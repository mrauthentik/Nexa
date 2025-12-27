export interface StudyCenter {
    id: number;
    name: string;
    address: string;
    director: string;
    counsellor: string;
    state: string;
    coordinates: {
        lat: number;
        lng: number;
    };
    email?: string;
    phone?: string;
}

// Helper to estimate coordinates based on state/city (simplified for this large dataset)
// In a real app, these would be precise geocoded locations
const getCoordinates = (name: string, state: string, address: string): { lat: number; lng: number } => {
    // Map of major locations to coordinates
    const locations: Record<string, { lat: number; lng: number }> = {
        'Abuja': { lat: 9.0765, lng: 7.3986 },
        'Lagos': { lat: 6.5244, lng: 3.3792 },
        'Kano': { lat: 12.0022, lng: 8.5920 },
        'Ibadan': { lat: 7.3775, lng: 3.9470 },
        'Port Harcourt': { lat: 4.8156, lng: 7.0498 },
        'Benin': { lat: 6.3350, lng: 5.6037 },
        'Maiduguri': { lat: 11.8311, lng: 13.1510 },
        'Zaria': { lat: 11.0855, lng: 7.7199 },
        'Jos': { lat: 9.8965, lng: 8.8583 },
        'Ilorin': { lat: 8.4799, lng: 4.5418 },
        'Kaduna': { lat: 10.5105, lng: 7.4165 },
        'Enugu': { lat: 6.4403, lng: 7.4961 },
        'Warri': { lat: 5.5544, lng: 5.7932 },
        'Abeokuta': { lat: 7.1475, lng: 3.3619 },
        'Akure': { lat: 7.2571, lng: 5.2058 },
        'Oshogbo': { lat: 7.7827, lng: 4.5418 },
        'Katsina': { lat: 12.9908, lng: 7.6018 },
        'Sokoto': { lat: 13.0059, lng: 5.2476 },
        'Minna': { lat: 9.5836, lng: 6.5463 },
        'Calabar': { lat: 4.9517, lng: 8.3417 },
        'Uyo': { lat: 5.0377, lng: 7.9128 },
        'Owerri': { lat: 5.4891, lng: 7.0176 },
        'Ado-Ekiti': { lat: 7.6212, lng: 5.2214 },
        'Makurdi': { lat: 7.7327, lng: 8.5214 },
        'Bauchi': { lat: 10.3158, lng: 9.8442 },
        'Gombe': { lat: 10.2897, lng: 11.1711 },
        'Yola': { lat: 9.2035, lng: 12.4954 },
        'Jalingo': { lat: 8.8937, lng: 11.3745 },
        'Damaturu': { lat: 11.7470, lng: 11.9608 },
        'Birnin Kebbi': { lat: 12.4539, lng: 4.1975 },
        'Lafia': { lat: 8.4893, lng: 8.5253 },
        'Lokoja': { lat: 7.8023, lng: 6.7469 },
        'Gusau': { lat: 12.1628, lng: 6.6612 },
        'Dutse': { lat: 11.7594, lng: 9.3392 },
        'Asaba': { lat: 6.1951, lng: 6.7866 },
        'Yenagoa': { lat: 4.9247, lng: 6.2642 },
        'Abakaliki': { lat: 6.3249, lng: 8.1137 },
        'Awka': { lat: 6.2105, lng: 7.0723 },
    };

    // Try to find a match in the name, address or state
    const searchString = `${name} ${state} ${address}`.toLowerCase();

    for (const [key, coords] of Object.entries(locations)) {
        if (searchString.includes(key.toLowerCase())) {
            // Add a small random jitter so pins in same city don't overlap perfectly
            return {
                lat: coords.lat + (Math.random() - 0.5) * 0.05,
                lng: coords.lng + (Math.random() - 0.5) * 0.05
            };
        }
    }

    // Default to center of Nigeria if no match found
    return { lat: 9.0820 + (Math.random() - 0.5) * 2, lng: 8.6753 + (Math.random() - 0.5) * 2 };
};

