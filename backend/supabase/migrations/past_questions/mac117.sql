DO $$
DECLARE
    v_course_id UUID;
BEGIN
    SELECT id INTO v_course_id FROM courses WHERE code = 'MAC117' LIMIT 1;

    -- Q1 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The mass media emerged in contemporary society as one of the powerful institutions for ______ change and development.', 'fill_in_blank', 'Societal', 'The mass media is an institution for societal change.');

    -- Q2 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The core purpose of the mass media as an institution is:', 'multiple_choice', 'Entertainment only', 'Writing and disseminating information', 'Making profit only', 'Political propaganda', 'B', 'The core purpose is writing and disseminating information.');

    -- Q3 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Who pointed out that deeper understanding of mass media is essential for effective writing?', 'multiple_choice', 'Uyo (1987)', 'DeFleur and Dennis', 'Blake and Haroldsen', 'MacDougal (1980)', 'A', 'Uyo (1987) emphasized understanding mass media for effective writing.');

    -- Q4 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'DeFleur and Dennis defined mass media as devices for moving messages across ______ and time.', 'fill_in_blank', 'distance', 'Mass media moves messages across distance and time.');

    -- Q5 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Blake and Haroldsen refer to mass media as:', 'multiple_choice', 'Social institutions', 'Technical vices', 'Public services', 'Commercial enterprises', 'B', 'They called mass media "technical vices" for mass communication.');

    -- Q6 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which is NOT a characteristic of mass media?', 'multiple_choice', 'Easily noticed', 'Always in a hurry', 'Secretive in nature', 'Publicist in nature', 'C', 'Mass media are not secretive; they are publicist in nature.');

    -- Q7 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Characteristically, the mass media are naturally open to ______.', 'fill_in_blank', 'public service', 'Mass media serve the public interest.');

    -- Q8 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Mass media are institutions that are both:', 'multiple_choice', 'Generalist and specialist', 'Private and public', 'Local and international', 'Traditional and modern', 'A', 'They function as both generalist and specialist institutions.');

    -- Q9 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which is a type of message presented in mass media?', 'multiple_choice', 'News Stories', 'Private letters', 'Personal diaries', 'Secret memos', 'A', 'News stories are standard mass media content.');

    -- Q10 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ is a straight, formal, objective, balanced, accurate, and timely account of a factual event.', 'fill_in_blank', 'News stories', 'This defines a standard news story.');

    -- Q11 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Breaking down news events to highlight important points is called:', 'multiple_choice', 'Editorial writing', 'News analysis', 'Feature writing', 'Advertising copy', 'B', 'News analysis examines and explains news events.');

    -- Q12 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'An editorial comment represents:', 'multiple_choice', 'Personal opinion of reporter', 'Official stand of media organization', 'Government position', 'Public opinion', 'B', 'Editorials express the media organization''s official position.');

    -- Q13 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ are materials that must be paid for before they are printed or aired.', 'fill_in_blank', 'Advertising/Commercials', 'Advertising requires payment for placement.');

    -- Q14 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Feature articles are written for:', 'multiple_choice', 'Hurried readers', 'Relaxed readers with time', 'Academic researchers', 'Government officials', 'B', 'Features target readers with leisure time.');

    -- Q15 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Opinion articles are:', 'multiple_choice', 'Objective facts', 'Subjective opinions of writer', 'Official statements', 'Legal documents', 'B', 'Opinion pieces express subjective views.');

    -- Q16 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ is a kind of panel analysis with experts discussing a topic on air.', 'fill_in_blank', 'Discussion', 'Discussion programs feature expert panels.');

    -- Q17 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Discussion programs are most common in:', 'multiple_choice', 'Print media', 'Broadcast media', 'Social media', 'Outdoor media', 'B', 'Discussions are primarily broadcast media content.');

    -- Q18 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In talk programs, who moderates the presentation?', 'multiple_choice', 'Producer', 'Host', 'Guest', 'Listener', 'B', 'The host moderates talk program discussions.');

    -- Q19 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ constitute the bulk of the entertainment function of broadcast media.', 'fill_in_blank', 'Drama presentation', 'Dramas are key broadcast entertainment.');

    -- Q20 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Cartoons are presented by:', 'multiple_choice', 'Print media only', 'Broadcast media only', 'Both print and broadcast', 'Neither print nor broadcast', 'C', 'Cartoons appear in both print and broadcast media.');

    -- Q21 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Letters to the Editor are:', 'multiple_choice', 'Official statements', 'Audience participatory presentations', 'Advertising content', 'Government notices', 'B', 'They allow audience participation in print media.');

    -- Q22 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The mass media are a ______ profession and all media writers are expected to write.', 'fill_in_blank', 'writing', 'Media is fundamentally a writing profession.');

    -- Q23 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Writing is defined as:', 'multiple_choice', 'Speaking effectively', 'Ability to put pen to paper to express ideas', 'Drawing illustrations', 'Making speeches', 'B', 'Writing involves expressing ideas through written words.');

    -- Q24 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Social processes are filtered through the ______ of mass media writers.', 'multiple_choice', 'Personal biases', 'Apparatus', 'Government control', 'Commercial interests', 'B', 'Media writers filter reality through their apparatus.');

    -- Q25 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Commercial messages that persuade may also ______.', 'fill_in_blank', 'entertain', 'Advertising can both persuade and entertain.');

    -- Q26 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Mass media audiences are:', 'multiple_choice', 'Homogeneous', 'Diverse', 'Elite only', 'Rural only', 'B', 'Media audiences are highly diverse.');

    -- Q27 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which is NOT an obligation of media writers?', 'multiple_choice', 'To profession', 'To medium', 'To society', 'To personal friends', 'D', 'Media writers have professional, institutional, and social obligations.');

    -- Q28 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ means representing reality as accurately as language allows.', 'fill_in_blank', 'Honesty', 'Honesty in media writing means accurate representation.');

    -- Q29 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Semantics divides statements into:', 'multiple_choice', 'Reports, inferences, judgement', 'Facts, opinions, lies', 'News, features, editorials', 'Simple, compound, complex', 'A', 'The three main groups are reports, inferences, and judgement.');

    -- Q30 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A report is a statement of:', 'multiple_choice', 'Opinion', 'Fact', 'Prediction', 'Evaluation', 'B', 'Reports state verifiable facts.');

    -- Q31 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Inferences are ______ conclusions.', 'fill_in_blank', 'logical', 'Inferences are logical deductions from known facts.');

    -- Q32 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Writing based only on inference can be:', 'multiple_choice', 'Safe', 'Risky', 'Always accurate', 'Mandatory', 'B', 'Relying solely on inferences is risky in journalism.');

    -- Q33 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A judgemental statement expresses:', 'multiple_choice', 'Factual data', 'Approval or disapproval', 'Statistical analysis', 'Historical context', 'B', 'Judgements express approval or disapproval.');

    -- Q34 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Fiction in ______ is never justified.', 'fill_in_blank', 'information', 'Journalistic information should never be fictionalized.');

    -- Q35 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The style model established by ______ is widely followed.', 'multiple_choice', 'BBC', 'CNN', 'Associated Press (AP)', 'Reuters', 'C', 'AP style is the standard for media writing.');

    -- Q36 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which is NOT a principle of good media writing?', 'multiple_choice', 'Be verbose', 'Be concise', 'Be concrete', 'Be organized', 'A', 'Good writing should be concise, not verbose.');

    -- Q37 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The media writer must be conscious of the ______ syndrome.', 'fill_in_blank', 'deadline', 'Meeting deadlines is crucial in media work.');

    -- Q38 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A good media writer must be:', 'multiple_choice', 'A student of human nature', 'Indifferent to society', 'Slow and methodical', 'Avoiding creativity', 'A', 'Understanding human behavior is essential.');

    -- Q39 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ is described as "the palm oil with which palm oil is eaten".', 'multiple_choice', 'Money', 'Language', 'Technology', 'Creativity', 'B', 'Language is fundamental to media writing.');

    -- Q40 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ is the central approach of writing for the air.', 'fill_in_blank', 'Simplicity', 'Broadcast writing requires simplicity.');

    -- Q41 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Warming up the listener is almost a ______ technique.', 'multiple_choice', 'Conclusion', 'Headline', 'Detail', 'Technical', 'B', 'It''s similar to headline writing for print.');

    -- Q42 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'According to Wermer (1969), it is hard to tell how to:', 'multiple_choice', 'Write to pictures', 'Write news stories', 'Edit copy', 'Interview sources', 'A', 'Writing to accompany pictures is challenging.');

    -- Q43 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The ______ marks the end of a sentence.', 'fill_in_blank', 'period', 'A period (full stop) ends sentences.');

    -- Q44 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Print media include:', 'multiple_choice', 'Newspapers and magazines', 'Radio and TV', 'Films', 'Websites only', 'A', 'Print media are reading materials like newspapers.');

    -- Q45 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Prints can be illustrated with:', 'multiple_choice', 'Sound only', 'Pictures and graphics', 'Motion only', 'Music only', 'B', 'Print media use visual elements like pictures.');

    -- Q46 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Print details are more ______ than those of broadcast.', 'fill_in_blank', 'detailed', 'Print allows for more detailed information.');

    -- Q47 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which gives readers the "first test"?', 'multiple_choice', 'Print media', 'Broadcast media', 'Both equally', 'Neither', 'B', 'Broadcast provides first, immediate information.');

    -- Q48 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which gives readers the "most test"?', 'multiple_choice', 'Print media', 'Broadcast media', 'Social media', 'Outdoor media', 'A', 'Print provides comprehensive, detailed information.');

    -- Q49 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Print stories are usually ______.', 'fill_in_blank', 'delayed', 'Print publication involves time delays.');

    -- Q50 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Daily newspapers are published:', 'multiple_choice', 'Weekly', 'Monthly', 'Everyday', 'Annually', 'C', 'Dailies are published daily with fresh content.');

    -- Q51 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Weekly newspapers have writing style that is:', 'multiple_choice', 'More rushed than dailies', 'More relaxed than dailies', 'More technical than dailies', 'More formal than dailies', 'B', 'Weeklies have more relaxed production schedules.');

    -- Q52 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ newspapers are rural based and specialize in grassroots information.', 'fill_in_blank', 'Community', 'Community newspapers focus on local grassroots issues.');

    -- Q53 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'National newspapers cover:', 'multiple_choice', 'Only one city', 'Entire country', 'Only rural areas', 'Only capital city', 'B', 'National newspapers have countrywide circulation.');

    -- Q54 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'International newspapers are ______ in outlook.', 'multiple_choice', 'Localized', 'Globalized', 'Regional', 'Nationalistic', 'B', 'International papers have global perspectives.');

    -- Q55 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Magazines are generally of ______ types.', 'fill_in_blank', 'two', 'Two main types: general interest and specialized.');

    -- Q56 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'General interest magazines:', 'multiple_choice', 'Discriminate in content', 'Do not discriminate in content', 'Are only for experts', 'Are only for children', 'B', 'They appeal to broad audiences without discrimination.');

    -- Q57 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Informational graphics help with all EXCEPT:', 'multiple_choice', 'Assimilation of stories', 'Breaking gray matters', 'Making stories longer', 'Effective page planning', 'C', 'Graphics don''t necessarily make stories longer.');

    -- Q58 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'When writing print copy, avoid excessive use of ______ tense.', 'fill_in_blank', 'past', 'Past tense can make stories seem stale.');

    -- Q59 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In email stories, using all capital letters is called:', 'multiple_choice', 'Emphasizing', 'Shouting', 'Highlighting', 'Bolding', 'B', 'All caps is considered "shouting" online.');

    -- Q60 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The traditional form for print media information packaging is:', 'multiple_choice', 'Pyramid style', 'Inverted pyramid', 'Circular style', 'Narrative style', 'B', 'Inverted pyramid is standard for news writing.');

    -- Q61 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Inverted pyramid crowds as much information as possible into the ______ paragraph.', 'fill_in_blank', 'first', 'The lead paragraph contains key information.');

    -- Q62 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Inverted pyramid is favored because it:', 'multiple_choice', 'Complicates reading', 'Facilitates reading', 'Hides information', 'Confuses readers', 'B', 'It makes reading and comprehension easier.');

    -- Q63 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Pyramid style is used for:', 'multiple_choice', 'Breaking news only', 'Essays, poetry, drama', 'Headlines only', 'Advertising only', 'B', 'MacDougal noted pyramid style for literary works.');

    -- Q64 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ has been described as writing with pictures.', 'fill_in_blank', 'Photo journalism', 'Photojournalism combines images and words.');

    -- Q65 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The invention that brought pictures to mass communication is:', 'multiple_choice', 'Telephone', 'Halftone', 'Radio', 'Television', 'B', 'Halftone technology enabled photo reproduction.');

    -- Q66 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'There are ______ classes of pictures used in print.', 'multiple_choice', 'Two', 'Three', 'Four', 'Five', 'A', 'Two classes: photojournalism and aesthetic pictures.');

    -- Q67 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ pictures are used to enhance page appearance.', 'fill_in_blank', 'Aesthetic', 'Aesthetic pictures improve visual appeal.');

    -- Q68 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Magazines are usually published:', 'multiple_choice', 'Daily', 'At intervals', 'Hourly', 'Continuously', 'B', 'Magazines have periodic publication schedules.');

    -- Q69 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Posters and brochures are designed to:', 'multiple_choice', 'Hide information', 'Call attention to something', 'Replace newspapers', 'Be kept secret', 'B', 'They attract attention to products, events, etc.');

    -- Q70 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Pamphlets are different from brochures in that their graphics may not always be ______.', 'fill_in_blank', 'especially interesting', 'Pamphlets may have simpler graphics.');

    -- Q71 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'An advertising writer''s obligation is to:', 'multiple_choice', 'Bore the audience', 'Capture attention and persuade', 'Provide neutral information', 'Criticize competitors', 'B', 'Advertising aims to attract and persuade.');

    -- Q72 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'APCON stands for:', 'multiple_choice', 'Advertising Practitioners Council of Nigeria', 'Association of Print Consultants of Nigeria', 'African Press Council of Nations', 'American Public Communication Network', 'A', 'APCON regulates Nigerian advertising.');

    -- Q73 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'There are ______ types of advertising copy appeals.', 'fill_in_blank', 'five', 'Five types: attention, self-interest, desire, credibility, action.');

    -- Q74 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Native creativity refers to:', 'multiple_choice', 'Learned skills', 'Inborn or biogenic qualities', 'Technical training', 'Academic education', 'B', 'It''s innate, unique individual qualities.');

    -- Q75 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Creativity can be honed by:', 'multiple_choice', 'Avoiding new ideas', 'Learning to make unusual associations', 'Following routines strictly', 'Ignoring other perspectives', 'B', 'Creative thinking involves novel connections.');

    -- Q76 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Institutional advertising is sometimes called ______ advertising.', 'fill_in_blank', 'image or idea', 'It focuses on organizational image rather than products.');

    -- Q77 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Image adverts help audiences see institutions:', 'multiple_choice', 'As they really are', 'As they want to be seen', 'As critics see them', 'As government sees them', 'B', 'Image advertising shapes organizational perception.');

    -- Q78 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'ADVAN stands for:', 'multiple_choice', 'Advertisers'' Association of Nigeria', 'Advertising Development Agency of Nigeria', 'African Digital Video Network', 'American Direct Video Network', 'A', 'ADVAN represents Nigerian advertisers.');

    -- Q79 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'BON stands for ______.', 'fill_in_blank', 'Broadcasting Organisation of Nigeria', 'BON is the broadcasting industry body.');

    -- Q80 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Public relations writing appears:', 'multiple_choice', 'Only in specialized media', 'As part of mass media presentations', 'Never in media', 'Only in government publications', 'B', 'PR writing is part of general media content.');

    -- Q81 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A prominent part of a media kit is the:', 'multiple_choice', 'Fact sheet', 'Fiction story', 'Personal letter', 'Secret memo', 'A', 'Fact sheets provide essential information.');

    -- Q82 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ means information is for writer''s understanding but not for reporting.', 'fill_in_blank', 'Off the record', 'Off-the-record information cannot be published.');

    -- Q83 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '"Background only" means information may be:', 'multiple_choice', 'Reported and attributed', 'Reported but not attributed', 'Ignored completely', 'Published with photos', 'B', 'Background information is usable without source attribution.');

    -- Q84 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The lead or intro is:', 'multiple_choice', 'The last paragraph', 'The very first paragraph', 'The middle section', 'The conclusion', 'B', 'The lead begins any media write-up.');

    -- Q85 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ lead allows authentication by starting with source''s exact words.', 'fill_in_blank', 'Quotation', 'Quotation leads use direct quotes for authenticity.');

    -- Q86 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Staccato lead emphasizes:', 'multiple_choice', 'Place element', 'Time element', 'Source element', 'Visual element', 'B', 'Staccato leads highlight time aspects.');

    -- Q87 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Explosive lead is best suited for:', 'multiple_choice', 'Straight news only', 'Feature articles', 'Weather reports', 'Stock market data', 'B', 'Explosive leads work well in feature writing.');

    -- Q88 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'A good lead should ______ the news.', 'fill_in_blank', 'summarize', 'Leads typically summarize the main points.');

    -- Q89 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'How many steps are involved in writing headlines?', 'multiple_choice', 'Two', 'Four', 'Six', 'Eight', 'B', 'Four main steps are typically involved.');

    -- Q90 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'GIGO stands for:', 'multiple_choice', 'Good input, good output', 'Garbage in, garbage out', 'Great ideas generate outcomes', 'General information goes online', 'B', 'GIGO means poor input leads to poor output.');

    -- Q91 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Media writers write what they ______.', 'fill_in_blank', 'observe', 'Journalism is based on observation.');

    -- Q92 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A primary source provides information:', 'multiple_choice', 'From secondhand accounts', 'Firsthand for your need', 'From other media reports', 'From rumors', 'B', 'Primary sources offer direct, firsthand information.');

    -- Q93 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The power of observation helps writers:', 'multiple_choice', 'See what others miss', 'Ignore details', 'Follow crowds', 'Avoid scoops', 'A', 'Observation reveals what others overlook.');

    -- Q94 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ has opened new electronic resources for media writers.', 'fill_in_blank', 'Technology', 'Technology provides new information tools.');

    -- Q95 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The fastest growing electronic information source is:', 'multiple_choice', 'Library archives', 'Internet', 'Newspaper morgues', 'Government files', 'B', 'Internet is the fastest-growing information source.');

    -- Q96 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'WWW stands for:', 'multiple_choice', 'World Wide Web', 'World Wireless Web', 'World Writing Web', 'World Web Wide', 'A', 'WWW is the World Wide Web.');

    -- Q97 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ are self-contained fee-based services with extensive resources.', 'fill_in_blank', 'On-line services', 'Online services like LexisNexis provide specialized information.');

    -- Q98 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A browser allows you to:', 'multiple_choice', 'Print documents only', 'Access specific internet information', 'Watch TV programs', 'Listen to radio', 'B', 'Browsers search and access web information.');

    -- Q99 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The head of executive government is the:', 'multiple_choice', 'President', 'Chief Justice', 'Senate President', 'Media owner', 'A', 'The president heads the executive branch.');

    -- Q100 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The ______ has responsibility to make laws.', 'fill_in_blank', 'Parliament', 'Parliament (legislature) creates laws.');

    -- Q101 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The judiciary desk handles information about:', 'multiple_choice', 'Executive branch', 'Legislative branch', 'Judiciary', 'Military', 'C', 'Judiciary desk covers courts and legal system.');

    -- Q102 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Interviewing involves:', 'multiple_choice', 'Observation only', 'Question and answer session', 'Reading documents', 'Watching events', 'B', 'Interviewing is Q&A between reporter and source.');

    -- Q103 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The ______ is the reporter''s place of assignment.', 'fill_in_blank', 'beat', 'A beat is a reporter''s regular coverage area.');

    -- Q104 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Observation is the art of:', 'multiple_choice', 'Ignoring details', 'Paying attention to details', 'Guessing information', 'Creating fiction', 'B', 'Observation requires careful attention to details.');

    -- Q105 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'An observant person will always:', 'multiple_choice', 'Miss information', 'Hear, see and feel information', 'Avoid information', 'Distort information', 'B', 'Observant people notice various information forms.');

    -- Q106 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ is one profession that is always in a hurry.', 'fill_in_blank', 'Journalism', 'Journalism operates with constant deadlines.');

    -- Q107 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Revising improves:', 'multiple_choice', 'Only spelling', 'Content and organization', 'Only punctuation', 'Only formatting', 'B', 'Revising enhances content and structure.');

    -- Q108 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'According to Camp (1998), revising is:', 'multiple_choice', 'Seeing again', 'Writing again', 'Deleting everything', 'Starting over', 'A', 'Revising means "seeing again" or re-examining.');

    -- Q109 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ refers to the general effect a piece of writing creates.', 'fill_in_blank', 'Tone', 'Tone is the writing''s overall effect or mood.');

    -- Q110 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Editing checks for all EXCEPT:', 'multiple_choice', 'Clarity', 'Completeness', 'Fictionalization', 'Correctness', 'C', 'Editing ensures quality; fiction has no place.');

    -- Q111 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A story is consistent in fact if it:', 'multiple_choice', 'Contradicts itself', 'Does not contradict itself', 'Changes facts', 'Omits facts', 'B', 'Consistency means no internal contradictions.');

    -- Q112 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ is examining a story to find errors for correction.', 'fill_in_blank', 'Proofreading', 'Proofreading catches errors before publication.');

    -- Q113 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The objective of effective journalistic writing is to:', 'multiple_choice', 'Be cumbersome', 'Avoid cumbersomeness', 'Be repetitious', 'Use excessive referents', 'B', 'Good writing avoids unnecessary complexity.');

    -- Q114 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A famous barrier to effective media writing is:', 'multiple_choice', 'Brevity', 'Wordiness', 'Clarity', 'Simplicity', 'B', 'Wordiness (verbosity) hinders clear writing.');

    -- Q115 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'A combination of words that properly belong together is a ______.', 'fill_in_blank', 'thought Unit', 'Thought units are coherent word groups.');

    -- Q116 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Proper emphasis in media writing:', 'multiple_choice', 'Creates vagueness', 'Avoids vagueness, ensures clarity', 'Hides important ideas', 'Confuses readers', 'B', 'Proper emphasis clarifies by positioning key ideas early.');

    -- Q117 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A cliché is:', 'multiple_choice', 'A fresh expression', 'An overused expression', 'A technical term', 'A new idea', 'B', 'Clichés are trite, overused phrases.');

    -- Q118 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ is a profession that relies on word use to share meaning.', 'fill_in_blank', 'Journalism', 'Journalism depends on effective language use.');

    -- Q119 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'How many parts of speech are there?', 'multiple_choice', 'Six', 'Seven', 'Eight', 'Nine', 'C', 'Eight parts: noun, pronoun, adjective, verb, adverb, conjunction, interjection, preposition.');

    -- Q120 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'An adjective modifies:', 'multiple_choice', 'Verb only', 'Noun or pronoun', 'Adverb only', 'Conjunction', 'B', 'Adjectives describe nouns or pronouns.');

    -- Q121 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Certain adjectives are irregular at comparative and superlative forms, e.g., good, ______, best.', 'fill_in_blank', 'better', 'Good, better, best are irregular forms.');

    -- Q122 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'An adverb modifies:', 'multiple_choice', 'Only verbs', 'Verbs, adjectives, or other adverbs', 'Only nouns', 'Only pronouns', 'B', 'Adverbs modify verbs, adjectives, or other adverbs.');

    -- Q123 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A conjunction connects:', 'multiple_choice', 'Only nouns', 'Sentences or sentence parts', 'Only verbs', 'Only adjectives', 'B', 'Conjunctions join words, phrases, or clauses.');

    -- Q124 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'An ______ expresses strong emotion.', 'fill_in_blank', 'interjection', 'Interjections like "Wow!" show emotion.');

    -- Q125 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A noun has:', 'multiple_choice', 'Only gender', 'Gender, number, and case', 'Only number', 'Only case', 'B', 'Nouns have gender, number, and case properties.');

    -- Q126 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A preposition joins:', 'multiple_choice', 'Noun/pronoun to rest of sentence', 'Two sentences only', 'Two adjectives only', 'Two verbs only', 'A', 'Prepositions connect nouns/pronouns to other words.');

    -- Q127 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'A pronoun stands for a ______.', 'fill_in_blank', 'noun', 'Pronouns replace nouns (he, she, it, etc.).');

    -- Q128 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Reflexive pronouns end in:', 'multiple_choice', 'ly', 'self', 'ing', 'ed', 'B', 'Reflexive pronouns: myself, yourself, himself, etc.');

    -- Q129 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Demonstrative pronouns include:', 'multiple_choice', 'I, you, he', 'This, that, those', 'Some, any, each', 'My, your, his', 'B', 'This, that, these, those are demonstrative pronouns.');

    -- Q130 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'A ______ expresses action, being, or state of being.', 'fill_in_blank', 'verb', 'Verbs show action or state of being.');

    -- Q131 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The most commonly used formula for testing passage average is:', 'multiple_choice', 'Word length', 'Sentence length', 'Paragraph count', 'Page count', 'B', 'Sentence length is a key readability measure.');

    -- Q132 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Banality involves ______ in media writing.', 'multiple_choice', 'Originality', 'Commonses', 'Complexity', 'Technicality', 'B', 'Banality means being commonplace or trite.');

    -- Q133 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ are standard tools for most PR professionals.', 'fill_in_blank', 'Media Kits', 'Media kits contain PR materials for distribution.');

    -- Q134 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Public relations aims to establish:', 'multiple_choice', 'Only profit', 'Mutual organization-public relationships', 'Only media coverage', 'Only advertising', 'B', 'PR builds mutual understanding between organizations and publics.');

    -- Q135 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The PR writer plays the role of a ______ within an organization.', 'multiple_choice', 'Salesperson', 'Reporter', 'Accountant', 'Technician', 'B', 'PR writers gather and disseminate information like reporters.');

    -- Q136 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The publication usually produced at intervals is ______.', 'fill_in_blank', 'Magazine', 'Magazines have periodic publication schedules.');

    -- Q137 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Newspaper covering entire country is called:', 'multiple_choice', 'Community newspaper', 'National newspaper', 'Daily newspaper', 'Weekly newspaper', 'B', 'National newspapers have countrywide circulation.');

    -- Q138 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which specializes in grassroots information?', 'multiple_choice', 'National newspaper', 'Community newspaper', 'International newspaper', 'Daily newspaper', 'B', 'Community newspapers focus on local grassroots issues.');

    -- Q139 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The commonest form of newspaper in Nigeria is ______ newspaper.', 'fill_in_blank', 'Daily', 'Daily newspapers are most common in Nigeria.');

    -- Q140 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The period marks the ______ of a sentence.', 'multiple_choice', 'Beginning', 'Middle', 'End', 'Continuation', 'C', 'Period (full stop) indicates sentence end.');

    -- Q141 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The first sentence of broadcast writing should:', 'multiple_choice', 'Be confusing', 'Catch listener''s attention', 'Be very long', 'Use complex vocabulary', 'B', 'Broadcast leads must immediately engage listeners.');

    -- Q142 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Ability to get message across in fewest words makes writing ______.', 'fill_in_blank', 'concise', 'Conciseness means expressing ideas briefly.');

    -- Q143 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Equivalent of Letters-to-the-Editor in broadcast is:', 'multiple_choice', 'News bulletin', 'Phone-in programmes', 'Documentary', 'Drama', 'B', 'Phone-in programs allow audience participation like letters.');

    -- Q144 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Discussion is mostly common to:', 'multiple_choice', 'Print media', 'Broadcast media', 'Outdoor media', 'Social media only', 'B', 'Discussion programs are primarily broadcast format.');

    -- Q145 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The mass media writers are in the primary business of information ______, writing, and dissemination.', 'fill_in_blank', 'gathering', 'Information gathering is the first step.');

    -- Q146 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The element of commercialization should not be pushed to ______ in mass media.', 'multiple_choice', 'Moderate level', 'Extreme', 'Minimum', 'Optimal level', 'B', 'Commercial interests shouldn''t override public service.');

    -- Q147 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which is a quality of a media writer?', 'multiple_choice', 'Functioning under pressure', 'Avoiding deadlines', 'Ignoring human nature', 'Lacking creativity', 'A', 'Media writers must work well under pressure.');

    -- Q148 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The general rule is not to use ______ unless you want material read as abbreviations.', 'fill_in_blank', 'abbreviations', 'Abbreviations should be used sparingly.');

    -- Q149 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In writing time, use:', 'multiple_choice', 'Words only', 'Figures, not PM/AM', 'PM/AM only', 'Roman numerals', 'B', 'Use figures (e.g., 3:00) without AM/PM in media writing.');

    -- Q150 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A typical TV viewer has difficulty with:', 'multiple_choice', 'Only seeing pictures', 'Seeing, hearing, and translating', 'Only hearing words', 'Only understanding', 'B', 'Viewers must process both visual and audio information.');

    -- Q151 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Print media characteristics include permanence, detail, delayed nature, financial outlay, and being ______ bound.', 'fill_in_blank', 'geographically', 'Print media have geographical distribution limits.');

    -- Q152 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Informational graphics help to:', 'multiple_choice', 'Assimilate stories', 'Discourage readability', 'Create gray matters', 'Complicate pages', 'A', 'Graphics aid story comprehension.');

    -- Q153 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'When writing print copy, you should:', 'multiple_choice', 'Gather minimal information', 'Gather more information than required', 'Never cross-check', 'Avoid balance', 'B', 'Gather extra information for thorough coverage.');

    -- Q154 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Email stories should be kept ______.', 'fill_in_blank', 'short', 'Concise emails are more effective.');

    -- Q155 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Inverted pyramid facilitates:', 'multiple_choice', 'Only headline writing', 'Reading, curiosity satisfaction, make-up, headline writing', 'Only make-up', 'Only curiosity', 'B', 'It aids multiple aspects of publication.');

    -- Q156 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Pyramid style assumes:', 'multiple_choice', 'Reader has no time', 'Reader has time or will make time', 'Reader is impatient', 'Reader scans only', 'B', 'Pyramid style suits leisurely reading.');

    -- Q157 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Inverted pyramid is recommended for magazine writing because readers have time to go through the whole ______.', 'fill_in_blank', 'hob', 'Readers have time for complete articles.');

    -- Q158 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The quality of paper in magazines is ______ than newspapers.', 'multiple_choice', 'Lower', 'Higher', 'Same', 'Unknown', 'B', 'Magazines use higher quality paper.');

    -- Q159 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'APCON''s Bureau of Consumer Protection issues:', 'multiple_choice', 'Voluntary guidelines', 'Legally binding regulations', 'Suggestions only', 'International standards', 'B', 'Their trade regulations have legal force.');

    -- Q160 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'AAPN stands for ______.', 'fill_in_blank', 'Association of Advertising Practitioners of Nigeria', 'AAPN is the advertising practitioners'' association.');

    -- Q161 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Advertising style of writing is ______ to media writing.', 'multiple_choice', 'New', 'Traditional', 'Unrelated', 'Identical', 'A', 'Advertising writing is a newer media writing form.');

    -- Q162 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'As a PR writer, you are responsible for:', 'multiple_choice', 'Only annual reports', 'All writing chores of organization', 'Only media relations', 'Only advertising', 'B', 'PR writers handle diverse organizational writing tasks.');

    -- Q163 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The ______ is the very first paragraph of any media write-up.', 'fill_in_blank', 'lead or intro', 'The lead/intro introduces the story.');

    -- Q164 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Example of quotation lead: "______", Professor Nwosu said.', 'multiple_choice', 'The economy is stable', 'The emotionally disturbed child is the number one problem', 'Education is improving', 'Technology is advancing', 'B', 'The document gives this specific example.');

    -- Q165 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A good lead ensures write-up is:', 'multiple_choice', 'Hard to read', 'Easy to read and interesting', 'Boring', 'Confusing', 'B', 'Good leads enhance readability and interest.');

    -- Q166 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Headline writing step: Summarize entire story in ______ sentence.', 'fill_in_blank', 'one', 'Summarize the story in one sentence first.');

    -- Q167 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Primary source example:', 'multiple_choice', 'Newspaper report', 'Eye witness account', 'Textbook summary', 'Wikipedia article', 'B', 'Eye witnesses provide firsthand primary information.');

    -- Q168 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Power of observation leads to:', 'multiple_choice', 'Missing scoops', 'Successful scooping', 'Ignoring news', 'Following rumors', 'B', 'Observation helps journalists get exclusive stories.');

    -- Q169 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Internet tools for print information include WWW, on-line services, and ______.', 'fill_in_blank', 'browser', 'Browsers access web information.');

    -- Q170 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'World Wide Web contains:', 'multiple_choice', 'Only images', 'Electronic documents', 'Only videos', 'Only audio', 'B', 'WWW contains electronic documents/resources.');

    -- Q171 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A browser is also known as:', 'multiple_choice', 'Search engineer', 'Web designer', 'Content manager', 'Network admin', 'A', 'Browser = search engine tool.');

    -- Q172 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Beat reporting is combing a news area to ______ information.', 'fill_in_blank', 'gather', 'Reporters gather information from their beats.');

    -- Q173 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Observation is the strategy of:', 'multiple_choice', 'Ignoring details', 'Paying attention to details', 'Creating information', 'Distorting facts', 'B', 'Observation requires careful attention.');

    -- Q174 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Revising, editing, and proofreading are:', 'multiple_choice', 'Same process', 'Different writing stages', 'Unnecessary steps', 'Only for beginners', 'B', 'They are distinct stages in writing refinement.');

    -- Q175 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Editing ensures writing is clear, complete, concise, consistent, correct, and ______.', 'fill_in_blank', 'courteous', 'Courtesy is one of the editing checks.');

    -- Q176 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Proofreading is essential for:', 'multiple_choice', 'Finding and correcting errors', 'Changing content', 'Adding new ideas', 'Rewriting completely', 'A', 'Proofreading catches grammatical/typographical errors.');

    -- Q177 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Wordiness is a barrier to:', 'multiple_choice', 'Effective media writing', 'Long articles', 'Fiction writing', 'Poetry', 'A', 'Concise writing is essential in media.');

    -- Q178 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'When thought unit words are placed correctly, readers understand meaning ______ and easily.', 'fill_in_blank', 'quickly', 'Proper word order aids quick comprehension.');

    -- Q179 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Proper emphasis places important ideas:', 'multiple_choice', 'At sentence end', 'At sentence beginning', 'In middle', 'Randomly', 'B', 'Key ideas should come early for clarity.');

    -- Q180 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Most adverbs end in:', 'multiple_choice', 'ing', 'ly', 'ed', 'tion', 'B', 'Adverbs often end with "ly" (quickly, happily).');

    -- Q181 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Personal pronouns include words like I, you, he, she, it, we, they, my, yours, hers, ______, and theirs.', 'fill_in_blank', 'ours', 'Ours is a possessive personal pronoun.');

    -- Q182 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The verb expresses:', 'multiple_choice', 'Only action', 'Action, being, or state of being', 'Only being', 'Only state', 'B', 'Verbs show action (run), being (is), or state (seem).');

    -- Q183 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Banality involves commonses, which means:', 'multiple_choice', 'Originality', 'Being commonplace/trite', 'Complexity', 'Sophistication', 'B', 'Commonses = lack of originality, being ordinary.');

    -- Q184 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Media kits are standard tools for ______ professionals.', 'fill_in_blank', 'Public Relations', 'PR professionals use media kits extensively.');

    -- Q185 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'PR aims at ______ relationship between organization and publics.', 'multiple_choice', 'One-way', 'Mutual', 'Adversarial', 'Ignoring', 'B', 'PR seeks mutual understanding and benefit.');

    -- Q186 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The PR writer role is similar to:', 'multiple_choice', 'Salesperson', 'Reporter', 'Accountant', 'Manager', 'B', 'PR writers gather and report information internally.');

    -- Q187 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Magazine is usually published at ______.', 'fill_in_blank', 'intervals', 'Magazines have periodic publication schedules.');

    -- Q188 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which newspaper covers entire country?', 'multiple_choice', 'Community', 'National', 'Daily', 'Weekly', 'B', 'National newspapers have nationwide reach.');

    -- Q189 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which specializes in grassroots information dissemination?', 'multiple_choice', 'National', 'Community', 'International', 'Daily', 'B', 'Community newspapers focus on local grassroots.');

    -- Q190 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The commonest newspaper in Nigeria is ______ newspaper.', 'fill_in_blank', 'Daily', 'Daily papers are most prevalent.');

    -- Q191 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Period marks sentence:', 'multiple_choice', 'Start', 'Middle', 'End', 'Pause', 'C', 'Period/full stop indicates sentence end.');

    -- Q192 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'First broadcast sentence should:', 'multiple_choice', 'Confuse', 'Catch attention', 'Be long', 'Use jargon', 'B', 'Broadcast leads must immediately engage.');

    -- Q193 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Conciseness means getting message across in ______ possible words.', 'fill_in_blank', 'fewer', 'Fewer words = more concise writing.');

    -- Q194 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Broadcast equivalent of Letters-to-Editor is:', 'multiple_choice', 'News bulletin', 'Phone-in', 'Documentary', 'Drama', 'B', 'Phone-in programs allow audience feedback.');

    -- Q195 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Discussion is most common in:', 'multiple_choice', 'Print', 'Broadcast', 'Outdoor', 'Online only', 'B', 'Discussion programs are primarily broadcast format.');

    -- Q196 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The mass media writers are in the primary ______ of information gathering, writing, and dissemination.', 'fill_in_blank', 'business', 'Media writing is a professional business.');

    -- Q197 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Mass media have nature of being:', 'multiple_choice', 'Secretive', 'Outspoken', 'Slow', 'Private', 'B', 'Mass media are characteristically outspoken.');

    -- Q198 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Commercialization should not be pushed to:', 'multiple_choice', 'Moderate level', 'Extreme', 'Minimum', 'Optimal', 'B', 'Commercial interests shouldn''t dominate media.');

    -- Q199 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Media writer must be astutely conscious of the ______ syndrome.', 'fill_in_blank', 'deadline', 'Deadlines are critical in media work.');

    -- Q200 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Good writing is ______ necessarily good media writing.', 'multiple_choice', 'Always', 'Not necessarily', 'Never', 'Usually', 'B', 'Media writing has specific requirements beyond general good writing.');

END $$;