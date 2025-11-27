import { Navigate } from 'react-router-dom';
import { useAuth } from '../context/AuthContext';
import { useEffect, useState } from 'react';
import supabase from '../supabaseClient';

interface ProtectedRouteProps {
    children: React.ReactNode;
    requireAdmin?: boolean;
}

const ProtectedRoute = ({ children, requireAdmin = false }: ProtectedRouteProps) => {
    const { user, profile, loading } = useAuth();
    const [emailVerified, setEmailVerified] = useState<boolean | null>(null);
    const [checkingVerification, setCheckingVerification] = useState(true);

    useEffect(() => {
        const checkEmailVerification = async () => {
            if (!user) {
                setCheckingVerification(false);
                return;
            }

            try {
                // Get fresh user data to check email verification
                const { data: { user: freshUser } } = await supabase.auth.getUser();
                setEmailVerified(freshUser?.email_confirmed_at != null);
            } catch (error) {
                console.error('Error checking email verification:', error);
                setEmailVerified(false);
            } finally {
                setCheckingVerification(false);
            }
        };

        checkEmailVerification();
    }, [user]);

    if (loading || checkingVerification) {
        return (
            <div className="min-h-screen flex items-center justify-center bg-gray-50">
                <div className="text-center">
                    <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary-600 mx-auto"></div>
                    <p className="mt-4 text-gray-600">Loading...</p>
                </div>
            </div>
        );
    }

    if (!user) {
        return <Navigate to="/auth" replace />;
    }

    // Redirect unverified users to auth page
    if (emailVerified === false) {
        return <Navigate to="/auth" replace />;
    }

    if (requireAdmin && profile?.role !== 'admin') {
        return <Navigate to="/dashboard" replace />;
    }

    return <>{children}</>;
};

export default ProtectedRoute;