export const nounCentersData: StudyCenter[] = [
    {
        id: 1,
        name: "Abakaliki Study Centre",
        state: "Benue", // Note: Original data said Benue, address says Benue, but name implies Ebonyi. Following address.
        address: "Former NDE Office, Opp. Mechanic Village, Kanshio, Makurdi, Benue State.",
        director: "Prof. Fidel Okopi (fokopi@noun.edu.ng, 08023509179)",
        counsellor: "ALAO, SERAH ASABI (MRS.) (asabialao@yahoo.com, +2348036125998)",
        coordinates: getCoordinates("Abakaliki Study Centre", "Benue", "Makurdi"),
        email: "fokopi@noun.edu.ng",
        phone: "08023509179"
    },
    {
        id: 2,
        name: "Abeokuta Correctional Service Study Centre",
        state: "Ogun",
        address: "Abeokuta, Ogun State",
        director: "N/A",
        counsellor: "N/A",
        coordinates: getCoordinates("Abeokuta", "Ogun", "")
    },
    {
        id: 3,
        name: "Abeokuta Study Centre",
        state: "Ogun",
        address: "Opposite NNPC Mega Station, Ogun State.",
        director: "Dr. Oba-Adenuga Olusegun A. (oadenuga@noun.edu.ng, 08033879789)",
        counsellor: "Mr. Adeyinka Segun Paul (+234 8033487398)",
        coordinates: getCoordinates("Abeokuta", "Ogun", "Opposite NNPC Mega Station"),
        email: "oadenuga@noun.edu.ng",
        phone: "08033879789"
    },
    {
        id: 4,
        name: "Abuja Model Study Centre",
        state: "FCT",
        address: "Dutse-Alhaji, Kubwa Express Way, Abuja, FCT.",
        director: "Prof. Sanni M. Ayodele (sayodele@noun.edu.ng, 08036761286)",
        counsellor: "AROGUNYO KINGSLEY OJO (karogunyo@noun.edu.ng, +2348035385460)",
        coordinates: getCoordinates("Abuja Model", "FCT", "Dutse-Alhaji"),
        email: "sayodele@noun.edu.ng",
        phone: "08036761286"
    },
    {
        id: 5,
        name: "Ado-Ekiti Study Centre",
        state: "Ekiti",
        address: "Beside Ekiti State Government College, Along Federal Polytechnic Road, Ado Ekiti, Ekiti State",
        director: "Prof. Mustapha A. Raheem (amustapha@noun.edu.ng, 07032333494)",
        counsellor: "+234 8021231234",
        coordinates: getCoordinates("Ado-Ekiti", "Ekiti", "Federal Polytechnic Road"),
        email: "amustapha@noun.edu.ng",
        phone: "07032333494"
    },
    {
        id: 6,
        name: "Akure Study Centre Idanre",
        state: "Ondo",
        address: "Old NRC Building, Idanre Road, Ondo State.",
        director: "Mr. Abidemi F. Agunbiade (aagunbiade@noun.edu.ng, 08023541556)",
        counsellor: "OYADEJI, JOSEPH BABAJIDE (DR.) (joyadeyi@noun.edu.ng, +234 8060042920)",
        coordinates: getCoordinates("Akure", "Ondo", "Idanre Road"),
        email: "aagunbiade@noun.edu.ng",
        phone: "08023541556"
    },
    {
        id: 7,
        name: "Asaba Study Centre",
        state: "Delta",
        address: "Federal College of Education (Technical), Asaba, Delta State.",
        director: "Professor Chibuogwu V. Nnaka (cnnaka@noun.edu.ng, 08037056993)",
        counsellor: "Dr. Yusuf Adebayo (+234 8097476155)",
        coordinates: getCoordinates("Asaba", "Delta", "Federal College of Education"),
        email: "cnnaka@noun.edu.ng",
        phone: "08037056993"
    },
    {
        id: 8,
        name: "Asaga Community Study Centre",
        state: "Abia",
        address: "Plot 2/3 Prof. Kalu Ezera Road, Asaga Ohafia, Abia State.",
        director: "Dr. Nkata U. Kalu (nkkalu@noun.edu.ng, 08038717655)",
        counsellor: "N/A",
        coordinates: getCoordinates("Asaga", "Abia", "Asaga Ohafia"),
        email: "nkkalu@noun.edu.ng",
        phone: "08038717655"
    },
    {
        id: 9,
        name: "Awa-Ijebu Community Study Centre",
        state: "Ogun",
        address: "Ijebu Awa, East Local Government Area, Ogun State.",
        director: "Dr Timothy Ishola (tishola@noun.edu.ng)",
        counsellor: "MRS MARY W. OMOTAYO (momotayo@noun.edu.ng, +2348033353760)",
        coordinates: getCoordinates("Awa-Ijebu", "Ogun", "Ijebu Awa"),
        email: "tishola@noun.edu.ng"
    },
    {
        id: 10,
        name: "Awgu Community Study Centre",
        state: "Enugu",
        address: "National Youth Development Centre, Orie Awgu, Enugu State.",
        director: "Mr. OFORBUIKE Nwachukwu (onwachukwu@noun.edu.ng, 08037782878)",
        counsellor: "N/A",
        coordinates: getCoordinates("Awgu", "Enugu", "Orie Awgu"),
        email: "onwachukwu@noun.edu.ng",
        phone: "08037782878"
    },
    {
        id: 11,
        name: "Awka Study Centre",
        state: "Anambra",
        address: "Defunct Party Building, P.M.B 2017, Abagana, Anambra State.",
        director: "Dr. Scholastica N. Ezeribe (sezeribe@noun.edu.ng, 08033922196)",
        counsellor: "Miss Isioma Elizabeth Dibie (+234 803386600)",
        coordinates: getCoordinates("Awka", "Anambra", "Abagana"),
        email: "sezeribe@noun.edu.ng",
        phone: "08033922196"
    },
    {
        id: 12,
        name: "Azare Community Study Centre",
        state: "Bauchi",
        address: "Azare Western Bye Pass, Off Kano Road, Azare, Bauchi State.",
        director: "Mr. Bulama Samson Mshelia (bmshelia@noun.edu.ng, 07038187288)",
        counsellor: "N/A",
        coordinates: getCoordinates("Azare", "Bauchi", "Azare"),
        email: "bmshelia@noun.edu.ng",
        phone: "07038187288"
    },
    {
        id: 13,
        name: "Badagry Study Centre",
        state: "Lagos",
        address: "Ajo street beside ajara vetho New Community Town Hall, opposite Nigerian French Language Village, Badagry, Lagos State.",
        director: "Dr Julius Paul Eyanuku (yeyanuku@noun.edu.ng, 08023188030)",
        counsellor: "N/A",
        coordinates: getCoordinates("Badagry", "Lagos", "Ajo street"),
        email: "yeyanuku@noun.edu.ng",
        phone: "08023188030"
    },
    {
        id: 14,
        name: "Bagwai Study Centre",
        state: "Kano",
        address: "Bagwai Community Study Centre, Kano State",
        director: "Dr. Bello Mohammed Kamal-Deen (mbello@noun.edu.ng, 08060354842)",
        counsellor: "N/A",
        coordinates: getCoordinates("Bagwai", "Kano", "Bagwai"),
        email: "mbello@noun.edu.ng",
        phone: "08060354842"
    },
    {
        id: 15,
        name: "Bauchi Study Centre",
        state: "Bauchi",
        address: "Former NRC Building, Federal Low Cost Housing Estate, Bauchi, Bauchi State",
        director: "Mrs Hauwa E. Dede (edede@noun.edu.ng, 08036178916)",
        counsellor: "GAGARE GRACE HASSAN (MRS.) (ggagare@noun.edu.ng, +238140051812)",
        coordinates: getCoordinates("Bauchi", "Bauchi", "Federal Low Cost"),
        email: "edede@noun.edu.ng",
        phone: "08036178916"
    },
    {
        id: 16,
        name: "Benin Study Centre",
        state: "Edo",
        address: "Ekenwa Road, Old SDP Secretariat, Benin City, Edo State.",
        director: "Dr. Akeem Babatunde Disu (adisu@noun.edu.ng, 08077138381)",
        counsellor: "MRS. UGOZIE STELLA NGOZI (soguzie@noun.edu.ng, +2348055221367)",
        coordinates: getCoordinates("Benin", "Edo", "Ekenwa Road"),
        email: "adisu@noun.edu.ng",
        phone: "08077138381"
    },
    {
        id: 17,
        name: "Bichi Study Centre",
        state: "Kano",
        address: "Bichi Community, Kano State.",
        director: "Dr. Bello Mohammed Kamal-Deen (Mbello@noun.edu.ng, 08060354842)",
        counsellor: "N/A",
        coordinates: getCoordinates("Bichi", "Kano", "Bichi"),
        email: "Mbello@noun.edu.ng",
        phone: "08060354842"
    },
    {
        id: 19,
        name: "Calabar Study Centre",
        state: "Cross River",
        address: "Opposite Zone 6 Police Hqtrs (Former Teachers Training College), Calabar, Cross River State.",
        director: "Prof. Onyeka Iwuchukwu (oiwuchukwu@noun.edu.ng, 07032760885)",
        counsellor: "Dr. Nnodi Nnenna (nnnodi@noun.edu.ng, +234 8033166957)",
        coordinates: getCoordinates("Calabar", "Cross River", "Zone 6 Police"),
        email: "oiwuchukwu@noun.edu.ng",
        phone: "07032760885"
    },
    {
        id: 20,
        name: "Damaturu Study Centre",
        state: "Yobe",
        address: "Former Amusement Park, Maiduguri Road, Damaturu, Yobe State.",
        director: "Dr. Machina MUHAMMED A. (mmachina@noun.edu.ng, 08036148866)",
        counsellor: "MACHINA, ADAMU M. (Ph.D) (mmachina@noun.edu.ng, +2348036148866)",
        coordinates: getCoordinates("Damaturu", "Yobe", "Maiduguri Road"),
        email: "mmachina@noun.edu.ng",
        phone: "08036148866"
    },
    {
        id: 21,
        name: "Danbatta Study Centre",
        state: "Kano",
        address: "Danbatta Community Study Centre, Kano State",
        director: "Dr. Haliru Tijjani (thalliru@noun.edu.ng, 08034371016)",
        counsellor: "N/A",
        coordinates: getCoordinates("Danbatta", "Kano", "Danbatta"),
        email: "thalliru@noun.edu.ng",
        phone: "08034371016"
    },
    {
        id: 24,
        name: "Dutse Study Centre",
        state: "Jigawa",
        address: "3rd Floor Federal Government Secretariat, Kiyawa Road, Dutse, Jigawa State",
        director: "Dr. Ahmed Tanimu Mahmoud (amahmoud@noun.edu.ng, 08038034912)",
        counsellor: "N/A",
        coordinates: getCoordinates("Dutse", "Jigawa", "Kiyawa Road"),
        email: "amahmoud@noun.edu.ng",
        phone: "08038034912"
    },
    {
        id: 26,
        name: "Enugu Study Centre",
        state: "Enugu",
        address: "87/89 Nike-Lake Road, Enugu, Enugu State.",
        director: "Prof. Onyia Alexander (aonyia@noun.edu.ng, 07030729120)",
        counsellor: "MR OKOBO UDO N. (uokobo@noun.edu.ng, +2348038486273)",
        coordinates: getCoordinates("Enugu", "Enugu", "Nike-Lake Road"),
        email: "aonyia@noun.edu.ng",
        phone: "07030729120"
    },
    {
        id: 30,
        name: "Gombe Study Centre",
        state: "Gombe",
        address: "After All Saints College, Gombe Federal Low Cost, P.M.B 0163, Gombe, Gombe State.",
        director: "Dr. Bappah Adamu (abappah@noun.edu.ng, 08069504259)",
        counsellor: "N/A",
        coordinates: getCoordinates("Gombe", "Gombe", "Federal Low Cost"),
        email: "abappah@noun.edu.ng",
        phone: "08069504259"
    },
    {
        id: 31,
        name: "Gulak Community Study Centre",
        state: "Adamawa",
        address: "Mubi North Local Government Secretariat Mubi, Adamawa State",
        director: "Mrs. Margaret John Ywantu (iyamtu@noun.edu.ng, 07063234784)",
        counsellor: "MARGARET JOHN YAMTU (MRS.) (jyamtu@noun.edu.ng, +2347063234784)",
        coordinates: getCoordinates("Gulak", "Adamawa", "Mubi"),
        email: "iyamtu@noun.edu.ng",
        phone: "07063234784"
    },
    {
        id: 32,
        name: "Gusau Study Centre",
        state: "Zamfara",
        address: "A4, Commissioner’s Quarters, Bye-Pass, Gusau, Zamfara State.",
        director: "Mr. Surajo Haido Aliyu (saliyu@noun.edu.ng, 07085756960)",
        counsellor: "N/A",
        coordinates: getCoordinates("Gusau", "Zamfara", "Bye-Pass"),
        email: "saliyu@noun.edu.ng",
        phone: "07085756960"
    },
    {
        id: 35,
        name: "Ibadan Study Centre (Sango Eleyele)",
        state: "Oyo",
        address: "Former Party Secretariat, Faith Clinic Road, Ijokodo Junction, Sango-Eleyele, Ibadan, Oyo State.",
        director: "Prof. Justus A. Shokefun (jsokefun@noun.edu.ng, 08037707047)",
        counsellor: "Adegoke Adedapo Rasheed (radegoke@noun.edu.ng, +2348038477932)",
        coordinates: getCoordinates("Ibadan", "Oyo", "Sango Eleyele"),
        email: "jsokefun@noun.edu.ng",
        phone: "08037707047"
    },
    {
        id: 38,
        name: "Ikorodu Model Study Centre",
        state: "Lagos",
        address: "132b Lagos Road, Aruna, Ikorodu, Lagos, Nigeria",
        director: "Prof. Saheed O. Ajibola (sajibola@noun.edu.ng, 0703440044)",
        counsellor: "N/A",
        coordinates: getCoordinates("Ikorodu", "Lagos", "Lagos Road"),
        email: "sajibola@noun.edu.ng",
        phone: "0703440044"
    },
    {
        id: 41,
        name: "Ilorin Study Centre",
        state: "Kwara",
        address: "Old Party Building, Kulende Housing Estate, Ilorin, Kwara State.",
        director: "Mrs Esther A.Oyinloye (eoyinloye@noun.edu.ng)",
        counsellor: "ONYINLOYE, ESTHER ADEOLA (MRS.) (eoyinloye@noun.edu.ng, +2348035773770)",
        coordinates: getCoordinates("Ilorin", "Kwara", "Kulende"),
        email: "eoyinloye@noun.edu.ng"
    },
    {
        id: 48,
        name: "Jos Study Centre (Sabon Barki)",
        state: "Plateau",
        address: "Lomay International Hotel Road, P.M.B.0983, Bukuru Sabon Barki, Jos, Plateau State.",
        director: "Dr. Philip S. Tachin (ptachin@noun.edu.ng, 09022200559)",
        counsellor: "MRS EZHIM RHODA MANYI (rezhim@noun.edu.ng, +2348036217460)",
        coordinates: getCoordinates("Jos", "Plateau", "Sabon Barki"),
        email: "ptachin@noun.edu.ng",
        phone: "09022200559"
    },
    {
        id: 51,
        name: "Kaduna Study Centre",
        state: "Kaduna",
        address: "Kaduna Campus (Old NETC) by Trade Fair Complex, KM 4 Zaria Road, Kaduna",
        director: "Mr. Abdullahi Z. Yusufu (kadunastudycentre@noun.edu.ng)",
        counsellor: "N/A",
        coordinates: getCoordinates("Kaduna", "Kaduna", "Zaria Road"),
        email: "kadunastudycentre@noun.edu.ng"
    },
    {
        id: 53,
        name: "Kano Study Centre",
        state: "Kano",
        address: "Independence Road, Sauna-Dakata, Kano",
        director: "Mudassir Ishaq (mishaq@noun.edu.ng, 08033551486)",
        counsellor: "YAZID, FATIMA BALARABE (MRS.) (fyazid@noun.edu.ng, +23407060716930)",
        coordinates: getCoordinates("Kano", "Kano", "Independence Road"),
        email: "mishaq@noun.edu.ng",
        phone: "08033551486"
    },
    {
        id: 54,
        name: "Katsina Study Centre",
        state: "Katsina",
        address: "After Katsina State House of Assembly, Kaita Road, Katsina State",
        director: "Dr. Babangida Iro (biro@noun.edu.ng, 08033540469)",
        counsellor: "N/A",
        coordinates: getCoordinates("Katsina", "Katsina", "Kaita Road"),
        email: "biro@noun.edu.ng",
        phone: "08033540469"
    },
    {
        id: 55,
        name: "Kebbi Study Centre",
        state: "Kebbi",
        address: "Emir Haruna Yahaya Road, Adjacent State Scholarship Board, Birnin Kebbi",
        director: "Dr. Musa Ibrahim (musaibrahim@noun.edu.ng, 08062622999)",
        counsellor: "IBRAHIM MUHAMMAD SANI-MAINAGGE (msanimainagge@noun.edu.ng, +2348039714216)",
        coordinates: getCoordinates("Birnin Kebbi", "Kebbi", "Emir Haruna Yahaya"),
        email: "musaibrahim@noun.edu.ng",
        phone: "08062622999"
    },
    {
        id: 61,
        name: "Lafia Study Centre",
        state: "Nasarawa",
        address: "Bukan-Sidi, Jos Road, Lafia, Nasarawa State.",
        director: "Prof. ALACHI A. James (jamesalachi@yahoo.com, 08035936950)",
        counsellor: "MR OYEWOLE O. EMMANUEL (oyewole2007@gmail.com, +238055227438)",
        coordinates: getCoordinates("Lafia", "Nasarawa", "Jos Road"),
        email: "jamesalachi@yahoo.com",
        phone: "08035936950"
    },
    {
        id: 63,
        name: "Lagos Study Centre",
        state: "Lagos",
        address: "Victoria Island, Lagos State.",
        director: "Dr Alero T. Akujobi (aakujobi@noun.edu.ng, 08037779342)",
        counsellor: "AKA-NWACHUKWU, VERONICA IHEOMA (vaka-nwachukwu@noun.edu.ng, +234 8062390434)",
        coordinates: getCoordinates("Lagos", "Lagos", "Victoria Island"),
        email: "aakujobi@noun.edu.ng",
        phone: "08037779342"
    },
    {
        id: 64,
        name: "Lokoja Study Centre",
        state: "Kogi",
        address: "Defunct NRC Secretariat, Opposite Bishop Dennis College, Lokoja, Kogi State.",
        director: "Dr. Godwin A. Alhassan (galhassan@noun.edu.ng, 08036792970)",
        counsellor: "DR ROSEMARY NWOFOR (rnwofor@noun.edu.ng, +2348038678808)",
        coordinates: getCoordinates("Lokoja", "Kogi", "NRC Secretariat"),
        email: "galhassan@noun.edu.ng",
        phone: "08036792970"
    },
    {
        id: 65,
        name: "Maiduguri Study Centre",
        state: "Borno",
        address: "Baga Road, P.O. Box 548, Maiduguri- Mubi Express Way, Borno State",
        director: "Dr. Buba Baba Shani (bshani@noun.edu.ng, 08034574544)",
        counsellor: "N/A",
        coordinates: getCoordinates("Maiduguri", "Borno", "Baga Road"),
        email: "bshani@noun.edu.ng",
        phone: "08034574544"
    },
    {
        id: 67,
        name: "Makurdi Study Centre",
        state: "Benue",
        address: "Former NDE Office, Opp. Mechanic Village, Kanshio, Markurdi, Benue State.",
        director: "Prof. Fidel Okopi (fokopi@noun.edu.ng, 08023509179)",
        counsellor: "ALAO, SERAH ASABI (MRS.) (asabialao@yahoo.com, +2348036125998)",
        coordinates: getCoordinates("Makurdi", "Benue", "Kanshio"),
        email: "fokopi@noun.edu.ng",
        phone: "08023509179"
    },
    {
        id: 70,
        name: "Mccarthy Study Centre Lagos",
        state: "Lagos",
        address: "No. 38/40 McCarthy, Off Obalende Road, Opp. Ghana High Commission, Victoria Island, Lagos State.",
        director: "Prof Rotimi Ogidan (jogidan@noun.edu.ng, 08024957468)",
        counsellor: "MRS LADI LINDA ANDREW (landrew@noun.edu.ng, +2348089426870)",
        coordinates: getCoordinates("Mccarthy", "Lagos", "Victoria Island"),
        email: "jogidan@noun.edu.ng",
        phone: "08024957468"
    },
    {
        id: 71,
        name: "Minna Study Centre",
        state: "Niger",
        address: "NRC Secretariat, Opp. Mariam Babangida Girls Science College, Bosso, Minna, Niger State.",
        director: "Dr. Mathew A. Gana (mgana@noun.edu.ng, 08033808321)",
        counsellor: "Mr. Isuwa Elisha (eisuwa@noun.edu.ng, 08029118060)",
        coordinates: getCoordinates("Minna", "Niger", "Bosso"),
        email: "mgana@noun.edu.ng",
        phone: "08033808321"
    },
    {
        id: 72,
        name: "Mushin Study Centre",
        state: "Lagos",
        address: "19 Fatai Atere Way, Mushin, Lagos State",
        director: "Dr. (Mrs) Ogunlela (yogunlela@noun.edu.ng, 08034518814)",
        counsellor: "ADEDOLAPO-ALI ABIMBOLA (MRS.) (aadedolapoali@noun.edu.ng, +234 8035495353)",
        coordinates: getCoordinates("Mushin", "Lagos", "Mushin"),
        email: "yogunlela@noun.edu.ng",
        phone: "08034518814"
    },
    {
        id: 93,
        name: "Osogbo Study Centre",
        state: "Osun",
        address: "Former SDP Defunct Party Building. Beside St. Charles Grammar School, Ilesa Road, Osogbo, Osun State.",
        director: "Dr Tessy. O. Angba (tangba@noun.edu.ng, 07066568941)",
        counsellor: "Mrs Mary W. Omotayo (+234 8033353760)",
        coordinates: getCoordinates("Osogbo", "Osun", "Ilesa Road"),
        email: "tangba@noun.edu.ng",
        phone: "07066568941"
    },
    {
        id: 95,
        name: "Otukpo Study Centre",
        state: "Benue",
        address: "Rep. Community Study Centre, Otukpo, 59/60 Upu Road, Otukpo, Benue State.",
        director: "Dr. Adakole Ikpe (aikpe@noun.edu.ng, 08033232155)",
        counsellor: "ABU. ELIZABETH ONYEMOWO (eabu@noun.edu.ng, +2348036050221)",
        coordinates: getCoordinates("Otukpo", "Benue", "Upu Road"),
        email: "aikpe@noun.edu.ng",
        phone: "08033232155"
    },
    {
        id: 96,
        name: "Owerri Study Centre",
        state: "Imo",
        address: "No. 63 Okigwe Road, Owerri, Imo State.",
        director: "Dr. Theresa Ettu (tettu@noun.edu.ng, 08063812465)",
        counsellor: "Theresa Ettu (tettu@noun.edu.ng, 08063812465)",
        coordinates: getCoordinates("Owerri", "Imo", "Okigwe Road"),
        email: "tettu@noun.edu.ng",
        phone: "08063812465"
    },
    {
        id: 99,
        name: "Portharcourt Study Centre (Iriebe)",
        state: "Rivers",
        address: "Obiri-Ikwere Junction, NTA/Choba Road, Ozuoba, Rivers State.",
        director: "Dr. Nnenna Ńancy Chukwuma (nnchukwuma@noun.edu.ng, 08033102878)",
        counsellor: "MR.AMUSAN KUNLE JELILI (kamusan@noun.edu.ng, +2347033559835)",
        coordinates: getCoordinates("Port Harcourt", "Rivers", "Ozuoba"),
        email: "nnchukwuma@noun.edu.ng",
        phone: "08033102878"
    },
    {
        id: 103,
        name: "Sokoto Study Centre",
        state: "Sokoto",
        address: "No 4 RABAH ROAD, GAWON NAMA AREA, SOKOTO.",
        director: "Dr. Tanko Anthony A (atanko@noun.edu.ng, 08036125776)",
        counsellor: "IBRAHIM MUHAMMAD Madugu (imuhammad@noun.edu.ng, +23407033510599)",
        coordinates: getCoordinates("Sokoto", "Sokoto", "Rabah Road"),
        email: "atanko@noun.edu.ng",
        phone: "08036125776"
    },
    {
        id: 111,
        name: "Uyo Study Centre",
        state: "Akwa Ibom",
        address: "Udo-Udoma Avenue, Opposite 100 Unit Housing Estate, Uyo, Akwa Ibom State",
        director: "Prof. Charity A. Okonkwo (cokonkwo@noun.edu.ng, 08036668264)",
        counsellor: "N/A",
        coordinates: getCoordinates("Uyo", "Akwa Ibom", "Udo-Udoma"),
        email: "cokonkwo@noun.edu.ng",
        phone: "08036668264"
    },
    {
        id: 114,
        name: "Wuse II Study Centre Abuja",
        state: "FCT",
        address: "5 Dares Salaam Off Aminu Kanu Crescent, Wuse II, Abuja, FCT.",
        director: "Prof. Grace Chidiogo Okoli (gokoli@noun.edu.ng, 07036640610)",
        counsellor: "MRS NKIRU U. MADUIKE (nmaduike@noun.edu.ng, +2348034452121)",
        coordinates: getCoordinates("Wuse II", "FCT", "Wuse II"),
        email: "gokoli@noun.edu.ng",
        phone: "07036640610"
    },
    {
        id: 115,
        name: "Yenagoa Study Centre",
        state: "Bayelsa",
        address: "288 Mbiama/Yenegoa Road, Ekeki (Opp. Looking Good Plaza) Yenegoa, Bayelsa State.",
        director: "Prof. Clifford Amini (mamini@noun.edu.ng, 08036700636)",
        counsellor: "N/A",
        coordinates: getCoordinates("Yenagoa", "Bayelsa", "Mbiama"),
        email: "mamini@noun.edu.ng",
        phone: "08036700636"
    },
    {
        id: 116,
        name: "Yola Study Centre",
        state: "Adamawa",
        address: "Army Barracks Road, Yola, Adamawa State.",
        director: "Tiling Marlin Yelyel (mtiling@noun.edu.ng, 08038053242)",
        counsellor: "Tiling Marlin Yelyel (mtiling@noun.edu.ng, 08038053242)",
        coordinates: getCoordinates("Yola", "Adamawa", "Army Barracks"),
        email: "mtiling@noun.edu.ng",
        phone: "08038053242"
    },
    {
        id: 119,
        name: "Surulere Study Centre",
        state: "Lagos",
        address: "Femi Gbajabiamila House at 2 Clegg Street, Ojuelegba, Surulere, Lagos",
        director: "Dr. (Mrs) Ogunlela (yogunlela@noun.edu.ng, 08034518814)",
        counsellor: "ADEDOLAPO-ALI ABIMBOLA (MRS.) (aadedolapoalin@noun.edu.ng, +234 8035495353)",
        coordinates: getCoordinates("Surulere", "Lagos", "Ojuelegba"),
        email: "yogunlela@noun.edu.ng",
        phone: "08034518814"
    }
];
