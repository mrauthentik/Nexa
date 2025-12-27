import { useState, useMemo, useEffect } from 'react';
import { MapContainer, TileLayer, Marker, Popup, useMap } from 'react-leaflet';
import L from 'leaflet';
import 'leaflet/dist/leaflet.css';
import { Search, MapPin, Phone, Mail, User, Users, X, List, Navigation } from 'lucide-react';
import Navbar from '../components/Navbar';
import { nounCentersData } from '../data/nounCenters';
import type { StudyCenter } from '../data/nounCenters';

// Fix for default Leaflet marker icons
import icon from 'leaflet/dist/images/marker-icon.png';
import iconShadow from 'leaflet/dist/images/marker-shadow.png';

let DefaultIcon = L.icon({
    iconUrl: icon,
    shadowUrl: iconShadow,
    iconSize: [25, 41],
    iconAnchor: [12, 41],
    popupAnchor: [1, -34],
});

L.Marker.prototype.options.icon = DefaultIcon;

// Custom Marker Icon
const customIcon = new L.Icon({
    iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-teal.png',
    shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',
    iconSize: [25, 41],
    iconAnchor: [12, 41],
    popupAnchor: [1, -34],
    shadowSize: [41, 41]
});

// Component to handle map view updates
function MapUpdater({ center, zoom }: { center: { lat: number; lng: number }, zoom: number }) {
    const map = useMap();
    useEffect(() => {
        map.flyTo(center, zoom, {
            duration: 1.5
        });
    }, [center, zoom, map]);
    return null;
}

