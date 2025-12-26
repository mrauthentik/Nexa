import { useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import supabase from '../supabaseClient';
import toast from 'react-hot-toast';

const AuthCallback = () => {
  const navigate = useNavigate();

  useEffect(() => {
    const handleCallback = async () => {
      try {
        console.log('🔄 AuthCallback component mounted');
        console.log('📍 Current URL:', window.location.href);
        console.log('🔗 Hash fragment:', window.location.hash);
        console.log('📂 Pathname:', window.location.pathname);

        // Get the session from the URL hash
        const { data: { session }, error } = await supabase.auth.getSession();

        console.log('📦 Session data:', { hasSession: !!session, error: error?.message });

        if (error) {
          console.error('❌ OAuth callback error:', error);
          toast.error('Authentication failed. Please try again.');
          navigate('/auth');
          return;
        }

        if (session) {
          console.log('✅ Session found for user:', session.user.email);
          console.log('👤 User metadata:', session.user.user_metadata);
          // Check if profile exists
          const { error: profileError } = await supabase
            .from('profiles')
            .select('*')
            .eq('id', session.user.id)
            .single();

          if (profileError && profileError.code === 'PGRST116') {
            console.log('📝 Profile not found, creating new profile...');
            // Profile doesn't exist, create it
            const profileData = {
              id: session.user.id,
              email: session.user.email || '',
              full_name: session.user.user_metadata?.full_name ||
                session.user.user_metadata?.name ||
                session.user.email?.split('@')[0] || 'User',
              role: 'student',
              email_verified: true, // Google OAuth users are pre-verified
              avatar_url: session.user.user_metadata?.avatar_url ||
                session.user.user_metadata?.picture,
              subscription_tier: 'free',
              subscription_status: 'active',
            };

            console.log('👤 Creating profile with data:', profileData);

            const { error: insertError } = await supabase
              .from('profiles')
              .upsert(profileData);

            if (insertError) {
              console.error('❌ Error creating profile:', insertError);
              toast.error('Failed to create profile. Please try again.');
              navigate('/auth');
              return;
            }

            console.log('✅ Profile created successfully');

            // Create welcome notification
            console.log('📬 Creating welcome notification...');
            await supabase.from('notifications').insert({
              user_id: session.user.id,
              type: 'announcement',
              title: '🎉 Welcome to NEXA!',
              message: `Hi ${session.user.user_metadata?.full_name || 'there'}! Welcome to NOUN Exam Experience Assistant (NEXA). Here's how to get started:\n\n📚 **Summaries**: Browse AI-generated course summaries to quickly grasp key concepts.\n\n📝 **Practice Tests**: Take CBT-style tests to prepare for exams. Questions are shuffled each time!\n\n📅 **Schedule**: Plan your study sessions and track your progress.\n\n📊 **Dashboard**: Monitor your performance and see your improvement over time.\n\nGood luck with your studies! 🚀`,
              read: false,
            });
            console.log('✅ Welcome notification created');
          } else if (profileError) {
            console.error('❌ Profile fetch error:', profileError);
          } else {
            console.log('✅ Profile already exists');
          }

          console.log('🎉 Sign-in successful, redirecting to dashboard...');
          toast.success('Successfully signed in with Google!');
          navigate('/dashboard');
        } else {
          // No session found
          console.warn('⚠️ No session found in callback');
          toast.error('No session found. Please try signing in again.');
          navigate('/auth');
        }
      } catch (err) {
        console.error('❌ Unexpected error in OAuth callback:', err);
        toast.error('An unexpected error occurred. Please try again.');
        navigate('/auth');
      }
    };

    handleCallback();
  }, [navigate]);

  return (
    <div className="min-h-screen flex items-center justify-center bg-gray-50">
      <div className="text-center">
        <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-primary-600 mb-4"></div>
        <p className="text-gray-600 text-lg font-medium">Completing sign in...</p>
        <p className="text-gray-500 text-sm mt-2">Please wait while we set up your account</p>
      </div>
    </div>
  );
};

export default AuthCallback;
