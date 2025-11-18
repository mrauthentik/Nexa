import { useState, useCallback } from 'react';

interface ToastState {
    message: string;
    type: 'success' | 'error' | 'info' | 'warning';
    show: boolean;
}

export const useToast = () => {
    const [toast, setToast] = useState<ToastState>({
        message: '',
        type: 'info',
        show: false
    });

    const showToast = useCallback((message: string, type: 'success' | 'error' | 'info' | 'warning' = 'info') => {
        setToast({ message, type, show: true });
    }, []);

    const hideToast = useCallback(() => {
        setToast(prev => ({ ...prev, show: false }));
    }, []);

    const success = useCallback((message: string) => showToast(message, 'success'), [showToast]);
    const error = useCallback((message: string) => showToast(message, 'error'), [showToast]);
    const info = useCallback((message: string) => showToast(message, 'info'), [showToast]);
    const warning = useCallback((message: string) => showToast(message, 'warning'), [showToast]);

    return {
        toast,
        showToast,
        hideToast,
        success,
        error,
        info,
        warning
    };
};
