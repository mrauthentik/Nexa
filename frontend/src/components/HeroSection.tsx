const HeroSection = () => {
  return (
    <section className="bg-gradient-to-br from-primary-50 to-white py-12 md:py-16 lg:py-24">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        {/* Announcement Banner */}
        <div className="mb-8">
          <div className="bg-gray-900 rounded-2xl p-4 md:p-6 shadow-lg">
            <div className="flex items-center justify-between flex-wrap gap-4">
              <div className="flex items-center gap-3">
                <div className="bg-white/10 backdrop-blur-sm rounded-full p-2">
                  <svg className="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M11 5.882V19.24a1.76 1.76 0 01-3.417.592l-2.147-6.15M18 13a3 3 0 100-6M5.436 13.683A4.001 4.001 0 017 6h1.832c4.1 0 7.625-1.234 9.168-3v14c-1.543-1.766-5.067-3-9.168-3H7a3.988 3.988 0 01-1.564-.317z" />
                  </svg>
                </div>
                <div className="text-white">
                  <p className="font-semibold text-sm md:text-base">🎉 NOUN Exam Season is Here!</p>
                  <p className="text-xs md:text-sm text-gray-300">Practice with real exam standards - Get exam-ready today</p>
                </div>
              </div>
              <button className="bg-primary-600 hover:bg-primary-700 text-white px-4 md:px-6 py-2 rounded-full font-semibold text-sm transition-colors shadow-md whitespace-nowrap">
                Learn More
              </button>
            </div>
          </div>
        </div>

        <div className="grid md:grid-cols-2 gap-8 md:gap-12 items-center">
          {/* Left Content */}
          <div className="space-y-4 md:space-y-6">
            <h1 className="text-3xl sm:text-4xl md:text-5xl lg:text-6xl font-bold text-gray-900 leading-tight">
              Master NOUN Exams with Confidence
            </h1>
            <p className="text-lg sm:text-xl md:text-2xl text-primary-700 font-semibold">
              NEXA - NOUN Exam Experience Assistant
            </p>
            <p className="text-gray-600 text-base md:text-lg">
              Your computer-based training platform designed to help freshers understand NOUN exam standards. Practice, track progress, and ace your exams. Success is your Nickname 🚀
            </p>
            <div className="flex gap-4">
              <a
                href="/auth"
                className="bg-primary-600 hover:bg-primary-700 px-8 py-3 rounded-full font-semibold transition-colors duration-200 shadow-lg hover:shadow-xl inline-block"
                style={{ color: '#ffffff' }}
              >
                Get Started
              </a>
              <a
                href="/auth"
                className="bg-white hover:bg-gray-50 text-primary-600 border-2 border-primary-600 px-8 py-3 rounded-full font-semibold transition-colors duration-200 shadow-lg hover:shadow-xl inline-block"
              >
                Sign In
              </a>
            </div>
          </div>

          {/* Right Content - Hero Image */}
          <div className="relative mt-8 md:mt-0">
            <div className="relative bg-primary-600 rounded-2xl md:rounded-3xl overflow-hidden aspect-[4/3] shadow-2xl">
              {/* Hero Image */}
              <img 
                src="/img (1).jpg" 
                alt="Student learning" 
                className="w-full h-full object-cover"
              />
              <div className="absolute inset-0 bg-gradient-to-br from-primary-600/20 to-transparent"></div>
              
              {/* Floating badges */}
              <div className="absolute top-8 right-8 bg-white px-6 py-3 rounded-full shadow-lg z-10">
                <span className="text-primary-700 font-semibold">Practice Mode</span>
              </div>
              <div className="absolute bottom-8 right-8 bg-white px-6 py-3 rounded-full shadow-lg z-10">
                <span className="text-primary-700 font-semibold">Exam Ready</span>
              </div>
            </div>
            
            {/* Decorative circles */}
            <div className="hidden lg:block absolute -right-4 top-1/2 transform -translate-y-1/2 space-y-3">
              <div className="w-4 h-4 bg-primary-300 rounded-full"></div>
              <div className="w-4 h-4 bg-primary-400 rounded-full"></div>
              <div className="w-4 h-4 bg-primary-500 rounded-full"></div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};

export default HeroSection;
