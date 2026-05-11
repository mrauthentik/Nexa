DO $$
DECLARE 
    v_course_id UUID;
BEGIN
    SELECT id INTO v_course_id FROM courses WHERE code = 'SLM201' LIMIT 1;

    -- Q1 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Soil is composed mainly of mineral particles, organic matter, organisms, ______ and water.', 'multiple_choice', 'airpores', 'nutrients', 'chemicals', 'microbes', 'A', 'Soil is composed of mineral particles, organic matter, organisms, airpores and water.');

    -- Q2 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The soil supports the entire human race for ______, fibre, water, building materials construction sites and waste disposal.', 'fill_in_blank', 'food', 'Soil supports human race for food, fibre, water, and other needs.');

    -- Q3 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Soil science deals with the systematic study of soils as a ______ resource.', 'multiple_choice', 'renewable', 'non-renewable', 'abundant', 'limited', 'B', 'Soil science studies soils as a non-renewable resource.');

    -- Q4 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The soil comprises individual soils which are natural bodies of different ______ and behaviours.', 'multiple_choice', 'colors', 'characteristics', 'sizes', 'ages', 'B', 'Soils have different characteristics and behaviors.');

    -- Q5 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Each soil has specific properties, qualities and ______.', 'fill_in_blank', 'characteristics', 'Each soil has specific properties, qualities and characteristics.');

    -- Q6 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Chemists consider soils as the storehouse of ______ compounds.', 'multiple_choice', 'organic', 'chemical', 'mineral', 'biological', 'B', 'Chemists see soils as storehouse of chemical compounds.');

    -- Q7 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Engineers define soils as any ______ material regardless of depth or mode of formation.', 'multiple_choice', 'consolidated', 'unconsolidated', 'organic', 'mineral', 'B', 'Engineers define soils as unconsolidated material.');

    -- Q8 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Soil morphology refers to the study and description of the layers or ______ of the soil.', 'fill_in_blank', 'horizons', 'Soil morphology studies soil layers or horizons.');

    -- Q9 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A pedon is the smallest sampling unit that displays the full range of soil ______.', 'multiple_choice', 'colors', 'horizons', 'textures', 'minerals', 'B', 'Pedon displays full range of soil horizons.');

    -- Q10 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Two or more pedons of similar properties make up a ______ or soil individual.', 'multiple_choice', 'profile', 'polypedon', 'series', 'type', 'B', 'Multiple pedons make up a polypedon.');

    -- Q11 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Soils are made up of inorganic materials, organic materials, ______ and water.', 'fill_in_blank', 'air', 'Soils consist of inorganic, organic materials, air and water.');

    -- Q12 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The mineral component of soil contributes to the soil''s ______ and behaviour.', 'multiple_choice', 'color', 'properties', 'temperature', 'moisture', 'B', 'Mineral component contributes to soil properties and behavior.');

    -- Q13 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Soil provides anchorage, water, and ______ for plant growth.', 'multiple_choice', 'light', 'nutrients', 'heat', 'space', 'B', 'Soil provides anchorage, water, and nutrients for plants.');

    -- Q14 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Soil serves as a habitat for many ______ organisms.', 'fill_in_blank', 'micro', 'Soil serves as habitat for micro organisms.');

    -- Q15 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In the natural environment, soil filters and purifies ______.', 'multiple_choice', 'air', 'water', 'minerals', 'organic matter', 'B', 'Soil filters and purifies water in natural environment.');

    -- Q16 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Soil is used for construction of buildings and ______.', 'multiple_choice', 'roads', 'food', 'medicine', 'energy', 'A', 'Soil used for construction of buildings and roads.');

    -- Q17 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Soil is a medium for the disposal and natural treatment of human and ______ waste.', 'fill_in_blank', 'animal', 'Soil treats human and animal waste naturally.');

    -- Q18 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Soil serves as a base for all ______ systems and terrestrial ecosystems.', 'multiple_choice', 'aquatic', 'land-based', 'atmospheric', 'biological', 'B', 'Soil serves as base for land-based systems and ecosystems.');

    -- Q19 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Field studies and ______ studies are complementary in soil science.', 'multiple_choice', 'laboratory', 'theoretical', 'historical', 'geographical', 'A', 'Field and laboratory studies complement each other.');

    -- Q20 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The systematic study of soil enables us to know the ______, physical and biological properties of the soil.', 'fill_in_blank', 'chemical', 'Systematic study reveals chemical, physical and biological properties.');

    -- Q21 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The study of the history of the soil is referred to as ______.', 'multiple_choice', 'soil chemistry', 'soil genesis', 'soil physics', 'soil biology', 'B', 'Study of soil history is called soil genesis.');

    -- Q22 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Soil genesis helps us understand what has been going on in the soil that gave it the ______ it possesses today.', 'multiple_choice', 'color', 'properties', 'texture', 'structure', 'B', 'Soil genesis explains properties soils possess today.');

    -- Q23 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The knowledge of soil genesis enables us to make better decisions concerning soil ______ and management.', 'fill_in_blank', 'use', 'Soil genesis knowledge helps in soil use and management decisions.');

    -- Q24 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Soil genesis helps provide adequate method for ______ of our soils.', 'multiple_choice', 'classification', 'management', 'testing', 'mapping', 'B', 'Soil genesis helps provide management methods for soils.');

    -- Q25 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A rock is defined as a consolidated mass composed of one or more ______.', 'multiple_choice', 'minerals', 'soils', 'elements', 'compounds', 'A', 'Rock is consolidated mass of one or more minerals.');

    -- Q26 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Rocks are divided into three main groups: igneous, sedimentary and ______.', 'fill_in_blank', 'metamorphic', 'Three main rock groups: igneous, sedimentary, metamorphic.');

    -- Q27 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Parent material, climate, topography, organisms and ______ are the soil forming factors.', 'multiple_choice', 'time', 'water', 'air', 'temperature', 'A', 'Soil forming factors include parent material, climate, topography, organisms and time.');

    -- Q28 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Igneous rocks are formed from cooled ______.', 'multiple_choice', 'lava', 'magma', 'sediment', 'minerals', 'B', 'Igneous rocks form from cooled magma.');

    -- Q29 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Sedimentary rocks are formed by deposition and ______.', 'fill_in_blank', 'compaction', 'Sedimentary rocks form by deposition and compaction.');

    -- Q30 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Metamorphic rocks are formed by changes in igneous or ______ rocks.', 'multiple_choice', 'sedimentary', 'volcanic', 'mineral', 'organic', 'A', 'Metamorphic rocks form from changes in igneous or sedimentary rocks.');

    -- Continuing with 170 more questions...

    -- Q31 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The amount of ______ determines the acidity of a rock.', 'multiple_choice', 'calcium', 'silica', 'iron', 'magnesium', 'B', 'Amount of silica determines rock acidity.');

    -- Q32 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Granite consists mainly of quartz, feldspar, mica and ______.', 'fill_in_blank', 'silica (SiO₂)', 'Granite contains quartz, feldspar, mica and silica.');

    -- Q33 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The two types of igneous rocks are ______ and intrusive.', 'multiple_choice', 'extrusive', 'sedimentary', 'metamorphic', 'volcanic', 'A', 'Two types: extrusive and intrusive igneous rocks.');

    -- Q34 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Rainfall and ______ are the most important components of climate affecting soil formation.', 'multiple_choice', 'wind', 'temperature', 'humidity', 'sunlight', 'B', 'Rainfall and temperature are key climate components for soil formation.');

    -- Q35 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The equation for soil formation by Hans Jenny is: S = F (C, O, r, p, t), where "S" stands for ______.', 'fill_in_blank', 'the total effect of all the factors', 'S represents total effect of all soil forming factors.');

    -- Q36 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The factor "O" in Jenny''s soil formation equation represents ______.', 'multiple_choice', 'organism', 'oxygen', 'organic', 'oxide', 'A', 'O represents organism in Jenny''s equation.');

    -- Q37 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Rainfall affects the intensity of weathering and ______ within the soil.', 'multiple_choice', 'erosion', 'leaching', 'compaction', 'consolidation', 'B', 'Rainfall affects weathering and leaching intensity.');

    -- Q38 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The organic matter in soils is provided by ______.', 'fill_in_blank', 'vegetation', 'Organic matter provided by vegetation.');

    -- Q39 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Profile mixing, nutrient cycling and structural stability in soil are aided by ______.', 'multiple_choice', 'water', 'living organisms', 'minerals', 'air', 'B', 'Living organisms aid profile mixing, nutrient cycling and structural stability.');

    -- Q40 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Soil characteristics such as texture, structure, porosity and colour result from the actions of ______.', 'multiple_choice', 'soil forming processes', 'human activities', 'animal grazing', 'plant growth', 'A', 'Soil characteristics result from soil forming processes.');

    -- Q41 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Soil physics deals with the study of soil ______ conditions.', 'fill_in_blank', 'physical', 'Soil physics studies physical conditions of soil.');

    -- Q42 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Soil texture describes the ______, silt and clay composition of the soil.', 'multiple_choice', 'gravel', 'sand', 'loam', 'humus', 'B', 'Soil texture describes sand, silt and clay composition.');

    -- Q43 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Soil texture is defined as the relative proportion of particle size groupings on ______ basis.', 'multiple_choice', 'weight', 'volume', 'percentage', 'density', 'C', 'Soil texture defined on percentage basis.');

    -- Q44 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The smaller the particles in a soil, the more ______ and nutrients the soil can retain.', 'fill_in_blank', 'water', 'Smaller particles retain more water and nutrients.');

    -- Q45 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Soils are composed of a mixture of separates which are groups of soil particles of a given ______ ranges.', 'multiple_choice', 'size', 'color', 'weight', 'shape', 'A', 'Soil separates are groups of particles of given size ranges.');

    -- Q46 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Sandy soil is generally coarse, gritty, ______ with low cohesion.', 'multiple_choice', 'sticky', 'non-sticky', 'plastic', 'smooth', 'B', 'Sandy soil is coarse, gritty, non-sticky with low cohesion.');

    -- Q47 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Clay is ______ and plastic when wet but very hard when dry.', 'fill_in_blank', 'sticky', 'Clay is sticky and plastic when wet, hard when dry.');

    -- Q48 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Soil textural classes are classified into ______ different combinations.', 'multiple_choice', 'ten', 'twelve', 'fifteen', 'eight', 'B', 'Soil textural classes have twelve different combinations.');

    -- Q49 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Soil structure refers to the way soil particles are ______ into aggregates.', 'multiple_choice', 'broken', 'arranged', 'mixed', 'separated', 'B', 'Soil structure refers to arrangement of particles into aggregates.');

    -- Q50 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The two major classes of soil structure are ______ and compound structure.', 'fill_in_blank', 'simple', 'Two major classes: simple and compound structure.');

    -- Q51 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Soil consistence is the resistance of soil to ______ or rupture.', 'multiple_choice', 'water', 'deformation', 'compaction', 'erosion', 'B', 'Soil consistence is resistance to deformation or rupture.');

    -- Q52 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The physical condition of the soil in relation to ease of tillage and permeability is known as soil ______.', 'multiple_choice', 'texture', 'tilth', 'structure', 'consistence', 'B', 'Soil tilth relates to ease of tillage and permeability.');

    -- Q53 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The portion of a given volume of soil not filled with solid matter is called ______.', 'fill_in_blank', 'pore space', 'Pore space is portion not filled with solid matter.');

    -- Q54 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Macropores are mainly meant for ______ while micropores are meant to transmit water.', 'multiple_choice', 'water storage', 'aeration', 'root growth', 'nutrient storage', 'B', 'Macropores for aeration, micropores for water transmission.');

    -- Q55 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'An ideal agricultural soil has ______% macropores and 25% micropores.', 'multiple_choice', '25', '50', '75', '10', 'A', 'Ideal soil has 25% macropores and 25% micropores.');

    -- Q56 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Particle density is the ______ per unit volume of soil solids.', 'fill_in_blank', 'mass', 'Particle density is mass per unit volume of soil solids.');

    -- Q57 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Bulk density is the mass of soil per unit ______ volume of dry soil.', 'multiple_choice', 'particle', 'bulk', 'pore', 'solid', 'B', 'Bulk density is mass per unit bulk volume of dry soil.');

    -- Q58 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Soil permeability is the ease with which ______, water and roots move through the soil.', 'multiple_choice', 'minerals', 'air', 'nutrients', 'organisms', 'B', 'Permeability is ease of air, water and roots movement.');

    -- Q59 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Permeability is measured by the movement of water through the soil known as ______ conductivity.', 'fill_in_blank', 'hydraulic', 'Permeability measured by hydraulic conductivity.');

    -- Q60 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Good tilth allows rapid root growth and ease of ______ emergence.', 'multiple_choice', 'seed', 'seedling', 'plant', 'crop', 'B', 'Good tilth allows rapid root growth and seedling emergence.');

    -- Continuing with remaining questions to reach 200...

    -- Q61 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Soil classification is defined as the systematic arrangement of soils into groups or categories on the basis of their ______.', 'multiple_choice', 'color', 'observed properties', 'age', 'location', 'B', 'Soil classification based on observed properties.');

    -- Q62 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Classification systems based on observed properties are usually called ______ classification.', 'fill_in_blank', 'natural', 'Classification based on observed properties is natural classification.');

    -- Q63 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A classification system based on inferences from observed properties is called ______ classification.', 'multiple_choice', 'natural', 'technical', 'scientific', 'practical', 'B', 'Classification based on inferences is technical classification.');

    -- Q64 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The soil order is the ______ level and broadest group.', 'multiple_choice', 'lowest', 'highest', 'middle', 'specific', 'B', 'Soil order is highest and broadest classification level.');

    -- Q65 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Soil series group is more relevant to ______, builders, extension workers and others.', 'fill_in_blank', 'farmers', 'Soil series relevant to farmers, builders, extension workers.');

    -- Q66 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Soil classification enables us to ______ soil behaviour and estimate productivity.', 'multiple_choice', 'ignore', 'predict', 'change', 'measure', 'B', 'Classification helps predict soil behavior and productivity.');

    -- Q67 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Soil classification helps identify the ______ use of a particular soil.', 'multiple_choice', 'best', 'worst', 'current', 'future', 'A', 'Classification helps identify best use of particular soil.');

    -- Q68 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Organizing soils into groups with similar properties minimizes the problem of locating ______ about any one soil.', 'fill_in_blank', 'information', 'Grouping soils minimizes problem of locating information.');

    -- Q69 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A comprehensive study of the ______ environment is the first step in soil classification.', 'multiple_choice', 'biological', 'physical', 'chemical', 'social', 'B', 'Study of physical environment is first step in classification.');

    -- Q70 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Field mapping, soil characterization and ______ sampling follow the environmental study.', 'multiple_choice', 'laboratory', 'field', 'random', 'systematic', 'B', 'Field mapping, characterization and field sampling follow environmental study.');

    -- Q71 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The classifier formulates differentiates at the ______ category.', 'fill_in_blank', 'lowest', 'Classifier formulates differentiates at lowest category.');

    -- Q72 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Soil classification is followed by clustering of individuals into higher-level ______', 'multiple_choice', 'groups', 'taxa', 'categories', 'classes', 'B', 'Classification followed by clustering into higher-level taxa.');

    -- Q73 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Natural classification is also termed ______ classification.', 'multiple_choice', 'technical', 'scientific', 'practical', 'applied', 'B', 'Natural classification also called scientific classification.');

    -- Q74 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The USDA Soil Taxonomy System contains ______ categories.', 'fill_in_blank', 'six', 'USDA Soil Taxonomy has six categories.');

    -- Q75 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The USDA Soil Taxonomy System recognizes ______ Soil Orders.', 'multiple_choice', 'ten', 'eleven', 'twelve', 'thirteen', 'B', 'USDA system recognizes eleven Soil Orders.');

    -- Q76 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In USDA system, Order is subdivided into Suborder, Great Group, Subgroup, ______ and Series.', 'multiple_choice', 'Type', 'Family', 'Class', 'Genus', 'B', 'Order subdivided into Suborder, Great Group, Subgroup, Family and Series.');

    -- Q77 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The FAO–UNESCO Soil Map of the World is an example of ______ soil classification.', 'fill_in_blank', 'natural', 'FAO-UNESCO Soil Map is natural soil classification.');

    -- Q78 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Technical classification is aimed at a specific, applied, ______ purpose.', 'multiple_choice', 'theoretical', 'practical', 'scientific', 'educational', 'B', 'Technical classification for specific, applied, practical purpose.');

    -- Q79 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Examples of technical classification include USDA Land Capability Classification System and FAO Land ______ Classification.', 'multiple_choice', 'Use', 'Suitability', 'Quality', 'Type', 'B', 'Examples include USDA Land Capability and FAO Land Suitability.');

    -- Q80 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'A soil survey is a systematic examination, ______, classification and mapping of soils in an area.', 'fill_in_blank', 'description', 'Soil survey involves examination, description, classification and mapping.');

       -- Q81 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Soil surveys emphasize the less changeable properties of ______ and site.', 'multiple_choice', 'color', 'texture', 'pedon', 'structure', 'C', 'Soil surveys emphasize properties of pedon and site.');

    -- Q82 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The six types of soil surveys include schematic, exploratory, reconnaissance, semi-detailed, ______ and very detailed.', 'multiple_choice', 'basic', 'detailed', 'general', 'specific', 'B', 'Six types include schematic, exploratory, reconnaissance, semi-detailed, detailed and very detailed.');

    -- Q83 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Schematic surveys produce generalized soil maps and are often based on ______ extrapolation.', 'fill_in_blank', 'intuitive', 'Schematic surveys use intuitive extrapolation.');

    -- Q84 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Exploratory surveys assess the national effort required for ______ development.', 'multiple_choice', 'economic', 'physical', 'social', 'agricultural', 'B', 'Exploratory surveys assess effort for physical development.');

    -- Q85 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Reconnaissance surveys identify areas for further ______ soil survey work.', 'multiple_choice', 'extensive', 'intensive', 'basic', 'general', 'B', 'Reconnaissance identifies areas for intensive survey work.');

    -- Q86 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Semi-detailed surveys are also called ______ intensity soil surveys.', 'fill_in_blank', 'medium', 'Semi-detailed surveys are medium intensity surveys.');

    -- Q87 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Detailed soil surveys are also known as ______ surveys.', 'multiple_choice', 'feasibility', 'exploratory', 'reconnaissance', 'schematic', 'A', 'Detailed surveys also called feasibility surveys.');

    -- Q88 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Very detailed soil surveys are carried out at scales larger than ______.', 'multiple_choice', '1:5,000', '1:10,000', '1:15,000', '1:20,000', 'B', 'Very detailed surveys at scales larger than 1:10,000.');

    -- Q89 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'In the rigid grid procedure, soil examination is at fixed ______ throughout the survey area.', 'fill_in_blank', 'points', 'Rigid grid uses fixed examination points.');

    -- Q90 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Free survey is convenient in open country where both access and ______ are unrestricted.', 'multiple_choice', 'water', 'visibility', 'vegetation', 'slope', 'B', 'Free survey convenient with unrestricted access and visibility.');

    -- Q91 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A soil map shows the ______ of the soil mapping units.', 'multiple_choice', 'composition', 'distribution', 'properties', 'classification', 'B', 'Soil map shows distribution of mapping units.');

    -- Q92 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'One of the most critical features of a map is its ______.', 'fill_in_blank', 'scale', 'Map scale is most critical feature.');

    -- Q93 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A soil survey report explains the mapping units, their properties and ______.', 'multiple_choice', 'colors', 'relationships', 'ages', 'origins', 'B', 'Report explains mapping units, properties and relationships.');

    -- Q94 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The report includes prediction of yields of crops under specific ______ practices.', 'multiple_choice', 'farming', 'management', 'irrigation', 'fertilizer', 'B', 'Report predicts yields under specific management practices.');

    -- Q95 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The report also discusses how soil characteristics influence management ______ and their solutions.', 'fill_in_blank', 'problems', 'Report discusses management problems and solutions.');

    -- Q96 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Growth is defined as the progressive development of an ______.', 'multiple_choice', 'ecosystem', 'organism', 'environment', 'community', 'B', 'Growth is progressive development of an organism.');

    -- Q97 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Growth is expressed in terms of dry matter weight, length, height and ______.', 'multiple_choice', 'color', 'diameter', 'texture', 'density', 'B', 'Growth expressed as dry weight, length, height and diameter.');

    -- Q98 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'There are two major factors affecting plant growth: genetic and ______ factors.', 'fill_in_blank', 'environmental', 'Two factors: genetic and environmental.');

    -- Q99 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Environmental factors include all external conditions and ______ that affect plant life.', 'multiple_choice', 'genes', 'influences', 'nutrients', 'chemicals', 'B', 'Environmental factors include external conditions and influences.');

    -- Q100 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Unless both the genetic and environmental factors are controlled, the desired ______ may not manifest.', 'multiple_choice', 'color', 'yield', 'size', 'quality', 'B', 'Both factors must be controlled for desired yield.');

    -- Q101 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The major environmental factors are sunlight, availability of oxygen/carbon dioxide, soil moisture, temperature, soil reaction, and absence of ______.', 'fill_in_blank', 'toxic substances', 'Major factors include absence of toxic substances.');

    -- Q102 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'It has been estimated that about ______ gm of water is needed to produce 1 gm of dry plant material.', 'multiple_choice', '100', '500', '1000', '2000', 'B', 'About 500 gm water needed for 1 gm dry plant material.');

    -- Q103 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A good soil is one which has 25% micro-pores and 25% ______.', 'multiple_choice', 'macro-pores', 'solid matter', 'water', 'organic matter', 'A', 'Good soil has 25% micro-pores and 25% macro-pores.');

    -- Q104 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Water and oxygen are ______ related in terms of availability.', 'fill_in_blank', 'inversely', 'Water and oxygen availability are inversely related.');

    -- Q105 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Water is essential for photosynthesis, turgidity, evapotranspiration, nutrient uptake, and ______ of food.', 'multiple_choice', 'production', 'translocation', 'storage', 'digestion', 'B', 'Water essential for photosynthesis, turgidity, evapotranspiration, nutrient uptake, and translocation.');

    -- Q106 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The optimum moisture potential for higher plants is between ______ bar.', 'multiple_choice', '-0.1 to -1', '-1 to -5', '-5 to -10', '-10 to -15', 'A', 'Optimum moisture potential is -0.1 to -1 bar.');

    -- Q107 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Anaerobic microorganisms grow best under ______ conditions.', 'fill_in_blank', 'saturation', 'Anaerobic microbes grow best under saturation conditions.');

    -- Q108 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The optimum temperature range for plant growth is between ______ °C.', 'multiple_choice', '5-20', '15-40', '25-50', '30-60', 'B', 'Optimum temperature range is 15-40°C.');

    -- Q109 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The Q10 theory states that microbial activity doubles with every 10°C increase up to ______ °C.', 'multiple_choice', '30', '40', '50', '60', 'B', 'Q10 theory: activity doubles every 10°C up to 40°C.');

    -- Q110 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Most crops grow well at a pH of ______.', 'fill_in_blank', '6.5 – 7.0', 'Most crops grow well at pH 6.5-7.0.');

    -- Q111 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Bacteria and actinomycetes are less tolerant of ______ soils than fungi.', 'multiple_choice', 'alkaline', 'neutral', 'acid', 'saline', 'C', 'Bacteria and actinomycetes less tolerant of acid soils.');

    -- Q112 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'At low pH, Mn and ______ may become toxic.', 'multiple_choice', 'Ca', 'Al³⁺', 'K', 'Na', 'B', 'At low pH, Mn and Al³⁺ may become toxic.');

    -- Q113 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The rhizosphere is the portion of soil about ______ mm from the root surface.', 'fill_in_blank', '2', 'Rhizosphere is about 2mm from root surface.');

    -- Q114 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The three mechanisms by which nutrients move to roots are mass flow, diffusion, and ______.', 'multiple_choice', 'osmosis', 'root interception', 'capillary action', 'gravity', 'B', 'Three mechanisms: mass flow, diffusion, and root interception.');

    -- Q115 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Mass flow is the major mechanism for ______ and magnesium.', 'multiple_choice', 'calcium', 'phosphorus', 'nitrogen', 'potassium', 'A', 'Mass flow major for calcium and magnesium.');

    -- Q116 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Diffusion is important for nutrients like phosphorus and ______.', 'fill_in_blank', 'potassium', 'Diffusion important for phosphorus and potassium.');

    -- Q117 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The most acceptable mechanism for ion uptake by plants is the ______ hypothesis.', 'multiple_choice', 'carrier', 'osmotic', 'diffusion', 'active transport', 'A', 'Carrier hypothesis most accepted for ion uptake.');

    -- Q118 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Ion exchange allows ______ on the root surface to be swapped with ions in solution.', 'multiple_choice', 'O²⁻ ions', 'H⁺ ions', 'OH⁻ ions', 'CO₃²⁻ ions', 'B', 'Ion exchange allows H⁺ ions to be swapped.');

    -- Q119 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Nutrient absorption against concentration gradient is explained by ______ transport.', 'fill_in_blank', 'active', 'Active transport explains absorption against gradient.');

    -- Q120 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A nutrient must be in ______ form to be absorbed by the plant.', 'multiple_choice', 'solid', 'soluble', 'gaseous', 'organic', 'B', 'Nutrients must be in soluble form for absorption.');

    -- Q121 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A limiting factor is any growth factor that is ______ in quantity or quality.', 'multiple_choice', 'excessive', 'deficient', 'balanced', 'optimal', 'B', 'Limiting factor is deficient in quantity or quality.');

    -- Q122 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The Mitscherlich''s law expresses the diminishing yield increase as a growth factor becomes ______.', 'fill_in_blank', 'adequate', 'Mitscherlich''s law: diminishing yield as factor becomes adequate.');

    -- Q123 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The equation \( \text{Log (A–y) = Log A} - 0.301x \) is a form of ______''s Law.', 'multiple_choice', 'Boyle''s', 'Mitscherlich''s', 'Newton''s', 'Darcy''s', 'B', 'This equation is Mitscherlich''s Law.');

    -- Q124 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The rhizosphere differs from bulk soil in pH, microbial population and ______ concentration.', 'multiple_choice', 'water', 'nutrient', 'oxygen', 'carbon dioxide', 'B', 'Rhizosphere differs in pH, microbes and nutrient concentration.');

    -- Q125 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Knowledge of growth factors is important for anyone intending to make farming a ______ venture.', 'fill_in_blank', 'profitable', 'Growth factors knowledge important for profitable farming.');

    -- Q126 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'On average, crop plants use ______ of water to produce a kilogram of dry plant matter.', 'multiple_choice', '100-150 liters', '220 to 320 liters', '400-500 liters', '600-700 liters', 'B', 'Crops use 220-320 liters water per kg dry matter.');

    -- Q127 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ deficiency commonly limits plant growth in several agricultural areas.', 'multiple_choice', 'Nutrient', 'Water', 'Light', 'Oxygen', 'B', 'Water deficiency commonly limits plant growth.');

    -- Q128 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Plant cells are largely made up of ______.', 'fill_in_blank', 'water', 'Plant cells largely made of water.');

    -- Q129 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Water pressure in plant tissue helps keep stems ______ and leaves expanded.', 'multiple_choice', 'flexible', 'upright', 'green', 'strong', 'B', 'Water pressure keeps stems upright and leaves expanded.');

    -- Q130 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Water is used as a building block in ______ during photosynthesis.', 'multiple_choice', 'proteins', 'carbohydrates', 'fats', 'vitamins', 'B', 'Water used as building block in carbohydrates during photosynthesis.');

    -- Q131 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The evaporation of water from the leaf is called ______.', 'fill_in_blank', 'transpiration', 'Evaporation from leaf is transpiration.');

    -- Q132 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Plant nutrients move toward roots through the ______.', 'multiple_choice', 'air', 'water', 'soil', 'roots', 'B', 'Nutrients move toward roots through water.');

    -- Q133 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Water carries nutrients and ______ throughout the plant.', 'multiple_choice', 'oxygen', 'carbohydrates', 'minerals', 'hormones', 'B', 'Water carries nutrients and carbohydrates throughout plant.');

    -- Q134 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Water stress is caused by a shortage of water in ______.', 'fill_in_blank', 'plant tissue', 'Water stress from shortage in plant tissue.');

    -- Q135 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ begin to close when a plant becomes deficient in water, reducing gas exchange.', 'multiple_choice', 'Root hairs', 'Guard cells', 'Stomata', 'Leaf veins', 'B', 'Guard cells close when plant deficient in water.');

    -- Q136 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The point at which a plant temporarily wilts but can recover is called the ______.', 'multiple_choice', 'permanent wilting point', 'temporary wilting point', 'field capacity', 'saturation point', 'B', 'Temporary wilting point: plant wilts but can recover.');

    -- Q137 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'When plants cannot recover from water deficiency, it is called the ______', 'fill_in_blank', 'permanent wilting point', 'Permanent wilting point: plants cannot recover.');

    -- Q138 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Corn plants exhibit water stress by ______.', 'multiple_choice', 'leaf curling', 'stem bending', 'root growth', 'flowering', 'A', 'Corn shows water stress by leaf curling.');

    -- Q139 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ is very sensitive to water shortage in plants.', 'multiple_choice', 'Flowering', 'Seed germination', 'Fruiting', 'Root development', 'B', 'Seed germination very sensitive to water shortage.');

    -- Q140 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The most obvious force influencing water movement in soil is ______.', 'fill_in_blank', 'gravitational force', 'Gravity most obvious force for water movement.');

    -- Q141 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Adhesion is the attraction of soil water to ______.', 'multiple_choice', 'other water molecules', 'soil particles', 'plant roots', 'air', 'B', 'Adhesion is attraction of water to soil particles.');

    -- Q142 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Cohesion is the attraction of water molecules to ______.', 'multiple_choice', 'soil particles', 'other water molecules', 'minerals', 'organic matter', 'B', 'Cohesion is attraction between water molecules.');

    -- Q143 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Hydrogen bonds account for both cohesion and ______.', 'fill_in_blank', 'adhesion', 'Hydrogen bonds account for cohesion and adhesion.');

    -- Q144 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Water that forms a thin inner film on soil particles is held tightly and cannot ______.', 'multiple_choice', 'evaporate', 'move', 'freeze', 'boil', 'B', 'Inner water film held tightly and cannot move.');

    -- Q145 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The outer water film held by cohesion is also known as ______.', 'multiple_choice', 'gravitational water', 'capillary water', 'hygroscopic water', 'vapor water', 'B', 'Outer water film is capillary water.');

    -- Q146 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Soil water exists in small spaces in the soil as a water ______ around soil particles.', 'fill_in_blank', 'film', 'Soil water exists as film around particles.');

    -- Q147 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Capillary action allows soil water to move against ______.', 'multiple_choice', 'pressure', 'gravity', 'temperature', 'wind', 'B', 'Capillary action moves water against gravity.');

    -- Q148 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ pores create greater capillary movement.', 'multiple_choice', 'Larger', 'Smaller', 'Medium', 'Irregular', 'B', 'Smaller pores create greater capillary movement.');

    -- Q149 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Water flows under saturated conditions and is also called saturated flow.', 'fill_in_blank', 'Gravitational', 'Gravitational water flows under saturated conditions.');

    -- Q150 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Water enters the soil first by infiltration and then ______ through the profile.', 'multiple_choice', 'evaporates', 'percolates', 'condenses', 'transpires', 'B', 'Water enters by infiltration then percolates through profile.');

    -- Q151 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Moisture enters plant roots through a process called ______.', 'multiple_choice', 'diffusion', 'osmosis', 'absorption', 'adsorption', 'B', 'Moisture enters roots through osmosis.');

    -- Q152 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'In osmosis, water moves from a zone of higher concentration to one of ______ concentration.', 'fill_in_blank', 'lower', 'In osmosis, water moves to lower concentration.');

    -- Q153 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The entrance of water and solutes through the root membrane occurs via ______ processes.', 'multiple_choice', 'similar', 'separate', 'combined', 'opposite', 'B', 'Water and solutes enter via separate processes.');

    -- Q154 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'For nutrient absorption, materials must be in a ______ form.', 'multiple_choice', 'solid', 'solution', 'gaseous', 'crystalline', 'B', 'Nutrients must be in solution form for absorption.');

    -- Q155 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Nutrients move with soil moisture and may accumulate near roots via ______.', 'fill_in_blank', 'capillarity', 'Nutrients accumulate near roots via capillarity.');

    -- Q156 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Vertical salt movement during drought can lead to visible ______ at the surface.', 'multiple_choice', 'erosion', 'salt accumulation', 'cracking', 'crusting', 'B', 'Drought causes salt accumulation at surface.');

    -- Q157 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Excess rainfall displaces soil solution and results in ______ of nutrients.', 'multiple_choice', 'accumulation', 'leaching', 'fixation', 'volatilization', 'B', 'Excess rainfall causes leaching of nutrients.');

    -- Q158 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ helps in nutrient movement in the plant and cooling of leaves.', 'fill_in_blank', 'Transpiration', 'Transpiration helps nutrient movement and cooling.');

    -- Q159 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Soil aeration is the process of ______ in soil that ensures oxygen sufficiency and prevents carbon dioxide toxicity.', 'multiple_choice', 'water movement', 'gas exchange', 'nutrient cycling', 'organic decomposition', 'B', 'Soil aeration is gas exchange process.');

    -- Q160 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A well-aerated soil allows normal functioning of plant roots and ______ microorganisms.', 'multiple_choice', 'anaerobic', 'aerobic', 'facultative', 'obligate', 'B', 'Well-aerated soil supports aerobic microorganisms.');

    -- Q161 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'In a well-aerated soil, micropores and macropores should each occupy ______%.', 'fill_in_blank', '25', 'Well-aerated soil has 25% micropores and 25% macropores.');

    -- Q162 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Coarse textured soils like sandy loam are best suited to areas of ______ rainfall.', 'multiple_choice', 'low', 'frequent', 'irregular', 'heavy', 'B', 'Sandy soils best for areas of frequent rainfall.');

    -- Q163 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Medium textured soils have good aeration and usually ______ water conditions.', 'multiple_choice', 'poor', 'optimum', 'excess', 'deficient', 'B', 'Medium textures have good aeration and optimum water.');

    -- Q164 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Fine textured soils are easily ______ but are good in long drought areas.', 'fill_in_blank', 'water-logged', 'Fine textures easily water-logged but good in drought.');

    -- Q165 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The redox potential (Eh) is the measure of the ______ status of the soil.', 'multiple_choice', 'nutrient', 'oxidation-reduction', 'water', 'temperature', 'B', 'Redox potential measures oxidation-reduction status.');

    -- Q166 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In aerobic soils, chemical elements are usually in ______ forms.', 'multiple_choice', 'reduced', 'oxidized', 'neutral', 'ionic', 'B', 'Aerobic soils have elements in oxidized forms.');

    -- Q167 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'In anaerobic soils, elements like Fe³⁺ and Mn⁴⁺ are reduced to more ______ forms.', 'fill_in_blank', 'soluble', 'In anaerobic soils, elements reduced to soluble forms.');

    -- Q168 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In a well-aerated soil, redox potential typically lies between ______ volts.', 'multiple_choice', '0.1 and 0.3', '0.5 and 0.8', '1.0 and 1.5', '2.0 and 3.0', 'B', 'Well-aerated soil Eh between 0.5 and 0.8 volts.');

    -- Q169 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Under anaerobic conditions, toxic substances like ______ and methane (CH₄) form.', 'multiple_choice', 'sulfide', 'nitrate', 'sulfate', 'carbonate', 'A', 'Anaerobic conditions produce sulfide and methane.');

    -- Q170 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Respiration and decomposition use oxygen and evolve ______.', 'fill_in_blank', 'carbon dioxide (CO₂)', 'Respiration and decomposition produce CO₂.');

    -- Q171 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Oxygen decreases while CO₂ increases with ______.', 'multiple_choice', 'time', 'depth', 'temperature', 'moisture', 'B', 'Oxygen decreases, CO₂ increases with depth.');

    -- Q172 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Soil CO₂ concentration is higher during ______ season due to limited gas exchange.', 'multiple_choice', 'dry', 'rainy', 'winter', 'summer', 'B', 'CO₂ higher in rainy season due to limited gas exchange.');

    -- Q173 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Application of farmyard manure increases soil CO₂ especially when soil is ______.', 'fill_in_blank', 'wet', 'Manure increases CO₂ when soil is wet.');

    -- Q174 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Green manuring may lead to poor ______ if seeds are sown too soon.', 'multiple_choice', 'growth', 'germination', 'yield', 'quality', 'B', 'Green manuring may cause poor germination if sown too soon.');

    -- Q175 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In tropical soils, decomposition of organic matter is very ______.', 'multiple_choice', 'slow', 'rapid', 'moderate', 'variable', 'B', 'In tropical soils, decomposition is very rapid.');

    -- Q176 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Most aerobic soil microorganisms absorb oxygen via ______ enzyme system.', 'fill_in_blank', 'cytochrome oxidase', 'Aerobic microbes use cytochrome oxidase system.');

    -- Q177 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Mineralization is the microbial release of plant nutrients, particularly ______.', 'multiple_choice', 'nitrate', 'ammonium (NH₄⁺)', 'phosphate', 'sulfate', 'B', 'Mineralization releases ammonium (NH₄⁺).');

    -- Q178 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Under continued aerobism, ammonium is oxidized by autotrophs to ______.', 'multiple_choice', 'nitrite', 'nitrate (NO₃⁻)', 'nitrogen gas', 'ammonia', 'B', 'Ammonium oxidized to nitrate (NO₃⁻) under aerobism.');

    -- Q179 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Crops like sorghum are more tolerant to poor ______ than maize.', 'fill_in_blank', 'aeration', 'Sorghum more tolerant to poor aeration than maize.');

    -- Q180 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Practical drainage methods include surface ditches, ridging, and ______ moulding.', 'multiple_choice', 'bed', 'ridge', 'flat', 'contour', 'A', 'Drainage methods: ditches, ridging, and bed moulding.');

    -- Q181 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Paddy rice develops internal ______ to cope with poor aeration.', 'multiple_choice', 'roots', 'air spaces', 'channels', 'vessels', 'B', 'Paddy rice develops internal air spaces.');

    -- Q182 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Overdrainage in calcareous soils can raise pH and reduce ______ iron availability.', 'fill_in_blank', 'ferrous', 'Overdrainage reduces ferrous iron availability.');

    -- Q183 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The optimum temperature range for most tropical crops is ______ °C.', 'multiple_choice', '10-20', '20-35', '30-45', '15-30', 'B', 'Optimum temperature for tropical crops: 20-35°C.');

    -- Q184 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Wheat and peas germinate best between ______ °C.', 'multiple_choice', '4-10', '15-25', '20-30', '25-35', 'A', 'Wheat and peas germinate best at 4-10°C.');

    -- Q185 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Soil temperature affects decomposition, nutrient uptake, and ______ emergence.', 'fill_in_blank', 'seedling', 'Soil temperature affects decomposition, nutrient uptake, and seedling emergence.');

    -- Q186 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Net radiation is the energy retained after losses via reflection and ______ radiation.', 'multiple_choice', 'solar', 'thermal', 'ultraviolet', 'infrared', 'B', 'Net radiation after reflection and thermal radiation losses.');

    -- Q187 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Only about ______ % of net radiation is stored as heat in soil and plants.', 'multiple_choice', '1-5', '5-15', '15-25', '25-35', 'B', 'Only 5-15% net radiation stored as heat.');

    -- Q188 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Vegetation canopy slows heating and cooling of ______ soils.', 'fill_in_blank', 'underlying', 'Vegetation canopy slows heating/cooling of underlying soils.');

    -- Q189 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Organic mulches lower soil temperature by ______ air within them.', 'multiple_choice', 'heating', 'cooling', 'immobilizing', 'circulating', 'C', 'Organic mulches lower temperature by immobilizing air.');

    -- Q190 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Sandy soils warm faster than clay soils and are called ______ soils.', 'multiple_choice', 'cool', 'warm', 'neutral', 'temperate', 'B', 'Sandy soils warm faster, called warm soils.');

    -- Q191 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Moist soils conduct heat better but warm up more ______ than dry soils.', 'fill_in_blank', 'slowly', 'Moist soils conduct heat better but warm slowly.');

    -- Q192 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Evaporation of soil moisture uses up absorbed ______ energy.', 'multiple_choice', 'solar', 'thermal', 'chemical', 'kinetic', 'A', 'Evaporation uses absorbed solar energy.');

    -- Q193 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Diumal soil temperature variation is higher in ______ soils.', 'multiple_choice', 'clay', 'sandy', 'loamy', 'organic', 'B', 'Diurnal variation higher in sandy soils.');

    -- Q194 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Soil organic matter consists of all parts of living and dead plants and animals, and products of ______ processes.', 'fill_in_blank', 'decaying', 'Organic matter includes decaying process products.');

    -- Q195 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The darker the soil, the more ______ it is likely to contain.', 'multiple_choice', 'minerals', 'organic matter', 'water', 'air', 'B', 'Darker soils likely contain more organic matter.');

    -- Q196 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Organic matter is a major source of ______ elements.', 'multiple_choice', 'mineral', 'plant nutrient', 'trace', 'heavy metal', 'B', 'Organic matter major source of plant nutrient elements.');

    -- Q197 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Organic matter improves water-holding capacity, aggregate stability, permeability, and other ______ soil properties.', 'fill_in_blank', 'desirable', 'Organic matter improves desirable soil properties.');

    -- Q198 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The greatest amount of organic matter in the soil resides in the ______.', 'multiple_choice', 'subsoil', 'top soil', 'parent material', 'bedrock', 'B', 'Most organic matter in top soil.');

    -- Q199 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Plant sources of soil organic matter include leaf droppings, crop residues, green manures and ______ parts.', 'multiple_choice', 'underground', 'above ground', 'woody', 'herbaceous', 'B', 'Plant sources include above ground parts.');

    -- Q200 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Animal sources include faeces, manures, and ______ residues.', 'fill_in_blank', 'microbial', 'Animal sources include microbial residues.');

END $$;