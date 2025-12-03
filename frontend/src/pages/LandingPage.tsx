import Navbar from '../components/Navbar'
import HeroSection from '../components/HeroSection'
import FeaturesSection from '../components/FeaturesSection'
import AboutSection from '../components/AboutSection'
// import Review from '../components/Review'
import FAQ from '../components/Faq'
import Contact from '../components/Contact'
import Footer from '../components/Footer'
import AnnouncementBanner from '../components/AnnouncementBanner'
import { Toaster } from 'react-hot-toast'

const LandingPage = () => {
  return (
    <>
      <Toaster position="top-center" reverseOrder={false} />
      <div className="min-h-screen">
        <AnnouncementBanner />
        <Navbar />
        <section id="home">
          <HeroSection />
        </section>
        <section id="features">
          <FeaturesSection />
        </section>
        <section id="about">
          <AboutSection />
        </section>
        {/* <section id="reviews">
          <Review />
        </section> */}
        <section id="faq">
          <FAQ />
        </section>
        <section id="contact">
          <Contact />
        </section>
        <Footer />
      </div>
    </>
  );
};

export default LandingPage;