const NounCentersPage = () => {
    const [selectedCenter, setSelectedCenter] = useState<StudyCenter | null>(null);
    const [searchTerm, setSearchTerm] = useState('');
    const [viewState, setViewState] = useState({ lat: 9.0820, lng: 8.6753, zoom: 6 }); // Default Nigeria center
    const [showList, setShowList] = useState(true);

    // Filter centers based on search
    const filteredCenters = useMemo(() => {
        return nounCentersData.filter(center =>
            center.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
            center.state.toLowerCase().includes(searchTerm.toLowerCase()) ||
            center.address.toLowerCase().includes(searchTerm.toLowerCase())
        );
    }, [searchTerm]);

    const handleCenterClick = (center: StudyCenter) => {
        setSelectedCenter(center);
        setViewState({ lat: center.coordinates.lat, lng: center.coordinates.lng, zoom: 12 });
        // On mobile, hide list when selecting
        if (window.innerWidth < 768) {
            setShowList(false);
        }
    };

    return (
        <div className="h-screen flex flex-col bg-gray-900 overflow-hidden">
            <div className="z-50">
                <Navbar />
            </div>

            <div className="flex-1 relative flex">

                {/* Sidebar List - Floating/Overlay style */}
                <div
                    className={`absolute left-0 top-0 bottom-0 z-[400] w-full md:w-96 bg-gray-900/95 backdrop-blur-xl border-r border-gray-800 transition-transform duration-300 transform ${showList ? 'translate-x-0' : '-translate-x-full md:translate-x-0'} md:relative md:translate-x-0 flex flex-col`}
                >
                    {/* Search Header */}
                    <div className="p-4 border-b border-gray-800 bg-gray-900/50">
                        <div className="flex items-center justify-between mb-4">
                            <h2 className="text-xl font-bold text-white flex items-center gap-2">
                                <MapPin className="text-teal-500" />
                                Study Centers
                                <span className="text-xs bg-teal-500/20 text-teal-400 px-2 py-0.5 rounded-full ml-auto">
                                    {filteredCenters.length}
                                </span>
                            </h2>
                            <button
                                onClick={() => setShowList(false)}
                                className="md:hidden text-gray-400 hover:text-white"
                            >
                                <X size={20} />
                            </button>
                        </div>
                        <div className="relative">
                            <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400" />
                            <input
                                type="text"
                                placeholder="Search centers, states..."
                                value={searchTerm}
                                onChange={(e) => setSearchTerm(e.target.value)}
                                className="w-full pl-9 pr-4 py-2.5 bg-gray-800 border border-gray-700 rounded-lg text-gray-200 focus:outline-none focus:ring-2 focus:ring-teal-500 placeholder-gray-500 text-sm"
                            />
                        </div>
                    </div>

                    {/* List Content */}
                    <div className="flex-1 overflow-y-auto custom-scrollbar">
                        {filteredCenters.map((center) => (
                            <div
                                key={center.id}
                                onClick={() => handleCenterClick(center)}
                                className={`p-4 border-b border-gray-800 cursor-pointer transition-all hover:bg-gray-800/50 ${selectedCenter?.id === center.id ? 'bg-teal-900/20 border-l-4 border-l-teal-500' : 'border-l-4 border-l-transparent'
                                    }`}
                            >
                                <div className="flex justify-between items-start">
                                    <div>
                                        <h3 className={`font-medium ${selectedCenter?.id === center.id ? 'text-teal-400' : 'text-gray-200'}`}>
                                            {center.name}
                                        </h3>
                                        <p className="text-sm text-gray-500 mt-1 flex items-center gap-1">
                                            <MapPin size={12} /> {center.state} State
                                        </p>
                                    </div>
                                </div>
                            </div>
                        ))}

                        {filteredCenters.length === 0 && (
                            <div className="p-8 text-center text-gray-500">
                                <Search size={32} className="mx-auto mb-2 opacity-50" />
                                <p>No centers found matching "{searchTerm}"</p>
                            </div>
                        )}
                    </div>
                </div>

                {/* Map Container */}
                <div className="flex-1 relative bg-gray-900">
                    {/* Mobile Toggle Button */}
                    {!showList && (
                        <button
                            onClick={() => setShowList(true)}
                            className="absolute top-4 left-4 z-[400] p-3 bg-teal-600 text-white rounded-full shadow-lg hover:bg-teal-700 transition-colors md:hidden"
                        >
                            <List size={20} />
                        </button>
                    )}

                    <MapContainer
                        center={[9.0820, 8.6753]}
                        zoom={6}
                        scrollWheelZoom={true}
                        className="w-full h-full z-0"
                        zoomControl={false}
                    >
                        <MapUpdater center={viewState} zoom={viewState.zoom} />

                        {/* Dark Mode Tile Layer */}
                        <TileLayer
                            attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors &copy; <a href="https://carto.com/attributions">CARTO</a>'
                            url="https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png"
                        />

                        {nounCentersData.map((center) => (
                            <Marker
                                key={center.id}
                                position={[center.coordinates.lat, center.coordinates.lng]}
                                icon={customIcon}
                                eventHandlers={{
                                    click: () => handleCenterClick(center),
                                }}
                            >
                                <Popup className="custom-popup">
                                    <div className="p-1">
                                        <h3 className="font-bold text-gray-900">{center.name}</h3>
                                        <p className="text-xs text-gray-600">{center.state}</p>
                                    </div>
                                </Popup>
                            </Marker>
                        ))}
                    </MapContainer>

                    {/* Selected Center Floating Card details */}
                    {selectedCenter && (
                        <div className="absolute top-4 right-4 z-[400] w-full max-w-sm bg-gray-900/90 backdrop-blur-xl border border-gray-700 rounded-2xl shadow-2xl overflow-hidden animate-in slide-in-from-right-10 fade-in duration-300">
                            <div className="bg-gradient-to-r from-teal-600 to-cyan-600 p-4 relative">
                                <button
                                    onClick={() => setSelectedCenter(null)}
                                    className="absolute top-4 right-4 text-white/80 hover:text-white"
                                >
                                    <X size={20} />
                                </button>
                                <div className="flex items-center gap-2 text-white/80 text-xs font-medium uppercase tracking-wider mb-2">
                                    <MapPin size={12} />
                                    {selectedCenter.state} State
                                </div>
                                <h2 className="text-xl font-bold text-white pr-6 leading-tight">
                                    {selectedCenter.name}
                                </h2>
                            </div>

                            <div className="p-5 space-y-5">
                                <div className="space-y-3">
                                    <div className="flex items-start gap-3 text-gray-300">
                                        <div className="mt-1 w-8 h-8 rounded-lg bg-gray-800 flex items-center justify-center flex-shrink-0 text-teal-500">
                                            <Navigation size={16} />
                                        </div>
                                        <div>
                                            <p className="text-xs text-gray-500 uppercase font-semibold mb-0.5">Address</p>
                                            <p className="text-sm leading-relaxed">{selectedCenter.address}</p>
                                        </div>
                                    </div>

                                    {selectedCenter.director && selectedCenter.director !== 'N/A' && (
                                        <div className="flex items-start gap-3 text-gray-300">
                                            <div className="mt-1 w-8 h-8 rounded-lg bg-gray-800 flex items-center justify-center flex-shrink-0 text-teal-500">
                                                <User size={16} />
                                            </div>
                                            <div>
                                                <p className="text-xs text-gray-500 uppercase font-semibold mb-0.5">Director</p>
                                                <p className="text-sm">{selectedCenter.director}</p>
                                            </div>
                                        </div>
                                    )}

                                    {selectedCenter.counsellor && selectedCenter.counsellor !== 'N/A' && (
                                        <div className="flex items-start gap-3 text-gray-300">
                                            <div className="mt-1 w-8 h-8 rounded-lg bg-gray-800 flex items-center justify-center flex-shrink-0 text-teal-500">
                                                <Users size={16} />
                                            </div>
                                            <div>
                                                <p className="text-xs text-gray-500 uppercase font-semibold mb-0.5">Counsellor</p>
                                                <p className="text-sm">{selectedCenter.counsellor}</p>
                                            </div>
                                        </div>
                                    )}

                                    {(selectedCenter.phone || selectedCenter.email) && (
                                        <div className="pt-3 border-t border-gray-800 flex flex-col gap-2">
                                            {selectedCenter.phone && (
                                                <div className="flex items-center gap-2 text-teal-400 text-sm">
                                                    <Phone size={14} />
                                                    <a href={`tel:${selectedCenter.phone}`} className="hover:underline">{selectedCenter.phone}</a>
                                                </div>
                                            )}
                                            {selectedCenter.email && (
                                                <div className="flex items-center gap-2 text-teal-400 text-sm">
                                                    <Mail size={14} />
                                                    <a href={`mailto:${selectedCenter.email}`} className="hover:underline truncate">{selectedCenter.email}</a>
                                                </div>
                                            )}
                                        </div>
                                    )}
                                </div>

                                <a
                                    href={`https://www.google.com/maps/search/?api=1&query=${selectedCenter.address}`}
                                    target="_blank"
                                    rel="noopener noreferrer"
                                    className="block w-full py-2.5 bg-gray-100 hover:bg-white text-gray-900 font-semibold text-center rounded-lg transition-colors text-sm"
                                >
                                    Open in Google Maps
                                </a>
                            </div>
                        </div>
                    )}

                    {/* Stats Overlay - Top Right (similar to screenshot) */}
                    <div className="absolute top-4 right-4 md:right-12 z-[300] hidden md:block">
                        <div className="bg-gray-900/80 backdrop-blur border border-gray-800 rounded-lg p-3 flex items-center gap-4">
                            <div>
                                <p className="text-xs text-gray-500 uppercase">Total Centers</p>
                                <p className="text-xl font-bold text-white">{nounCentersData.length}</p>
                            </div>
                            <div className="h-8 w-px bg-gray-700"></div>
                            <div>
                                <p className="text-xs text-gray-500 uppercase">States Covered</p>
                                <p className="text-xl font-bold text-teal-400">36 + FCT</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
};

export default NounCentersPage;
