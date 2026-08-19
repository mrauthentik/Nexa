import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { summariesAPI } from '../services/api';
import supabase from '../supabaseClient';

export interface Summary {
    id: string;
    title: string;
    course_code: string;
    course_title?: string;
    category: string;
    level?: string;
    department?: string;
    read_time?: string;
    summary_text?: string;
    file_url?: string;
    created_at: string;
    updated_at?: string;
}

export const SUMMARIES_QUERY_KEY = ['summaries'];

/**
 * Fetch all study summaries with optional category/search filters.
 */
export const useSummaries = (category?: string, search?: string) => {
    return useQuery({
        queryKey: [...SUMMARIES_QUERY_KEY, { category, search }],
        queryFn: async (): Promise<Summary[]> => {
            const data = await summariesAPI.getAll(category, search);
            return Array.isArray(data) ? data : data?.data || [];
        },
        staleTime: 5 * 60 * 1000, // 5 minutes
    });
};

/**
 * Fetch detail for a single summary by ID.
 */
export const useSummaryDetail = (summaryId: string) => {
    return useQuery({
        queryKey: ['summary', summaryId],
        queryFn: async (): Promise<Summary | null> => {
            if (!summaryId) return null;
            const data = await summariesAPI.getDetail(summaryId);
            return data?.data || data || null;
        },
        enabled: !!summaryId,
        staleTime: 10 * 60 * 1000, // 10 minutes
    });
};

/**
 * Mutation hook to create a summary (Admin/User).
 */
export const useCreateSummary = () => {
    const queryClient = useQueryClient();

    return useMutation({
        mutationFn: async (summaryData: Partial<Summary>) => {
            return await summariesAPI.create(summaryData);
        },
        onSuccess: () => {
            queryClient.invalidateQueries({ queryKey: SUMMARIES_QUERY_KEY });
        },
    });
};

/**
 * Mutation hook to delete a summary.
 */
export const useDeleteSummary = () => {
    const queryClient = useQueryClient();

    return useMutation({
        mutationFn: async (summaryId: string) => {
            const { error } = await supabase
                .from('summaries')
                .delete()
                .eq('id', summaryId);

            if (error) throw error;
        },
        onSuccess: () => {
            queryClient.invalidateQueries({ queryKey: SUMMARIES_QUERY_KEY });
        },
    });
};
