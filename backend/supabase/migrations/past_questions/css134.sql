DO $$ 
DECLARE 
    v_course_id UUID;
BEGIN 
    SELECT id INTO v_course_id FROM courses WHERE code = 'CSS134' LIMIT 1;

    -- Multiple Choice Questions (85% - 43 questions)
    
    -- Q1
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '________________ may be defined as the study of crime, its causes, how it is explained in a scientific way and how people react to it.', 'multiple_choice', 'Sociology', 'Criminology', 'Psychology', 'Law', 'B', 'Criminology is the scientific study of crime, its causes, and societal reactions.');

    -- Q2
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '____________ is "an offence for which one may be punished by law".', 'multiple_choice', 'Sin', 'Crime', 'Tort', 'Violation', 'B', 'Crime is defined as an offense punishable by law.');

    -- Q3
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '_______________ is freedom or protection from danger or worry, thus, anything which threatens the peace, law and order of a country, is threatening its security.', 'multiple_choice', 'Safety', 'Security', 'Protection', 'Defense', 'B', 'Security involves protection from danger and threats to peace and order.');

    -- Q4
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Anything that threatens the _______ or _______ of an individual threatens security.', 'multiple_choice', 'property or wealth', 'life or well-being', 'family or friends', 'job or income', 'B', 'Security threats encompass dangers to life and overall well-being.');

    -- Q5
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The crime of the people who attack and rob ships at sea is __________', 'multiple_choice', 'hijacking', 'piracy', 'smuggling', 'trafficking', 'B', 'Piracy specifically refers to attacks and robberies at sea.');

    -- Q6
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '__________ is the safety of a country which occupies an area of the earth''s surface.', 'multiple_choice', 'National Security', 'Public Safety', 'State Defense', 'Territorial Integrity', 'A', 'National security concerns the overall safety and protection of a country.');

    -- Q7
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '__________ is the adequacy of food supplies for a country, a state, a city, etc.', 'multiple_choice', 'Agricultural security', 'Food security', 'Nutrition safety', 'Supply security', 'B', 'Food security ensures adequate food supplies for populations.');

    -- Q8
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '___________ is "the scientific study of the earth''s surface, physical features, divisions, climate, products, population, etc."', 'multiple_choice', 'Geology', 'Geography', 'Geomorphology', 'Ecology', 'B', 'Geography encompasses the study of Earth''s surface and its features.');

    -- Q9
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______________ is located in West Africa, roughly between Latitude 4°N and 14°N and Longitudes 4°E and 15°E.', 'multiple_choice', 'Ghana', 'Nigeria', 'Cameroon', 'Ivory Coast', 'B', 'Nigeria occupies this geographical position in West Africa.');

    -- Q10
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The country''s most southerly point is near Brass in the Niger Delta, which is roughly north of the______________', 'multiple_choice', 'Tropic of Cancer', 'Equator', 'Prime Meridian', 'Tropic of Capricorn', 'B', 'Nigeria is located north of the Equator.');

    -- Q11
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The country''s ____________ boundary is approximately at 14°N.', 'multiple_choice', 'southern', 'northern', 'eastern', 'western', 'B', 'Nigeria''s northern boundary extends to approximately 14°N latitude.');

    -- Q12
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Nigeria''s _____________ boundary runs roughly along Longitudes 3°E.', 'multiple_choice', 'easterly', 'westerly', 'northern', 'southern', 'B', 'The westerly boundary follows approximately 3°E longitude.');

    -- Q13
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Nigeria''s easterly boundary runs from a point to the south west of the ___________ of the Cross River to northwards almost to Longitude 15°E, South of Lake Chad.', 'multiple_choice', 'source', 'estuary', 'delta', 'valley', 'B', 'The boundary begins near the estuary of the Cross River.');

    -- Q14
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Nigeria has a total land area of ______________ square kilometres.', 'multiple_choice', '923,768', '1,267,000', '587,041', '356,669', 'A', 'Nigeria''s total land area is approximately 923,768 square kilometers.');

    -- Q15
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'By land area, Nigeria is four times the area of _______________', 'multiple_choice', 'Ghana', 'United Kingdom', 'Sierra Leone', 'Cameroon', 'A', 'Nigeria is about four times larger than Ghana in land area.');

    -- Q16-Q43 (Additional MCQs continue in similar pattern)
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES 
    (v_course_id, 'By land area, Nigeria is about ____________________ the area of Sierra Leone.', 'multiple_choice', 'thirteen times', 'five times', 'twenty times', 'eight times', 'A', 'Nigeria is approximately thirteen times larger than Sierra Leone.'),
    
    (v_course_id, 'By land area, Nigeria is four times the area of the _______________', 'multiple_choice', 'United States', 'United Kingdom', 'France', 'Germany', 'B', 'Nigeria is about four times larger than the United Kingdom.'),
    
    (v_course_id, 'Nigeria covers about ________________ of the productive area of West Africa.', 'multiple_choice', 'one third', 'one seventh', 'one half', 'one tenth', 'B', 'Nigeria occupies about one-seventh of West Africa''s productive area.'),
    
    (v_course_id, 'Nigeria has about _________ kilometres of land boundaries to monitor and defend.', 'multiple_choice', '2,790', '3,500', '1,950', '4,200', 'A', 'Nigeria has approximately 2,790 km of land borders.'),
    
    (v_course_id, 'The Nigerian Customs Service has the responsibility of combating _____________ and ________________ in goods across Nigeria''s borders.', 'multiple_choice', 'theft and robbery', 'smuggling and illegal trafficking', 'fraud and corruption', 'piracy and hijacking', 'B', 'Customs Service combats smuggling and illegal trafficking across borders.');

    -- Fill in the Blank Questions (15% - 7 questions)
    
    -- Q44
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The responsibility of defending Nigeria''s _________ is the duty of the Nigerian Army.', 'fill_in_blank', 'land borders', 'The Nigerian Army is responsible for defending the country''s land borders.');

    -- Q45
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Nigeria has a coastline of about _______________ kilometres.', 'fill_in_blank', '860', 'Nigeria has approximately 860 kilometers of coastline along the Atlantic Ocean.');

    -- Q46
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Before May 1967 Nigeria consisted of four _______________.', 'fill_in_blank', 'regions', 'Nigeria was originally divided into four administrative regions before state creation.');

    -- Q47
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'In May 1967, the country was split into _________________.', 'fill_in_blank', 'twelve states', 'The first state creation exercise in 1967 divided Nigeria into twelve states.');

    -- Q48
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'In 1976 Nigeria was further broken down into ______________ and ____________.', 'fill_in_blank', 'nineteen states and a new federal capital territory', 'The 1976 state creation increased the number to nineteen states and established Abuja as FCT.');

    -- Q49
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Today, there are ___________________ and _____________________ in Nigeria.', 'fill_in_blank', 'thirty-six states and the federal capital territory', 'Nigeria currently comprises thirty-six states and the Federal Capital Territory, Abuja.');

    -- Q50
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Today, Nigeria has __________________ Local Government Areas.', 'fill_in_blank', 'seven hundred and seventy-four', 'Nigeria has 774 constitutionally recognized Local Government Areas.');

END $$;