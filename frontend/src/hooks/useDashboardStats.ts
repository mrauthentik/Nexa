import { useQuery } from '@tanstack/react-query';
import { dashboardAPI } from '../services/api';

export interface DashboardStatsData {
    stats?: {
        courseProgress: number;
        attendance: number;
        averageScore: number;
        totalTests: number;
        completedTests: number;
    };
    error?: string;
}

export interface PerformanceChartData {
    labels?: string[];
    scores?: number[];
    averageScore?: number;
    totalTests?: number;
}

/**
 * Fetch dashboard statistics for a specific user ID.
 */
export const useDashboardStats = (userId?: string) => {
    return useQuery({
        queryKey: ['dashboardStats', userId],
        queryFn: async (): Promise<DashboardStatsData> => {
            if (!userId) return {};
            return await dashboardAPI.getStats(userId);
        },
        enabled: !!userId,
        staleTime: 60 * 1000, // 1 minute
    });
};

/**
 * Fetch performance chart data for a given timeframe (7, 30, or 90 days).
 */
export const usePerformanceChart = (userId?: string, period: string = '7') => {
    return useQuery({
        queryKey: ['performanceChart', userId, period],
        queryFn: async (): Promise<PerformanceChartData> => {
            if (!userId) return {};
            return await dashboardAPI.getPerformanceChart(userId, period);
        },
        enabled: !!userId,
        staleTime: 2 * 60 * 1000, // 2 minutes
    });
};
