import { Navigate, useLocation } from 'react-router-dom';
import { useAuth } from '../context/AuthContext';
import { useEffect } from 'react';
import toast from 'react-hot-toast';
import DashboardSkeleton from './DashboardSkeleton';

interface ProtectedRouteProps {
    children: React.ReactNode;
    requireAdmin?: boolean;
}

const ProtectedRoute = ({ children, requireAdmin = false }: ProtectedRouteProps) => {
    const { user, profile, loading } = useAuth();
    const location = useLocation();

    useEffect(() => {
        // Show toast when redirecting unverified users
        if (!loading && user && profile && profile.email_verified === false) {
            toast.error('Please verify your email to access the dashboard');
        }
    }, [loading, user, profile]);

    // Show Dashboard Skeleton Loader while checking authentication (replaces circle spinner)
    if (loading) {
        return <DashboardSkeleton />;
    }

    // STRICT CHECK 1: No authenticated user - redirect to auth page
    if (!user) {
        return <Navigate to="/auth" replace state={{ from: location }} />;
    }

    // STRICT CHECK 2: No profile in database - redirect to auth page
    if (!profile) {
        console.error('User authenticated but no profile found in database');
        return <Navigate to="/auth" replace state={{ from: location }} />;
    }

    // STRICT CHECK 3: Email not verified - redirect to auth page
    if (profile.email_verified === false) {
        return <Navigate to="/auth" replace state={{ from: location, needsVerification: true }} />;
    }

    // STRICT CHECK 4: Admin routes require admin role
    if (requireAdmin && profile.role !== 'admin') {
        toast.error('Access denied. Admin privileges required.');
        return <Navigate to="/dashboard" replace />;
    }

    // All checks passed - render protected content
    return <>{children}</>;
};

export default ProtectedRoute;
