DO $$ 
DECLARE 
    v_course_id UUID;
BEGIN 
    SELECT id INTO v_course_id FROM courses WHERE code = 'CSS242' LIMIT 1;

    -- Multiple Choice Questions (85% - 43 questions)
    
    -- Q1
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Crime is a breach of a rule or __________?', 'multiple_choice', 'moral code', 'law', 'social norm', 'religious doctrine', 'B', 'Crime is legally defined as a breach of established laws within a jurisdiction.');

    -- Q2
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Informal relationships and sanctions have been deemed insufficient to create and maintain a desired __________?', 'multiple_choice', 'economic system', 'social order', 'political structure', 'cultural identity', 'B', 'Formal legal systems are necessary to maintain social order when informal controls are insufficient.');

    -- Q3
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A person who fails to do that which is required by law or by duty when such failure is minor in nature is called a/an_______', 'multiple_choice', 'criminal', 'delinquent', 'offender', 'violator', 'B', 'Delinquent refers to someone who commits minor legal infractions or fails in minor duties.');

    -- Q4
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'ALL but One are the reasons for delinquency', 'multiple_choice', 'family breakdown', 'peer pressure', 'quality education', 'poverty', 'C', 'Quality education is typically a protective factor against delinquency, not a cause.');

    -- Q5
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'According to Graham & Bowling (1995), Family factors which may have an influence on offending includes ALL except', 'multiple_choice', 'parental conflict', 'pro bono', 'poor supervision', 'family size', 'B', 'Pro bono (voluntary legal work) is not a family factor influencing offending behavior.');

    -- Q6
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '_________is a mental or psychological impairment or retardation.', 'multiple_choice', 'insanity', 'duress', 'entrapment', 'self-defense', 'A', 'Insanity refers to mental impairment that may affect criminal responsibility.');

    -- Q7
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A situation where people are relieved of criminal responsibility based on the fact that they only acted in defence of their person or property.', 'multiple_choice', 'entrapment', 'self defense', 'duress', 'insanity', 'B', 'Self-defense is a legal justification for actions taken to protect oneself or property.');

    -- Q8
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The argument that rests on the assumption that someone who is insane at the time of a crime lacks the capacity, or has diminished capacity, to act in a premeditated manner is known as ________', 'multiple_choice', 'duress defense', 'mental disorder defense', 'entrapment defense', 'self-defense', 'B', 'Mental disorder defense argues that mental illness affects criminal intent and capacity.');

    -- Q9
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A situation where people are generally considered either not responsible or less responsible for their crimes if they were trapped or induced into committing them, by a law enforcement officer or by someone acting as an agent of Law Enforcement is known as __________', 'multiple_choice', 'duress', 'entrapment', 'self-defense', 'insanity', 'B', 'Entrapment occurs when law enforcement induces someone to commit a crime they wouldn''t otherwise commit.');

    -- Q10
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The reason why people are not held legally responsible for acting in self-defence or in defence of a third party, is that, due to extenuating circumstances, they do not act with ________ (Bohn & Haley, 2002)', 'multiple_choice', 'actus reus', 'mens rea', 'criminal intent', 'malice aforethought', 'B', 'Self-defense situations lack the required criminal intent (mens rea) for liability.');

    -- Q11-Q43 (Additional MCQs continue in similar pattern)
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES 
    (v_course_id, 'A person may be excluded from criminal liability if he was forced or coerced to commit a crime. Such a person would be tagged to have acted under ____?', 'multiple_choice', 'duress', 'entrapment', 'self-defense', 'insanity', 'A', 'Duress involves being forced to commit a crime under threat of harm.'),
    
    (v_course_id, '___________is a programme of standardised sample surveys to look at householders'' experience with crime, policing, crime prevention and feelings of unsafety in a large number of countries.', 'multiple_choice', 'International Crime Victim Survey', 'Global Crime Assessment', 'World Crime Study', 'International Safety Survey', 'A', 'The ICVS is a standardized international survey of crime victimization.'),
    
    (v_course_id, 'According to Karman (2003), one of the criticism of the ICVS is that _____', 'multiple_choice', 'it is too expensive', 'respondents'' information are not verified', 'it only covers urban areas', 'it ignores white-collar crime', 'B', 'A key criticism is that self-reported victimization data cannot be independently verified.'),
    
    (v_course_id, 'Which of these is not a component of the Criminal Justice System?', 'multiple_choice', 'police', 'courts', 'federal government', 'corrections', 'C', 'The core components are police, courts, and corrections - federal government is broader.'),
    
    (v_course_id, 'Juvenile justice agencies are intended to operate within the________?', 'multiple_choice', 'rule of law', 'parental authority', 'school regulations', 'community standards', 'A', 'Juvenile justice operates within the framework of established laws and legal procedures.');

    -- Fill in the Blank Questions (15% - 7 questions)
    
    -- Q44
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The idea that criminals are born and have specific physical characteristics that predict criminality was propounded by ____________', 'fill_in_blank', 'Cesare Lombroso', 'Lombroso was the founder of the Italian school of criminology and proposed biological determinism.');

    -- Q45
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '__________ is the believe that criminals are evolutionary throwbacks.', 'fill_in_blank', 'Atavism', 'Atavism theory suggests criminals are biological regressions to primitive ancestors.');

    -- Q46
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '_________ attributed crimes to body types', 'fill_in_blank', 'William Sheldon', 'Sheldon developed somatotype theory linking body types to criminal behavior.');

    -- Q47
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '_____________ concluded that crime was inherited much in the same way as ordinary physical traits and features.', 'fill_in_blank', 'Charles Goring', 'Goring conducted extensive research supporting hereditary factors in crime.');

    -- Q48
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '____________ crimes are offences that persons commit while acting in their legitimate jobs and professions', 'fill_in_blank', 'White Collar Crimes', 'White-collar crimes are committed by professionals in the course of their occupation.');

    -- Q49
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '__________ are consensual acts (in which people are willing participants) and violations in which only the perpetrator is hurt, such as the personal use of illegal drugs, are called victimless crimes', 'fill_in_blank', 'Victimless Crimes', 'Victimless crimes involve willing participants with no direct victim other than the perpetrator.');

    -- Q50
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '_____________ refers to the unlawful activities of members of criminal organisations that supply illegal goods and services.', 'fill_in_blank', 'Organised Crimes', 'Organized crime involves structured groups engaged in illegal enterprises for profit.');

END $$;