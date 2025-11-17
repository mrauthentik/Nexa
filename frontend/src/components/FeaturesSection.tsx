import { BookOpen, Award, Users, TrendingUp } from 'lucide-react';

const FeaturesSection = () => {
  const features = [
    {
      icon: BookOpen,
      title: 'Practice Mode',
      description: 'Take unlimited practice tests in a real exam environment',
      image: '/img (3).jpg',
    },
    {
      icon: Award,
      title: 'Exam Standards',
      description: 'Experience actual NOUN exam format and difficulty level',
      image: '/img (4).jpg',
    },
    {
      icon: Users,
      title: 'Progress Tracking',
      description: 'Monitor your performance and see how exam-ready you are',
      image: '/img (3).jpg',
    },
    {
      icon: TrendingUp,
      title: 'Smart Timer',
      description: 'Practice with timed tests to build exam speed and confidence',
      image: '/img (4).jpg',
    },
  ];

  return (
    <section className="py-12 md:py-16 lg:py-24 bg-white">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        {/* Section Header */}
        <div className="text-center mb-8 md:mb-12">
          <h2 className="text-2xl sm:text-3xl md:text-4xl lg:text-5xl font-bold text-gray-900 mb-3 md:mb-4">
            Everything You Need to Ace NOUN Exams
          </h2>
          <p className="text-base md:text-lg text-gray-600 max-w-2xl mx-auto px-4">
            NEXA provides all the tools freshers need to understand exam standards and perform excellently
          </p>
        </div>

        {/* Features Grid */}
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 md:gap-8">
          {features.map((feature, index) => {
            const Icon = feature.icon;
            return (
              <div
                key={index}
                className="group relative bg-gradient-to-br from-primary-50 to-white rounded-2xl p-6 shadow-lg hover:shadow-2xl transition-all duration-300 hover:-translate-y-2"
              >
                {/* Icon */}
                <div className="w-14 h-14 bg-primary-600 rounded-xl flex items-center justify-center mb-4 group-hover:scale-110 transition-transform duration-300">
                  <Icon className="text-white" size={28} />
                </div>

                {/* Content */}
                <h3 className="text-xl font-bold text-gray-900 mb-2">{feature.title}</h3>
                <p className="text-gray-600 text-sm">{feature.description}</p>

                {/* Decorative gradient */}
                <div className="absolute inset-0 bg-gradient-to-br from-primary-600/0 to-primary-600/5 rounded-2xl opacity-0 group-hover:opacity-100 transition-opacity duration-300"></div>
              </div>
            );
          })}
        </div>

        {/* Image Showcase */}
        <div className="mt-12 md:mt-16 grid grid-cols-1 md:grid-cols-2 gap-6 md:gap-8">
          <div className="relative rounded-xl md:rounded-2xl overflow-hidden shadow-2xl aspect-[16/10]">
            <img
              src="/img (3).jpg"
              alt="Students studying"
              className="w-full h-full object-cover hover:scale-105 transition-transform duration-500"
            />
            <div className="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent flex items-end p-4 md:p-6">
              <div className="text-white">
                <h3 className="text-xl md:text-2xl font-bold mb-1 md:mb-2">Computer-Based Training</h3>
                <p className="text-xs md:text-sm">Practice in a real CBT environment just like NOUN exams</p>
              </div>
            </div>
          </div>

          <div className="relative rounded-xl md:rounded-2xl overflow-hidden shadow-2xl aspect-[16/10]">
            <img
              src="/img (4).jpg"
              alt="Student achievement"
              className="w-full h-full object-cover hover:scale-105 transition-transform duration-500"
            />
            <div className="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent flex items-end p-4 md:p-6">
              <div className="text-white">
                <h3 className="text-xl md:text-2xl font-bold mb-1 md:mb-2">Get Exam Ready</h3>
                <p className="text-xs md:text-sm">Build confidence and achieve success in your NOUN exams</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};

export default FeaturesSection;
