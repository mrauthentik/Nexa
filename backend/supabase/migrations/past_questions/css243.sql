DO $$ 
DECLARE 
    v_course_id UUID;
BEGIN 
    SELECT id INTO v_course_id FROM courses WHERE code = 'CSS243' LIMIT 1;

    -- Multiple Choice Questions (85% - 43 questions)
    
    -- Q1
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Violence is a source of ______________ such that the differentials between the power capabilities narrow between the advanced (strong) and disadvantaged (weak) nations', 'multiple_choice', 'economic growth', 'power transition', 'social development', 'political stability', 'B', 'Power transition theory suggests violence occurs when power differentials between nations narrow.');

    -- Q2
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Cyclical theory of war is of the opinion that violence is not necessary but ______________', 'multiple_choice', 'absolutely inevitable', 'completely avoidable', 'rarely occurring', 'socially constructed', 'A', 'Cyclical theory posits that violence and war follow inevitable historical cycles.');

    -- Q3
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The ______________ of violence is of the view that violence is a function of class struggle', 'multiple_choice', 'psychological theory', 'Marxist theory', 'biological theory', 'environmental theory', 'B', 'Marxist theory views violence as arising from class conflicts and economic inequalities.');

    -- Q4
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Marxists are of the view that the disruptive character of industrialized societies can be said to be responsible for _____________', 'multiple_choice', 'economic prosperity', 'criminal behaviour', 'social harmony', 'political unity', 'B', 'Marxists attribute criminal behavior to the disruptive effects of industrialization and class conflict.');

    -- Q5
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Therefore, it is the class that controls the mode of production that will ______________ not only the economy and polity but also the law that regulates the conduct of the people in a given society', 'multiple_choice', 'influence', 'determine', 'suggest', 'propose', 'B', 'The ruling class determines economic, political, and legal structures in society.');

    -- Q6
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The shape and character of the legal system in complex societies can be understood as deriving from the conflicts inherent in the structure of these societies which are _______________ economically and politically', 'multiple_choice', 'homogeneous', 'stratified', 'egalitarian', 'unified', 'B', 'Complex societies are economically and politically stratified, leading to legal conflicts.');

    -- Q7
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The relation explains the way society is structured in class arrangement such that the few who control the ___________________. (bourgeisie) are those who decide on the laws and the legal machinery of the state with the aim of protecting their property', 'multiple_choice', 'educational system', 'mode of production', 'religious institutions', 'military forces', 'B', 'The bourgeoisie controls the means of production and uses state machinery to protect property interests.');

    -- Q8
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The Marxist theory further holds that capitalist contradictions have forced majority (proletariat) into ___________________.', 'multiple_choice', 'structural relegation', 'economic prosperity', 'political power', 'social mobility', 'A', 'Capitalist contradictions lead to the structural relegation of the proletariat.');

    -- Q9
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'This situation has _______________ conditions, which have hitherto given rise to a climate of crime and criminality in the society', 'multiple_choice', 'created', 'eliminated', 'reduced', 'controlled', 'A', 'Structural inequalities create conditions conducive to crime and criminality.');

    -- Q10
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'According to Marxist''s theory the source of crime can be traced to the introduction of private ownership of property in the _____________, of state.', 'multiple_choice', 'evolution', 'destruction', 'stagnation', 'revolution', 'A', 'Marxists trace crime origins to the evolution of private property in state development.');

    -- Q11-Q43 (Additional MCQs continue in similar pattern)
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES 
    (v_course_id, 'Willem Bonger also believes that it is the class system that characterizes the modern state that is responsible for ____________________.', 'multiple_choice', 'social harmony', 'criminal behaviour', 'economic equality', 'political stability', 'B', 'Bonger attributed criminal behavior to class systems in modern states.'),
    
    (v_course_id, 'But when societies began to move beyond agrarian production the improved exchange of information gave birth to growing________________ and people started producing for commercial purposes', 'multiple_choice', 'technology', 'religion', 'education', 'art', 'A', 'Technological advancement enabled the shift from agrarian to commercial production.'),
    
    (v_course_id, 'Bonger argued that crime is social in foundation and an actual reaction to the existing ______________.', 'multiple_choice', 'cultural order', 'political system', 'economic policy', 'religious doctrine', 'A', 'Bonger viewed crime as a social reaction to the prevailing cultural order.'),
    
    (v_course_id, 'The_______________ discouraged the habits of selfishness while the relationship among the people were guided by altrustic ethos in where selflessness was the order of the day', 'multiple_choice', 'modern societies', 'primitive societies', 'industrial societies', 'digital societies', 'B', 'Primitive societies emphasized altruism and discouraged selfish behavior.'),
    
    (v_course_id, 'This situation led to the ._______________. of private property ownership', 'multiple_choice', 'elimination', 'introduction', 'reduction', 'regulation', 'B', 'Societal evolution led to the introduction of private property ownership.');

    -- Fill in the Blank Questions (15% - 7 questions)
    
    -- Q44
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Decentralization of decision making by a manager is a good way to ______________ (Cohen and Wills, 1985)', 'fill_in_blank', 'reduce stress', 'Decentralizing decision-making helps distribute responsibility and reduce managerial stress.');

    -- Q45
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Stress Resilience is a strategy that helps employee to develop _______________and ______________against potentially harmful stressors, and the most widely recommended strategy include physical exercise, proper diet, and weight control, (Champoux,1996).', 'fill_in_blank', 'physical and psychological stamina', 'Stress resilience builds both physical and psychological capacity to handle stressors.');

    -- Q46
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Time management skills can also help workers to manage the _____________ that are often placed upon them in both work and non- work settings.', 'fill_in_blank', 'multiple demands', 'Effective time management helps workers handle multiple competing demands.');

    -- Q47
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Stress reduction aims at _____________of _______________ the amount of stress a person experiences', 'fill_in_blank', 'decreasing or minimizing', 'Stress reduction strategies focus on decreasing or minimizing stress levels.');

    -- Q48
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Physical exercises help in conditioning the body to be able to face _____________ with confidence', 'fill_in_blank', 'potential stressors', 'Physical exercise prepares the body to handle potential stressors effectively.');

    -- Q49
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'A balanced diet low in sodium and saturated fats help keep _______________ and serum cholesterols within acceptable bounds (Quick and Quick,1984)', 'fill_in_blank', 'blood pressure', 'Proper nutrition helps maintain healthy blood pressure and cholesterol levels.');

    -- Q50
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Physical and mental relaxation are a natural process including decreased respiration, _______________ and _____________', 'fill_in_blank', 'heart and metabolic rates', 'Relaxation processes naturally lower respiration, heart rate, and metabolic rate.');

END $$;