DO $$
DECLARE
    v_course_id UUID;
BEGIN
    SELECT id INTO v_course_id FROM courses WHERE code = 'MAC111' LIMIT 1;

    -- Q1 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ is a common phenomenon that cuts across the daily activities of human being.', 'fill_in_blank', 'Communication', 'Communication is fundamental to human daily activities.');

    -- Q2 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ defines communication as a process that involves the transmission of message from a sender to the receiver.', 'multiple_choice', 'Folarin (2003)', 'Obllade (1989)', 'Lasswell (1948)', 'Baran (2012)', 'B', 'Obllade (1989) gave this definition of communication.');

    -- Q3 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Communication is from a Latin word ______.', 'multiple_choice', 'Communicare', 'Communis', 'Commus', 'Communico', 'B', 'The Latin word "Communis" means common or shared understanding.');

    -- Q4 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Communication is ______, every man is born with the ability, from childhood, we learn to communicate by crying, smiling, kicking etc.', 'fill_in_blank', 'innate', 'Communication is an innate human ability.');

    -- Q5 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of the following is NOT a feature of mass communication?', 'multiple_choice', 'Mass Medium', 'Presence of Gatekeepers', 'Immediate Feedback', 'Limited Sensory Channels', 'C', 'Feedback in mass communication is delayed, not immediate.');

    -- Q6 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'For a medium to be regarded as mass in communication it must have acquired ______ adopters.', 'multiple_choice', 'one million', 'ten million', 'fifty million', 'one hundred million', 'C', 'A mass medium must reach at least fifty million people.');

    -- Q7 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The concept of gatekeeper was first coined by ______.', 'fill_in_blank', 'Kurt Lewin', 'Kurt Lewin introduced the gatekeeper concept in communication studies.');

    -- Q8 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Feedback in mass communication is often:', 'multiple_choice', 'Instant and direct', 'Limited, delayed and indirect', 'Always positive', 'Nonexistent', 'B', 'Feedback in mass communication is typically limited, delayed and indirect.');

    -- Q9 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ coined the term "delayed inferential feedback".', 'multiple_choice', 'Wilbur Schramm', 'Stanley Baran', 'Harold Lasswell', 'Marshall McLuhan', 'B', 'Stanley Baran introduced this term to describe mass communication feedback.');

    -- Q10 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The ______ nature of the audience of mass communication makes it very difficult to address messages to specific audience or group of people.', 'fill_in_blank', 'large', 'The large audience size makes targeting difficult in mass communication.');

    -- Q11 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Simultaneity in mass communication means that:', 'multiple_choice', 'Messages reach everyone at different times', 'Messages are available to the audience at the same time', 'Messages are simple to understand', 'Messages are sent simultaneously from multiple sources', 'B', 'Simultaneity means messages reach the audience at the same time.');

    -- Q12 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ refers to the exactitude with which a medium reproduces the original physical dimensions of images.', 'multiple_choice', 'Fidelity', 'Universality', 'Permanency', 'Mobility', 'A', 'Fidelity refers to the accuracy of reproduction in a medium.');

    -- Q13 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'A full colour page advert in an average Nigeria newspaper costs no less than ______.', 'fill_in_blank', 'N150,000', 'This is the approximate cost mentioned in the study material.');

    -- Q14 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Communication as a process is:', 'multiple_choice', 'Static and linear', 'Dynamic, recursive, ongoing, continuous and cyclical', 'Simple and one-way', 'Predictable and fixed', 'B', 'Communication is a complex, dynamic process with multiple characteristics.');

    -- Q15 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The point at which the source sees the need to communicate is called:', 'multiple_choice', 'Encoding', 'Stimulation', 'Transmission', 'Reception', 'B', 'Stimulation initiates the communication process.');

    -- Q16 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The ______ processes the message he wants to communicate into a form that will be understandable to the receivers.', 'fill_in_blank', 'source', 'The source encodes the message for the receivers.');

    -- Q17 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ is the response or reaction of the receiver to the message sent.', 'multiple_choice', 'Noise', 'Feedback', 'Encoding', 'Channel', 'B', 'Feedback is the receiver''s response to a message.');

    -- Q18 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Communication is incomplete without:', 'multiple_choice', 'Noise', 'Feedback', 'A complex message', 'Multiple channels', 'B', 'Feedback is essential for complete communication.');

    -- Q19 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ is interference that keeps a message from being understood or accurately interpreted.', 'fill_in_blank', 'Noise', 'Noise refers to any interference in the communication process.');

    -- Q20 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ comes from within as a result of poor mental attitude, depression, emotional stress or disability.', 'multiple_choice', 'Physical noise', 'Psychological noise', 'Physiological noise', 'Linguistic noise', 'B', 'Psychological noise originates from internal mental states.');

    -- Q21 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Aristotle called the study of communication:', 'multiple_choice', 'Semiotics', 'Rhetoric', 'Linguistics', 'Propaganda', 'B', 'Aristotle referred to communication study as rhetoric.');

    -- Q22 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Lasswell''s version of the communication process mentions ______ parts.', 'fill_in_blank', 'four', 'Lasswell''s model has four components: who, says what, in which channel, to whom, with what effect.');

    -- Q23 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ model made a clear case for delayed feedbacks in mass communication.', 'multiple_choice', 'Aristotle''s Model', 'Shannon-Weaver Model', 'Schramm''s Model', 'Lasswell''s Model', 'C', 'Schramm''s Model explicitly addresses delayed feedback in mass communication.');

    -- Q24 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The H in HUB model stands for:', 'multiple_choice', 'Harold', 'Hiebert', 'Human', 'Hub', 'B', 'The Hub Model was designed by Hiebert, Ungurait and Bohn.');

    -- Q25 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ is a conceptual representation or explanation of phenomenon.', 'fill_in_blank', 'Theory', 'A theory provides a conceptual explanation of phenomena.');

    -- Q26 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Theories are derived through a process known as:', 'multiple_choice', 'Random observation', 'Scientific method', 'Intuition', 'Tradition', 'B', 'Theories are developed through the scientific method.');

    -- Q27 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ is the oldest of the press theories.', 'multiple_choice', 'Libertarian Theory', 'Authoritarian Media Theory', 'Social Responsibility Theory', 'Soviet-Communist Theory', 'B', 'Authoritarian Media Theory is historically the oldest press theory.');

    -- Q28 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The fundamental assumption of the authoritarian system is that the government is ______.', 'fill_in_blank', 'infallible', 'Authoritarian theory assumes the government cannot make mistakes.');

    -- Q29 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ theory sees the press as a free "market place" of ideas.', 'multiple_choice', 'Authoritarian', 'Libertarian', 'Social Responsibility', 'Development', 'B', 'Libertarian theory views the press as a marketplace of ideas.');

    -- Q30 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The Hutchins Commission on Freedom of the press was established in:', 'multiple_choice', '1932', '1942', '1952', '1962', 'B', 'The Hutchins Commission was established in 1942.');

    -- Q31 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ theory advocates media support for cultural pluralism at a grassroots level.', 'fill_in_blank', 'Democratic-Participant Media Theory', 'This theory emphasizes grassroots cultural pluralism.');

    -- Q32 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Magic Bullet Theory is also called:', 'multiple_choice', 'Two-Step Flow Theory', 'Hypodermic Needle Theory', 'Agenda Setting Theory', 'Uses and Gratifications', 'B', 'Hypodermic Needle Theory is another name for Magic Bullet Theory.');

    -- Q33 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'People were viewed as powerless to consciously resist manipulation in:', 'multiple_choice', 'Agenda Setting Theory', 'Magic Bullet Theory', 'Uses and Gratifications', 'Social Learning Theory', 'B', 'Magic Bullet Theory viewed audiences as powerless against media influence.');

    -- Q34 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ argued that the worldwide economic depression and political strife had made people particularly vulnerable to propaganda.', 'fill_in_blank', 'Lasswell', 'Harold Lasswell proposed this view.');

    -- Q35 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Two-Step Flow Theory was later modified to:', 'multiple_choice', 'One-Step Flow', 'Multi-Step or N-Step Flow', 'Circular Flow', 'Linear Flow', 'B', 'Two-Step Flow evolved into Multi-Step or N-Step Flow theory.');

    -- Q36 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ theory posits that the mass media determines the issues that are regarded as important.', 'multiple_choice', 'Uses and Gratifications', 'Agenda Setting', 'Cultivation', 'Social Learning', 'B', 'Agenda Setting Theory focuses on media''s role in determining important issues.');

    -- Q37 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Main Streaming is also called ______ Theory.', 'fill_in_blank', 'Synchronisation', 'Main Streaming is synonymous with Synchronisation Theory.');

    -- Q38 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ theory establishes that the media systematically inform some segments of the population better than others.', 'multiple_choice', 'Knowledge Gap', 'Spiral of Silence', 'Cultivation', 'Agenda Setting', 'A', 'Knowledge Gap Theory addresses unequal information distribution.');

    -- Q39 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Spiral of Silence Theory describes:', 'multiple_choice', 'How media creates knowledge gaps', 'How people avoid expressing minority views', 'How media sets agendas', 'How people learn from media', 'B', 'Spiral of Silence explains how people withhold unpopular opinions.');

    -- Q40 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ states that viewing violence is sufficient to purge or satisfy a person''s aggressive drive.', 'fill_in_blank', 'Catharsis theory', 'Catharsis theory suggests media violence can release aggressive impulses.');

    -- Q41 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Social learning theory encompasses:', 'multiple_choice', 'Only imitation', 'Only identification', 'Both identification and imitation', 'Neither identification nor imitation', 'C', 'Social learning theory includes both identification and imitation processes.');

    -- Q42 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ is the direct, mechanical reproduction of behaviour.', 'multiple_choice', 'Identification', 'Imitation', 'Modeling', 'Reinforcement', 'B', 'Imitation involves directly copying observed behavior.');

    -- Q43 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Play Theory was proposed by ______.', 'fill_in_blank', 'William Stephenson', 'William Stephenson developed Play Theory.');

    -- Q44 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Surveillance Function is otherwise known as:', 'multiple_choice', 'Entertainment function', 'News function', 'Cultural transmission', 'Correlation function', 'B', 'Surveillance function is the news-gathering role of media.');

    -- Q45 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Surveillance concept is synonymous to ______ role of the press.', 'multiple_choice', 'Entertainment', 'Watchdog', 'Educational', 'Commercial', 'B', 'The watchdog role involves monitoring and exposing wrongdoing.');

    -- Q46 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'In 1986, two gangsters emerged from the crime scene in Nigeria, namely Lawrence Anini and ______.', 'fill_in_blank', 'Monday Osumbor', 'Both were notorious Nigerian armed robbers in 1986.');

    -- Q47 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The correlation function of mass communication is otherwise known as:', 'multiple_choice', 'Entertainment function', 'Opinion or editorial function', 'News function', 'Cultural function', 'B', 'Correlation involves interpretation, analysis, and opinion formation.');

    -- Q48 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'By nature, entertainment is meant to ease:', 'multiple_choice', 'Only tension', 'Only stress', 'Both tension and stress', 'Neither tension nor stress', 'C', 'Entertainment relieves both tension and stress.');

    -- Q49 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ function entails the passing on or the transfer of a nation''s social heritage from one generation to another.', 'fill_in_blank', 'Cultural Transmission', 'This function preserves and transmits cultural heritage.');

    -- Q50 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Sambe (2005) describes the ______ function as the preservation of past heritage or culture.', 'multiple_choice', 'Surveillance', 'Correlation', 'Entertainment', 'Cultural transmission', 'D', 'Sambe specifically discussed cultural transmission function.');

    -- Continuing with 150 more questions following the same pattern...
    -- Note: Due to space constraints, I'll show the structure and include a few more examples

    -- Q51 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Radio Lagos (Tiwantinwa) promotes and transmits ______ culture mostly.', 'multiple_choice', 'Igbo', 'Yoruba', 'Hausa', 'Edo', 'B', 'Radio Lagos focuses on Yoruba culture.');

    -- Q52 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ defines our realities but communication constructs and maintains our culture.', 'fill_in_blank', 'Culture', 'Culture shapes reality while communication sustains it.');

    -- Q53 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Transmission school sees media as:', 'multiple_choice', 'Cultural rituals', 'Senders of information', 'Entertainment tools', 'Political instruments', 'B', 'Transmission perspective views media as information senders.');

    -- Q54 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Harris says ______ is the learned, socially acquired traditions and lifestyles.', 'multiple_choice', 'Communication', 'Culture', 'Media', 'Society', 'B', 'Harris provided this definition of culture.');

    -- Q55 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Two negative roles of mass communication in the society is the propagation of violence and ______.', 'fill_in_blank', 'pornography', 'These are two major negative impacts identified.');

    -- Q56 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'There are basically ______ forms of communication.', 'multiple_choice', 'two', 'three', 'four', 'five', 'A', 'The two basic forms are verbal and non-verbal.');

    -- Q57 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The major components of verbal communication are:', 'multiple_choice', 'Oral and written', 'Verbal and non-verbal', 'Formal and informal', 'Direct and indirect', 'A', 'Verbal communication includes oral and written forms.');

    -- Q58 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ means communication by word of mouth.', 'fill_in_blank', 'Oral communication', 'Oral communication involves spoken words.');

    -- Q59 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of the following is an advantage of oral communication?', 'multiple_choice', 'It lacks permanence', 'It allows for instantaneous exchange', 'It can easily be denied', 'It has little weight as contractual evidence', 'B', 'Immediate exchange is a key advantage of oral communication.');

    -- Q60 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ could be simply defined as communication by means of written symbols.', 'multiple_choice', 'Oral communication', 'Written communication', 'Non-verbal communication', 'Visual communication', 'B', 'Written communication uses written symbols.');

    -- Q61 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Writing as a system of communication is an offshoot of ______.', 'fill_in_blank', 'speech', 'Written language developed from spoken language.');

    -- Q62 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which is a disadvantage of written communication?', 'multiple_choice', 'Provides record keeping', 'Delays feedback', 'Reduces chance of distortion', 'Amenable to complex messages', 'B', 'Delayed feedback is a disadvantage of written communication.');

    -- Q63 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Non-verbal communication is often referred to as:', 'multiple_choice', 'Verbal cues', 'Untalk communication or silent language', 'Written symbols', 'Oral signals', 'B', 'Non-verbal communication is silent language.');

    -- Q64 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Vocalics is also called ______.', 'fill_in_blank', 'paralanguage', 'Vocalics deals with paralanguage aspects.');

    -- Q65 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Kinesics is also called:', 'multiple_choice', 'Eye language', 'Body language', 'Voice language', 'Space language', 'B', 'Kinesics refers to body language.');

    -- Q66 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ is essentially a neuro-physiological activity which involves mental processes.', 'multiple_choice', 'Interpersonal communication', 'Intra-personal communication', 'Mass communication', 'Group communication', 'B', 'Intrapersonal communication involves internal mental processes.');

    -- Q67 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ occurs when you communicate on a one-to-one basis usually in an informal setting.', 'fill_in_blank', 'Interpersonal communication', 'This describes interpersonal communication contexts.');

    -- Q68 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Social Penetration Theory says we attempt to:', 'multiple_choice', 'Avoid communication', 'Gain information about others', 'Limit self-disclosure', 'Maintain superficial relationships', 'B', 'The theory explains how we seek information about others.');

    -- Q69 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ refer to how a message is said.', 'multiple_choice', 'Content messages', 'Relationship messages', 'Verbal messages', 'Written messages', 'B', 'Relationship messages concern the manner of delivery.');

    -- Q70 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ is the need to establish identity with others.', 'fill_in_blank', 'Inclusion', 'Inclusion refers to the need for social belonging.');

    -- Q71 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ deals with the physical "where" in which you are communicating.', 'multiple_choice', 'Psychological context', 'Relational context', 'Situational context', 'Environmental context', 'D', 'Environmental context involves physical location.');

    -- Q72 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Interpersonal communication has ______ major types.', 'multiple_choice', 'two', 'three', 'four', 'five', 'B', 'The three types are dyadic, public speaking, and small-group.');

    -- Q73 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ is simply a method of communication that only involves two people.', 'fill_in_blank', 'Dyadic communication', 'Dyadic communication involves exactly two participants.');

    -- Q74 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ is where the sender manipulates the information that he communicates.', 'multiple_choice', 'Filtering', 'Defensiveness', 'Jargon', 'Feedback', 'A', 'Filtering involves manipulating information before communication.');

    -- Q75 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Communication within oneself is called ______ communication.', 'multiple_choice', 'Interpersonal', 'Intra-personal', 'Group', 'Mass', 'B', 'Intrapersonal communication is internal self-communication.');

    -- Q76 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ form of communication occurs among a small number of people for problem-solving.', 'fill_in_blank', 'Group Communication', 'Group communication focuses on collective problem-solving.');

    -- Q77 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ carried out the first important research study of small group communication.', 'multiple_choice', 'Robert Bales', 'Irving Janis', 'Harold Guetzkow', 'Donnel King', 'A', 'Robert Bales pioneered small group communication research.');

    -- Q78 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Groupthink was described by:', 'multiple_choice', 'Robert Bales', 'Irving Janis', 'Harold Guetzkow', 'William Stephenson', 'B', 'Irving Janis developed the groupthink concept.');

    -- Q79 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Opportunity for verbal ______ is limited in most public communication.', 'fill_in_blank', 'feedback', 'Public communication typically offers limited feedback opportunities.');

    -- Q80 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ could be defined as communication between two or more nations.', 'multiple_choice', 'Interpersonal communication', 'International communication', 'Mass communication', 'Group communication', 'B', 'International communication crosses national boundaries.');

       -- Q81 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The first printing press arrived in North America in ______.', 'fill_in_blank', '1638', 'The printing press arrived in North America in 1638.');

    -- Q82 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The first book printed in America was:', 'multiple_choice', 'The Bible', 'The Whole Booke of Psalms', 'The Constitution', 'The Declaration', 'B', 'The Bay Psalm Book (The Whole Booke of Psalms) was the first book printed.');

    -- Q83 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Over ______ years ago, alphabets were developed independently in several places.', 'multiple_choice', '1,000', '3,000', '5,000', '10,000', 'C', 'Alphabets were developed over 5,000 years ago.');

    -- Q84 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The ______ developed the cuneiform writing system.', 'fill_in_blank', 'Sumerians', 'Sumerians developed cuneiform for international trade.');

    -- Q85 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Internet is changing the way books are:', 'multiple_choice', 'Written only', 'Distributed and sold', 'Read only', 'Edited only', 'B', 'Internet has revolutionized book distribution and sales.');

    -- Q86 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'POD stands for:', 'multiple_choice', 'Print on Demand', 'Post Office Delivery', 'Print or Digital', 'Published Online Daily', 'A', 'POD means Print on Demand.');

    -- Q87 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The first successively published title was ______ of 1622.', 'fill_in_blank', 'The Weekly Newes', 'The Weekly Newes was the first successively published title.');

    -- Q88 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The first true newspaper in English was:', 'multiple_choice', 'The Times', 'London Gazette', 'The Guardian', 'Daily Mail', 'B', 'London Gazette (1666) was the first true English newspaper.');

    -- Q89 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Corantos were one-page news sheets printed in Holland in:', 'multiple_choice', '1600', '1620', '1640', '1660', 'B', 'Corantos appeared in Holland in 1620.');

    -- Q90 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The first newspaper published in Germany was found in 1609 by ______.', 'fill_in_blank', 'Egenolph Emmel', 'Egenolph Emmel published the first German newspaper.');

    -- Q91 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In 1704, the Boston News-Letter was published by:', 'multiple_choice', 'Benjamin Franklin', 'Jelm Campell and Bartholomew Green', 'John Peter Zenger', 'James Franklin', 'B', 'Jelm Campell and Bartholomew Green published the Boston News-Letter.');

    -- Q92 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'By 1721, The News-letter received competition from:', 'multiple_choice', 'Pennsylvania Gazette', 'New England Courant', 'Virginia Gazette', 'New York Weekly', 'B', 'New England Courant competed with the News-letter.');

    -- Q93 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'In 1790, Congress adopted the first 10 amendments called ______.', 'fill_in_blank', 'The Bills of Rights', 'The Bill of Rights was adopted in 1790.');

    -- Q94 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The first successful American newspaper was:', 'multiple_choice', 'Publick Occurrences', 'Boston News-Letter', 'Pennsylvania Gazette', 'New York Gazette', 'B', 'Boston News-Letter (1704) was the first successful newspaper.');

    -- Q95 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'At the end of the Revolutionary War in 1783, there were ______ newspapers in print.', 'multiple_choice', '23', '43', '63', '83', 'B', 'There were 43 newspapers in print in 1783.');

    -- Q96 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The Penny Press emerged in the ______.', 'fill_in_blank', '1830s', 'The Penny Press emerged in the 1830s.');

    -- Q97 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The 1850 census catalogued ______ newspaper titles.', 'multiple_choice', '1,526', '2,526', '3,526', '4,526', 'B', '2,526 newspaper titles were catalogued in 1850.');

    -- Q98 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'An astounding 11,314 different papers were recorded in the ______ census.', 'multiple_choice', '1860', '1870', '1880', '1890', 'C', '11,314 papers were recorded in the 1880 census.');

    -- Q99 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The earliest penny press was the ______, published in 1833.', 'fill_in_blank', 'New York Sun', 'New York Sun was the first penny press.');

    -- Q100 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The first magazine was believed to have been started by:', 'multiple_choice', 'Benjamin Franklin', 'Daniel Defoe', 'Joseph Addison', 'Richard Steele', 'B', 'Daniel Defoe started the first magazine in 1704.');

    -- Q101 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Magazines began to have mass circulation after:', 'multiple_choice', 'American Revolution', 'American Civil War', 'World War I', 'Industrial Revolution', 'B', 'Mass circulation began after the American Civil War.');

    -- Q102 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The sustenance of magazine business is made possible by ______.', 'fill_in_blank', 'advertisement', 'Advertising revenue sustains magazine business.');

    -- Q103 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Gutenberg conceived of movable type in:', 'multiple_choice', '1432', '1452', '1472', '1492', 'B', 'Gutenberg conceived movable type in 1452.');

    -- Q104 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Premium book paper is also called:', 'multiple_choice', 'Newsprint', 'Bible grade', 'Cover paper', 'Card stock', 'B', 'Bible grade is another name for premium book paper.');

    -- Q105 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ is an inexpensive paper made primarily of mechanically ground wood pulp.', 'fill_in_blank', 'Newsprint', 'Newsprint is cheap paper for newspapers.');

    -- Q106 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Cover paper is also known as:', 'multiple_choice', 'Bible paper', 'Newsprint', 'Card stock', 'Tissue paper', 'C', 'Cover paper is called card stock.');

    -- Q107 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ is when the author doubles as the publisher.', 'multiple_choice', 'Vanity publishing', 'Self-publisher', 'Subsidy publishing', 'Traditional publishing', 'B', 'Self-publisher means author publishes their own work.');

    -- Q108 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'A ______ handles any or all aspects of putting a book together and getting it printed.', 'fill_in_blank', 'book producer', 'A book producer manages book production.');

    -- Q109 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A vanity publisher requires authors to:', 'multiple_choice', 'Pay the entire cost', 'Share profits only', 'Pay nothing', 'Pay only marketing costs', 'A', 'Vanity publishers charge authors for production costs.');

    -- Q110 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The ______ prints and usually binds the book.', 'multiple_choice', 'Publisher', 'Printer', 'Distributor', 'Editor', 'B', 'The printer produces physical books.');

    -- Q111 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'BPIDP stands for ______.', 'fill_in_blank', 'Book Publishing Industry Development Programme', 'BPIDP is a publishing industry program.');

    -- Q112 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Royalties usually range between ______% of recommended retail price.', 'multiple_choice', '1-3', '5-7', '10-12', '15-20', 'C', 'Typical royalties are 10-12% of retail price.');

    -- Q113 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ process prepares the work for printing.', 'multiple_choice', 'Postpress', 'Prepress', 'Distribution', 'Marketing', 'B', 'Prepress prepares materials for printing.');

    -- Q114 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'In 1906, ______ perfected the audio tube.', 'fill_in_blank', 'De Forest', 'Lee De Forest perfected the audio tube.');

    -- Q115 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In 1920, Frank Conrad began broadcasting:', 'multiple_choice', 'News programs', 'Phonograph music', 'Sports events', 'Political speeches', 'B', 'Conrad broadcast phonograph music from his garage.');

    -- Q116 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A.T.&T. sold WEAF to RCA in:', 'multiple_choice', '1924', '1926', '1928', '1930', 'B', 'WEAF was sold to RCA in 1926.');

    -- Q117 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______, a German physicist, discovered radio waves in 1888.', 'fill_in_blank', 'Heinrich Hertz', 'Heinrich Hertz discovered radio waves.');

    -- Q118 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The world''s first radio factory was opened in:', 'multiple_choice', '1898', '1901', '1906', '1910', 'A', 'First radio factory opened in 1898.');

    -- Q119 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Discovery of electromagnetic induction was by:', 'multiple_choice', 'James Clerk Maxwell', 'Michael Faraday', 'Heinrich Hertz', 'Guglielmo Marconi', 'B', 'Michael Faraday discovered electromagnetic induction.');

    -- Q120 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Maxwell equations were developed by ______.', 'fill_in_blank', 'James Clerk Maxwell', 'James Clerk Maxwell developed electromagnetic equations.');

    -- Q121 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In 1884, Temistocle Calzecchi-Onesti invented:', 'multiple_choice', 'Vacuum tube', 'Coherer', 'Telegraph', 'Radio transmitter', 'B', 'He invented the coherer tube.');

    -- Q122 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ developed means to reliably produce radio frequencies.', 'multiple_choice', 'Marconi', 'Tesla', 'Edison', 'Faraday', 'B', 'Nikola Tesla developed radio frequency production.');

    -- Q123 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'In 1912, Lodge sold the patent to ______.', 'fill_in_blank', 'Marconi', 'Marconi acquired Lodge''s patent.');

    -- Q124 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Nipkow proposed the first electromechanical television system in:', 'multiple_choice', '1874', '1884', '1894', '1904', 'B', 'Nipkow patented his system in 1884.');

    -- Q125 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'John Logie Baird demonstrated colour transmission in:', 'multiple_choice', '1926', '1928', '1930', '1932', 'B', 'Baird demonstrated colour TV on July 3, 1928.');

    -- Q126 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'FCC stands for ______.', 'fill_in_blank', 'Federal Communications Commission', 'FCC regulates US communications.');

    -- Q127 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'NTSC stands for:', 'multiple_choice', 'National Television Standards Committee', 'National Television System Committee', 'New Television Standards Council', 'National Technical Standards Committee', 'B', 'NTSC is National Television System Committee.');

    -- Q128 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ became the second country to introduce colour television.', 'multiple_choice', 'Canada', 'Mexico', 'Cuba', 'Japan', 'C', 'Cuba was second after the US.');

    -- Q129 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'DBS stands for ______.', 'fill_in_blank', 'Direct broadcast satellite', 'DBS is satellite television.');

    -- Q130 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ is considered the Father of Radio.', 'multiple_choice', 'Heinrich Hertz', 'Guglielmo Marconi', 'Nikola Tesla', 'Lee De Forest', 'B', 'Guglielmo Marconi is called Father of Radio.');

    -- Q131 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'John A. Fleming developed the diode tube in:', 'multiple_choice', '1902', '1904', '1906', '1908', 'B', 'Fleming developed the diode in 1904.');

    -- Q132 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Film is a medium that combines ______ and audio.', 'fill_in_blank', 'visual', 'Film is audiovisual medium.');

    -- Q133 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In 1877, ______ arranged a series of still cameras along a racetrack.', 'multiple_choice', 'Edison', 'Muybridge', 'Lumiere brothers', 'Eastman', 'B', 'Eadweard Muybridge conducted this experiment.');

    -- Q134 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Edison built the "Black Maria" studio in:', 'multiple_choice', '1881', '1891', '1901', '1911', 'B', 'Black Maria was built in 1891.');

    -- Q135 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The Lumiere brothers were ______.', 'fill_in_blank', 'French', 'The Lumiere brothers were French inventors.');

    -- Q136 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Sound was introduced to motion pictures in:', 'multiple_choice', '1917', '1927', '1937', '1947', 'B', 'Sound films began in 1927.');

    -- Q137 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Film flourished through the Great Depression of the:', 'multiple_choice', '1910s', '1920s', '1930s', '1940s', 'C', 'Films remained popular during the 1930s Depression.');

    -- Q138 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Originally, a ______ is any story that has a happy ending.', 'fill_in_blank', 'comedy', 'Comedies traditionally have happy endings.');

    -- Q139 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ place emphasis on suspense and fearful anticipation.', 'multiple_choice', 'Comedies', 'Thrillers', 'Adventures', 'Documentaries', 'B', 'Thrillers focus on suspense and anticipation.');

    -- Q140 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A ______ is a factual film about an event or person.', 'multiple_choice', 'Drama', 'Documentary', 'Biography', 'Musical', 'B', 'Documentaries present factual content.');

    -- Q141 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'In ______ films, real life experiences are fictionalized to provide examples of virtue.', 'fill_in_blank', 'biographical', 'Biographical films fictionalize real lives.');

    -- Q142 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which is NOT a function of film?', 'multiple_choice', 'Entertainment', 'Relaxation', 'Catharsis', 'Gatekeeping', 'D', 'Gatekeeping is a media function, not specifically film.');

    -- Q143 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ is the person who initiates the idea of production.', 'multiple_choice', 'Director', 'Producer', 'Script writer', 'Editor', 'B', 'The producer initiates production ideas.');

    -- Q144 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The ______ has the responsibility of running the entire production.', 'fill_in_blank', 'production manager', 'Production manager oversees all production aspects.');

    -- Q145 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ creates the screenplay.', 'multiple_choice', 'Director', 'Producer', 'Script writer', 'Editor', 'C', 'Script writer creates the screenplay.');

    -- Q146 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Production designer is also known as:', 'multiple_choice', 'Set designer', 'Costume designer', 'Make-up artist', 'Sound director', 'A', 'Production designer is the set designer.');

    -- Q147 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ selects all the clothing worn by players in the film.', 'fill_in_blank', 'Costume designer', 'Costume designer chooses actors'' clothing.');

    -- Q148 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ is applied to enhance or transform actors'' looks.', 'multiple_choice', 'Costumes', 'Make-up', 'Lighting', 'Sound', 'B', 'Make-up enhances or transforms appearance.');

    -- Q149 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The ______ composes or selects music for the film.', 'multiple_choice', 'Sound director', 'Composer', 'Editor', 'Producer', 'B', 'Composer creates or selects film music.');

    -- Q150 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'MATV stands for ______.', 'fill_in_blank', 'master antennal television', 'MATV is master antenna television.');

    -- Q151 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'HBO was launched in:', 'multiple_choice', '1970', '1972', '1974', '1976', 'B', 'Home Box Office launched in 1972.');

    -- Q152 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'SMATV employs a ______ to capture signals.', 'multiple_choice', 'Satellite dish', 'Microwave receiver', 'Cable wire', 'Antenna tower', 'A', 'SMATV uses satellite dishes.');

    -- Q153 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'MMDS stands for ______.', 'fill_in_blank', 'Microwave multi distribution system', 'MMDS is microwave distribution.');

    -- Q154 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'IP stands for:', 'multiple_choice', 'Internet Protocol', 'International Protocol', 'Information Processing', 'Internet Processing', 'A', 'IP means Internet Protocol.');

    -- Q155 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The first full-service electronic computer was:', 'multiple_choice', 'UNIVAC', 'ENIAC', 'IBM 701', 'Apple I', 'B', 'ENIAC was first full-service electronic computer.');

    -- Q156 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'ENIAC stands for ______.', 'fill_in_blank', 'Electronic Numerical Integrator and Calculator', 'ENIAC was an early computer.');

    -- Q157 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Commercial computers were introduced by:', 'multiple_choice', 'Apple', 'Microsoft', 'IBM', 'Intel', 'C', 'IBM introduced commercial computers.');

    -- Q158 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The "global village" concept suggests:', 'multiple_choice', 'Isolated communities', 'Increased global interconnectedness', 'Rural development', 'Urban isolation', 'B', 'Global village means increased interconnectedness.');

    -- Q159 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Online magazine is also known as ______.', 'fill_in_blank', 'Webzines', 'Online magazines are called webzines.');

    -- Q160 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'An ezine that appears on the World Wide Web is called a:', 'multiple_choice', 'Blog', 'Webzine', 'Podcast', 'Vlog', 'B', 'Web-based ezines are webzines.');

    -- Q161 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ are additional sources through which mass media get information.', 'multiple_choice', 'Adjuncts', 'Gatekeepers', 'Sources', 'Channels', 'A', 'Adjuncts are supplementary media sources.');

    -- Q162 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'NAN stands for ______.', 'fill_in_blank', 'News Agency of Nigeria', 'NAN is Nigeria''s news agency.');

    -- Q163 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The advertising agency serves as mediator between:', 'multiple_choice', 'Government and media', 'Advertisers and mass media', 'Public and government', 'Media and audience', 'B', 'Agencies mediate between advertisers and media.');

    -- Q164 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which is NOT a function of advertising agency?', 'multiple_choice', 'Planning', 'Client service', 'Creative service', 'Gatekeeping', 'D', 'Gatekeeping is not typically an agency function.');

    -- Q165 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The primary function of advertisement is to help companies produce ______.', 'fill_in_blank', 'larger sales', 'Advertising aims to increase sales.');

    -- Q166 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Exchange of culture and values is a function called:', 'multiple_choice', 'Surveillance', 'Correlation', 'Social-Cultural Integration', 'Entertainment', 'C', 'Social-cultural integration involves cultural exchange.');

    -- Q167 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Severin and Tankard (1980) grouped definitions of communication into:', 'multiple_choice', 'Two areas', 'Three areas', 'Four areas', 'Five areas', 'B', 'They identified three major areas.');

    -- Q168 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Processing, understanding and interpreting a message by the receiver is called ______.', 'fill_in_blank', 'Encoding', 'The receiver encodes (interprets) the message.');

    -- Q169 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In Laswellian model, "to whom" refers to:', 'multiple_choice', 'Source', 'Message', 'Channel', 'Receiver', 'D', '"To whom" means the receiver.');

    -- Q170 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which model shows communication as circular and ongoing?', 'multiple_choice', 'Aristotle''s Model', 'Lasswell''s Model', 'The Hub Model', 'Shannon-Weaver Model', 'C', 'Hub Model shows circular, ongoing process.');

    -- Q171 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'According to Kaplan, a theory enables us to ______.', 'fill_in_blank', 'make sense out of a disturbing situation', 'Theories help understand complex situations.');

    -- Q172 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which theory sees audience as influencing media through selective use?', 'multiple_choice', 'Magic Bullet', 'Uses and gratifications', 'Agenda Setting', 'Cultivation', 'B', 'Uses and gratifications emphasizes audience choice.');

    -- Q173 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Communication by word of mouth is:', 'multiple_choice', 'Written communication', 'Oral communication', 'Non-verbal communication', 'Visual communication', 'B', 'Oral communication uses spoken words.');

    -- Q174 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The type of communication mostly learnt during childhood is ______.', 'fill_in_blank', 'Non-verbal', 'Children learn non-verbal communication first.');

    -- Q175 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Body movements that directly translate into words are:', 'multiple_choice', 'Illustrators', 'Emblems', 'Regulators', 'Adaptors', 'B', 'Emblems are direct word replacements.');

    -- Q176 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Conveying messages through eye contact is:', 'multiple_choice', 'Kinesics', 'Oculesics', 'Vocalics', 'Proxemics', 'B', 'Oculesics is eye communication.');

    -- Q177 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The kind where sender is also receiver is ______ communication.', 'fill_in_blank', 'Intrapersonal', 'Intrapersonal involves self-communication.');

    -- Q178 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Dyadic communication involves ______ people.', 'multiple_choice', 'One', 'Two', 'Three', 'Many', 'B', 'Dyadic means two-person communication.');

    -- Q179 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'International communication occurs between:', 'multiple_choice', 'Individuals', 'Groups', 'Nations', 'Organizations', 'C', 'International means between nations.');

    -- Q180 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Books, newspapers and magazines are ______ media.', 'fill_in_blank', 'print', 'These are traditional print media.');

    -- Q181 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Development of books started with invention of:', 'multiple_choice', 'Printing', 'Writing', 'Paper', 'Ink', 'B', 'Books began with writing systems.');

    -- Q182 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Acta Diurna means:', 'multiple_choice', 'Daily news', 'Actions of the day', 'Public records', 'Government bulletins', 'B', 'Acta Diurna translates to "actions of the day".');

    -- Q183 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The first magazine was established in ______.', 'fill_in_blank', '1704', 'Daniel Defoe started the first magazine in 1704.');

    -- Q184 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Early books were made of:', 'multiple_choice', 'Papyrus', 'Vellum', 'Paper', 'Clay', 'B', 'Vellum (animal skin) was used for early books.');

    -- Q185 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'There are ______ periods in the history of books.', 'multiple_choice', 'Three', 'Four', 'Five', 'Six', 'B', 'Four historical periods are identified.');

    -- Q186 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Textbooks and learning materials are ______ books.', 'fill_in_blank', 'educational', 'These are educational publications.');

    -- Q187 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The first step in book publishing is:', 'multiple_choice', 'Editing', 'Marketing', 'Submission by author', 'Printing', 'C', 'Author submission initiates publishing.');

    -- Q188 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Important predecessors of radio were telegraph and:', 'multiple_choice', 'Telephone', 'Television', 'Newspaper', 'Film', 'A', 'Telegraph and telephone preceded radio.');

    -- Q189 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The most influential medium is ______.', 'fill_in_blank', 'Television', 'TV is considered most influential mass medium.');

    -- Q190 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Comedy usually has a ______ ending.', 'multiple_choice', 'Sad', 'Happy', 'Open', 'Tragic', 'B', 'Comedies traditionally end happily.');

    -- Q191 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'WWW stands for:', 'multiple_choice', 'World Wide Web', 'World Web Wide', 'Web World Wide', 'Wide World Web', 'A', 'WWW is World Wide Web.');

    -- Q192 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Internet is worldwide accessible series of interconnected ______ networks.', 'fill_in_blank', 'computer', 'Internet connects computer networks.');

    -- Q193 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '"Global village" was propounded by:', 'multiple_choice', 'Marshall McLuhan', 'Harold Innis', 'Walter Ong', 'Neil Postman', 'A', 'Marshall McLuhan coined "global village".');

    -- Q194 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Internet radio was born in:', 'multiple_choice', '1993', '1995', '1997', '1999', 'B', 'Internet radio began in 1995.');

    -- Q195 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Online newspaper is also called ______.', 'fill_in_blank', 'web newspaper', 'Online newspapers are web newspapers.');

    -- Q196 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'News agencies are examples of:', 'multiple_choice', 'Mass media', 'Adjuncts', 'Gatekeepers', 'Sources', 'B', 'News agencies are adjuncts to mass media.');

    -- Q197 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'AFP stands for:', 'multiple_choice', 'American French Press', 'Agence France Presse', 'Associated French Press', 'African Press Federation', 'B', 'AFP is Agence France Presse.');

    -- Q198 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Reuters is owned by ______ government.', 'fill_in_blank', 'British', 'Reuters is a British news agency.');

    -- Q199 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Effective communication produces:', 'multiple_choice', 'Noise', 'An effect', 'Confusion', 'Isolation', 'B', 'Effective communication creates an effect.');

    -- Q200 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '"Who says what, in which channel, to whom, with what effect?" was said by:', 'multiple_choice', 'Aristotle', 'Harold Lasswell', 'Wilbur Schramm', 'Marshall McLuhan', 'B', 'Lasswell formulated this communication model.');

END $$;