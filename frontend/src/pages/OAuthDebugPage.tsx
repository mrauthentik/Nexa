import { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import supabase from '../supabaseClient';

const OAuthDebugPage = () => {
  const navigate = useNavigate();
  const [debugInfo, setDebugInfo] = useState<any>({});

  useEffect(() => {
    const checkAuth = async () => {
      // Get hash from URL
      const hash = window.location.hash;
      
      // Get session
      const { data: { session }, error } = await supabase.auth.getSession();
      
      // Get user
      const { data: { user } } = await supabase.auth.getUser();

      setDebugInfo({
        currentUrl: window.location.href,
        hash: hash,
        origin: window.location.origin,
        pathname: window.location.pathname,
        hasSession: !!session,
        sessionUser: session?.user?.email,
        hasUser: !!user,
        userEmail: user?.email,
        error: error?.message,
      });
    };

    checkAuth();
  }, []);

  return (
    <div className="min-h-screen bg-gray-50 p-8">
      <div className="max-w-4xl mx-auto">
        <h1 className="text-3xl font-bold mb-6">OAuth Debug Info</h1>
        
        <div className="bg-white rounded-lg shadow p-6 mb-4">
          <h2 className="text-xl font-semibold mb-4">Current State</h2>
          <pre className="bg-gray-100 p-4 rounded overflow-auto text-sm">
            {JSON.stringify(debugInfo, null, 2)}
          </pre>
        </div>

        <div className="flex gap-4">
          <button
            onClick={() => navigate('/auth')}
            className="px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700"
          >
            Go to Auth Page
          </button>
          <button
            onClick={() => navigate('/dashboard')}
            className="px-4 py-2 bg-green-600 text-white rounded hover:bg-green-700"
          >
            Go to Dashboard
          </button>
          <button
            onClick={() => navigate('/auth/callback')}
            className="px-4 py-2 bg-purple-600 text-white rounded hover:bg-purple-700"
          >
            Go to Callback
          </button>
        </div>
      </div>
    </div>
  );
};

export default OAuthDebugPage;
