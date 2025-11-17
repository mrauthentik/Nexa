import { Star } from 'lucide-react';

const AboutSection = () => {
  const features = [
    'Practice tests in real exam format',
    'Comprehensive progress tracking',
    'Timed practice sessions',
    'Instant performance feedback',
  ];

  return (
    <section className="py-12 md:py-16 lg:py-24 bg-gradient-to-br from-amber-50 to-orange-50">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="grid md:grid-cols-2 gap-8 md:gap-12 items-center">
          {/* Left Content */}
          <div className="space-y-4 md:space-y-6">
            <div className="inline-block">
              <span className="text-primary-700 font-semibold text-xs sm:text-sm uppercase tracking-wide">
                About NEXA
              </span>
            </div>
            
            <h2 className="text-2xl sm:text-3xl md:text-4xl lg:text-5xl font-bold text-gray-900 leading-tight">
              NOUN Exam Experience Assistant
            </h2>
            
            <p className="text-gray-700 text-sm sm:text-base md:text-lg leading-relaxed">
              NEXA is a computer-based training platform specifically designed for NOUN students. As freshers often find it difficult to understand the school exam standard, NEXA is here to help you abreast yourself to the NOUN exam standard. Take tests in practice mode, track your progress, see how well you can perform, and get ready for the main exam. With NEXA, you'll build the confidence and skills needed to excel in your NOUN examinations. Success is your Nickname 🚀
            </p>

            <div className="space-y-2 md:space-y-3">
              {features.map((feature, index) => (
                <div key={index} className="flex items-start gap-2 md:gap-3">
                  <Star className="text-primary-600 mt-1 flex-shrink-0" size={18} fill="currentColor" />
                  <span className="text-gray-700 text-sm md:text-base">{feature}</span>
                </div>
              ))}
            </div>

            <button 
              className="bg-primary-600 hover:bg-primary-700 px-6 sm:px-8 py-2.5 sm:py-3 rounded-full font-semibold transition-colors duration-200 shadow-lg hover:shadow-xl mt-4 text-sm sm:text-base"
              style={{ color: '#ffffff' }}
            >
              Start Practicing Now
            </button>
          </div>

          {/* Right Content - Image Grid */}
          <div className="relative mt-8 md:mt-0">
            <div className="grid grid-cols-2 gap-4">
              {/* Main large image */}
              <div className="col-span-2 bg-primary-200 rounded-xl md:rounded-2xl aspect-[16/10] overflow-hidden shadow-xl">
                <img 
                  src="/img (2).jpg" 
                  alt="Students collaborating" 
                  className="w-full h-full object-cover"
                />
              </div>
              
              {/* Floating cards */}
              <div className="absolute top-2 sm:top-4 left-2 sm:left-4 bg-white px-2 sm:px-4 py-1.5 sm:py-2 rounded-lg shadow-lg z-10 backdrop-blur-sm bg-white/95">
                <span className="text-xs sm:text-sm text-gray-700 font-medium">Practice Mode</span>
              </div>
              
              <div className="absolute top-1/2 right-2 sm:right-4 bg-white px-2 sm:px-4 py-1.5 sm:py-2 rounded-lg shadow-lg z-10 backdrop-blur-sm bg-white/95">
                <span className="text-xs sm:text-sm text-gray-700 font-medium">Track Progress</span>
              </div>
              
              <div className="absolute bottom-2 sm:bottom-4 left-1/4 bg-white px-2 sm:px-4 py-1.5 sm:py-2 rounded-lg shadow-lg z-10 backdrop-blur-sm bg-white/95">
                <span className="text-xs sm:text-sm text-gray-700 font-medium">Ace Your Exams</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};

export default AboutSection;
