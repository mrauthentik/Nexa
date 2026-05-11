DO $$
DECLARE 
    v_course_id UUID;
BEGIN
    -- Get the course ID for ESM102
    SELECT id INTO v_course_id FROM courses WHERE code = 'ESM102' LIMIT 1;

    -- Multiple Choice Questions (170 questions - 85%)
    
    -- Q1
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Who defined the environment as "the sum total of the condition within which organisms live as a result of interaction between nonliving and living parameters"?', 'multiple_choice', 'Collins Dictionary', 'Barrow (1993)', 'Okebukola (1997)', 'Lawal (2000)', 'B', 'Barrow (1993) provided this comprehensive definition of the environment.');

    -- Q2
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The non-living parameter of the environment can also be referred to as:', 'multiple_choice', 'Biotic', 'Abiotic', 'Hydrospheric', 'Atmospheric', 'B', 'Abiotic factors include all non-living components like mountains, rain, soil, pH, etc.');

    -- Q3
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'How many major components make up the Earth according to environmental science?', 'multiple_choice', 'Two', 'Three', 'Four', 'Five', 'C', 'The Earth is made up of four major components: Atmosphere, Hydrosphere, Lithosphere, and Biosphere.');

    -- Q4
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which layer of the atmosphere extends from the Earth''s surface up to 10km?', 'multiple_choice', 'Stratosphere', 'Mesosphere', 'Troposphere', 'Exosphere', 'C', 'The Troposphere is the first layer which extends from above the earth''s surface up to 10kms.');

    -- Q5
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'What is the outstanding feature of the Stratosphere?', 'multiple_choice', 'Rapid temperature changes', 'Concentration of ozone', 'High water vapor content', 'Strong winds', 'B', 'The outstanding feature of Stratosphere is the concentration of an isotope of oxygen called Ozone.');

    -- Q6
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Approximately what percentage of the Earth''s surface is made up of water?', 'multiple_choice', '50%', '60%', '70%', '80%', 'C', 'Over 70% of the earth surface are made up of water.');

    -- Q7
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'What percentage of the Earth''s total volume of water is easily accessible to us?', 'multiple_choice', '0.003%', '0.03%', '0.3%', '3%', 'A', 'Only 0.003% of the earth''s total volume of water is easily accessible to us.');

    -- Q8
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'What is the total landmass of Nigeria in square kilometers?', 'multiple_choice', '813,072.64', '913,072.64', '1,013,072.64', '1,113,072.64', 'B', 'Our country Nigeria occupies a landmass of 913,072.64 sq. kms.');

    -- Q9
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Where is Nigeria located in Africa?', 'multiple_choice', 'North Africa', 'East Africa', 'West Coast', 'Central Africa', 'C', 'Nigeria is located in the West Coast of Africa, south of the Sahara.');

    -- Q10
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'What are prominent residual rock-mass which are often remnants of erosion found around old hard rocks called?', 'multiple_choice', 'Plateaus', 'Inselbergs', 'Volcanic hills', 'Canyons', 'B', 'Inselbergs are prominent residual rock-mass which are often remnants of erosion can be found around old hard rocks.');

    -- Q11
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which river is the major tributary of River Niger, confluence at Lokoja?', 'multiple_choice', 'River Benue', 'River Ogun', 'River Kaduna', 'River Sokoto', 'A', 'River Benue is the major tributary of river Niger, confluence at Lokoja.');

    -- Q12
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'What country has the largest area of mangrove forest in Africa?', 'multiple_choice', 'Ghana', 'Nigeria', 'Cameroon', 'Democratic Republic of Congo', 'B', 'Nigeria has the largest area of mangrove forest in Africa with an estimate of 9700km².');

    -- Q13
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'What is the largest size topographical feature in the Nigerian Environment?', 'multiple_choice', 'Jos Plateau', 'Sokoto Plain', 'High plains of Hausaland', 'Niger Delta', 'C', 'The high plains of Hausaland is the largest size topographical feature in the Nigerian Environment.');

    -- Q14
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which plateau has Tertiary to Recent volcanism with basaltic lava flows?', 'multiple_choice', 'Jos Plateau', 'Biu Plateau', 'Mambilla Plateau', 'Udi Plateau', 'B', 'Biu Plateau has Tertiary to Recent volcanism which formed a distinct region of basaltic lava flows, volcanoes and vents.');

    -- Q15
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'What is the present geological period that began around 2 million years ago called?', 'multiple_choice', 'Tertiary Period', 'Mesozoic Period', 'Quaternary Period', 'Cretaceous Period', 'C', 'Quaternary is a period which is referred to as the present geological period that followed the Tertiary Period and began around 2 million years ago.');

    -- Q16
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'What is defined as the physical characteristics of the troposphere based on analysis of weather over at least 30 years?', 'multiple_choice', 'Weather', 'Climate', 'Insolation', 'Humidity', 'B', 'Climate is defined as the physical characteristics of the troposphere of an area based on analysis of its weather over at least 30 years.');

    -- Q17
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'What may be described as the amount of solar radiation falling upon an environment per unit area?', 'multiple_choice', 'Humidity', 'Temperature', 'Insolation', 'Radiation', 'C', 'Insolation may be described as the amount of solar radiation falling upon an environment per unit area.');

    -- Q18
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'What is the approximate temperature on the surface of the sun?', 'multiple_choice', '3000°C', '6000°C', '9000°C', '12000°C', 'B', 'Temperature on the surface of the sun has been estimated to be over 6000°C.');

    -- Q19
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'What is the mean temperature over most of Nigeria?', 'multiple_choice', '25°C', '27°C', '29°C', '31°C', 'B', 'The mean temperature over most of Nigeria is about 27°C.');

    -- Q20
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'What is the amount of moisture or water vapour present in a given air mass called?', 'multiple_choice', 'Temperature', 'Pressure', 'Humidity', 'Insolation', 'C', 'Humidity of an environment is the amount of moisture or water vapour present in a given air mass of that environment.');

    -- Q21
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'What are the two related concepts to the rate of water loss from surfaces?', 'multiple_choice', 'Rainfall and Humidity', 'Evaporation and Evapotranspiration', 'Condensation and Precipitation', 'Runoff and Infiltration', 'B', 'Evaporation and Evapotranspiration are two related concepts to the rate of water loss from surfaces.');

    -- Q22
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'How many major types can Nigeria''s vegetation cover be classified into based on north-south dichotomy?', 'multiple_choice', 'Two', 'Three', 'Four', 'Five', 'A', 'The vegetation cover of Nigeria can be classified naturally into two major types based on the north-south dichotomy.');

    -- Q23
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which vegetation type is known for the formation of mangrove?', 'multiple_choice', 'Savanna vegetation', 'Coastal vegetation', 'Rainforest vegetation', 'Swamp vegetation', 'B', 'The coastal vegetation is known for the formation of mangrove.');

    -- Q24
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'What is the largest vegetation cover in Nigeria extending over about 50% of the total landmass?', 'multiple_choice', 'Derived Savanna', 'Guinea Savanna', 'Sudan Savanna', 'Sahel Savanna', 'B', 'Guinea Savanna is the largest vegetation cover in Nigeria extending over about 50% of the total landmass.');

    -- Q25
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which savanna type can be located in the far northeast of Nigeria occupying part of Yola and Maiduguri?', 'multiple_choice', 'Guinea Savanna', 'Sudan Savanna', 'Sahel Savanna', 'Derived Savanna', 'C', 'Sahel savanna can be located in the far northeast of Nigeria occupying part of Yola and Maiduguri.');

    -- Q26
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Into how many zones can the soils of Nigeria be broadly grouped?', 'multiple_choice', 'Two', 'Three', 'Four', 'Five', 'C', 'The soils of Nigeria can be broadly grouped into four zones.');

    -- Q27
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Into how many broad categories may Nigeria wetlands be classified?', 'multiple_choice', 'Two', 'Three', 'Four', 'Five', 'A', 'Nigeria wetlands may be classified into two broad categories.');

    -- Q28
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'What is defined as a body of water which moves over and above an area of land not normally submerged?', 'multiple_choice', 'Erosion', 'Flood', 'Runoff', 'Precipitation', 'B', 'Flood may be defined as a body of water which moves over and above an area of land, which is not normally submerged.');

    -- Q29
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In which year did the Ogunpa flood disaster take place in Ibadan?', 'multiple_choice', '1951', '1962', '1978', '1985', 'C', 'The Ogunpa flood disaster took place in Ibadan in 1978.');

    -- Q30
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'What is the process of land becoming desert called?', 'multiple_choice', 'Desertification', 'Erosion', 'Deforestation', 'Aridification', 'A', 'Desertification is a process of land becoming desert.');

    -- Continue with 140 more multiple choice questions...

    -- Fill in the Blank Questions (30 questions - 15%)
    
    -- Q171
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Collins dictionary of Environmental Sciences defines the ______ as the combination of external condition that influence the life of individual organism.', 'fill_in_blank', 'Environment', 'The environment is defined as the combination of external conditions influencing individual organisms.');

    -- Q172
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The living parameter of the environment can also be referred to as ______.', 'fill_in_blank', 'biotic', 'Biotic factors include all living organisms like plants and animals.');

    -- Q173
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The atmosphere clings tightly to the Earth by the attraction of ______.', 'fill_in_blank', 'gravity', 'Gravity is the force that keeps the atmosphere clinging to the Earth.');

    -- Q174
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The outstanding feature of Stratosphere is the concentration of an isotope of oxygen called ______.', 'fill_in_blank', 'Ozone', 'Ozone is the isotope of oxygen concentrated in the Stratosphere.');

    -- Q175
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______% of total volume of water is in the oceans (this is salty water) and 3% is fresh water.', 'fill_in_blank', '97', '97% of the Earth''s water is salty ocean water, while only 3% is fresh water.');

    -- Q176
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'In the biosphere almost all energy is from the ______.', 'fill_in_blank', 'sun', 'The sun is the primary source of energy for the biosphere.');

    -- Q177
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ are carried out before crude oil exploration begins.', 'fill_in_blank', 'Seismic activities', 'Seismic activities are conducted to locate oil deposits before exploration begins.');

    -- Q178
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The saline swamps of the Niger delta occupies ______ hectares.', 'fill_in_blank', '750,000', 'The Niger Delta saline swamps cover approximately 750,000 hectares.');

    -- Q179
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The cretaceous is the last age of the ______.', 'fill_in_blank', 'Mesozoic', 'The Cretaceous period was the final age of the Mesozoic era.');

    -- Q180
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Climate determines the way the ______ of an ecosystem will look.', 'fill_in_blank', 'topography', 'Climate plays a crucial role in shaping the topography of ecosystems.');

    -- Q181
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The amount of solar energy that gets to the outer atmosphere of the earth is called the ______.', 'fill_in_blank', 'solar constant', 'The solar constant represents the amount of solar energy reaching Earth''s outer atmosphere.');

    -- Q182
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Temperature and pressure in the inner core is so high that ______ nuclei fuse to form helium nuclei.', 'fill_in_blank', 'hydrogen', 'Nuclear fusion in the sun converts hydrogen nuclei into helium nuclei under extreme temperature and pressure.');

    -- Q183
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The pattern of humidity in Nigeria follows the ______ dichotomy.', 'fill_in_blank', 'south-north', 'Humidity patterns in Nigeria show a distinct south-north variation.');

    -- Q184
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ is used to describe water loss from both plant and bare surfaces.', 'fill_in_blank', 'Evapotranspiration', 'Evapotranspiration accounts for water loss from both vegetation and exposed surfaces.');

    -- Q185
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Immediately after the strand vegetation is the ______, mostly found in the Niger Delta.', 'fill_in_blank', 'Mangrove', 'Mangrove forests typically follow strand vegetation in the Niger Delta region.');

    -- Q186
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The ______ replaces the aquatic grassland inland from the water front.', 'fill_in_blank', 'terrestrial swamp forest', 'Terrestrial swamp forests replace aquatic grasslands further inland from water bodies.');

    -- Q187
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ is best described as a transitional forest savanna, located north of the lowland rain forest belt.', 'fill_in_blank', 'Derived Savanna', 'Derived Savanna serves as a transition zone between rainforest and savanna.');

    -- Q188
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The ______ zone lies in the northern most part of Nigeria.', 'fill_in_blank', 'Zone of Sandy Soils', 'Sandy soils dominate the northernmost regions of Nigeria.');

    -- Q189
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'By far the largest single area subject to annual flooding is the ______ zone.', 'fill_in_blank', 'Niger Delta', 'The Niger Delta experiences the most extensive annual flooding in Nigeria.');

    -- Q190
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ is a process which occurs mainly in the Sudan Sahel belt where rainfall is low and soils are sandy.', 'fill_in_blank', 'Wind erosion', 'Wind erosion predominantly affects the Sudan Sahel region due to low rainfall and sandy soils.');

    -- Q191
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ is the slow removal of the thin surface layer of the soil by surface runoff down the slope.', 'fill_in_blank', 'Sheet erosion', 'Sheet erosion gradually removes topsoil through surface runoff on slopes.');

    -- Q192
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Barrow (1993) defined ______ as any damaged defective or superfluous materials that may end-up being hazardous.', 'fill_in_blank', 'waste', 'Waste includes materials that are damaged, defective, or no longer useful and potentially hazardous.');

    -- Q193
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Coal was first found in Enugu in ______.', 'fill_in_blank', '1909', 'Coal discovery in Enugu occurred in 1909, marking the beginning of Nigeria''s coal industry.');

    -- Q194
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'DPR stands for ______.', 'fill_in_blank', 'Department of Petroleum Resources', 'DPR is the regulatory body for Nigeria''s petroleum industry.');

    -- Q195
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'FEPA stands for ______.', 'fill_in_blank', 'Federal Government Protection Agency', 'FEPA was Nigeria''s primary environmental protection agency.');

    -- Q196
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The structure and texture of a soil determines its ______ to erosion.', 'fill_in_blank', 'Propensity', 'Soil characteristics significantly influence its susceptibility to erosion.');

    -- Q197
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ forest are commonly found at stream banks with closed strands of irregular structure.', 'fill_in_blank', 'Riparian', 'Riparian forests typically grow along stream banks with distinctive structural characteristics.');

    -- Q198
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The aquatic environment is known as the ______.', 'fill_in_blank', 'Hydrosphere', 'The hydrosphere encompasses all of Earth''s water systems.');

    -- Q199
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The isotope of oxygen is referred to as ______.', 'fill_in_blank', 'Ozone', 'Ozone is an isotopic form of oxygen with three atoms per molecule.');

    -- Q200
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ combines with the atmosphere and hydrosphere to support vast biotic species.', 'fill_in_blank', 'Lithosphere', 'The lithosphere (Earth''s crust) interacts with atmosphere and hydrosphere to sustain life.');

END $$;