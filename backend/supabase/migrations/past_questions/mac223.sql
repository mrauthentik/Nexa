DO $$
DECLARE
    v_course_id UUID;
BEGIN
    -- Assume course MAC223 exists; adjust if needed
    SELECT id INTO v_course_id FROM courses WHERE code = 'MAC223' LIMIT 1;

    -- Q1: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'According to Alexander (2000), ______ is writing and reporting which answers the questions: What was it like? and/or “what does it mean?”', 'fill_in_blank', 'feature writing', 'Alexander (2000) defines feature writing as writing that answers those questions.');

    -- Q2: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A ______ provides a reader with the flavour of an event or the nature of a person, not just the facts.', 'multiple_choice', 'news story', 'feature story', 'editorial', 'advertisement', 'B', 'A feature story provides the flavor and nature, not just facts.');

    -- Q3: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'According to Gidean (2009:14), feature writing is vivid, sensational writing which appeals to the ______ of the reader.', 'multiple_choice', 'logic', 'emotions', 'curiosity', 'intellect', 'B', 'Gidean says feature writing appeals to emotions.');

    -- Q4: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Gidean (2009:14) defines feature writing as ______, sensational writing which appeals to the emotions of the reader.', 'fill_in_blank', 'vivid', 'Gidean describes feature writing as vivid and sensational.');

    -- Q5: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'According to Okoye (2006), a feature is an in-depth and factual write up on a topical issue in a more ______ style than straight news.', 'multiple_choice', 'formal', 'captivating and relaxed', 'technical', 'brief', 'B', 'Okoye says features are more captivating and relaxed.');

    -- Q6: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Feature writing is an attempt to report, inform, enlighten, educate or persuade in a ______ way.', 'multiple_choice', 'strict', 'relaxed', 'hurried', 'biased', 'B', 'Feature writing is done in a relaxed manner.');

    -- Q7: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Whether it is serious news or just an article, what feature articles seek to achieve is to pass the message across in a more expansive, illustrative, sensational, descriptive or ______ way.', 'fill_in_blank', 'dramatic', 'Features use a dramatic or expansive style.');

    -- Q8: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of the following is NOT a characteristic of feature writing?', 'multiple_choice', 'Varied Approach', 'Individual voice from the writer', 'Very short length', 'Wide use of quotes and dialogue', 'C', 'Features are longer than news, not shorter.');

    -- Q9: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A good feature writer will develop his own ______ writing style.', 'multiple_choice', 'generic', 'borrowed', 'distinctive', 'complex', 'C', 'A good feature writer develops a distinctive style.');

    -- Q10: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'News stories are generally written with a tight ______.', 'fill_in_blank', 'deadline', 'News stories have tight deadlines.');

    -- Q11: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Features may be prepared a day or more in advance; magazine deadlines may be ______ months.', 'multiple_choice', 'one', 'two', 'three', 'six', 'C', 'Magazine deadlines can be up to three months.');

    -- Q12: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'There is no difference between the feature you will find in a newspaper and the one you will find in a magazine.', 'multiple_choice', 'True', 'False', 'Sometimes', 'Depends on the editor', 'B', 'There are differences in style, audience, and deadline.');

    -- Q13: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'A magazine comes out ______.', 'fill_in_blank', 'monthly', 'Magazines are typically published monthly.');

    -- Q14: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ have room enough to breathe.', 'multiple_choice', 'News stories', 'Features', 'Editorials', 'Advertisements', 'B', 'Features have more space and time.');

    -- Q15: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A feature can appear either in a newspaper or ______.', 'multiple_choice', 'book', 'magazine', 'journal', 'blog', 'B', 'Features can appear in both newspapers and magazines.');

    -- Q16: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ encourage good writing.', 'fill_in_blank', 'Magazines', 'Magazines encourage good writing due to longer deadlines.');

    -- Q17: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Magazine stories run longer, in general, than those in ______.', 'multiple_choice', 'books', 'newspapers', 'journals', 'blogs', 'B', 'Magazine stories are longer than newspaper stories.');

    -- Q18: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The differences between magazine writing and newspaper writing are specialization and ______.', 'multiple_choice', 'speed', 'thoroughness', 'brevity', 'humor', 'B', 'Specialization and thoroughness are key differences.');

    -- Q19: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Okoye (1998) identified ______ major kinds of feature.', 'fill_in_blank', 'six', 'Okoye identified six major kinds of feature.');

    -- Q20: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of the following is NOT one of the major kinds of feature according to Okoye (1998)?', 'multiple_choice', 'The News Feature', 'The Profile', 'The Editorial', 'The Travelogue', 'C', 'Editorial is not listed as a major feature type by Okoye.');

    -- Q21: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The qualities of a good feature writer include:', 'multiple_choice', 'A nose for news', 'Resourcefulness', 'Sound Educational and Professional background', 'All of the above', 'D', 'All are qualities of a good feature writer.');

    -- Q22: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'According to Alexander (2003:112), a ______ is news that is written again with the addition of human interest and feature touches.', 'fill_in_blank', 'news feature', 'A news feature adds human interest to straight news.');

    -- Q23: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ summarizes the big news of the week.', 'multiple_choice', 'Editorial', 'Feature', 'Advertisement', 'Cartoon', 'B', 'Features often summarize weekly news.');

    -- Q24: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'According to Okoye (2006:14), ______ and mundane things of life which make interesting reading are the subjects of good features.', 'multiple_choice', 'trivialities', 'major events', 'political issues', 'scientific discoveries', 'A', 'Trivialities and mundane things are feature subjects.');

    -- Q25: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Feature articles provide enough materials for those who read for ______.', 'fill_in_blank', 'pleasure', 'Features are often read for pleasure.');

    -- Q26: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The purpose of the news feature includes:', 'multiple_choice', 'To analyze or interpret the already reported event', 'To highlight side attractions', 'To summarize bits and pieces of news', 'All of the above', 'D', 'All are purposes of a news feature.');

    -- Q27: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ is an expanded version of news report.', 'multiple_choice', 'Editorial', 'News feature', 'Profile', 'Travelogue', 'B', 'A news feature expands on a news report.');

    -- Q28: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ is a story exposing the ills of society.', 'fill_in_blank', 'An alarmer', 'An alarmer exposes societal ills.');

    -- Q29: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Feature writing is usually written in a ______ and stylish manner than straight news.', 'multiple_choice', 'colourful', 'plain', 'technical', 'vague', 'A', 'Feature writing is more colourful and stylish.');

    -- Q30: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A good journalist must have ______.', 'multiple_choice', 'a camera', 'a nose for news', 'a degree in law', 'a loud voice', 'B', 'A nose for news is essential.');

    -- Q31: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ is the ability to recognize clues in the environment which may lead to important news.', 'fill_in_blank', 'Nose for news', 'Nose for news is the ability to spot news clues.');

    -- Q32: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A ______ feature writer consistently solves problems arising from the beat.', 'multiple_choice', 'Resourceful', 'Creative', 'Wealthy', 'Famous', 'A', 'A resourceful writer solves problems.');

    -- Q33: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'News feature do not come as easy as it sounds.', 'multiple_choice', 'True', 'False', 'Sometimes', 'Rarely', 'A', 'Writing news features is challenging.');

    -- Q34: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'A good feature writer must unavoidably love the art of ______.', 'fill_in_blank', 'Writing', 'A feature writer must love writing.');

    -- Q35: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A feature writer must enjoy the pains that go with the process of writing from planning to the ______.', 'multiple_choice', 'first draft', 'final draft', 'editing', 'publication', 'B', 'The writer must enjoy the process through the final draft.');

    -- Q36: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The news feature is news that already ______.', 'multiple_choice', 'is secret', 'existed', 'is fictional', 'is future', 'B', 'News features are based on existing news.');

    -- Q37: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The Oxford dictionary defines ______ as a description or something that gives useful information.', 'fill_in_blank', 'Profile', 'A profile provides useful information.');

    -- Q38: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Okoye (2006:20) defined ______ as a close-up on a significant personality, organization, place or thing.', 'multiple_choice', 'news feature', 'profile feature', 'travelogue', 'alarmer', 'B', 'A profile feature is a close-up on something significant.');

    -- Q39: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of the following is a type of profile feature?', 'multiple_choice', 'Profile on Personalities', 'Profile on Organizations', 'Profile on Places', 'All of the above', 'D', 'All are types of profile features.');

    -- Q40: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ simply means closeness in space and time.', 'fill_in_blank', 'Proximity', 'Proximity refers to closeness in space and time.');

    -- Q41: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Proximity is an attraction for profile feature because:', 'multiple_choice', 'it means fame', 'it means closeness in space and time', 'it means wealth', 'it means power', 'B', 'Proximity means closeness in space/time.');

    -- Q42: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ main categories of places attract the focus of feature writer when it comes to profiles on places.', 'multiple_choice', 'Two', 'Three', 'Four', 'Five', 'B', 'Three main categories: historical, contemporary, obscure.');

    -- Q43: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Historical sites and ______ are surely point of reckoning for a profile feature story.', 'fill_in_blank', 'locations', 'Historical sites and locations are key for profiles.');

    -- Q44: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'According to Okoye (2006:24), ______ exist in every city which are unknown to most people.', 'multiple_choice', 'historical places', 'obscure places', 'famous landmarks', 'shopping malls', 'B', 'Obscure places are unknown to most.');

    -- Q45: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which is a tip for writing profile features?', 'multiple_choice', 'Exaggerate facts', 'Use over-used facts', 'Select a theme', 'Repeat known facts', 'C', 'Selecting a theme is a key tip.');

    -- Q46: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Profile could be written on personalities, organization and ______.', 'fill_in_blank', 'places', 'Profiles can be about personalities, organizations, or places.');

    -- Q47: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A ______ is the account of a trip to a place of interest.', 'multiple_choice', 'profile', 'travelogue', 'news feature', 'how-to article', 'B', 'A travelogue is about a trip.');

    -- Q48: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Travelogues are filed by newsmen who visit distant places:', 'multiple_choice', 'only on holiday', 'only on official duties', 'on official duties or on holiday', 'never', 'C', 'Travelogues can be from official or holiday trips.');

    -- Q49: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'In newspapers or magazines, ______ add variety and enlighten readers about other lands.', 'fill_in_blank', 'travelogues', 'Travelogues add variety and enlighten.');

    -- Q50: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Bicycle is not a symbol of poverty in ______.', 'multiple_choice', 'Nigeria', 'China', 'USA', 'UK', 'B', 'In China, bicycles are not seen as poverty symbols.');

    -- Q51: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The mass media extend one’s world view by bringing information about distant places. ______ is one method used.', 'multiple_choice', 'Editorial', 'Travelogue', 'Advertisement', 'Cartoon', 'B', 'Travelogue is a method to extend world view.');

    -- Q52: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'A ______ is a publication issued at regular intervals, containing articles, stories, photographs, etc.', 'fill_in_blank', 'Magazine', 'A magazine is a periodic publication.');

    -- Q53: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Modern magazines fall under the broad category of ______.', 'multiple_choice', 'books', 'newspapers', 'periodicals', 'blogs', 'C', 'Magazines are periodicals.');

    -- Q54: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A convenient way of describing magazine characteristics is to compare them with ______.', 'multiple_choice', 'books', 'newspapers', 'radio', 'television', 'B', 'Magazines are often compared to newspapers.');

    -- Q55: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Magazines are half way between newspapers and ______.', 'fill_in_blank', 'books', 'Magazines are between newspapers and books.');

    -- Q56: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which is NOT a difference between magazines and newspapers?', 'multiple_choice', 'Timeliness', 'Frequency of Publication', 'Use of color', 'Length of articles', 'D', 'Length is not a primary distinguishing factor.');

    -- Q57: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'According to Okoye (2004), magazines are meant to be ______, unlike books.', 'multiple_choice', 'permanent', 'ephemeral', 'expensive', 'hardcover', 'B', 'Magazines are ephemeral; books last longer.');

    -- Q58: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'In entertainment, ______ compete favourably with other mass media.', 'fill_in_blank', 'Magazines', 'Magazines compete well in entertainment.');

    -- Q59: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In depth and scope of information, a book rates higher than a magazine.', 'multiple_choice', 'True', 'False', 'Sometimes', 'Rarely', 'A', 'Books generally have more depth than magazines.');

    -- Q60: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A magazine is a ______ publication containing contributions by various writers.', 'multiple_choice', 'daily', 'periodical', 'annual', 'weekly', 'B', 'A magazine is a periodical publication.');

    -- Q61: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'According to Okoye (2004), the ______ word magazine originally denoted a warehouse or storehouse.', 'fill_in_blank', 'English', 'The English word magazine meant warehouse.');

    -- Q62: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The first magazine in the modern sense, the Gentleman’s magazine, was founded in ______.', 'multiple_choice', '1731', '1800', '1900', '1650', 'A', 'Gentleman’s magazine was founded in 1731.');

    -- Q63: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ founded the first modern magazine.', 'multiple_choice', 'Benjamin Franklin', 'Edward Cave', 'Andrew Bradford', 'Isaiah Thomas', 'B', 'Edward Cave founded Gentleman’s magazine.');

    -- Q64: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The first two magazines in America were The American Magazine and ______.', 'fill_in_blank', 'General Magazine', 'The first two American magazines were American Magazine and General Magazine.');

    -- Q65: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ was a distinguished newspaper man and advocate of press freedom.', 'multiple_choice', 'Edward Cave', 'Benjamin Franklin', 'Andrew Bradford', 'Thomas Paine', 'B', 'Benjamin Franklin was a press freedom advocate.');

    -- Q66: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The first successful American magazine was the ______.', 'multiple_choice', 'Royal American Magazine', 'Pennsylvania Magazine', 'Gentleman’s Magazine', 'American Magazine', 'A', 'Royal American Magazine was the first successful one.');

    -- Q67: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The Pennsylvania magazine was edited by ______.', 'fill_in_blank', 'Thomas Paine', 'Thomas Paine edited the Pennsylvania magazine.');

    -- Q68: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Factors for the growth of the Magazine Industry in the US include:', 'multiple_choice', 'Democracy and Press Freedom', 'High Literacy', 'Big Business for ads', 'All of the above', 'D', 'All factors contributed to growth.');

    -- Q69: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In Nigeria, the first magazine was the Nigerian Gazette, established in ______.', 'multiple_choice', '1900', '1920', '1960', '1880', 'A', 'Nigerian Gazette was established in 1900.');

    -- Q70: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Factors for sudden growth of magazine industry in Nigeria include Increasing Literacy Level and Improved ______.', 'fill_in_blank', 'Technology', 'Improved technology aided growth.');

    -- Q71: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'According to Ohaja (2004:2), ______ can be gained through any kind of content.', 'multiple_choice', 'Entertainment', 'Education', 'Wealth', 'Fame', 'B', 'Education can come from any content.');

    -- Q72: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'According to Ohaja (2004:3), persuasion comes through commentaries, essays, opinion articles, advertisements and ______.', 'multiple_choice', 'news reports', 'utility features', 'sports reports', 'weather reports', 'B', 'Persuasion comes through utility features too.');

    -- Q73: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Magazines perform functions like providing in-depth coverage, specialized information, and serving as a medium for ______.', 'fill_in_blank', 'advertising', 'Magazines are a veritable medium for advertising.');

    -- Q74: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'There are ______ broad classifications of magazines.', 'multiple_choice', 'two', 'three', 'four', 'five', 'B', 'Three broad classifications: consumer, professional, company.');

    -- Q75: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ are magazines targeted at the general public.', 'multiple_choice', 'Consumer Magazines', 'Professional Magazines', 'Company Magazines', 'Trade Magazines', 'A', 'Consumer magazines target the general public.');

    -- Q76: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ are designed for specialized people, written in specialized language.', 'fill_in_blank', 'Professional/Trade Magazines', 'Professional/Trade magazines are specialized.');

    -- Q77: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Company magazines are also called ______ publications.', 'multiple_choice', 'in-house', 'public', 'government', 'academic', 'A', 'Company magazines are in-house publications.');

    -- Q78: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Company magazines are well planned publications not less than ______ pages.', 'multiple_choice', '10', '20', '30', '50', 'B', 'Company magazines are at least 20 pages.');

    -- Q79: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ magazines deal with different issues that cut across people.', 'fill_in_blank', 'General interest', 'General interest magazines cut across issues.');

    -- Q80: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ magazines carry news and significant issues in society.', 'multiple_choice', 'News', 'Sports', 'Fashion', 'Health', 'A', 'News magazines carry significant issues.');

    -- Q81: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ magazines are targeted at the male audience.', 'multiple_choice', 'Women’s', 'Men’s', 'Family', 'Youth', 'B', 'Men’s magazines target males.');

    -- Q82: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ magazines are specifically targeted at the female group.', 'fill_in_blank', 'Women’s', 'Women’s magazines target females.');

    -- Q83: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ magazines deal with family issues.', 'multiple_choice', 'Sports', 'Family', 'Gossip', 'Picture', 'B', 'Family magazines focus on family issues.');

    -- Q84: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ magazines carry stories and information on various sports.', 'multiple_choice', 'Sports', 'Health', 'Fashion', 'News', 'A', 'Sports magazines cover sports.');

    -- Q85: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ magazines are targeted at teenage and youth population.', 'fill_in_blank', 'Youth', 'Youth magazines target teenagers and youth.');

    -- Q86: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ magazines carry gossips about celebrities.', 'multiple_choice', 'Gossip', 'News', 'Health', 'Fashion', 'A', 'Gossip magazines focus on celebrities.');

    -- Q87: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The contents of ______ magazines are mainly pictures of events.', 'multiple_choice', 'Picture', 'News', 'Sports', 'Family', 'A', 'Picture magazines are mainly photos.');

    -- Q88: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ magazines carry information on health related matters.', 'fill_in_blank', 'Health', 'Health magazines focus on health.');

    -- Q89: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ magazines carry information on fashion and style.', 'multiple_choice', 'Fashion', 'Sports', 'News', 'Gossip', 'A', 'Fashion magazines cover fashion and style.');

    -- Q90: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The ______ of a magazine refers to its size and shape.', 'multiple_choice', 'format', 'content', 'theme', 'audience', 'A', 'Format refers to size and shape.');

    -- Q91: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'There are ______ standard magazine sizes.', 'fill_in_blank', 'Three', 'There are three standard sizes: Life, Time, Reader’s Digest.');

    -- Q92: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which is NOT a standard magazine size?', 'multiple_choice', 'Life-Size', 'Time-Size', 'Readers Digest Size', 'Portrait Size', 'D', 'Portrait is not a standard size.');

    -- Q93: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ is the straight or hard news report, a timely account of an event.', 'multiple_choice', 'Feature', 'News Stories', 'Editorial', 'Review', 'B', 'News stories are straight news reports.');

    -- Q94: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'An ______ is a step beyond straight news.', 'fill_in_blank', 'indepth report', 'An in-depth report goes beyond straight news.');

    -- Q95: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The ______ involves analyzing a particular aspect of a news situation.', 'multiple_choice', 'news analysis', 'editorial', 'feature', 'travelogue', 'A', 'News analysis breaks down a situation.');

    -- Q96: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ are step beyond straight news.', 'multiple_choice', 'Interpretative reports', 'Advertisements', 'Cartoons', 'Photographs', 'A', 'Interpretative reports go beyond straight news.');

    -- Q97: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ is primarily concerned with uncovering hidden facts behind a news event.', 'fill_in_blank', 'Investigative reporting', 'Investigative reporting uncovers hidden facts.');

    -- Q98: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Investigative reporting is also called ______.', 'multiple_choice', 'muckraking', 'fact-checking', 'editing', 'proofreading', 'A', 'Investigative reporting is also muckraking.');

    -- Q99: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The ______ is the official stand of the paper on an issue.', 'multiple_choice', 'editorial', 'feature', 'news story', 'advertisement', 'A', 'Editorial is the official stand.');

    -- Q100: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ provide information but in more detailed form than the news.', 'fill_in_blank', 'Feature', 'Features provide more detail than news.');

    -- Q101: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ are special opinion articles that appear regularly reflecting the writer’s opinion.', 'multiple_choice', 'Columns', 'Features', 'News', 'Advertisements', 'A', 'Columns reflect the writer’s opinion.');

    -- Q102: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ present opinions about books, movies, plays, etc.', 'multiple_choice', 'Reviews', 'Editorials', 'News', 'Features', 'A', 'Reviews present opinions on arts/entertainment.');

    -- Q103: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ are spaces in a magazine paid for by someone with goods or services to sell.', 'fill_in_blank', 'Advertisements', 'Advertisements are paid spaces.');

    -- Q104: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A sales message is called ______.', 'multiple_choice', 'advertisement', 'editorial', 'feature', 'review', 'A', 'An advertisement is a sales message.');

    -- Q105: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A ______ is a humorous drawing with a caption that induces laughter.', 'multiple_choice', 'cartoon', 'photograph', 'graphic', 'illustration', 'A', 'A cartoon is a humorous drawing.');

    -- Q106: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'A type of cartoon that comments on an issue or current event is called ______.', 'fill_in_blank', 'editorial cartoon', 'Editorial cartoons comment on issues.');

    -- Q107: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ refers to a story told primarily through a series of photographs with captions.', 'multiple_choice', 'Photorama', 'Travelogue', 'Profile', 'Feature', 'A', 'Photorama is a story through photos.');

    -- Q108: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Photodrama is a combination of two words: photograph and ______.', 'multiple_choice', 'panorama', 'drama', 'cinema', 'graph', 'A', 'Photodrama = photograph + panorama.');

    -- Q109: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ is an article relating opinions of the general public about a current issue.', 'fill_in_blank', 'The vox pop', 'Vox pop collects public opinions.');

    -- Q110: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The ______ poll involves a more select group of experts.', 'multiple_choice', 'vox pop', 'strip poll', 'public opinion', 'random', 'B', 'Strip poll involves experts.');

    -- Q111: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In ______, people are selected through random probability sampling.', 'multiple_choice', 'vox pop', 'strip poll', 'public opinion poll', 'interview', 'C', 'Public opinion poll uses random sampling.');

    -- Q112: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Magazines are fewer in number but of high ______ quality.', 'fill_in_blank', 'literacy', 'Magazines have high literacy quality.');

    -- Q113: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'There are ______ requirements that a magazine article should meet to be good writing.', 'multiple_choice', 'two', 'three', 'four', 'five', 'A', 'Two requirements: economy and freshness.');

    -- Q114: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The first quality of any good writing is ______.', 'multiple_choice', 'verbosity', 'economy', 'complexity', 'length', 'B', 'Economy is the first quality.');

    -- Q115: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Ebele (2003) stresses that wordiness and ______ are twin problems for writers.', 'fill_in_blank', 'verbosity', 'Verbosity is a problem alongside wordiness.');

    -- Q116: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'According to Ohaja (2004), when someone picks up a magazine, they don’t expect to be bored by ______ articles.', 'multiple_choice', 'short', 'interminable', 'funny', 'colorful', 'B', 'Readers don’t want interminable articles.');

    -- Q117: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A writer is a ______ learner.', 'multiple_choice', 'temporary', 'perpetual', 'reluctant', 'fast', 'B', 'A writer is a perpetual learner.');

    -- Q118: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'A writer must strive to improve his language to ______ effectively.', 'fill_in_blank', 'communicate', 'Writers need to communicate effectively.');

    -- Q119: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Verbosity is good writing.', 'multiple_choice', 'True', 'False', 'Sometimes', 'Depends', 'B', 'Verbosity is not good writing.');

    -- Q120: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which helps a feature writer turn out elegant articles?', 'multiple_choice', 'Freshness of Expression', 'Use of Figurative Language', 'Humour and Wit', 'All of the above', 'D', 'All contribute to elegant writing.');

    -- Q121: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The Oxford Dictionary defines ______ as very informal words not suitable for formal situations.', 'fill_in_blank', 'Slangs', 'Slangs are informal words.');

    -- Q122: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Figurative language according to Obiaku (1999) communicates by ______.', 'multiple_choice', 'analogy', 'facts', 'direct statement', 'questions', 'A', 'Figurative language uses analogy.');

    -- Q123: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ is a figure of speech comparing using “like” or “as”.', 'multiple_choice', 'Metaphor', 'Simile', 'Hyperbole', 'Personification', 'B', 'Simile uses “like” or “as”.');

    -- Q124: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '“He will come like a thief in the night” is an example of ______.', 'fill_in_blank', 'Simile', 'This is a simile using “like”.');

    -- Q125: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ is a figure of speech comparing without “like” or “as”.', 'multiple_choice', 'Simile', 'Metaphor', 'Hyperbole', 'Apostrophe', 'B', 'Metaphor compares directly.');

    -- Q126: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '“The world is a stage” is an example of ______.', 'multiple_choice', 'Simile', 'Metaphor', 'Hyperbole', 'Personification', 'B', 'This is a metaphor.');

    -- Q127: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ exaggerates an idea to stress a point.', 'fill_in_blank', 'Hyperbole', 'Hyperbole exaggerates for emphasis.');

    -- Q128: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '“Calabar is not just far away, it is next to heaven” is an example of ______.', 'multiple_choice', 'Metaphor', 'Simile', 'Hyperbole', 'Personification', 'C', 'This is hyperbole (exaggeration).');

    -- Q129: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ portrays inanimate objects as having human qualities.', 'multiple_choice', 'Personification', 'Apostrophe', 'Antonomasia', 'Metaphor', 'A', 'Personification gives human traits.');

    -- Q130: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '“I hear the trees clapping their hands” is an example of ______.', 'fill_in_blank', 'Personification', 'Trees are given human action.');

    -- Q131: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ addresses concepts or the dead as if they are human and present.', 'multiple_choice', 'Apostrophe', 'Personification', 'Metaphor', 'Simile', 'A', 'Apostrophe addresses absent/dead.');

    -- Q132: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '“Death, where is your sting?” is an example of ______.', 'multiple_choice', 'Apostrophe', 'Personification', 'Hyperbole', 'Simile', 'A', 'This addresses death directly.');

    -- Q133: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ is a form of metaphor comparing to well-known persons or events.', 'fill_in_blank', 'Antonomasia', 'Antonomasia compares to famous figures.');

    -- Q134: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '“Abacha was just another Idi-Amin” is an example of ______.', 'multiple_choice', 'Simile', 'Antonomasia', 'Hyperbole', 'Apostrophe', 'B', 'Comparing to a well-known figure.');

    -- Q135: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which is a tip for humour writing?', 'multiple_choice', 'Explain a joke', 'Import humour into a story', 'Avoid tasteless humour', 'Be someone else', 'C', 'Avoid tasteless humour.');

    -- Q136: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'According to Anene-Boyle (2002:105), the ______ is the most common mark of punctuation.', 'fill_in_blank', 'Comma', 'The comma is the most common punctuation.');

    -- Q137: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The ______ article consists of elegant prose with vivid description, conversation, etc.', 'multiple_choice', 'Fictional', 'News', 'Editorial', 'Feature', 'A', 'Fictional articles use elegant prose.');

    -- Q138: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The basic elements of fiction include:', 'multiple_choice', 'Setting', 'Plot', 'Conflict', 'All of the above', 'D', 'All are basic elements.');

    -- Q139: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The beginning of a story where characters and setting are revealed is called ______.', 'fill_in_blank', 'Introduction', 'Introduction sets up the story.');

    -- Q140: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ is where events become complicated and conflict is revealed.', 'multiple_choice', 'Introduction', 'Rising action', 'Climax', 'Denouement', 'B', 'Rising action complicates events.');

    -- Q141: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ is the highest point of interest and turning point.', 'multiple_choice', 'Climax', 'Rising action', 'Introduction', 'Denouement', 'A', 'Climax is the peak.');

    -- Q142: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ is the final outcome or untangling of events.', 'fill_in_blank', 'Denouement', 'Denouement is the resolution.');

    -- Q143: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'There is no plot without conflict.', 'multiple_choice', 'True', 'False', 'Sometimes', 'Rarely', 'A', 'Conflict is essential to plot.');

    -- Q144: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'There are ______ types of conflict.', 'multiple_choice', 'two', 'three', 'four', 'five', 'A', 'Two types: internal and external.');

    -- Q145: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'There are two types of conflict: External and ______.', 'fill_in_blank', 'Internal', 'Conflict can be external or internal.');

    -- Q146: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'There are ______ kinds of conflict.', 'multiple_choice', 'two', 'three', 'four', 'five', 'C', 'Four kinds: man vs man, circumstances, society, self.');

    -- Q147: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Man vs Himself/Herself is ______ conflict.', 'multiple_choice', 'physical', 'psychological', 'social', 'classical', 'B', 'Man vs self is psychological.');

    -- Q148: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'A character central to the story is the ______.', 'fill_in_blank', 'Protagonist', 'The protagonist is the main character.');

    -- Q149: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The opposer of the main character is the ______.', 'multiple_choice', 'protagonist', 'antagonist', 'hero', 'sidekick', 'B', 'Antagonist opposes the protagonist.');

    -- Q150: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ is when the story is told through the eyes of a child.', 'multiple_choice', 'Innocent Eye', 'First person', 'Omniscient', 'Third person', 'A', 'Innocent Eye uses a child’s perspective.');

    -- Q151: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'When the author narrates with omniscient point of view, it is referred to as ______.', 'fill_in_blank', 'Omniscient', 'Omniscient point of view sees all.');

    -- Q152: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ occurs when the story is told by the protagonist using “I”.', 'multiple_choice', 'First person', 'Third person', 'Omniscient', 'Innocent Eye', 'A', 'First person uses “I”.');

    -- Q153: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The ______ in fiction is its controlling idea or central insight.', 'multiple_choice', 'plot', 'setting', 'theme', 'conflict', 'C', 'Theme is the central insight.');

    -- Q154: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ are the glory or beauty of a magazine.', 'fill_in_blank', 'Pictures', 'Pictures enhance magazine beauty.');

    -- Q155: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'According to Osho (2007), photography means writing or drawing with ______.', 'multiple_choice', 'ink', 'light', 'paint', 'words', 'B', 'Photo means light, graph means writing.');

    -- Q156: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Photography is the process of recording events in ______ form.', 'multiple_choice', 'written', 'pictorial', 'audio', 'digital', 'B', 'Photography records events pictorially.');

    -- Q157: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Photography is an interplay of light and ______.', 'fill_in_blank', 'chemicals', 'Photography involves light and chemicals.');

    -- Q158: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'It was in the mid ______ century before the camera was perfected.', 'multiple_choice', '18th', '19th', '20th', '21st', 'B', 'Camera perfected in mid-19th century.');

    -- Q159: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Pictures can be classified into three forms: representation, form, and ______.', 'multiple_choice', 'color', 'expression', 'size', 'clarity', 'B', 'Three forms: representation, form, expression.');

    -- Q160: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'According to Esimokha (2011), ______ aid page make-up and attract readers.', 'fill_in_blank', 'photographs', 'Photographs aid page make-up.');

    -- Q161: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ are arranged pictures taken at occasions like weddings.', 'multiple_choice', 'Informal pictures', 'Formal pictures', 'Action pictures', 'Dramatic pictures', 'B', 'Formal pictures are arranged.');

    -- Q162: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ are pictures that are not arranged.', 'multiple_choice', 'Formal pictures', 'Informal pictures', 'Action pictures', 'Spontaneous pictures', 'B', 'Informal pictures are not arranged.');

    -- Q163: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ are pictures that tell stories.', 'fill_in_blank', 'Action pictures', 'Action pictures tell stories.');

    -- Q164: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ are pictures that are quarrelsome in nature.', 'multiple_choice', 'Spontaneous action pictures', 'Formal pictures', 'Dramatic pictures', 'Action pictures', 'A', 'Spontaneous action pictures are quarrelsome.');

    -- Q165: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ are pictures meant to entertain readers.', 'multiple_choice', 'Dramatic pictures', 'Formal pictures', 'Action pictures', 'Informal pictures', 'A', 'Dramatic pictures entertain.');

    -- Q166: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ is the account of an event through pictures.', 'fill_in_blank', 'Photojournalism', 'Photojournalism tells stories through pictures.');

    -- Q167: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The first step in picture editing is ______.', 'multiple_choice', 'scaling', 'cropping', 'flopping', 'bleeding', 'B', 'Cropping is the first step.');

    -- Q168: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ involves elimination of unwanted portions of a photograph.', 'multiple_choice', 'Cropping', 'Scaling', 'Flopping', 'Bleeding', 'A', 'Cropping removes unwanted parts.');

    -- Q169: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ is the process of enlarging or reducing a photograph to fit a space.', 'fill_in_blank', 'Scaling and sizing', 'Scaling and sizing adjust photo size.');

    -- Q170: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ means blowing the picture off the edge of the page.', 'multiple_choice', 'Bleeding', 'Flopping', 'Doctoring', 'Slicing', 'A', 'Bleeding runs picture off the edge.');

    -- Q171: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The changing of the direction of a picture is called ______.', 'multiple_choice', 'flopping', 'cropping', 'bleeding', 'doctoring', 'A', 'Flopping changes direction.');

    -- Q172: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ refers to making shapes like triangles or circles around a picture.', 'fill_in_blank', 'Doctoring', 'Doctoring shapes picture edges.');

    -- Q173: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Doctoring is done for occasional ______.', 'multiple_choice', 'impact', 'clarity', 'size', 'color', 'A', 'Doctoring is for impact.');

    -- Q174: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ means cutting pictures for negative effect to excite attention.', 'multiple_choice', 'Slicing', 'Cropping', 'Flopping', 'Bleeding', 'A', 'Slicing cuts for negative effect.');

    -- Q175: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ is a process of improving artwork especially photographs.', 'fill_in_blank', 'Retouching', 'Retouching improves artwork.');

    -- Q176: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ involves transferring a picture into a computerized machine.', 'multiple_choice', 'Scanning', 'Cropping', 'Flopping', 'Bleeding', 'A', 'Scanning digitizes pictures.');

    -- Q177: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Magazines depend on pictures to be beautiful.', 'multiple_choice', 'True', 'False', 'Sometimes', 'Rarely', 'A', 'Pictures are crucial for magazine beauty.');

    -- Q178: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'A ______ is a highly organized system of obtaining, storing and retrieving information.', 'fill_in_blank', 'Library', 'A library organizes information.');

    -- Q179: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A library is not just a collection of books.', 'multiple_choice', 'True', 'False', 'Sometimes', 'Depends', 'A', 'Libraries include various media.');

    -- Q180: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ keep a collection of reference materials in the reference room.', 'multiple_choice', 'Libraries', 'Schools', 'Offices', 'Bookstores', 'A', 'Libraries have reference rooms.');

    -- Q181: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ are often bulky and contain general information.', 'fill_in_blank', 'Reference work', 'Reference works are bulky and general.');

    -- Q182: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The two major general encyclopedias are Encyclopaedia Britannica and ______.', 'multiple_choice', 'Encyclopaedia Americana', 'World Book', 'Wikipedia', 'Oxford Reference', 'A', 'Britannica and Americana are major encyclopedias.');

    -- Q183: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ give the meanings of terms, words or phrases.', 'multiple_choice', 'Dictionaries', 'Encyclopedias', 'Yearbooks', 'Bibliographies', 'A', 'Dictionaries give meanings.');

    -- Q184: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ are reference works containing bibliographical information of people.', 'fill_in_blank', 'Bibliographies', 'Bibliographies list works by/about people.');

    -- Q185: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ are devoted to chief events of the preceding year.', 'multiple_choice', 'Yearbooks', 'Directories', 'Indexes', 'Abstracts', 'A', 'Yearbooks cover past year events.');

    -- Q186: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Information in yearbooks can be in the form of statistics in economics, trade and ______.', 'multiple_choice', 'population', 'weather', 'sports', 'politics', 'A', 'Yearbooks include population stats.');

    -- Q187: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Any publication issued in successive parts at regular intervals is a ______.', 'fill_in_blank', 'serial publication', 'Serials are issued periodically.');

    -- Q188: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ are useful guides to periodicals on different subjects.', 'multiple_choice', 'Indexes', 'Directories', 'Abstracts', 'Yearbooks', 'A', 'Indexes guide to periodicals.');

    -- Q189: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ give details of addresses, phone numbers, designations.', 'multiple_choice', 'Directories', 'Bibliographies', 'Yearbooks', 'Encyclopedias', 'A', 'Directories provide contact details.');

    -- Q190: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The ______ contains a summary of a published article.', 'fill_in_blank', 'Abstract', 'An abstract summarizes an article.');

    -- Q191: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The ______ enables the writer to become familiar with words.', 'multiple_choice', 'Dictionary', 'Encyclopedia', 'Thesaurus', 'Directory', 'A', 'Dictionary helps with words.');

    -- Q192: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A dictionary is intended primarily to give the ______ of words.', 'multiple_choice', 'meanings', 'spellings', 'pronunciations', 'origins', 'A', 'Dictionary gives meanings first.');

    -- Q193: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The dictionary is a final authority in matters of ______.', 'fill_in_blank', 'Spelling', 'Dictionary is authoritative for spelling.');

    -- Q194: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'According to Wikipedia (2012), the ______ is a global system of interconnected networks.', 'multiple_choice', 'Internet', 'Web', 'Library', 'Database', 'A', 'Internet is a global network system.');

    -- Q195: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ is the act of tapping human sources for information.', 'multiple_choice', 'Interviewing', 'Observing', 'Reading', 'Writing', 'A', 'Interviewing gathers info from people.');

    -- Q196: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Interviews can be conducted face-to-face, mail, and ______.', 'fill_in_blank', 'Telephone', 'Telephone is a method for interviews.');

    -- Q197: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Okoye (2006) maintains that ______ is the fastest means of obtaining information.', 'multiple_choice', 'telephone interview', 'mail interview', 'face-to-face interview', 'observation', 'A', 'Telephone interview is fastest.');

    -- Q198: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Tools of a writer include:', 'multiple_choice', 'Computer', 'Pen and notebook', 'Camera', 'All of the above', 'D', 'All are tools for a writer.');

    -- Q199: Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Okoye (2006) defines ______ as an extended news report adding flesh to straight news.', 'fill_in_blank', 'news feature', 'News feature extends straight news.');

    -- Q200: Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A book looks more serious than a magazine.', 'multiple_choice', 'True', 'False', 'Sometimes', 'Depends', 'A', 'Books generally appear more serious.');

END $$;