import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { calendarAPI, scheduleAPI } from '../services/api';

export interface CalendarEvent {
    id: string;
    title: string;
    description?: string;
    date: string;
    type: 'exam' | 'assignment' | 'class' | 'study';
    color?: string;
    user_id?: string;
}

export const CALENDAR_EVENTS_QUERY_KEY = ['calendarEvents'];
export const SCHEDULE_ITEMS_QUERY_KEY = ['scheduleItems'];

/**
 * Fetch calendar events for a date range (month/week view).
 */
export const useCalendarEvents = (startDate?: string, endDate?: string) => {
    return useQuery({
        queryKey: [...CALENDAR_EVENTS_QUERY_KEY, { startDate, endDate }],
        queryFn: async (): Promise<CalendarEvent[]> => {
            const data = await calendarAPI.getEvents(startDate, endDate);
            return Array.isArray(data) ? data : data?.events || data?.data || [];
        },
        staleTime: 3 * 60 * 1000, // 3 minutes
    });
};

/**
 * Fetch student class schedule items.
 */
export const useScheduleItems = () => {
    return useQuery({
        queryKey: SCHEDULE_ITEMS_QUERY_KEY,
        queryFn: async () => {
            const data = await scheduleAPI.getAll();
            return data?.data || data || [];
        },
        staleTime: 5 * 60 * 1000,
    });
};

/**
 * Mutation hook to create a calendar event.
 */
export const useCreateCalendarEvent = () => {
    const queryClient = useQueryClient();

    return useMutation({
        mutationFn: async (eventData: { title: string; description?: string; date: string; type: string; color?: string }) => {
            return await calendarAPI.createEvent(eventData);
        },
        onSuccess: () => {
            queryClient.invalidateQueries({ queryKey: CALENDAR_EVENTS_QUERY_KEY });
        },
    });
};

/**
 * Mutation hook to delete a calendar event.
 */
export const useDeleteCalendarEvent = () => {
    const queryClient = useQueryClient();

    return useMutation({
        mutationFn: async (eventId: string) => {
            return await calendarAPI.deleteEvent(eventId);
        },
        onSuccess: () => {
            queryClient.invalidateQueries({ queryKey: CALENDAR_EVENTS_QUERY_KEY });
        },
    });
};

/**
 * Mutation hook to create a schedule item (class, assignment, study_session).
 */
export const useCreateScheduleItem = () => {
    const queryClient = useQueryClient();

    return useMutation({
        mutationFn: async ({ type, itemData }: { type: 'class' | 'assignment' | 'study_session'; itemData: any }) => {
            return await scheduleAPI.createItem(type, itemData);
        },
        onSuccess: () => {
            queryClient.invalidateQueries({ queryKey: SCHEDULE_ITEMS_QUERY_KEY });
        },
    });
};
