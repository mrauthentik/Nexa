import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import supabase from '../supabaseClient';
import { notificationsAPI } from '../services/api';

export interface NotificationItem {
    id: string;
    user_id: string;
    type: string;
    title: string;
    message: string;
    read: boolean;
    link?: string;
    priority?: string;
    created_at: string;
}

export const NOTIFICATION_QUERY_KEY = ['notifications'];

/**
 * Custom hook for fetching notifications with React Query.
 * Bulletproof against non-array response types.
 */
export const useNotifications = (userId?: string) => {
    const query = useQuery({
        queryKey: NOTIFICATION_QUERY_KEY,
        queryFn: async (): Promise<NotificationItem[]> => {
            try {
                const { data, error } = await supabase
                    .from('notifications')
                    .select('id, user_id, type, title, message, read, link, priority, created_at')
                    .order('created_at', { ascending: false })
                    .limit(20);

                if (!error && Array.isArray(data)) {
                    return data;
                }

                // Fallback to Edge Function API
                const res = await notificationsAPI.getAll();
                if (Array.isArray(res)) return res;
                if (Array.isArray(res?.data)) return res.data;
                if (Array.isArray(res?.notifications)) return res.notifications;
                return [];
            } catch {
                return [];
            }
        },
        staleTime: 2 * 60 * 1000,
        enabled: !!userId,
    });

    const notifications: NotificationItem[] = Array.isArray(query.data) ? query.data : [];
    const unreadCount = notifications.filter(n => Boolean(n && !n.read)).length;

    return {
        ...query,
        notifications,
        unreadCount,
    };
};

/**
 * Mutation hook to mark a notification as read.
 * Optimistically updates the cache and invalidates notifications query.
 */
export const useMarkNotificationRead = () => {
    const queryClient = useQueryClient();

    return useMutation({
        mutationFn: async (notificationId: string) => {
            const { error } = await supabase
                .from('notifications')
                .update({ read: true })
                .eq('id', notificationId);

            if (error) {
                await notificationsAPI.markAsRead(notificationId);
            }
        },
        onMutate: async (notificationId) => {
            await queryClient.cancelQueries({ queryKey: NOTIFICATION_QUERY_KEY });
            const previous = queryClient.getQueryData<NotificationItem[]>(NOTIFICATION_QUERY_KEY);

            if (previous && Array.isArray(previous)) {
                queryClient.setQueryData<NotificationItem[]>(NOTIFICATION_QUERY_KEY, old =>
                    (Array.isArray(old) ? old : []).map(n => n.id === notificationId ? { ...n, read: true } : n)
                );
            }

            return { previous };
        },
        onError: (_err, _id, context) => {
            if (context?.previous) {
                queryClient.setQueryData(NOTIFICATION_QUERY_KEY, context.previous);
            }
        },
        onSettled: () => {
            queryClient.invalidateQueries({ queryKey: NOTIFICATION_QUERY_KEY });
        },
    });
};

/**
 * Mutation hook to mark all notifications as read.
 */
export const useMarkAllNotificationsRead = () => {
    const queryClient = useQueryClient();

    return useMutation({
        mutationFn: async () => {
            const { error } = await supabase
                .from('notifications')
                .update({ read: true })
                .eq('read', false);

            if (error) {
                await notificationsAPI.markAllAsRead();
            }
        },
        onSuccess: () => {
            queryClient.invalidateQueries({ queryKey: NOTIFICATION_QUERY_KEY });
        },
    });
};

/**
 * Mutation hook to delete a notification.
 * Optimistically removes item from cache so badge count updates instantly.
 */
export const useDeleteNotification = () => {
    const queryClient = useQueryClient();

    return useMutation({
        mutationFn: async (notificationId: string) => {
            const { error } = await supabase
                .from('notifications')
                .delete()
                .eq('id', notificationId);

            if (error) {
                await notificationsAPI.delete(notificationId);
            }
        },
        onMutate: async (notificationId) => {
            await queryClient.cancelQueries({ queryKey: NOTIFICATION_QUERY_KEY });
            const previous = queryClient.getQueryData<NotificationItem[]>(NOTIFICATION_QUERY_KEY);

            if (previous && Array.isArray(previous)) {
                queryClient.setQueryData<NotificationItem[]>(NOTIFICATION_QUERY_KEY, old =>
                    (Array.isArray(old) ? old : []).filter(n => n.id !== notificationId)
                );
            }

            return { previous };
        },
        onError: (_err, _id, context) => {
            if (context?.previous) {
                queryClient.setQueryData(NOTIFICATION_QUERY_KEY, context.previous);
            }
        },
        onSettled: () => {
            queryClient.invalidateQueries({ queryKey: NOTIFICATION_QUERY_KEY });
        },
    });
};
