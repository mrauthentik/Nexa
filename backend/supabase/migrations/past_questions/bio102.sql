DO $$
DECLARE
    v_course_id UUID;
BEGIN
    SELECT id INTO v_course_id FROM courses WHERE code = 'BIO102' LIMIT 1;

    -- Q1 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Who was the first person to make an attempt to classify living organisms?', 'multiple_choice', 'Linnaeus', 'Aristotle', 'Whittaker', 'Darwin', 'B', 'Aristotle, a Greek philosopher, was the first to attempt classifying living organisms.');

    -- Q2 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The present method of classifying and naming living organisms is based on the work of:', 'multiple_choice', 'Aristotle', 'Whittaker', 'Linnaeus', 'Darwin', 'C', 'Carl Linnaeus established the binomial nomenclature system used today.');

    -- Q3 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The study of the general principle of classification is known as ______.', 'fill_in_blank', 'Taxonomy', 'Taxonomy is the science of classification.');

    -- Q4 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which has the largest group of organisms in the hierarchy of living organisms?', 'multiple_choice', 'Species', 'Family', 'Kingdom', 'Phylum', 'C', 'Kingdom has the largest variety of organisms in classification hierarchy.');

    -- Q5 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'What is the smallest unit of classification?', 'multiple_choice', 'Genus', 'Species', 'Family', 'Order', 'B', 'Species is the smallest and most specific unit of classification.');

    -- Q6 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The use of a standard system to name living organisms is called:', 'multiple_choice', 'Taxonomy', 'Systematics', 'Binomial Nomenclature', 'Classification', 'C', 'Binomial Nomenclature gives each organism two names: genus and species.');

    -- Q7 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'In Binomial Nomenclature, each kind of organism is given ______ names.', 'fill_in_blank', 'two', 'Binomial means two names: generic name and species name.');

    -- Q8 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The scientific name of Pawpaw is:', 'multiple_choice', 'Musa paradisiaca', 'Carica Papaya', 'Azadirachta indica', 'Mangifera indica', 'B', 'Carica Papaya is the scientific name for pawpaw.');

    -- Q9 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Who proposed the five-kingdom classification?', 'multiple_choice', 'Aristotle', 'Linnaeus', 'Whittaker', 'Darwin', 'C', 'Whittaker proposed the five-kingdom classification in 1969.');

    -- Q10 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which kingdom contains prokaryotes?', 'multiple_choice', 'Protista', 'Monera', 'Fungi', 'Plantae', 'B', 'Kingdom Monera contains prokaryotic organisms without true nuclei.');

    -- Q11 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Organisms with cells that have true nuclei are classified as:', 'multiple_choice', 'Prokaryotes', 'Eukaryotes', 'Monerans', 'Bacteria', 'B', 'Eukaryotes have cells with true nuclei and organized structures.');

    -- Q12 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The ______ are simple-celled organisms that have no true nuclei.', 'fill_in_blank', 'Prokaryotes', 'Prokaryotes lack membrane-bound nuclei and organelles.');

    -- Q13 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of these is an example of Kingdom Monera?', 'multiple_choice', 'Amoeba', 'Bacteria', 'Mushrooms', 'Ferns', 'B', 'Bacteria are prokaryotic organisms belonging to Kingdom Monera.');

    -- Q14 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which kingdom includes organisms that cannot carry out photosynthesis due to absence of chlorophyll?', 'multiple_choice', 'Plantae', 'Protista', 'Fungi', 'Animalia', 'C', 'Fungi lack chlorophyll and obtain nutrients through absorption.');

    -- Q15 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Plants transform light energy into:', 'multiple_choice', 'mechanical energy', 'thermal energy', 'chemical energy', 'electrical energy', 'C', 'Plants transform light energy into chemical energy through photosynthesis.');

    -- Q16 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Plants produce ______ at their tips.', 'fill_in_blank', 'Meristems', 'Meristems are regions of active cell division in plants.');

    -- Q17 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of these plant groups is considered the simplest green plants?', 'multiple_choice', 'Bryophytes', 'Algae', 'Pteridophytes', 'Gymnosperms', 'B', 'Algae are simple green plants also known as thallophytes.');

    -- Q18 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which plant group colonized terrestrial habitats but still depends on water for completion of their life cycle?', 'multiple_choice', 'Algae', 'Bryophytes', 'Pteridophytes', 'Angiosperms', 'B', 'Bryophytes are considered amphibians of plant kingdom.');

    -- Q19 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Pteridophytes, Gymnosperm and Angiosperm are collectively called:', 'multiple_choice', 'Thallophytes', 'Bryophytes', 'Tracheophytes', 'Spermatophytes', 'C', 'Tracheophytes are vascular plants with conducting tissues.');

    -- Q20 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The tracheophytes are known as ______ plants.', 'fill_in_blank', 'vascular', 'Tracheophytes have vascular tissues for conducting water and food.');

    -- Q21 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'All animals belong to the kingdom:', 'multiple_choice', 'Animalia', 'Protista', 'Fungi', 'Monera', 'A', 'All multicellular, heterotrophic eukaryotes belong to Kingdom Animalia.');

    -- Q22 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Growth in animals is:', 'multiple_choice', 'indeterminate', 'determinate', 'continuous', 'unlimited', 'B', 'Animal growth is determinate, stopping after reaching certain size.');

    -- Q23 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Animals are classified into how many main groups?', 'multiple_choice', 'One', 'Two', 'Three', 'Four', 'B', 'Animals are classified into invertebrates and vertebrates.');

    -- Q24 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The animals with no backbone are called ______.', 'fill_in_blank', 'invertebrates', 'Invertebrates lack vertebral column or backbone.');

    -- Q25 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of these is an example of unicellular algae?', 'multiple_choice', 'Nostoc', 'Ulothrix', 'Anacystis', 'Volvox', 'C', 'Anacystis is an example of unicellular algae.');

    -- Q26 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Nostoc, Ulothrix and Oedogonium are examples of ______ algae.', 'multiple_choice', 'unicellular', 'colonial', 'filamentous', 'thalloid', 'C', 'These are examples of filamentous algae.');

    -- Q27 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Brown algae belong to the class:', 'multiple_choice', 'Chlorophyta', 'Phaeophyta', 'Rhodophyta', 'Xantophyta', 'B', 'Phaeophyta is the class for brown algae.');

    -- Q28 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The Golden-Brown algae belong to the class ______.', 'fill_in_blank', 'Chrysophyta', 'Chrysophyta contains golden-brown algae.');

    -- Q29 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Spirogyra is commonly referred to as:', 'multiple_choice', 'seaweed', 'pond scum', 'moss', 'fern', 'B', 'Spirogyra forms bright green masses on water surfaces, called pond scum.');

    -- Q30 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of these are considered to be the first land plants?', 'multiple_choice', 'Algae', 'Bryophytes', 'Pteridophytes', 'Gymnosperms', 'B', 'Bryophytes are considered the first land plants.');

    -- Q31 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In bryophytes, the haploid generation alternates with diploid generation known as:', 'multiple_choice', 'metamorphosis', 'alternation of generation', 'fertilization', 'germination', 'B', 'Alternation of generation involves switching between haploid and diploid phases.');

    -- Q32 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Bryophytes are more abundant in ______ areas.', 'fill_in_blank', 'moist tropical', 'Bryophytes thrive in moist tropical environments.');

    -- Q33 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Bryophytes are mostly divided into:', 'multiple_choice', 'algae and fungi', 'liverworts and mosses', 'ferns and horsetails', 'conifers and cycads', 'B', 'Bryophytes include liverworts and mosses.');

    -- Q34 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Marchantia and Riccia are examples of:', 'multiple_choice', 'mosses', 'liverworts', 'ferns', 'algae', 'B', 'Marchantia and Riccia are common liverworts.');

    -- Q35 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Funaria is an example of:', 'multiple_choice', 'liverworts', 'mosses', 'ferns', 'algae', 'B', 'Funaria is a common moss widely distributed worldwide.');

    -- Q36 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The adult gametophyte of Funaria is called ______.', 'fill_in_blank', 'Gametophine', 'Gametophine is the adult gametophyte in Funaria.');

    -- Q37 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Bryophytes are fixed to the soil by thread-like structures called:', 'multiple_choice', 'roots', 'rhizoids', 'root hairs', 'hyphae', 'B', 'Rhizoids anchor bryophytes to the soil.');

    -- Q38 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of these are vascular plants possessing roots, stems and leaves?', 'multiple_choice', 'Bryophytes', 'Pteridophytes', 'Algae', 'Fungi', 'B', 'Pteridophytes are vascular plants with true roots, stems and leaves.');

    -- Q39 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In pteridophytes, the dominant generation is the:', 'multiple_choice', 'gametophyte', 'sporophyte', 'prothallus', 'thallus', 'B', 'Sporophyte is the dominant generation in pteridophytes.');

    -- Q40 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The leaves of a fern plant is called ______.', 'fill_in_blank', 'frond', 'Fern leaves are called fronds.');

    -- Q41 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Seed plants are also called:', 'multiple_choice', 'bryophytes', 'pteridophytes', 'spermatophytes', 'thallophytes', 'C', 'Spermatophytes are seed-producing plants.');

    -- Q42 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Among the gymnosperms, the most important are the:', 'multiple_choice', 'cycads', 'conifers', 'ginkgos', 'gnetophytes', 'B', 'Conifers are the most important and numerous gymnosperms.');

    -- Q43 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The wood of conifers is known as:', 'multiple_choice', 'hardwood', 'softwood', 'heartwood', 'sapwood', 'B', 'Conifer wood is called softwood.');

    -- Q44 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The angiosperms are also known as ______ plants.', 'fill_in_blank', 'flowering', 'Angiosperms are flowering plants that produce seeds enclosed in fruits.');

    -- Q45 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Angiosperms are generally classified into:', 'multiple_choice', 'bryophytes and pteridophytes', 'monocotyledons and dicotyledons', 'gymnosperms and angiosperms', 'algae and fungi', 'B', 'Angiosperms are divided into monocots and dicots.');

    -- Q46 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'An animal is either vertebrate or:', 'multiple_choice', 'mammal', 'invertebrate', 'reptile', 'amphibian', 'B', 'Animals are classified as vertebrates or invertebrates based on backbone presence.');

    -- Q47 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The vertebral column is referred to as:', 'multiple_choice', 'sternum', 'backbone or spine', 'rib cage', 'pelvis', 'B', 'Vertebral column is also called backbone or spine.');

    -- Q48 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Animals which do not have the vertebral column are called ______.', 'fill_in_blank', 'invertebrates', 'Invertebrates lack vertebral column.');

    -- Q49 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'All invertebrate animals are:', 'multiple_choice', 'warm-blooded', 'cold-blooded', 'endothermic', 'homeothermic', 'B', 'Invertebrates are cold-blooded (poikilothermic).');

    -- Q50 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The simplest of all groups in the animal kingdom is:', 'multiple_choice', 'Porifera', 'Cnidaria', 'Protozoa', 'Platyhelminthes', 'C', 'Protozoa are the simplest unicellular animals.');

    -- Q51 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The classification of Phylum Protozoa is based on:', 'multiple_choice', 'reproduction method', 'locomotory structure', 'nutrition type', 'habitat', 'B', 'Protozoa classification is based on locomotory structures like pseudopodia, cilia, or flagella.');

    -- Q52 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The most common species of Amoeba is ______.', 'fill_in_blank', 'Amoeba proteus', 'Amoeba proteus is the most common and well-studied species.');

    -- Q53 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The organ of feeding in amoeba is called:', 'multiple_choice', 'cilia', 'flagella', 'pseudopodia', 'tentacles', 'C', 'Pseudopodia are used for both locomotion and feeding in amoeba.');

    -- Q54 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'What is responsible for osmoregulation in amoeba?', 'multiple_choice', 'nucleus', 'contractile vacuole', 'food vacuole', 'mitochondria', 'B', 'Contractile vacuole regulates water content in amoeba.');

    -- Q55 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Protozoans are called ______ organisms.', 'multiple_choice', 'multicellular', 'acellular or non-cellular', 'colonial', 'filamentous', 'B', 'Protozoans are acellular or non-cellular as they lack true tissues.');

    -- Q56 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The Mesoglea contains types of cells which together form the ______.', 'fill_in_blank', 'Mesenchyme', 'Mesenchyme is the cellular component within mesoglea.');

    -- Q57 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Leucosolenia is an example of:', 'multiple_choice', 'Protozoa', 'Sponges', 'Cnidaria', 'Platyhelminthes', 'B', 'Leucosolenia is a simple sponge.');

    -- Q58 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Phylum Coelenterata comprises of how many classes?', 'multiple_choice', 'Two', 'Three', 'Four', 'Five', 'C', 'Coelenterata has four classes: Hydrozoa, Scyphozoa, Cubozoa, Anthozoa.');

    -- Q59 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The two forms of individuals in phylum Coelenterata are:', 'multiple_choice', 'larva and adult', 'polyp and medusa', 'male and female', 'sessile and motile', 'B', 'Coelenterates exist as polyps (sessile) and medusae (free-swimming).');

    -- Q60 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The ______ is the free swimming umbrella-like pelagic form with mouth at the end of the manubrium.', 'fill_in_blank', 'Medusa', 'Medusa is the free-swimming form in coelenterates.');

    -- Q61 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which class of coelenterates includes animals that are all polyps?', 'multiple_choice', 'Hydrozoa', 'Scyphozoa', 'Cubozoa', 'Anthozoa', 'D', 'Anthozoa includes only polyp forms like corals and sea anemones.');

    -- Q62 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The general characteristic features of Phylum Platyhelminthes include:', 'multiple_choice', 'radial symmetry', 'segmented body', 'bilaterally symmetrical and dorsoventrally flattened', 'presence of coelom', 'C', 'Platyhelminthes are flatworms with bilateral symmetry and flattened bodies.');

    -- Q63 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The phylum platyhelminthes is classified into how many classes?', 'multiple_choice', 'Two', 'Three', 'Four', 'Five', 'B', 'Platyhelminthes has three classes: Turbellaria, Trematoda, Cestoda.');

    -- Q64 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Sheep Liver–Fluke is called ______.', 'fill_in_blank', 'Fasciola Hepatica', 'Fasciola hepatica is the scientific name for sheep liver fluke.');

    -- Q65 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Fasciola hepatica requires how many hosts to complete its life-cycle?', 'multiple_choice', 'One', 'Two', 'Three', 'Four', 'B', 'Fasciola hepatica requires two hosts: snail and sheep.');

    -- Q66 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Aschelminthes are popularly known as:', 'multiple_choice', 'flatworms', 'roundworms', 'segmented worms', 'ribbon worms', 'B', 'Aschelminthes are commonly called roundworms.');

    -- Q67 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Roundworm Ascaris Lumbricoides is a parasite in the ______ of man.', 'multiple_choice', 'liver', 'intestine', 'lungs', 'blood', 'B', 'Ascaris lumbricoides parasitizes the human intestine.');

    -- Q68 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The phylum Aschelminthes are commonly known as ______.', 'fill_in_blank', 'Nematodes', 'Nematodes is another name for roundworms in phylum Aschelminthes.');

    -- Q69 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Earthworms, Neanthes and Leeches belong to the phylum:', 'multiple_choice', 'Annelida', 'Arthropoda', 'Mollusca', 'Nematoda', 'A', 'These are all segmented worms belonging to phylum Annelida.');

    -- Q70 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The Phylum Annelida is generally divided into how many classes?', 'multiple_choice', 'Two', 'Three', 'Four', 'Five', 'B', 'Annelida has three classes: Polychaeta, Oligochaeta, Hirudinea.');

    -- Q71 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Earthworm belongs to the class:', 'multiple_choice', 'Polychaeta', 'Oligochaeta', 'Hirudinea', 'Cestoda', 'B', 'Earthworms belong to class Oligochaeta.');

    -- Q72 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Leeches belong to the class ______.', 'fill_in_blank', 'Hirudinea', 'Hirudinea is the class containing leeches.');

    -- Q73 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In earthworm, the first segment where the mouth is situated is called:', 'multiple_choice', 'prostomium', 'peristomium', 'clitellum', 'setae', 'B', 'Peristomium is the first segment containing the mouth.');

    -- Q74 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In earthworm, the middle of each segment has a ring of chitinous structures called:', 'multiple_choice', 'parapodia', 'setae', 'suckers', 'clitellum', 'B', 'Setae are bristle-like structures aiding in locomotion.');

    -- Q75 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The Earthworm excretes waste products with the aid of an organ known as:', 'multiple_choice', 'nephridia', 'flame cells', 'malpighian tubules', 'kidneys', 'A', 'Nephridia are excretory organs in earthworms.');

    -- Q76 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'In earthworms, soil containing organic matter is digested and the residual soil is ejected as ______.', 'fill_in_blank', 'Casting', 'Earthworm castings are nutrient-rich waste products.');

    -- Q77 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The phylum Mollusca is characterized by:', 'multiple_choice', 'segmented body', 'jointed appendages', 'soft unsegmented bodies with muscular foot', 'radial symmetry', 'C', 'Mollusks have soft bodies with muscular foot and often a shell.');

    -- Q78 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Octopus, nautilus, cuttlefish and squids belong to the class:', 'multiple_choice', 'Gastropoda', 'Bivalvia', 'Cephalopoda', 'Pelecypoda', 'C', 'These are cephalopods with well-developed heads and tentacles.');

    -- Q79 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Snail belongs to the class:', 'multiple_choice', 'Gastropoda', 'Bivalvia', 'Cephalopoda', 'Pelecypoda', 'A', 'Snails are gastropods, the largest class of mollusks.');

    -- Q80 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'In the class gastropoda (snails), visceral mass undergoes a 90 to 180 degree twist known as ______.', 'fill_in_blank', 'Torsion', 'Torsion is the twisting of visceral mass in gastropods.');

    -- Q81 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The largest group of the animal Kingdom is:', 'multiple_choice', 'Mollusca', 'Annelida', 'Arthropoda', 'Chordata', 'C', 'Arthropoda is the largest phylum with over 700,000 species.');

    -- Q82 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Crabs, prawns and lobsters belong to the class:', 'multiple_choice', 'Insecta', 'Arachnida', 'Crustacea', 'Myriapoda', 'C', 'These are crustaceans, mainly aquatic arthropods.');

    -- Q83 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Grasshopper, cockroach and housefly belong to the class:', 'multiple_choice', 'Insecta', 'Arachnida', 'Crustacea', 'Myriapoda', 'A', 'These are insects, characterized by three body parts and six legs.');

    -- Q84 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Spiders, scorpions, mites and ticks belong to the class ______.', 'fill_in_blank', 'Arachnida', 'Arachnids have eight legs and two body segments.');

    -- Q85 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'About what percentage of all known species of animals are insects?', 'multiple_choice', '30%', '50%', '70%', '90%', 'C', 'Approximately 70% of all animal species are insects.');

    -- Q86 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'An insect carries out gaseous exchange by means of:', 'multiple_choice', 'gills', 'lungs', 'tracheae', 'skin', 'C', 'Insects breathe through a network of tracheal tubes.');

    -- Q87 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Cockroaches are ______ insects.', 'multiple_choice', 'diurnal', 'nocturnal', 'aquatic', 'parasitic', 'B', 'Cockroaches are nocturnal, active at night.');

    -- Q88 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'An Arachnid has a body divided into two parts: cephalothorax and ______.', 'fill_in_blank', 'abdomen', 'Arachnids have two main body parts: cephalothorax and abdomen.');

    -- Q89 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The body of insect is divided into how many parts?', 'multiple_choice', 'Two', 'Three', 'Four', 'Five', 'B', 'Insects have three body parts: head, thorax, and abdomen.');

    -- Q90 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Arthropods possess ______ which prevents them against water loss.', 'multiple_choice', 'endoskeleton', 'exoskeleton', 'hydrostatic skeleton', 'cartilage', 'B', 'Exoskeleton made of chitin protects against desiccation and predators.');

    -- Q91 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'All Echinoderms are:', 'multiple_choice', 'freshwater animals', 'marine animals', 'terrestrial animals', 'parasitic animals', 'B', 'All echinoderms are exclusively marine organisms.');

    -- Q92 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The Phylum Echinodermata includes five classes including Asteroidea which contains ______.', 'fill_in_blank', 'Star Fishes', 'Asteroidea is the class containing starfish.');

    -- Q93 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The Vertebrata is a subphylum of the Phylum:', 'multiple_choice', 'Annelida', 'Arthropoda', 'Chordata', 'Mollusca', 'C', 'Vertebrates belong to phylum Chordata, characterized by notochord presence.');

    -- Q94 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The vertebrates are divided into how many classes?', 'multiple_choice', 'Three', 'Four', 'Five', 'Six', 'C', 'Vertebrates have five classes: Pisces, Amphibia, Reptilia, Aves, Mammalia.');

    -- Q95 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Pisces have a ______ chambered heart.', 'multiple_choice', 'two', 'three', 'four', 'five', 'A', 'Fish have two-chambered hearts: one atrium and one ventricle.');

    -- Q96 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'In fishes, fertilization is usually ______.', 'fill_in_blank', 'external', 'Most fish exhibit external fertilization in water.');

    -- Q97 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Pisces carries out gaseous exchange by:', 'multiple_choice', 'lungs', 'gills', 'skin', 'tracheae', 'B', 'Fish use gills for respiration in aquatic environments.');

    -- Q98 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which group made the first transition from aquatic to terrestrial life?', 'multiple_choice', 'Reptiles', 'Amphibians', 'Birds', 'Mammals', 'B', 'Amphibians were the first vertebrates to transition to land.');

    -- Q99 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Frogs, toads, newts and salamanders are examples of:', 'multiple_choice', 'Reptiles', 'Amphibians', 'Fish', 'Mammals', 'B', 'These are all amphibians, living both in water and on land.');

    -- Q100 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Amphibians have a ______-chambered heart.', 'fill_in_blank', 'three', 'Amphibians have three-chambered hearts: two atria and one ventricle.');

    -- Continuing with 100 more questions to reach 200 total...

    -- Q101 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The young amphibians are known as:', 'multiple_choice', 'larvae', 'nymphs', 'tadpoles', 'fry', 'C', 'Young amphibians are called tadpoles, especially in frogs and toads.');

    -- Q102 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The adult amphibians have ______ for breathing.', 'multiple_choice', 'gills', 'lungs', 'tracheae', 'skin', 'B', 'Adult amphibians develop lungs for air breathing.');

    -- Q103 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Amphibians are ______ animals.', 'multiple_choice', 'warm-blooded', 'cold-blooded', 'endothermic', 'homeothermic', 'B', 'Amphibians are cold-blooded (poikilothermic).');

    -- Q104 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ are the first group of vertebrates to have become completely adapted to life on land.', 'fill_in_blank', 'Reptiles', 'Reptiles were the first fully terrestrial vertebrates.');

    -- Q105 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'There are ______ main groups of reptiles.', 'multiple_choice', 'two', 'three', 'four', 'five', 'C', 'Four main reptile groups: lizards, snakes, crocodiles, turtles.');

    -- Q106 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In reptiles, the embryo always lies in a fluid-filled sac known as:', 'multiple_choice', 'placenta', 'amnion', 'yolk sac', 'chorion', 'B', 'Amnion protects the embryo in a fluid environment.');

    -- Q107 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Aves have a ______ chambered heart.', 'multiple_choice', 'two', 'three', 'four', 'five', 'C', 'Birds have four-chambered hearts for efficient oxygenation.');

    -- Q108 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The head of a bird is small and ______.', 'fill_in_blank', 'rounded', 'Birds have small, rounded heads with beaks.');

    -- Q109 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The body of birds is covered with:', 'multiple_choice', 'scales', 'fur', 'feathers', 'shell', 'C', 'Feathers are characteristic of birds, providing insulation and enabling flight.');

    -- Q110 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The fore limbs of birds are modified to form:', 'multiple_choice', 'fins', 'wings', 'legs', 'antennae', 'B', 'Bird forelimbs are modified as wings for flight.');

    -- Q111 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Mammals have external ears called:', 'multiple_choice', 'tympanum', 'pinnae', 'ossicles', 'cochlea', 'B', 'Pinnae are external ears that collect sound waves.');

    -- Q112 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Mammals have ______ chambered heart.', 'fill_in_blank', 'four', 'Mammals have four-chambered hearts for complete separation of oxygenated and deoxygenated blood.');

    -- Q113 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In mammals, the body cavity is separated into two by a muscular sheet called:', 'multiple_choice', 'pericardium', 'pleura', 'diaphragm', 'peritoneum', 'C', 'Diaphragm separates thoracic and abdominal cavities.');

    -- Q114 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The capsids are made up of identical repeating subunits called:', 'multiple_choice', 'capsomeres', 'virions', 'prions', 'bacteriophages', 'A', 'Capsomeres are protein subunits that form viral capsids.');

    -- Q115 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A tissue responsible for secondary growth in plants is called:', 'multiple_choice', 'xylem', 'phloem', 'cambium', 'epidermis', 'C', 'Cambium is responsible for secondary growth in plants.');

    -- Q116 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The flower parts in dicot is usually in four while in monocot is in ______.', 'fill_in_blank', 'three', 'Monocot flowers typically have parts in multiples of three.');

    -- Q117 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Diatoms belong to the group of algae called:', 'multiple_choice', 'Chlorophyta', 'Phaeophyta', 'Bacillariophyta', 'Rhodophyta', 'C', 'Bacillariophyta is the phylum for diatoms.');

    -- Q118 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of the cells in Hydra is for absorption and digestion of food?', 'multiple_choice', 'cnidocytes', 'glandular cells', 'epithelial cells', 'nerve cells', 'B', 'Glandular cells secrete digestive enzymes in Hydra.');

    -- Q119 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In viruses, there is a protective coat called ______ around the nucleic core.', 'multiple_choice', 'envelope', 'capsid', 'membrane', 'wall', 'B', 'Capsid is the protein coat surrounding viral genetic material.');

    -- Q120 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The virus that causes HIV is called ______.', 'fill_in_blank', 'human immunodeficiency virus', 'HIV stands for Human Immunodeficiency Virus.');

    -- Q121 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The main diagnostic feature of round worm is that it is ______ at both ends.', 'multiple_choice', 'blunt', 'pointed', 'rounded', 'elongated', 'B', 'Roundworms are typically pointed at both ends.');

    -- Q122 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'What is the role of cell membrane in bacteria and other organisms?', 'multiple_choice', 'provides structural support', 'controls what goes in and out of the cell', 'produces energy', 'stores genetic material', 'B', 'Cell membrane regulates transport of substances in and out of cells.');

    -- Q123 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ includes all those eukaryotes that are considered as ancestors of plants, animals and fungi.', 'multiple_choice', 'Monera', 'Protista', 'Protoctista', 'Archaezoa', 'C', 'Protoctista includes ancestral eukaryotic organisms.');

    -- Q124 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Members of fungi either live as saprophytes or ______.', 'fill_in_blank', 'parasites', 'Fungi can be saprophytic (decomposers) or parasitic.');

    -- Q125 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The group of plants which are not differentiated into roots, stems and leaves is called:', 'multiple_choice', 'bryophytes', 'pteridophytes', 'thallophyta', 'spermatophyta', 'C', 'Thallophytes lack true roots, stems, and leaves.');

    -- Q126 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ are disease causing organisms which are specific to their host.', 'multiple_choice', 'Bacteria', 'Fungi', 'Viruses', 'Protozoa', 'C', 'Viruses are host-specific pathogens.');

    -- Q127 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The organelle in the cell that contains a mixture of water, salts, and organic compounds is called:', 'multiple_choice', 'nucleus', 'cytoplasmic matrix', 'mitochondria', 'ribosome', 'B', 'Cytoplasmic matrix is the fluid content where organelles are suspended.');

    -- Q128 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ is a structure in the plant cell that contains aqueous solution of mineral salts.', 'fill_in_blank', 'vacuole', 'Vacuole stores water, minerals, and helps maintain turgor pressure.');

    -- Q129 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A common example of fungi whose mycelium can produce both plus and minus is:', 'multiple_choice', 'Rhizopus', 'Neurospora', 'Saccharomyces', 'Penicillium', 'B', 'Neurospora is used in genetic studies and has plus and minus mating types.');

    -- Q130 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Other name for shield in arthropods is:', 'multiple_choice', 'carapace', 'exoskeleton', 'cuticle', 'thorax', 'A', 'Carapace is the dorsal shield in crustaceans and some other arthropods.');

    -- Q131 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The phylum ______ is the largest in terms of number of animal species.', 'multiple_choice', 'Mollusca', 'Chordata', 'Annelida', 'Arthropoda', 'D', 'Arthropoda contains the majority of animal species.');

    -- Q132 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The immunodeficiency virus belongs to the group of RNA viruses known as ______.', 'fill_in_blank', 'Retroviruses', 'HIV is a retrovirus that uses reverse transcriptase.');

    -- Q133 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Some bacteria without cell wall and can change their shape are called:', 'multiple_choice', 'bacilli', 'cocci', 'mycoplasmas', 'spirilla', 'C', 'Mycoplasmas lack cell walls and are pleomorphic.');

    -- Q134 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A coating on the outside of cell wall with a definite boundary in some bacteria is called ______ layer.', 'multiple_choice', 'capsule', 'slime', 'mucous', 'glycocalyx', 'B', 'Slime layer is a loose, protective coating outside bacterial cell wall.');

    -- Q135 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The group of plants though live on land but still dependent on water for completion of their life cycle is:', 'multiple_choice', 'algae', 'bryophytes', 'pteridophytes', 'gymnosperms', 'B', 'Bryophytes require water for fertilization as they have motile sperm.');

    -- Q136 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The ______ are the simplest form of land plants.', 'fill_in_blank', 'Bryophytes', 'Bryophytes are the simplest plants adapted to terrestrial life.');

    -- Q137 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Organisms can only use two forms of energy, either chemical or:', 'multiple_choice', 'thermal', 'mechanical', 'light', 'electrical', 'C', 'Organisms use either chemical energy or light energy (photosynthesis).');

    -- Q138 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A covering of insect body that has a great influence on growth is called:', 'multiple_choice', 'cuticle', 'chitin', 'exoskeleton', 'carapace', 'B', 'Chitin is the main component of insect exoskeleton.');

    -- Q139 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The vascular tissue in Pteridophyte is found in ______ generation.', 'multiple_choice', 'gametophyte', 'sporophyte', 'both generations', 'neither generation', 'B', 'Vascular tissues are present in sporophyte generation of pteridophytes.');

    -- Q140 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The group of plants which usually produce cones on which sporangia, spores and seeds develop is called ______.', 'fill_in_blank', 'Conifers', 'Conifers are gymnosperms that produce cones.');

    -- Q141 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'One of the challenges of ______ reproduction is how to get the non-motile gametes to reach the female gametes.', 'multiple_choice', 'bryophyte', 'pteridophyte', 'gymnosperm', 'angiosperm', 'D', 'Angiosperms face the challenge of pollen transfer to stigma.');

    -- Q142 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The ______ are known as vascular plants.', 'multiple_choice', 'bryophytes', 'thallophytes', 'tracheophytes', 'spermatophytes', 'C', 'Tracheophytes have vascular tissues (xylem and phloem).');

    -- Q143 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In the phylum Rhizopoda, the ______ have naked surface without differentiation.', 'multiple_choice', 'flagellates', 'ciliates', 'sarcodinians', 'sporozoans', 'C', 'Sarcodinians like amoeba have naked cell surfaces.');

    -- Q144 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The cell that is for capturing Hydra small animal food is called ______.', 'fill_in_blank', 'Stinging cells', 'Stinging cells (cnidocytes) capture prey in Hydra.');

    -- Q145 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of the following is not a characteristic of Annelids?', 'multiple_choice', 'They are bilaterally symmetrical', 'They have segmented bodies', 'They are not bilaterally symmetrical', 'They have a closed circulatory system', 'C', 'Annelids are bilaterally symmetrical, so this statement is incorrect.');

    -- Q146 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of these is not a class of Annelids?', 'multiple_choice', 'Polychaeta', 'Oligochaeta', 'Hirudinea', 'Entamelochaeta', 'D', 'Entamelochaeta is not a valid annelid class.');

    -- Q147 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The following are members of Annelids except:', 'multiple_choice', 'earthworm', 'leech', 'nereis', 'planaria', 'D', 'Planaria belongs to Platyhelminthes, not Annelida.');

    -- Q148 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The characteristics of arthropods include the following except ______.', 'fill_in_blank', 'Coelom highly developed', 'Arthropods have a reduced coelom, not highly developed.');

    -- Q149 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of these is not a class of the phylum arthropoda?', 'multiple_choice', 'Insecta', 'Arachnida', 'Crustacea', 'Polychaeta', 'D', 'Polychaeta is a class of Annelida, not Arthropoda.');

    -- Q150 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Arthropods are placed in the various classes on the bases of the following except:', 'multiple_choice', 'number of body segments', 'type of appendages', 'number of legs', 'number of segments', 'D', 'Number of segments is not a primary classification basis for arthropods.');

    -- Q151 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'What is the number of segments in Centipede?', 'multiple_choice', 'Between 5 to 10', 'Between 15 to 20', 'Between 25 to 30', 'Between 35 to 40', 'B', 'Centipedes typically have between 15 to 20 segments.');

    -- Q152 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Which of these triploblastic coelomates is unsegmented? ______', 'fill_in_blank', 'Molluscs', 'Molluscs are triploblastic coelomates but unsegmented.');

    -- Q153 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of these is not a class of vertebrates?', 'multiple_choice', 'Pisces', 'Amphibia', 'Reptilia', 'Gastropod', 'D', 'Gastropod is a class of Mollusca, not vertebrates.');

    -- Q154 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The part of mammalian skin which contains pigment for skin colour is called:', 'multiple_choice', 'epidermis', 'dermis', 'malpighian layer', 'subcutaneous layer', 'C', 'Malpighian layer contains melanocytes that produce skin pigment.');

    -- Q155 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of these statements is not correct about Paramecium?', 'multiple_choice', 'It moves by cilia', 'It has two nuclei', 'Oral groove and gullet are covered with flagella', 'It reproduces by conjugation', 'C', 'Paramecium has cilia, not flagella, in its oral groove.');

    -- Q156 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Which of these organisms is not a protozoa? ______', 'fill_in_blank', 'Cnidaria', 'Cnidaria is a phylum of multicellular animals, not protozoa.');

    -- Q157 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Amoeba belongs to the phylum:', 'multiple_choice', 'Ciliophora', 'Rhizopoda', 'Flagellata', 'Sporozoa', 'B', 'Amoeba belongs to phylum Rhizopoda, characterized by pseudopodia.');

    -- Q158 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Sporozoa is in the phylum of:', 'multiple_choice', 'Apicomplexa', 'Ciliophora', 'Rhizopoda', 'Zoomastigina', 'A', 'Sporozoans belong to phylum Apicomplexa.');

    -- Q159 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'An average size of Amoeba is:', 'multiple_choice', '0.002cm', '0.02cm', '0.2cm', '2.0cm', 'B', 'Amoeba typically measures about 0.02cm in size.');

    -- Q160 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The food substance of Amoeba are usually ______.', 'fill_in_blank', 'Diatoms', 'Amoeba commonly feeds on diatoms and other small organisms.');

    -- Q161 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Under which kingdom are bacteria classified?', 'multiple_choice', 'Protista', 'Monera', 'Fungi', 'Plantae', 'B', 'Bacteria are prokaryotes classified under Kingdom Monera.');

    -- Q162 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of the following phyla contain parasites?', 'multiple_choice', 'Porifera', 'Cnidaria', 'Apicomplexa', 'Ctenophora', 'C', 'Apicomplexa contains parasitic protozoans like Plasmodium.');

    -- Q163 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of these is not a characteristics of the members of Porifera?', 'multiple_choice', 'They are multicellular', 'They have specialized tissues', 'Their body is symmetrical', 'They have canal system', 'C', 'Sponges (Porifera) are generally asymmetrical.');

    -- Q164 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The following structures are part of reproduction in Porifera except ______.', 'fill_in_blank', 'Collar cells', 'Collar cells are for feeding, not reproduction.');

    -- Q165 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of these statements is not true about Sponges?', 'multiple_choice', 'They are multicellular', 'Their cells are highly specialised', 'They have true tissues', 'They are mostly marine', 'C', 'Sponges lack true tissues, having only cellular level organization.');

    -- Q166 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'What is the role of mesogloea in Cnidaria?', 'multiple_choice', 'Digestion', 'Reproduction', 'Separate ectoderm from endoderm', 'Locomotion', 'C', 'Mesogloea is the gelatinous layer between ectoderm and endoderm.');

    -- Q167 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A good example of Cnidaria is:', 'multiple_choice', 'Amoeba', 'Paramecium', 'Hydra', 'Planaria', 'C', 'Hydra is a freshwater cnidarian commonly studied.');

    -- Q168 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The stinging cells in Hydra that help to capture food organisms is called ______.', 'fill_in_blank', 'Nematocysts cells', 'Nematocysts are specialized stinging cells in cnidarians.');

    -- Q169 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of these groups of animals is the first to develop the organ system level of organization?', 'multiple_choice', 'Porifera', 'Cnidaria', 'Platyhelminthes', 'Nematoda', 'C', 'Platyhelminthes show the first true organ system level organization.');

    -- Q170 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of these is not a characteristic of platyhelminthes?', 'multiple_choice', 'Bilaterally symmetrical', 'Triploblastic', 'Biploblastic', 'Acoelomate', 'C', 'Platyhelminthes are triploblastic, not diploblastic.');

    -- Q171 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of these organisms is a member of Cestoda?', 'multiple_choice', 'Planaria', 'Fasciola', 'Taenia', 'Schistosoma', 'C', 'Taenia is a tapeworm belonging to class Cestoda.');

    -- Q172 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Nematodes possesses the following characteristics except ______.', 'fill_in_blank', 'The digestive canal is open at one end', 'Nematodes have complete digestive tracts with mouth and anus.');

    -- Q173 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Nematodes are like platyhelminthes in the following ways except in:', 'multiple_choice', 'bilateral symmetry', 'triploblastic organization', 'they are both segmented', 'presence of digestive system', 'C', 'Nematodes are unsegmented, unlike some platyhelminthes.');

    -- Q174 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The crustacean with wider thoracic and short abdomen is:', 'multiple_choice', 'prawn', 'crab', 'lobster', 'crayfish', 'B', 'Crabs have broad cephalothorax and short, folded abdomen.');

    -- Q175 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The appendage in the crayfish which branched into a pair of pointed chitinous structure is called:', 'multiple_choice', '1st Abdominal', '2nd Abdominal', '3rd Abdominal', '4th Abdominal', 'A', 'The first abdominal appendage is modified for reproduction.');

    -- Q176 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The serrated edge for gripping in crab is called ______.', 'fill_in_blank', 'Thoracic appendages', 'Crab thoracic appendages have serrated edges for gripping food.');

    -- Q177 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'If you are presented with an arthropod with head made up of six segments fused together, a pair of antennae and a pair of lateral compound eye, such arthropod is:', 'multiple_choice', 'arachnid', 'crustacean', 'insect', 'myriapod', 'C', 'These are characteristic features of insects.');

    -- Q178 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of the following is not a characteristic of Diplopoda?', 'multiple_choice', 'Two pairs of legs per segment', 'Rounded body', 'Herbivorous', 'A pair of legs in each segment', 'D', 'Diplopoda (millipedes) have two pairs of legs per segment, not one.');

    -- Q179 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Cold blooded animals also known as ______ animal.', 'multiple_choice', 'homeothermic', 'endothermic', 'poikilothermic', 'thermoregulatory', 'C', 'Poikilothermic means body temperature varies with environment.');

    -- Q180 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Which group of animal made the first translation from aquatic to the terrestrial mood of life? ______', 'fill_in_blank', 'Amphibian', 'Amphibians were the first vertebrates to transition to land.');

    -- Q181 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of these is an example of a bony fish?', 'multiple_choice', 'Shark', 'Ray', 'Carp', 'Lamprey', 'C', 'Carp is a bony fish (Osteichthyes).');

    -- Q182 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of these does the fish use in detecting movement and change in water pressure?', 'multiple_choice', 'gills', 'lateral line', 'swim bladder', 'fins', 'B', 'Lateral line system detects water vibrations and pressure changes.');

    -- Q183 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of these is an example of jawless fish?', 'multiple_choice', 'Shark', 'Ray', 'Lamprey', 'Tilapia', 'C', 'Lamprey is a jawless fish (Agnatha).');

    -- Q184 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Which of the following has naked moist skin? ______', 'fill_in_blank', 'Amphibian', 'Amphibians have naked, moist skin without scales.');

    -- Q185 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The head is small and rounded, whole body oval and stream-lined. These description best describe:', 'multiple_choice', 'fish', 'amphibian', 'reptile', 'bird', 'D', 'These are characteristic features of birds.');

    -- Q186 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of these is not an amphibian?', 'multiple_choice', 'Frog', 'Toad', 'Salamander', 'Skates', 'D', 'Skates are cartilaginous fish, not amphibians.');

    -- Q187 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of the following is not an example of a cartilaginous fish?', 'multiple_choice', 'Shark', 'Ray', 'Tilapia', 'Skate', 'C', 'Tilapia is a bony fish, not cartilaginous.');

    -- Q188 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The Hinds limbs of ______ have clawed digits modified for walking, perching, hopping, running or swimming.', 'fill_in_blank', 'Aves', 'Birds have hind limbs adapted for various locomotion types.');

    -- Q189 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'How many units are in the module 2 of BIO 102?', 'multiple_choice', '3 Units', '4 Units', '5 Units', '6 Units', 'C', 'Module 2 of BIO 102 contains 5 units.');

    -- Q190 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Nomenclature in biology is a binomial system following the work of:', 'multiple_choice', 'Aristotle', 'Darwin', 'Carl Linnaeus', 'Whittaker', 'C', 'Carl Linnaeus established the binomial nomenclature system.');

    -- Q191 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The sub-phylum vertebrata is made up of how many classes?', 'multiple_choice', '4', '5', '6', '7', 'C', 'Traditionally, vertebrates are divided into 6 classes including extinct forms.');

    -- Q192 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The classification that includes both internal and external features is ______.', 'fill_in_blank', 'Natural classification', 'Natural classification considers multiple characteristics including internal anatomy.');

    -- Q193 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The use of computer in the classification of organisms is called:', 'multiple_choice', 'cyber taxonomy', 'digital taxonomy', 'numerical taxonomy', 'computer taxonomy', 'C', 'Numerical taxonomy uses computational methods for classification.');

    -- Q194 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The average size of cell of prokaryotes in diameter is:', 'multiple_choice', '0.1 - 1 milimicron', '0.5 - 10 milimicron', '1 - 20 milimicron', '5 - 50 milimicron', 'B', 'Prokaryotic cells typically range from 0.5 to 10 micrometers.');

    -- Q195 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ is a nitrogen containing polysaccharide.', 'multiple_choice', 'Cellulose', 'Starch', 'Chitin', 'Glycogen', 'C', 'Chitin contains nitrogen and is found in fungal cell walls and arthropod exoskeletons.');

    -- Q196 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Evolutionally, autotrophic eukaryotes arrived on earth only ______ years ago.', 'fill_in_blank', '420 million', 'Autotrophic eukaryotes evolved around 420 million years ago.');

    -- Q197 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The simplest form of identification key is:', 'multiple_choice', 'multi-access key', 'dichotomous key', 'polyclave key', 'synoptic key', 'B', 'Dichotomous key uses paired statements for identification.');

    -- Q198 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The protective coat around the core of virus is called:', 'multiple_choice', 'envelope', 'capsid', 'membrane', 'wall', 'B', 'Capsid is the protein coat surrounding viral genetic material.');

    -- Q199 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Viruses that attack bacteria are called:', 'multiple_choice', 'bacteriophages', 'retroviruses', 'adenoviruses', 'herpesviruses', 'A', 'Bacteriophages specifically infect bacteria.');

    -- Q200 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'HIV virus belong to the group of RNA viruses known as ______.', 'fill_in_blank', 'Retroviruses', 'HIV is a retrovirus that uses reverse transcriptase to convert RNA to DNA.');

END $$;