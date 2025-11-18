import supabase from '../supabaseClient';

const FUNCTIONS_URL = import.meta.env.VITE_SUPABASE_URL + '/functions/v1';

// Helper function to get auth headers
const getAuthHeaders = async () => {
    const { data: { session } } = await supabase.auth.getSession();
    return {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${session?.access_token || ''}`,
    };
};

// Auth APIs
export const authAPI = {
    signUp: async (email: string, password: string, fullName: string) => {
        const response = await fetch(`${FUNCTIONS_URL}/signup`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ email, password, fullName }),
        });
        return response.json();
    },

    signIn: async (email: string, password: string) => {
        const response = await fetch(`${FUNCTIONS_URL}/signin`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ email, password }),
        });
        return response.json();
    },

    signOut: async () => {
        return await supabase.auth.signOut();
    },

    getCurrentUser: async () => {
        return await supabase.auth.getUser();
    },
};

// Summaries APIs
export const summariesAPI = {
    getAll: async (category?: string, search?: string) => {
        const params = new URLSearchParams();
        if (category) params.append('category', category);
        if (search) params.append('search', search);
        
        const response = await fetch(`${FUNCTIONS_URL}/get-summaries?${params}`, {
            headers: await getAuthHeaders(),
        });
        return response.json();
    },

    getDetail: async (id: string) => {
        const response = await fetch(`${FUNCTIONS_URL}/get-summary-detail?id=${id}`, {
            headers: await getAuthHeaders(),
        });
        return response.json();
    },

    create: async (summaryData: any) => {
        const response = await fetch(`${FUNCTIONS_URL}/create-summary`, {
            method: 'POST',
            headers: await getAuthHeaders(),
            body: JSON.stringify(summaryData),
        });
        return response.json();
    },
};

// Tests APIs
export const testsAPI = {
    getAll: async () => {
        const response = await fetch(`${FUNCTIONS_URL}/get-tests`, {
            headers: await getAuthHeaders(),
        });
        return response.json();
    },

    getQuestions: async (testId: string) => {
        const response = await fetch(`${FUNCTIONS_URL}/get-test-questions?testId=${testId}`, {
            headers: await getAuthHeaders(),
        });
        return response.json();
    },

    create: async (testData: any) => {
        const response = await fetch(`${FUNCTIONS_URL}/create-test`, {
            method: 'POST',
            headers: await getAuthHeaders(),
            body: JSON.stringify(testData),
        });
        return response.json();
    },

    submit: async (testId: string, answers: any, timeTaken: number) => {
        const response = await fetch(`${FUNCTIONS_URL}/submit-test`, {
            method: 'POST',
            headers: await getAuthHeaders(),
            body: JSON.stringify({ testId, answers, timeTaken }),
        });
        return response.json();
    },
};

// Notifications APIs
export const notificationsAPI = {
    getAll: async () => {
        const response = await fetch(`${FUNCTIONS_URL}/get-notifications`, {
            headers: await getAuthHeaders(),
        });
        return response.json();
    },

    markAsRead: async (notificationId: string) => {
        const response = await fetch(`${FUNCTIONS_URL}/mark-notification-read`, {
            method: 'POST',
            headers: await getAuthHeaders(),
            body: JSON.stringify({ notificationId }),
        });
        return response.json();
    },
};

// Schedule APIs
export const scheduleAPI = {
    getAll: async () => {
        const response = await fetch(`${FUNCTIONS_URL}/get-schedule`, {
            headers: await getAuthHeaders(),
        });
        return response.json();
    },

    createItem: async (type: 'class' | 'assignment' | 'study_session', itemData: any) => {
        const response = await fetch(`${FUNCTIONS_URL}/create-schedule-item`, {
            method: 'POST',
            headers: await getAuthHeaders(),
            body: JSON.stringify({ type, ...itemData }),
        });
        return response.json();
    },
};

// User APIs
export const userAPI = {
    getStats: async () => {
        const response = await fetch(`${FUNCTIONS_URL}/get-user-stats`, {
            headers: await getAuthHeaders(),
        });
        return response.json();
    },

    updateProfile: async (updates: any) => {
        const response = await fetch(`${FUNCTIONS_URL}/update-user-profile`, {
            method: 'POST',
            headers: await getAuthHeaders(),
            body: JSON.stringify(updates),
        });
        return response.json();
    },

    getProfile: async () => {
        const { data: { user } } = await supabase.auth.getUser();
        if (!user) return null;

        const { data, error } = await supabase
            .from('profiles')
            .select('*')
            .eq('id', user.id)
            .single();

        if (error) throw error;
        return data;
    },
};

// Admin APIs
export const adminAPI = {
    getDashboard: async () => {
        const response = await fetch(`${FUNCTIONS_URL}/get-admin-dashboard`, {
            headers: await getAuthHeaders(),
        });
        return response.json();
    },

    getAllStudents: async () => {
        const { data, error } = await supabase
            .from('profiles')
            .select('*')
            .eq('role', 'student')
            .order('created_at', { ascending: false });

        if (error) throw error;
        return data;
    },

    getAllTests: async () => {
        const { data, error } = await supabase
            .from('tests')
            .select(`
                *,
                courses(title, code)
            `)
            .order('created_at', { ascending: false });

        if (error) throw error;
        return data;
    },

    getAllSubmissions: async () => {
        const { data, error } = await supabase
            .from('test_submissions')
            .select(`
                *,
                profiles(full_name, email),
                tests(title, course_code)
            `)
            .order('submitted_at', { ascending: false });

        if (error) throw error;
        return data;
    },
};

export default {
    auth: authAPI,
    summaries: summariesAPI,
    tests: testsAPI,
    notifications: notificationsAPI,
    schedule: scheduleAPI,
    user: userAPI,
    admin: adminAPI,
};
