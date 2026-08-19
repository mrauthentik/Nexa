import { useQuery } from '@tanstack/react-query';
import { adminAPI } from '../services/api';

export interface StudentProfile {
    id: string;
    email: string;
    full_name: string;
    role: string;
    student_id?: string;
    department?: string;
    level?: string;
    phone?: string;
    avatar_url?: string;
    subscription_tier?: string;
    subscription_status?: string;
    email_verified?: boolean;
    last_active_at?: string;
    is_online?: boolean;
    created_at: string;
}

export const ADMIN_STUDENTS_QUERY_KEY = ['adminStudents'];
export const ADMIN_DASHBOARD_QUERY_KEY = ['adminDashboard'];

/**
 * Fetch all student profiles for admin table view.
 */
export const useAdminStudents = (enabled: boolean = true) => {
    return useQuery({
        queryKey: ADMIN_STUDENTS_QUERY_KEY,
        queryFn: async (): Promise<StudentProfile[]> => {
            const data = await adminAPI.getAllStudents();
            return (data as unknown as StudentProfile[]) || [];
        },
        enabled,
        staleTime: 2 * 60 * 1000,
    });
};

/**
 * Fetch admin high-level metrics dashboard data.
 */
export const useAdminDashboard = (enabled: boolean = true) => {
    return useQuery({
        queryKey: ADMIN_DASHBOARD_QUERY_KEY,
        queryFn: async () => {
            return await adminAPI.getDashboard();
        },
        enabled,
        staleTime: 60 * 1000,
    });
};

/**
 * Fetch all test submissions for admin review.
 */
export const useAdminSubmissions = (enabled: boolean = true) => {
    return useQuery({
        queryKey: ['adminSubmissions'],
        queryFn: async () => {
            return await adminAPI.getAllSubmissions();
        },
        enabled,
        staleTime: 2 * 60 * 1000,
    });
};
