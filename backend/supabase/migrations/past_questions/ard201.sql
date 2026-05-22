DO $$
DECLARE 
    v_course_id UUID;
BEGIN
    SELECT id INTO v_course_id FROM courses WHERE code = 'ARD201' LIMIT 1;

    -- Q1 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Agricultural extension involves the exchange of ______ to the end users.', 'multiple_choice', 'money', 'knowledge', 'equipment', 'seeds', 'B', 'Agricultural extension involves the exchange of knowledge to the end users.');

    -- Q2 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Agricultural extension is a voluntary out-of-school educational programme for ______.', 'fill_in_blank', 'clientele', 'Agricultural extension is for clientele.');

    -- Q3 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The three key words in the definition of agricultural extension are:', 'multiple_choice', 'money, equipment, seeds', 'knowledge, education, dissemination', 'farming, planting, harvesting', 'research, technology, innovation', 'B', 'The three key words are knowledge, education, and dissemination.');

    -- Q4 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Agricultural extension has two dimensions:', 'multiple_choice', 'economic and social', 'educational and communicational', 'theoretical and practical', 'urban and rural', 'B', 'The two dimensions are educational and communicational.');

    -- Q5 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The educational dimension involves the ______ attempting to work on the clientele''s psychology using effective teaching methods.', 'fill_in_blank', 'change agent (extension worker)', 'The change agent works on clientele psychology.');

    -- Q6 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The goal of educational dimension is to improve the clientele''s ______ and develop their skills.', 'multiple_choice', 'wealth', 'knowledge', 'land ownership', 'social status', 'B', 'The goal is to improve knowledge and develop skills.');

    -- Q7 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The nature of education in agricultural extension is:', 'multiple_choice', 'theoretical and abstract', 'action-oriented, problem-oriented, and problem-centered', 'informal and unstructured', 'formal and rigid', 'B', 'It is action-oriented, problem-oriented, and problem-centered.');

    -- Q8 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The communication dimension involves dissemination of information to the clientele on ______ or innovation.', 'multiple_choice', 'traditional methods', 'new technologies', 'government policies', 'market prices', 'B', 'It involves dissemination of new technologies or innovation.');

    -- Q9 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Communication in extension also includes exchange of ideas that provide a basis for ______ or feedback.', 'fill_in_blank', 'research', 'Communication provides basis for research or feedback.');

    -- Q10 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The methods of communication in agricultural extension can be through:', 'multiple_choice', 'individual, group, or mass methods', 'only face-to-face methods', 'only electronic methods', 'only written methods', 'A', 'Methods include individual, group, or mass methods.');

    -- Q11 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Agricultural extension serves as an intermediary between ______ and the clientele.', 'multiple_choice', 'government and farmers', 'research/scientists and clientele', 'banks and farmers', 'markets and producers', 'B', 'Extension serves as intermediary between research/scientists and clientele.');

    -- Q12 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The clientele refers to the end-users of ______ that extension personnel deal with.', 'fill_in_blank', 'information', 'Clientele are end-users of information.');

    -- Q13 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In agriculture, the clientele includes:', 'multiple_choice', 'only farmers', 'farmers, community leaders, and women involved in processing', 'only large-scale farmers', 'only educated farmers', 'B', 'Clientele includes farmers, community leaders, and women involved in processing.');

    -- Q14 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Clientele in any setup could be:', 'multiple_choice', 'rich and poor', 'heterogeneous and homogeneous', 'urban and rural', 'educated and uneducated', 'B', 'Clientele can be heterogeneous or homogeneous.');

    -- Q15 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'A heterogeneous audience consists of individuals who vary in age, literacy level, and ______ status.', 'fill_in_blank', 'economic', 'Heterogeneous audience varies in economic status.');

    -- Q16 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A homogeneous audience consists of individuals with common characteristics, such as being all ______ or all literate.', 'multiple_choice', 'old', 'young', 'rich', 'male', 'B', 'Homogeneous audience has common characteristics like all young.');

    -- Q17 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The type of audience determines the extension methods and ______ to use in extension work.', 'multiple_choice', 'materials', 'budget', 'time', 'personnel', 'A', 'Audience type determines methods and materials to use.');

    -- Q18 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Many farmers in rural communities still employ ______ methods of production.', 'fill_in_blank', 'traditional', 'Many farmers use traditional methods.');

    -- Q19 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In Nigeria, there is a lag of over ______ years between the discovery of new farming practices and their adoption.', 'multiple_choice', '5', '10', '20', '30', 'C', 'There is a lag of over 20 years in Nigeria.');

    -- Q20 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Agricultural extension helps bridge the gap between scientific discoveries and ______.', 'multiple_choice', 'researchers', 'farmers', 'government', 'markets', 'B', 'Extension bridges gap between scientific discoveries and farmers.');

    -- Continuing with 180 more questions in the same pattern...

    -- Q21 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Extension services provide information on sources of ______ and credit facilities.', 'multiple_choice', 'labor', 'input', 'land', 'water', 'B', 'Extension provides information on input and credit facilities.');

    -- Q22 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Agricultural extension gives feedback to researchers to improve developed ______.', 'fill_in_blank', 'technology', 'Extension gives feedback to improve technology.');

    -- Q23 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Agricultural extension provides farmers with marketing strategies to maximize their ______.', 'multiple_choice', 'production', 'profit', 'land use', 'labor efficiency', 'B', 'Extension helps maximize profit through marketing strategies.');

    -- Q24 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Extension also introduces farmers to ______ to help them sell their products on time.', 'multiple_choice', 'new crops', 'market opportunities', 'government officials', 'bank managers', 'B', 'Extension introduces farmers to market opportunities.');

    -- Q25 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The importance of agricultural extension includes increasing farmers'' production levels, providing strategic marketing information, and offering effective feedback on ______.', 'fill_in_blank', 'innovation', 'Extension provides feedback on innovation.');

    -- Q26 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Agricultural Extension is the primary process through which farmers learn reasons why they must change their ______ and ______.', 'multiple_choice', 'attitude and practice', 'crops and livestock', 'land and equipment', 'houses and farms', 'A', 'Farmers learn to change attitude and practice.');

    -- Q27 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'It involves not only farmers in direct production but also those in ______ and ______ of agricultural products.', 'multiple_choice', 'buying and selling', 'processing and marketing', 'storing and transporting', 'planting and harvesting', 'B', 'It involves those in processing and marketing.');

    -- Q28 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Extension emphasizes working ______ people rather than ______ them.', 'fill_in_blank', 'with, for', 'Extension works with people rather than for them.');

    -- Q29 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'It helps people recognize problems and work out ______ to satisfy their desires.', 'multiple_choice', 'money', 'solutions', 'equipment', 'land', 'B', 'It helps people work out solutions.');

    -- Q30 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Extension does not only take research findings to farmers but also takes ______ to researchers.', 'multiple_choice', 'money', 'farmer problems', 'crops', 'equipment', 'B', 'Extension takes farmer problems to researchers.');

    -- Q31 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Agricultural extension involves ______ development in communities.', 'fill_in_blank', 'leadership', 'Extension involves leadership development.');

    -- Q32 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'It mobilizes members of communities to improve their ______, which affects their production systems.', 'multiple_choice', 'individual resources', 'collective resources', 'government resources', 'bank resources', 'B', 'It mobilizes to improve collective resources.');

    -- Q33 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Youth are encouraged to form ______ and ______ to exchange ideas and become useful.', 'multiple_choice', 'clubs and organizations', 'companies and businesses', 'farms and plantations', 'shops and markets', 'A', 'Youth form clubs and organizations.');

    -- Q34 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'This discourages ______ and retains labor for agricultural work.', 'fill_in_blank', 'rural-urban migration', 'Extension discourages rural-urban migration.');

    -- Q35 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Extension emphasizes character change in terms of ______.', 'multiple_choice', 'wealth', 'attitude', 'land ownership', 'crop variety', 'B', 'Extension emphasizes attitude change.');

    -- Q36 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'It is also involved in ______ (domestic science) and other aspects of rural living.', 'multiple_choice', 'engineering', 'home making', 'medicine', 'education', 'B', 'It is involved in home making.');

    -- Q37 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Agricultural extension focuses on working ______ people rather than ______ them.', 'fill_in_blank', 'with, for', 'Extension works with people rather than for them.');

    -- Q38 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Its aim is to build the ______ of the clientele to be resourceful and take initiatives.', 'multiple_choice', 'wealth', 'capacity', 'land', 'equipment', 'B', 'It aims to build capacity of clientele.');

    -- Q39 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Extension helps rural people utilize ______ or ______ in their daily activities.', 'multiple_choice', 'tradition or culture', 'science or innovations', 'money or credit', 'land or water', 'B', 'Extension helps utilize science or innovations.');

    -- Q40 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'It builds in clientele the ability to identify and ______ their problems.', 'fill_in_blank', 'prioritize', 'Extension helps prioritize problems.');

      -- Q41 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Extension also helps rural families apply science to ______, ______, and other aspects of rural living.', 'multiple_choice', 'farming, home making', 'trading, banking', 'mining, construction', 'fishing, hunting', 'A', 'Extension helps apply science to farming and home making.');

    -- Q42 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'One major limitation to agricultural extension is ______ supporting services, leading to insufficient farm inputs.', 'fill_in_blank', 'inadequate', 'Inadequate supporting services is a major limitation.');

    -- Q43 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'There is low morale among extension officers due to ______ and lack of a conducive working environment.', 'multiple_choice', 'poor pay', 'too much work', 'long holidays', 'good facilities', 'A', 'Low morale is due to poor pay and poor working environment.');

    -- Q44 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The withdrawal of ______ funding has affected the Agricultural Development Projects (ADPs) in Nigeria.', 'multiple_choice', 'government', 'World Bank', 'private sector', 'local communities', 'B', 'Withdrawal of World Bank funding affected ADPs.');

    -- Q45 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The use of inadequate ______ for staff and farmers limits agricultural extension.', 'fill_in_blank', 'training', 'Inadequate training limits extension.');

    -- Q46 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Weak linkages exist between ______ organizations, ______ institutes, universities, and stakeholders.', 'multiple_choice', 'extension, research', 'government, private', 'banking, financial', 'trading, marketing', 'A', 'Weak linkages between extension and research organizations.');

    -- Q47 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The extension farmer ratio in Nigeria is about ______, which is high.', 'multiple_choice', '1:500', '1:1000', '1:1722', '1:2000', 'C', 'Extension farmer ratio is about 1:1722 in Nigeria.');

    -- Q48 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Many farmers remain ______ and ______ of new technologies.', 'fill_in_blank', 'unreached, unaware', 'Many farmers are unreached and unaware of new technologies.');

    -- Q49 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Financial support to extension work has been ______, with inadequate budgets for equipment and materials.', 'multiple_choice', 'adequate', 'grossly inadequate', 'excessive', 'well managed', 'B', 'Financial support has been grossly inadequate.');

    -- Q50 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'There is a lack of effective ______ of agricultural extension programs, leading to repeated mistakes.', 'multiple_choice', 'funding', 'evaluation', 'planning', 'implementation', 'B', 'Lack of effective evaluation leads to repeated mistakes.');

    -- Q51 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Agricultural extension helps improve the performance of those in ______ by disseminating useful information.', 'fill_in_blank', 'primary food production', 'Extension helps those in primary food production.');

    -- Q52 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'This involves shifting from ______ methods to ______ methods.', 'multiple_choice', 'traditional resource-based, science-based', 'science-based, traditional', 'expensive, cheap', 'simple, complex', 'A', 'Shift from traditional resource-based to science-based methods.');

    -- Q53 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In educational development, extension educates farmers on maximizing ______ and available ______.', 'multiple_choice', 'profits, markets', 'resources, services', 'land, water', 'labor, equipment', 'B', 'Extension helps maximize resources and available services.');

    -- Q54 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'It develops farmers'' ______ and ______ to benefit from improved technology.', 'fill_in_blank', 'skills, attitudes', 'Extension develops skills and attitudes.');

    -- Q55 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In the vacuum filler role, many farmers are unaware of sources of ______, ______, or markets for their products.', 'multiple_choice', 'input, credit facilities', 'land, water', 'labor, equipment', 'seeds, fertilizers', 'A', 'Farmers unaware of input, credit facilities, or markets.');

    -- Q56 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Extension helps farmers access ______, ______, and markets, improving their income.', 'multiple_choice', 'information, marketing strategies', 'land, water', 'money, credit', 'tools, equipment', 'A', 'Extension helps access information, marketing strategies, and markets.');

    -- Q57 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Extension provides a linkage between ______ and ______.', 'fill_in_blank', 'farmers, researchers', 'Extension links farmers and researchers.');

    -- Q58 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Researchers develop technologies that are ______, ______, and ______.', 'multiple_choice', 'expensive, complex, difficult', 'culturally compatible, technologically acceptable, economically feasible', 'simple, cheap, easy', 'traditional, local, indigenous', 'B', 'Technologies should be culturally compatible, technologically acceptable, and economically feasible.');

    -- Q59 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Extension creates awareness about ______ and ______.', 'multiple_choice', 'profit, loss', 'sustainability, environmental management', 'government policies', 'market prices', 'B', 'Extension creates awareness about sustainability and environmental management.');

    -- Q60 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'It helps integrate sustainability into agriculture and ______.', 'fill_in_blank', 'resource management', 'Extension integrates sustainability into resource management.');

    -- Q61 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Farmers receive information on ______ and ______ to improve decision-making.', 'multiple_choice', 'marketing, investment', 'planting, harvesting', 'weeding, pruning', 'irrigation, drainage', 'A', 'Farmers receive marketing and investment information.');

    -- Q62 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'They are trained to make decisions on ______, ______, and social issues.', 'multiple_choice', 'agricultural prices, management practices', 'family matters', 'political issues', 'religious affairs', 'A', 'Trained on agricultural prices, management practices, and social issues.');

    -- Q63 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Extension activities are carried out through ______.', 'fill_in_blank', 'teamwork', 'Extension activities through teamwork.');

    -- Q64 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'An extension support team includes ______ who provides the necessary arrangement for logistics support and materials.', 'multiple_choice', 'Researchers', 'Administrators', 'Subject matter specialists', 'Extension agents', 'B', 'Administrators provide logistics support and materials.');

    -- Q65 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ who evolve solutions through their findings to farmers'' problems.', 'multiple_choice', 'Administrators', 'Researchers', 'Subject matter specialists', 'Extension agents', 'B', 'Researchers evolve solutions to farmers'' problems.');

    -- Q66 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ who help interpret research findings to extension agents and farmers.', 'fill_in_blank', 'Subject matter specialists', 'Subject matter specialists interpret research findings.');

    -- Q67 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ who communicate research findings or innovations to the end users.', 'multiple_choice', 'Administrators', 'Researchers', 'Subject matter specialists', 'Extension agents', 'D', 'Extension agents communicate findings to end users.');

    -- Q68 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ and teaching aids are used to ensure that the learners understand and accept the technology.', 'multiple_choice', 'Production of materials', 'Money', 'Land', 'Equipment', 'A', 'Production of materials and teaching aids are used.');

    -- Q69 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ and credit facilities are important for farmers to back up new technologies.', 'fill_in_blank', 'Essential inputs', 'Essential inputs and credit facilities are important.');

    -- Q70 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ and training programmes are necessary for constant training and re-training.', 'multiple_choice', 'Training facilities', 'Money', 'Land', 'Equipment', 'A', 'Training facilities and programmes are necessary.');

    -- Q71 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In advanced countries, farmers hire ______ to help plan and advise on farm organization.', 'multiple_choice', 'laborers', 'advisers', 'machines', 'animals', 'B', 'Farmers hire advisers in advanced countries.');

    -- Q72 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'In some developed countries, extension activities involve ______ supplying the bulk of agricultural inputs.', 'fill_in_blank', 'commercial firms', 'Commercial firms supply inputs in developed countries.');

    -- Q73 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In many developing countries, extension services are the exclusive responsibility of the ______.', 'multiple_choice', 'private sector', 'government', 'NGOs', 'international organizations', 'B', 'Extension is government responsibility in developing countries.');

    -- Q74 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'It is the responsibility of ______ to provide well-trained extension workers.', 'multiple_choice', 'farmers', 'government', 'private companies', 'international donors', 'B', 'Government provides well-trained extension workers.');

    -- Q75 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The number of extension personnel provided and supported would determine the ______-farmer ratio.', 'fill_in_blank', 'extension', 'Determines extension-farmer ratio.');

    -- Q76 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'To enhance adoption of new technologies, government should make adequate provision for ______ which should be affordable and accessible.', 'multiple_choice', 'farm inputs', 'luxury goods', 'entertainment', 'transportation', 'A', 'Government should provide affordable farm inputs.');

    -- Q77 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In national policy formulation, the importance of ______ should be stressed.', 'multiple_choice', 'extension', 'entertainment', 'sports', 'tourism', 'A', 'Importance of extension should be stressed in policy.');

    -- Q78 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Extension services require ______ provision to meet demands.', 'fill_in_blank', 'adequate budgetary', 'Extension requires adequate budgetary provision.');

    -- Q79 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Improving agricultural productivity in rural areas requires ______ serving agriculture.', 'multiple_choice', 'infrastructure facilities', 'shopping malls', 'hotels', 'restaurants', 'A', 'Requires infrastructure facilities serving agriculture.');

    -- Q80 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Establishment of ______ for farmers will help promote adoption of innovation.', 'multiple_choice', 'rural credit opportunities', 'urban housing', 'shopping centers', 'entertainment venues', 'A', 'Rural credit opportunities promote innovation adoption.');

    -- Q81 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'For effective extension services, there should be a ______ national policy.', 'fill_in_blank', 'wholistic', 'Need wholistic national policy for extension.');

    -- Q82 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The role of extension services would be incomplete without adequate sources of ______ for finding solutions.', 'multiple_choice', 'money', 'technical information', 'land', 'labor', 'B', 'Need technical information for finding solutions.');

    -- Q83 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'There should be ______ to provide needed personnel for extension work.', 'multiple_choice', 'trained people', 'untrained workers', 'volunteers', 'foreign experts', 'A', 'Need trained people for extension work.');

    -- Q84 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Adequate ______ such as input supply, credit, transportation, and marketing should be provided.', 'fill_in_blank', 'auxiliary services', 'Adequate auxiliary services needed.');

    -- Q85 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'An environment conducive to continued agricultural and rural development includes ______ for production and political stability.', 'multiple_choice', 'penalties', 'incentives', 'restrictions', 'taxes', 'B', 'Need incentives for production and political stability.');

    -- Q86 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Strict compliance with the ______ role of agricultural extension is essential.', 'multiple_choice', 'political', 'educational', 'religious', 'military', 'B', 'Strict compliance with educational role is essential.');

    -- Q87 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Agricultural Extension began to assume its current form with the rise of "scientific" agriculture in the ______ countries of ______ in the late nineteenth century.', 'fill_in_blank', 'industrializing, Western Europe', 'Agricultural extension began in industrializing Western Europe.');

    -- Q88 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The first national Extension services were established in ______ in 1893 and the ______ in 1914.', 'multiple_choice', 'Japan, United States', 'UK, France', 'Germany, Italy', 'China, India', 'A', 'First in Japan (1893) and United States (1914).');

    -- Q89 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The United Kingdom established its own in ______, Israel in ______, and India in ______.', 'multiple_choice', '1946, 1948, 1952', '1900, 1905, 1910', '1920, 1925, 1930', '1960, 1965, 1970', 'A', 'UK: 1946, Israel: 1948, India: 1952.');

    -- Q90 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'In most developing countries, national agricultural extension services started after the attainment of ______ from ______.', 'fill_in_blank', 'independence, colonial masters', 'Extension started after independence from colonial masters.');

    -- Continuing with questions 91-200...

    -- Q91 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'There have been patches of regional research programmes aimed towards enhancing the production of ______ for ______.', 'multiple_choice', 'food crops, local consumption', 'beneficial crops, exportation', 'medicinal plants, healthcare', 'ornamental plants, decoration', 'B', 'Research for beneficial crops for exportation.');

    -- Q92 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'These factors dictated the initial forms of ______ extension system approach.', 'multiple_choice', 'Agricultural', 'Medical', 'Educational', 'Industrial', 'A', 'Dictated agricultural extension system approach.');

    -- Q93 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The various activities of man are influenced in numerous ways by the ______.', 'fill_in_blank', 'weather', 'Human activities influenced by weather.');

    -- Q94 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The way man lives, the air he breathes, the food he eats and the water he drinks are all ______ related.', 'multiple_choice', 'weather', 'political', 'economic', 'religious', 'A', 'All are weather related.');

    -- Q95 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Weather phenomena was thought to be controlled by the _____until about 400 BC.', 'multiple_choice', 'scientists', 'gods', 'kings', 'farmers', 'B', 'Weather thought to be controlled by gods until 400 BC.');

    -- Q96 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '_____ and _____published their works; Air, Waters and Places, and Meteorological respectively.', 'fill_in_blank', 'Hippocrates and Aristotle', 'Hippocrates and Aristotle published important works.');

    -- Q97 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The works represented the _____of knowledge on weather and climate at that time.', 'multiple_choice', 'beginning', 'end', 'sum', 'rejection', 'C', 'Works represented the sum of knowledge at that time.');

    -- Q98 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Profit-Oriented Extension is based on a single commodity or small ranges of clearly defined commodities usually geared toward export markets.', 'multiple_choice', 'True', 'False', 'Partially true', 'Not mentioned', 'A', 'Profit-Oriented Extension focuses on commodities for export.');

    -- Q99 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The system operates on a _____ basis, with government backing through inputs.', 'fill_in_blank', 'commercial', 'System operates on commercial basis.');

    -- Q100 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The _____ regulate prices of products like cocoa and cotton.', 'multiple_choice', 'farmers', 'marketing boards', 'government officials', 'international markets', 'B', 'Marketing boards regulate prices.');

     -- Q101 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Extension personnel provide _____ information to improve production.', 'multiple_choice', 'financial', 'technical', 'political', 'religious', 'B', 'Extension personnel provide technical information.');

    -- Q102 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The _____ approach involves improving agricultural production and rural infrastructure.', 'fill_in_blank', 'Integrated/Multi-Sectoral Rural Development', 'Integrated approach improves both agriculture and infrastructure.');

    -- Q103 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The extension system involves introducing farmers to new crops and providing _____ like roads and electricity.', 'multiple_choice', 'infrastructure', 'money', 'seeds only', 'tools only', 'A', 'Extension provides infrastructure like roads and electricity.');

    -- Q104 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The approach is implemented in _____-funded projects aimed at alleviating poverty.', 'multiple_choice', 'locally', 'foreign', 'privately', 'community', 'B', 'Implemented in foreign-funded poverty alleviation projects.');

    -- Q105 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'At the second phase of ADPs, ______ services and road construction were provided.', 'fill_in_blank', 'technical', 'Technical services and roads provided in ADP second phase.');

    -- Q106 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Specialized Extension Services aim to provide ______ advice across the agricultural sector.', 'multiple_choice', 'occasional', 'inconsistent', 'consistent', 'basic', 'C', 'Specialized services provide consistent advice.');

    -- Q107 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'This involves developing professional extension agents who provide ______ advice.', 'multiple_choice', 'financial', 'technical', 'political', 'legal', 'B', 'Professional agents provide technical advice.');

    -- Q108 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The Ministry-Based Extension System leads to multiple agents visiting the same ______.', 'fill_in_blank', 'farm', 'Ministry system leads to multiple agents visiting same farm.');

    -- Q109 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The University-Based Extension System involves universities building ______ to disseminate research.', 'multiple_choice', 'laboratories', 'information networks', 'classrooms', 'hostels', 'B', 'Universities build information networks to disseminate research.');

    -- Q110 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In Nigeria, ______ universities have been involved in extension projects.', 'multiple_choice', 'Lagos and Abuja', 'Ibadan and Ife (now Obafemi Awolowo University)', 'Benin and Port Harcourt', 'Kano and Sokoto', 'B', 'Ibadan and Ife universities involved in extension.');

    -- Q111 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The use of voluntary collaborators called ______ is involved in initiating discussions within the community.', 'fill_in_blank', 'animateurs', 'Voluntary collaborators called animateurs initiate discussions.');

    -- Q112 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A new concept, the ______ system, is being advocated to improve poor public extension performance.', 'multiple_choice', 'Government-Based', 'Privatized Extension', 'Community-Based', 'International', 'B', 'Privatized Extension system advocated for improvement.');

    -- Q113 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In this system, ______ personnel provide farmers with necessary information to improve production.', 'multiple_choice', 'government', 'extension', 'research', 'administrative', 'B', 'Extension personnel provide necessary information.');

    -- Q114 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Agricultural extension education involves ______ participation based on the farmer''s willingness.', 'fill_in_blank', 'voluntary', 'Extension education involves voluntary participation.');

    -- Q115 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In extension education, there is no ______ as it is based on the interest of the participants.', 'multiple_choice', 'learning', 'coercion', 'discussion', 'practice', 'B', 'No coercion in extension education.');

    -- Q116 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Agricultural extension education is ______ due to the heterogeneous audience and the fact that it takes place in the clientele''s place.', 'multiple_choice', 'formal', 'informal', 'rigid', 'structured', 'B', 'Extension education is informal.');

    -- Q117 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Agricultural extension education takes place ______ using the farmers'' field as the classroom.', 'fill_in_blank', 'out of school', 'Extension education takes place out of school.');

    -- Q118 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The audience of agricultural extension is ______, involving various categories of people.', 'multiple_choice', 'homogeneous', 'heterogeneous', 'small', 'large', 'B', 'Extension audience is heterogeneous.');

    -- Q119 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Agricultural extension is ______, addressing specific problems based on the needs of the clientele.', 'multiple_choice', 'problem oriented', 'theory based', 'random', 'general', 'A', 'Extension is problem oriented.');

    -- Q120 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'In formal education, the course content or curriculum is ______ and not based on the clientele''s needs.', 'fill_in_blank', 'rigid', 'Formal education has rigid curriculum.');

    -- Q121 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'One function of extension is to prepare and stimulate farmers'' state of mind to accept new ______.', 'multiple_choice', 'equipment', 'innovations', 'policies', 'regulations', 'B', 'Extension helps farmers accept new innovations.');

    -- Q122 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Extension disseminates ______ to the farmers and takes farmers'' reaction to researchers.', 'multiple_choice', 'money', 'research result', 'equipment', 'seeds', 'B', 'Extension disseminates research results.');

    -- Q123 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Extension provides ______ to the farmer so that they can efficiently combine all factors of production.', 'fill_in_blank', 'farm management advisory services', 'Extension provides farm management advisory services.');

    -- Q124 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Extension helps farmers organize ______ such as how to obtain credit facilities and marketing strategies.', 'multiple_choice', 'support services', 'political parties', 'religious groups', 'social events', 'A', 'Extension helps organize support services.');

    -- Q125 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Extension gives advice on the wise use and conservation of ______.', 'multiple_choice', 'money', 'natural resources', 'equipment', 'time', 'B', 'Extension advises on natural resource conservation.');

    -- Q126 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Extension helps in the development of ______ through enlightenment and information given to households.', 'fill_in_blank', 'good family living', 'Extension helps develop good family living.');

    -- Q127 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Extension helps with ______ by organizing various youth programs and formation of youth clubs.', 'multiple_choice', 'youth development', 'political education', 'religious teaching', 'sports training', 'A', 'Extension helps with youth development.');

    -- Q128 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Agricultural extension functions by training the youths and adults on ______, which is essential because it involves local participation.', 'multiple_choice', 'leadership development', 'foreign languages', 'computer skills', 'driving skills', 'A', 'Extension trains on leadership development.');

    -- Q129 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The ultimate goal of the agricultural extension system is ______ and human resource development.', 'fill_in_blank', 'technology transfer', 'Ultimate goal is technology transfer and human resource development.');

    -- Q130 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The basic philosophy of agricultural extension is to help farmers ______.', 'multiple_choice', 'get rich quickly', 'help themselves', 'depend on government', 'avoid work', 'B', 'Basic philosophy is to help farmers help themselves.');

    -- Q131 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The extension personnel should be guided by this philosophy to enhance farmers'' ______ and optimum utilization of scarce resources.', 'multiple_choice', 'decision-making ability', 'physical strength', 'political power', 'religious faith', 'A', 'Enhance decision-making ability and resource utilization.');

    -- Q132 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The philosophy is based on the concept of ______ and participatory approval.', 'fill_in_blank', 'involvement', 'Philosophy based on involvement and participatory approval.');

    -- Q133 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Once the skill and ability of farmers are developed, their ______ will be built to deal with problems and seize new opportunities.', 'multiple_choice', 'wealth', 'capacity', 'land', 'equipment', 'B', 'Farmers'' capacity will be built to deal with problems.');

    -- Q134 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The ultimate goal of agricultural extension is to instill the concept of ______ in farmers.', 'multiple_choice', 'dependence', 'self-reliance', 'government support', 'foreign aid', 'B', 'Ultimate goal is to instill self-reliance.');

    -- Q135 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Farmers are encouraged to form ______ to seek linkage opportunities for technical information.', 'fill_in_blank', 'groups and societies', 'Farmers form groups and societies for technical information.');

    -- Q136 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Local leaders play a key role in the adoption of new technologies because farmers accept them when their ______ approve them.', 'multiple_choice', 'children', 'leaders', 'neighbors', 'friends', 'B', 'Farmers accept technologies when leaders approve.');

    -- Q137 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A leader is an individual whose ideas and actions influence the ______ and behaviors of others.', 'multiple_choice', 'thoughts', 'wealth', 'land', 'equipment', 'A', 'Leader influences thoughts and behaviors of others.');

    -- Q138 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Using local leaders for extension work creates a ______ effect, allowing agents to reach more farmers.', 'fill_in_blank', 'multiplier', 'Using leaders creates multiplier effect.');

    -- Q139 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The approach of ______ ensures that information is spread widely through the trained local leaders.', 'multiple_choice', '"teach one, teach all"', '"learn alone"', '"government knows best"', '"expert only"', 'A', '"Teach one, teach all" approach spreads information widely.');

    -- Q140 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A good leader should be ______ individual.', 'multiple_choice', 'self-oriented', 'group-oriented', 'money-oriented', 'power-oriented', 'B', 'Good leader should be group-oriented.');

    -- Q141 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'A person with a high sense of ______', 'fill_in_blank', 'responsibility', 'Good leader has high sense of responsibility.');

    -- Q142 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A person who is ______ and tolerant', 'multiple_choice', 'considerate', 'rude', 'arrogant', 'selfish', 'A', 'Good leader is considerate and tolerant.');

    -- Q143 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ stable', 'multiple_choice', 'Physically', 'Emotionally', 'Financially', 'Politically', 'B', 'Good leader is emotionally stable.');

    -- Q144 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Has interest in the ______ of the group', 'fill_in_blank', 'affairs', 'Leader has interest in group affairs.');

    -- Q145 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'High sense of ______', 'multiple_choice', 'compliance', 'rebellion', 'disobedience', 'ignorance', 'A', 'Good leader has high sense of compliance.');

    -- Q146 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______', 'multiple_choice', 'Empathy', 'Cruelty', 'Indifference', 'Selfishness', 'A', 'Good leader has empathy.');

    -- Q147 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______', 'fill_in_blank', 'Integrity', 'Good leader has integrity.');

    -- Q148 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______', 'multiple_choice', 'Faith', 'Doubt', 'Distrust', 'Suspicion', 'A', 'Good leader has faith.');

    -- Q149 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'To sustain the philosophy of agricultural extension, local leaders should receive adequate ______ and assistance.', 'multiple_choice', 'money', 'training', 'land', 'equipment', 'B', 'Local leaders need adequate training and assistance.');

    -- Q150 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The principle of ______ is fundamental to successful extension work, ensuring that extension personnel work at the level where farmers are.', 'fill_in_blank', 'starting where the people are', 'Principle of starting where the people are is fundamental.');

    -- Q151 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Farmers have different ______, which must be considered when introducing new technologies.', 'multiple_choice', 'economic, social, and educational levels', 'physical strength only', 'land size only', 'crop types only', 'A', 'Farmers have different economic, social, and educational levels.');

    -- Q152 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Extension work is ______, which is why various methods are used to enhance farmers'' learning ability.', 'multiple_choice', 'homogeneous', 'heterogeneous', 'simple', 'easy', 'B', 'Extension work is heterogeneous.');

    -- Q153 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'To effectively disseminate information, extension personnel must understand farmers'' ______, including their social structure, traditions, attitudes, and economic status.', 'fill_in_blank', 'conditions', 'Must understand farmers'' conditions.');

    -- Q154 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Most farmers in Nigeria are ______ with low income, which limits the technologies they can adopt.', 'multiple_choice', 'large-scale farmers', 'small-scale farmers', 'commercial farmers', 'export farmers', 'B', 'Most Nigerian farmers are small-scale with low income.');

    -- Q155 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Using ______ for discussion increases the accessibility of new technologies to farmers.', 'multiple_choice', 'foreign languages', 'local units/names', 'scientific terms', 'technical jargon', 'B', 'Using local units/names increases accessibility.');

    -- Q156 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'A thorough understanding of farmers'' conditions helps researchers develop technologies that ______.', 'fill_in_blank', 'suit the farmers'' conditions', 'Understanding helps develop suitable technologies.');

    -- Q157 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The philosophy of extension is to help farmers ______.', 'multiple_choice', 'depend on government', 'help themselves', 'avoid work', 'get loans', 'B', 'Philosophy is to help farmers help themselves.');

    -- Q158 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The concept of ______ should be taken seriously so that farmers can distinguish real problems.', 'multiple_choice', 'problem analysis', 'profit making', 'land acquisition', 'equipment purchase', 'A', 'Problem analysis helps distinguish real problems.');

    -- Q159 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Extension agents should not solve problems for farmers but rather ______.', 'fill_in_blank', 'guide them on how to solve their problems', 'Agents should guide farmers to solve their own problems.');

    -- Q160 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The principle of helping farmers determine their problems builds ______ in the clientele.', 'multiple_choice', 'dependence', 'sustainable practices', 'laziness', 'ignorance', 'B', 'Helping farmers determine problems builds sustainable practices.');

    -- Q161 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Farmers should be able to ______ why projects fail and find suitable solutions.', 'multiple_choice', 'ignore', 'diagnose', 'blame others for', 'forget', 'B', 'Farmers should diagnose why projects fail.');

    -- Q162 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Extension is ______, meaning that farmers are not forced to accept new innovations.', 'fill_in_blank', 'voluntary', 'Extension is voluntary, not forced.');

    -- Q163 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Needs are classified as ______ and unfelt needs.', 'multiple_choice', 'felt', 'financial', 'land', 'equipment', 'A', 'Needs are classified as felt and unfelt.');

    -- Q164 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A farmer facing Quela Quela bird infestation will be more interested in solutions for the birds than in ______.', 'multiple_choice', 'applying for an agricultural loan', 'buying new equipment', 'learning new techniques', 'attending meetings', 'A', 'Farmer will prioritize bird infestation over loan application.');

    -- Q165 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Understanding farmers'' interests helps extension work by saving ______ and ______.', 'fill_in_blank', 'cost, time', 'Understanding interests saves cost and time.');

    -- Q166 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The principle of ______ is critical in human relationships and extension work, ensuring respect and trust between the extension agent and farmers.', 'multiple_choice', 'Mutual Trust and Respect', 'Authority and Power', 'Fear and Intimidation', 'Ignorance and Avoidance', 'A', 'Mutual Trust and Respect is critical in extension work.');

    -- Q167 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Farmers should be respected for their ______, as they have been successfully carrying out farming activities for years.', 'multiple_choice', 'ignorance', 'knowledge and experience', 'wealth', 'land ownership', 'B', 'Farmers should be respected for their knowledge and experience.');

    -- Q168 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The extension agent should avoid viewing farmers as ______.', 'fill_in_blank', 'people without intelligence', 'Agent should not view farmers as people without intelligence.');

    -- Q169 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Although farmers may not be aware of modern farming practices, they can ______ if given the opportunity.', 'multiple_choice', 'learn and utilize new practices', 'never learn', 'only follow traditions', 'reject all changes', 'A', 'Farmers can learn and utilize new practices if given opportunity.');

    -- Q170 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The extension agent should maintain credibility by keeping ______ and avoiding activities outside his main functions.', 'multiple_choice', 'his promises', 'secrets', 'money', 'equipment', 'A', 'Agent should maintain credibility by keeping promises.');

    -- Q171 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'An extension agent should not engage in selling inputs such as ______ to farmers.', 'fill_in_blank', 'fertilizers, agrochemicals', 'Agent should not sell inputs like fertilizers, agrochemicals.');

    -- Q172 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'When the extension agent cannot handle an issue, he should consult a ______.', 'multiple_choice', 'politician', 'subject matter specialist', 'businessman', 'religious leader', 'B', 'Agent should consult subject matter specialist when needed.');

    -- Q173 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The principle of ______ emphasizes that behavioral change can only occur when farmers are willing to accept new ideas.', 'multiple_choice', 'Voluntary Involvement', 'Forced Compliance', 'Government Order', 'External Pressure', 'A', 'Voluntary Involvement emphasizes willingness to accept new ideas.');

    -- Q174 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Coercion does not help in project ______ and ______.', 'fill_in_blank', 'implementation, sustainability', 'Coercion doesn''t help implementation and sustainability.');

    -- Q175 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A participatory approach ensures that both the clientele and the extension agent work towards ______.', 'multiple_choice', 'different goals', 'a common goal', 'personal interests', 'financial gain', 'B', 'Participatory approach ensures working towards common goal.');

    -- Q176 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'If farmers are not involved in ______ or ______, they may not be interested in extension programs.', 'multiple_choice', 'planning, need identification', 'paying, working', 'singing, dancing', 'eating, sleeping', 'A', 'Farmers need involvement in planning and need identification.');

    -- Q177 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'In African communities, agricultural production involves ______.', 'fill_in_blank', 'the whole family', 'In Africa, agriculture involves the whole family.');

    -- Q178 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Apart from cultivation, family members contribute to ______, ______, and ______.', 'multiple_choice', 'processing, transportation, marketing', 'studying, teaching, learning', 'cooking, cleaning, washing', 'singing, dancing, playing', 'A', 'Family contributes to processing, transportation, and marketing.');

    -- Q179 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The family should be regarded as a ______ in both domestic and farming activities.', 'multiple_choice', 'working unit', 'social club', 'political party', 'religious group', 'A', 'Family should be regarded as a working unit.');

    -- Q180 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Extension work should be carried out without regard to ______, ______, or ______ beliefs.', 'fill_in_blank', 'religious, racial, political', 'Extension should disregard religious, racial, or political beliefs.');

    -- Q181 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Involving the whole family in extension work increases ______ and helps in the acceptance of new ideas.', 'multiple_choice', 'confusion', 'awareness', 'conflict', 'resistance', 'B', 'Involving family increases awareness and acceptance.');

    -- Q182 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Different family members are exposed to various ______, increasing their level of knowledge.', 'multiple_choice', 'information sources', 'dangers', 'conflicts', 'problems', 'A', 'Family members exposed to various information sources.');

    -- Q183 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The principle of ______ ensures that extension work is based on verified facts and knowledge rather than assumptions.', 'fill_in_blank', 'Extension based on facts and knowledge', 'Extension should be based on verified facts and knowledge.');

    -- Q184 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Extension involves disseminating information that is based on ______ to help farmers improve their productivity.', 'multiple_choice', 'rumors', 'experimentation and adaptation of findings', 'guesses', 'traditional beliefs only', 'B', 'Information based on experimentation and adaptation of findings.');

    -- Q185 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'New technologies introduced to farmers should be based on absolute ______ to minimize risk.', 'multiple_choice', 'facts', 'guesses', 'rumors', 'opinions', 'A', 'Technologies should be based on absolute facts to minimize risk.');

    -- Q186 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Farmers may lose ______ in extension personnel if the disseminated information does not improve their output.', 'fill_in_blank', 'trust and respect', 'Farmers may lose trust and respect if information doesn''t help.');

    -- Q187 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The principle of ______ emphasizes the need for extension personnel to collaborate with experts in their field.', 'multiple_choice', 'Working alone', 'Working with trained specialists', 'Avoiding experts', 'Ignoring research', 'B', 'Extension should collaborate with trained specialists.');

    -- Q188 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Extension agents should work with ______ to solve farmers'' problems and link with research institutes.', 'multiple_choice', 'specialists and experts', 'politicians only', 'businessmen only', 'religious leaders only', 'A', 'Agents should work with specialists and experts.');

    -- Q189 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The ______ system allows extension agents and specialists to meet monthly for technical review meetings.', 'fill_in_blank', 'Training and Visit (T&V)', 'T&V system allows monthly technical review meetings.');

    -- Q190 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The ______ program focuses on training women in nutrition and food processing.', 'multiple_choice', 'Men-in-Agriculture', 'Women-in-Agriculture (WIA)', 'Youth-in-Agriculture', 'Children-in-Agriculture', 'B', 'WIA program focuses on training women in nutrition and food processing.');

    -- Q191 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The principle of ______ ensures that extension programs are regularly assessed for effectiveness.', 'multiple_choice', 'Periodic Evaluation', 'Continuous Spending', 'Random Implementation', 'Occasional Visits', 'A', 'Periodic Evaluation ensures regular assessment of programs.');

    -- Q192 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Monitoring is an ongoing exercise, while ______ helps determine the success and direction of extension programs.', 'fill_in_blank', 'evaluation', 'Evaluation determines success and direction of programs.');

    -- Q193 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Periodic evaluation helps determine if extension programs align with the ______ of the community.', 'multiple_choice', 'existing changes and conditions', 'personal interests', 'political agenda', 'religious beliefs', 'A', 'Evaluation checks alignment with community changes and conditions.');

    -- Q194 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The principle of ______ emphasizes that extension should focus on education rather than other civic responsibilities.', 'multiple_choice', 'Educational Responsibility', 'Political Involvement', 'Religious Teaching', 'Business Management', 'A', 'Extension should focus on educational responsibility.');

    -- Q195 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Extension should not be involved in the distribution of ______, ______, or ______ as it may lead to mistrust.', 'fill_in_blank', 'seeds, fertilizers, fungicides', 'Extension should not distribute seeds, fertilizers, or fungicides.');

    -- Q196 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Failure to successfully deliver materials could lead to ______ among farmers.', 'multiple_choice', 'trust', 'mistrust', 'cooperation', 'understanding', 'B', 'Failure to deliver materials leads to mistrust.');

    -- Q197 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The diversion of extension agents to non-educational responsibilities affects their ability to ______.', 'multiple_choice', 'focus on their primary duties', 'earn more money', 'gain political power', 'make friends', 'A', 'Diversion affects focus on primary duties.');

    -- Q198 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The concept of ______ refers to the application of knowledge for practical purposes.', 'fill_in_blank', 'Agricultural Technology', 'Agricultural Technology is application of knowledge for practical purposes.');

    -- Q199 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Technology helps improve human conditions, the ______, or carry out socio-economic activities.', 'multiple_choice', 'natural environment', 'political system', 'religious beliefs', 'cultural traditions', 'A', 'Technology improves human conditions and natural environment.');

    -- Q200 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Material technology includes tools, agrochemicals, improved plant varieties, and improved breeds of ______.', 'multiple_choice', 'humans', 'animals', 'insects', 'microbes', 'B', 'Material technology includes improved breeds of animals.');

END $$;