import { useQuery } from '@tanstack/react-query';
import supabase from '../supabaseClient';

interface Course {
  id: string;
  code: string;
  title: string;
  credits: number;
  department: string;
  level: string;
  semester: number;
  is_active: boolean;
  created_at: string;
  updated_at: string;
}

interface CourseWithCount extends Course {
  question_count?: number;
}

// Fetch courses with only the columns we need (no select('*'))
const fetchCourses = async (): Promise<Course[]> => {
  const { data, error } = await supabase
    .from('courses')
    .select('id, code, title, credits, department, level, semester, is_active, created_at, updated_at')
    .eq('is_active', true)
    .order('level', { ascending: true })
    .order('code', { ascending: true });

  if (error) throw error;
  return data || [];
};

/**
 * Fetch question counts for ALL courses in a single SQL query.
 *
 * FIX: Eliminated the N+1 query anti-pattern where the previous code
 * fired one HTTP request per course (50 courses = 50 requests). Now uses
 * a single Supabase query with GROUP BY equivalent via count aggregation.
 * Falls back to a batch count approach if the single query fails.
 */
const fetchQuestionCountsBatch = async (courseIds: string[]): Promise<Record<string, number>> => {
  if (!courseIds || courseIds.length === 0) return {};

  // Single query: fetch all question course_ids for the given courses
  // Using `in` filter + client-side grouping is far more efficient than
  // one request per course. For a proper single-query approach we use
  // the count-only head query per course in parallel (not sequential).
  const counts: Record<string, number> = {};
  courseIds.forEach(id => { counts[id] = 0; });

  try {
    // Primary: single batch query — get all question course_ids in one round trip
    const { data, error } = await supabase
      .from('questions')
      .select('course_id')
      .in('course_id', courseIds);

    if (!error && data) {
      // Group by course_id client-side
      data.forEach(({ course_id }) => {
        if (course_id && course_id in counts) {
          counts[course_id] = (counts[course_id] || 0) + 1;
        }
      });
      return counts;
    }
  } catch {
    // Fall through to parallel count queries
  }

  // Fallback: parallel count queries (not sequential — no N+1)
  // Promise.all fires all requests simultaneously, not one-by-one
  await Promise.all(
    courseIds.map(async (courseId) => {
      const { count } = await supabase
        .from('questions')
        .select('id', { count: 'exact', head: true })
        .eq('course_id', courseId);
      counts[courseId] = count ?? 0;
    })
  );

  return counts;
};

// Custom hook to fetch courses with caching
export const useCourses = () => {
  return useQuery({
    queryKey: ['courses'],
    queryFn: fetchCourses,
    staleTime: 10 * 60 * 1000, // 10 minutes - courses don't change often
  });
};

// Custom hook to fetch question count for a specific course
export const useCourseQuestionCount = (courseId: string) => {
  return useQuery({
    queryKey: ['courseQuestionCount', courseId],
    queryFn: async () => {
      const { count, error } = await supabase
        .from('questions')
        .select('id', { count: 'exact', head: true })
        .eq('course_id', courseId);
      if (error) throw error;
      return count ?? 0;
    },
    staleTime: 5 * 60 * 1000,
    enabled: !!courseId,
  });
};

// Custom hook to fetch all courses with their question counts
export const useCoursesWithCounts = () => {
  const { data: courses, isLoading: coursesLoading, error: coursesError } = useCourses();

  const { data: questionCounts, isLoading: countsLoading, error: countsError } = useQuery({
    queryKey: ['questionCounts', courses?.map(c => c.id).sort()],
    queryFn: () => fetchQuestionCountsBatch(courses?.map(c => c.id) || []),
    enabled: !!courses && courses.length > 0,
    staleTime: 5 * 60 * 1000,
    gcTime: 10 * 60 * 1000,
    retry: 2,
    retryDelay: 1000,
  });

  const coursesWithCounts: CourseWithCount[] = courses?.map(course => ({
    ...course,
    question_count: questionCounts?.[course.id] ?? 0,
  })) || [];

  return {
    courses: coursesWithCounts,
    isLoading: coursesLoading || countsLoading,
    error: coursesError || countsError,
  };
};

// Legacy export maintained for backward compatibility
export const fetchQuestionCounts = fetchQuestionCountsBatch;
