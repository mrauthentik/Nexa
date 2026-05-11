DO $$
DECLARE
    v_course_id UUID;
BEGIN
    SELECT id INTO v_course_id FROM courses WHERE code = 'ESM221' LIMIT 1;

    -- Q1 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ is a mode of eco-development which represents a practical and effective means of attaining social and economic improvement for all countries.', 'fill_in_blank', 'Ecotourism', 'Ecotourism promotes social and economic improvement.');

    -- Q2 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The Ecotourism Society defines ______ as purposeful travel to natural areas to understand the cultural and natural history of the environment.', 'multiple_choice', 'Adventure tourism', 'Ecotourism', 'Cultural tourism', 'Sustainable tourism', 'B', 'Ecotourism involves understanding natural and cultural history.');

    -- Q3 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of these is NOT commonly given the ecotourism label?', 'multiple_choice', 'Nature-based tourism', 'Conservation-supporting tourism', 'Luxury tourism', 'Environmentally aware tourism', 'C', 'Luxury tourism is not typically considered ecotourism.');

    -- Q4 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Claims for ecotourism''s potential are generally based on ______ key assumptions.', 'fill_in_blank', 'Three', 'Ecotourism potential is based on three key assumptions.');

    -- Q5 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ and tourism is the world''s largest industry.', 'multiple_choice', 'Transport', 'Travel', 'Accommodation', 'Food', 'B', 'Travel and tourism combined form the world''s largest industry.');

    -- Q6 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The world tourism grew by ______ between 1970 and 1990.', 'multiple_choice', '160%', '260%', '360%', '460%', 'B', 'Tourism grew by 260% between 1970 and 1990.');

    -- Q7 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The optimistic projections forecast annual global nature-oriented travel at $260 billion by ______.', 'multiple_choice', '1990', '1996', '2000', '2005', 'B', 'Projected to reach $260 billion by 1996.');

    -- Q8 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The phenomenon where people show up at destinations needing services leading to provision is called ______.', 'fill_in_blank', 'Spearheading', 'Spearheading describes demand-driven development.');

    -- Q9 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Tourism to the ______ increased by nearly 300% between 1988 and 1989.', 'multiple_choice', 'Amazon', 'Alps', 'Sahara', 'Himalayas', 'A', 'Amazon tourism grew by 300% in one year.');

    -- Q10 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'There are ______ types of ecotourists.', 'multiple_choice', 'Two', 'Three', 'Four', 'Five', 'C', 'Four types of ecotourists are identified.');

    -- Q11 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which group is made up of members of tours designed specifically for education and environmental projects?', 'multiple_choice', 'Mainstream ecotourists', 'Dedicated ecotourists', 'Hard core ecotourists', 'Casual ecotourists', 'C', 'Hard core ecotourists participate in educational projects.');

    -- Q12 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ are travelers who undertake tours to see protected areas and understand local natural and cultural history.', 'fill_in_blank', 'Dedicated', 'Dedicated ecotourists focus on protected areas.');

    -- Q13 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ tourists are primarily interested in going on unusual trips.', 'multiple_choice', 'Hard core', 'Dedicated', 'Mainstream', 'Casual', 'C', 'Mainstream tourists seek unusual trips.');

    -- Q14 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ ecotourism includes natural and cultural travel as an incidental component of a broader trip.', 'multiple_choice', 'Hard core', 'Dedicated', 'Mainstream', 'Casual', 'D', 'Casual ecotourism is incidental to broader trips.');

    -- Q15 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A ______ ecotourism trip may require walking miles into undeveloped backlands and primitive conditions.', 'multiple_choice', 'soft', 'hard', 'dedicated', 'casual', 'B', 'Hard ecotourism involves challenging conditions.');

    -- Q16 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Distribution channels typically involve up to ______ parties.', 'fill_in_blank', 'Four', 'Distribution channels involve four parties.');

    -- Q17 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Distribution channels typically involve all these parties EXCEPT:', 'multiple_choice', 'Suppliers', 'Wholesalers', 'Retailers', 'Investors', 'D', 'Investors are not part of distribution channels.');

    -- Q18 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In tourism industry, large geographic distance normally prevents suppliers from selling directly to:', 'multiple_choice', 'Wholesalers', 'Retailers', 'Consumers', 'Agents', 'C', 'Distance prevents direct sales to consumers.');

    -- Q19 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of these is NOT a factor affecting ecotourism?', 'multiple_choice', 'Political factors', 'Environmental factors', 'Astrological factors', 'Social factors', 'C', 'Astrological factors do not affect ecotourism.');

    -- Q20 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The key factors that limit ecotourism potential include all EXCEPT:', 'multiple_choice', 'Political', 'Social', 'Environmental', 'Astronomical', 'D', 'Astronomical factors do not limit ecotourism.');

    -- Q21 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'There are ______ types of ecotourism.', 'fill_in_blank', 'Four', 'Four types of ecotourism are identified.');

    -- Q22 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The Oxford Advanced Learners Dictionary defines ______ as the protection of the natural environment.', 'multiple_choice', 'Preservation', 'Conservation', 'Protection', 'Sustainability', 'B', 'Conservation means protecting natural environment.');

    -- Q23 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of these is NOT a key benefit for conservation from nature-oriented tourism?', 'multiple_choice', 'Providing financing for parks', 'Justification for park protection', 'Economic alternatives for local people', 'Increasing urban development', 'D', 'Urban development is not a conservation benefit.');

    -- Q24 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ are fees charged to people who use an area or facility.', 'multiple_choice', 'Concession fees', 'User fees', 'Royalties', 'Taxes', 'B', 'User fees are charged for area/facility use.');

    -- Q25 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ fees are charged to individuals or groups licensed to provide services to visitors.', 'multiple_choice', 'User', 'Concession', 'Royalty', 'Tax', 'B', 'Concession fees for licensed service providers.');

    -- Q26 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ are a percentage of earnings from activities or products of a site tourists visit.', 'fill_in_blank', 'Sales and royalties', 'Sales and royalties are percentage earnings.');

    -- Q27 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ of goods and services used by ecotourists is a common way to generate revenue.', 'multiple_choice', 'Taxation', 'Donation', 'Subscription', 'Licensing', 'A', 'Taxation generates revenue from tourist spending.');

    -- Q28 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ can be solicited from tourists for special projects or routine maintenance.', 'multiple_choice', 'Taxes', 'Fees', 'Donations', 'Royalties', 'C', 'Donations can be solicited for specific needs.');

    -- Q29 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ have the potential to provide significant amounts of money at famous or highly visited sites.', 'multiple_choice', 'User fees', 'Concession fees and royalties', 'Donations', 'Taxes', 'B', 'Concession fees and royalties at popular sites.');

    -- Q30 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ can provide a strong economic rationale to preserve areas rather than converting them to alternative uses.', 'multiple_choice', 'Agriculture', 'Tourism', 'Mining', 'Logging', 'B', 'Tourism provides economic rationale for preservation.');

    -- Q31 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'ICDP means ______.', 'fill_in_blank', 'Integrated Conservation and Development Project', 'ICDP integrates conservation and development.');

    -- Q32 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of these is NOT a threat to attainable ecotourism products?', 'multiple_choice', 'Lack of understanding and awareness', 'Lack of ecotourism development policies', 'Lack of incentive and support', 'Excessive government funding', 'D', 'Excessive funding is not typically a threat.');

    -- Q33 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Sites with greatest potential for ecotourism have all EXCEPT:', 'multiple_choice', 'Interesting wildlife easily viewed', 'Difficult access and poor communication', 'Interesting cultural attractions', 'Economic competitiveness', 'B', 'Difficult access reduces ecotourism potential.');

    -- Q34 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'IMF means ______.', 'multiple_choice', 'International Monetary Fund', 'International Marketing Federation', 'International Management Forum', 'International Monetary Foundation', 'A', 'IMF is International Monetary Fund.');

    -- Q35 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'WTO means ______.', 'multiple_choice', 'World Trade Organization', 'World Tourism Organization', 'World Travel Organization', 'World Transport Organization', 'B', 'WTO means World Tourism Organization.');

    -- Q36 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Tourism-related employment is grouped into ______ categories.', 'fill_in_blank', 'Three', 'Tourism employment has three categories.');

    -- Q37 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'US Agency International Development (USAID) is promoting a tourism strategy called ______.', 'multiple_choice', 'Eco-Tourism', 'Low Impact Tourism', 'Sustainable Tourism', 'Green Tourism', 'B', 'USAID promotes Low Impact Tourism (LIT).');

    -- Q38 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'LIT means ______.', 'multiple_choice', 'Low Income Tourism', 'Low Impact Tourism', 'Local Indigenous Tourism', 'Limited International Tourism', 'B', 'LIT means Low Impact Tourism.');

    -- Q39 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ focuses on establishing ingenious natural resources management through private sector initiatives.', 'multiple_choice', 'Mass Tourism', 'Low Impact Tourism', 'Cultural Tourism', 'Adventure Tourism', 'B', 'Low Impact Tourism focuses on resource management.');

    -- Q40 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The parks and game reserves serve ______ purposes.', 'multiple_choice', 'Two', 'Three', 'Four', 'Five', 'A', 'Parks and reserves serve two purposes.');

    -- Continue with remaining 160 questions...

    -- Q41 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Advanced countries are famous for the ______ of their natural and archaeological heritage.', 'multiple_choice', 'Exploitation', 'Conservation', 'Destruction', 'Commercialization', 'B', 'Advanced countries conserve natural heritage.');

    -- Q42 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'NCF means ______.', 'multiple_choice', 'National Conservation Foundation', 'Nigeria Conservation Foundation', 'Natural Conservation Fund', 'National Cultural Foundation', 'B', 'NCF is Nigeria Conservation Foundation.');

    -- Q43 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'NARESCON means ______.', 'multiple_choice', 'National Resources Conservation', 'Natural Resources Conservation Council of Nigeria', 'National Reserve Conservation', 'Natural Reserve Council', 'B', 'NARESCON is Natural Resources Conservation Council.');

    -- Q44 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'WWF means ______.', 'multiple_choice', 'World Wildlife Federation', 'World Wildlife Fund for Nature', 'World Wide Fund', 'World Wildlife Foundation', 'B', 'WWF is World Wildlife Fund for Nature.');

    -- Q45 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The most important and threatened life-support systems in Nigeria are the ______ areas.', 'fill_in_blank', 'Semi-arid', 'Semi-arid areas are threatened in Nigeria.');

    -- Q46 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ asserted that conservation is for people, but that can only apply if there is awareness of benefits.', 'multiple_choice', 'Gibbon (1990)', 'William (1990)', 'Christaller (1963)', 'Ciriacy-Wantrup', 'A', 'Gibbon (1990) made this assertion.');

    -- Q47 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ asserted that large reserves reduce extinction risk because they contain sizeable populations.', 'multiple_choice', 'Gibbon (1990)', 'William (1990)', 'Christaller (1963)', 'Ciriacy-Wantrup', 'B', 'William (1990) made this assertion.');

    -- Q48 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'CRNP means ______.', 'multiple_choice', 'Cross River National Park', 'Conservation Resources National Park', 'Cultural Resources National Park', 'Cross Regional National Park', 'A', 'CRNP is Cross River National Park.');

    -- Q49 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The ______ reported that modern tourism is subject to sharp seasonal variations.', 'multiple_choice', 'IMF', 'WTO', 'WWF', 'USAID', 'B', 'WTO reported seasonal variations in tourism.');

    -- Q50 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which is NOT a useful tool in visitor management?', 'multiple_choice', 'Agreements with tour operators', 'Codes of conduct for visitors', 'Environmental impact assessment', 'Unlimited visitor access', 'D', 'Unlimited access is not a management tool.');

    -- Q51 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ sites are irreplaceable resources.', 'fill_in_blank', 'Cultural', 'Cultural sites are irreplaceable.');

    -- Q52 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Cultural sites are irreplaceable resources:', 'multiple_choice', 'True', 'False', 'Sometimes', 'Rarely', 'A', 'True - cultural sites cannot be replaced.');

    -- Q53 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which factor does NOT influence tourism impact on culture?', 'multiple_choice', 'Community cohesion and structure', 'Ability to separate sacred from profane', 'Rapidity of tourism development', 'Astronomical conditions', 'D', 'Astronomical conditions do not affect cultural impact.');

    -- Q54 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ have been involved in tourism and wage labour for over 40 years.', 'multiple_choice', 'Maasai warriors', 'Nepalese Sherpas', 'Inuit guides', 'Aboriginal elders', 'B', 'Nepalese Sherpas have long tourism history.');

    -- Q55 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Nepalese Sherpas have been involved in tourism for over ______ years.', 'multiple_choice', '30', '40', '50', '60', 'B', 'Sherpas involved for over 40 years.');

    -- Q56 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ are primary objectives in national parks.', 'multiple_choice', 'Mining and logging', 'Recreation and tourism', 'Agriculture and farming', 'Hunting and fishing', 'B', 'Recreation and tourism are primary objectives.');

    -- Q57 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ include the value people derive from protected areas not related to direct use.', 'fill_in_blank', 'Non-consumptive benefits', 'Non-consumptive benefits are indirect values.');

    -- Q58 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ main types of cost are associated with establishing and maintaining protected areas.', 'multiple_choice', 'Two', 'Three', 'Four', 'Five', 'B', 'Three main types of costs.');

    -- Q59 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ are costs directly related to establishment and management of protected areas.', 'multiple_choice', 'Indirect costs', 'Direct costs', 'Opportunity costs', 'Hidden costs', 'B', 'Direct costs relate to establishment/management.');

    -- Q60 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ refer to adverse impacts caused by establishing protected areas.', 'multiple_choice', 'Direct costs', 'Indirect costs', 'Opportunity costs', 'Management costs', 'B', 'Indirect costs are adverse impacts.');

    -- Q61 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ represent the loss of potential benefits from protecting rather than harvesting resources.', 'multiple_choice', 'Direct costs', 'Indirect costs', 'Opportunity costs', 'Fixed costs', 'C', 'Opportunity costs represent lost potential benefits.');

    -- Q62 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ represent direct budget outlays usually paid by governments.', 'multiple_choice', 'Indirect costs', 'Direct costs', 'Opportunity costs', 'Variable costs', 'B', 'Direct costs are government budget outlays.');

    -- Q63 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The ______ of a protected area are benefits society loses when area is protected.', 'multiple_choice', 'direct costs', 'indirect costs', 'opportunity costs', 'sunk costs', 'C', 'Opportunity costs are lost benefits.');

    -- Q64 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'NPV means ______.', 'fill_in_blank', 'Net Present Value', 'NPV is Net Present Value.');

    -- Q65 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'IRR means ______.', 'multiple_choice', 'Internal Rate of Return', 'International Rate of Return', 'Internal Revenue Rate', 'International Revenue Ratio', 'A', 'IRR is Internal Rate of Return.');

    -- Q66 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Safe minimum standard (SMS) approach originally developed by ______.', 'multiple_choice', 'Gibbon', 'William', 'Christaller', 'Ciriacy-Wantrup', 'D', 'Ciriacy-Wantrup developed SMS approach.');

    -- Q67 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A ______ guides and controls management of protected area resources.', 'multiple_choice', 'Business plan', 'Management plan', 'Development plan', 'Conservation plan', 'B', 'Management plan guides protected area management.');

    -- Q68 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The management plan usually covers a period of typically ______ years.', 'multiple_choice', 'Three', 'Five', 'Seven', 'Ten', 'B', 'Typically covers five years.');

    -- Q69 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which is NOT a reasonable condition for undertaking tourism business?', 'multiple_choice', 'Economic and political framework', 'National legislation obstructing tourism income', 'Sufficient level of ownership rights', 'High levels of safety and security', 'B', 'Obstructive legislation is not reasonable.');

    -- Q70 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which is NOT a basic precondition for community-based ecotourism?', 'multiple_choice', 'Landscape with inherited attractiveness', 'Ecosystems able to absorb visitation', 'Local community awareness', 'Presence of luxury hotels', 'D', 'Luxury hotels not required for community ecotourism.');

    -- Q71 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Tourist resources have ______ main characteristics.', 'fill_in_blank', 'Three', 'Tourist resources have three characteristics.');

    -- Q72 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ is attracted to unique and fragile resources around the world.', 'multiple_choice', 'Agriculture', 'Tourism', 'Mining', 'Industry', 'B', 'Tourism attracted to unique/fragile resources.');

    -- Q73 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which is NOT one of the four main landform types?', 'multiple_choice', 'Mountains', 'Plateaux', 'Hill lands', 'Oceans', 'D', 'Oceans are not landforms.');

    -- Q74 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ are ideal for resort development with access to beach and sea.', 'multiple_choice', 'Mountain peaks', 'Coastal plains', 'Hill lands', 'Plateaux', 'B', 'Coastal plains ideal for resort development.');

    -- Q75 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ are more commonly distributed in higher latitudes and glaciated areas.', 'multiple_choice', 'Deserts', 'Lakes', 'Mountains', 'Forests', 'B', 'Lakes common in higher latitudes.');

    -- Q76 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ are the raison d''être for tourism.', 'multiple_choice', 'Hotels', 'Attractions', 'Transportation', 'Restaurants', 'B', 'Attractions are the reason for tourism.');

    -- Q77 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'RED means ______.', 'multiple_choice', 'Recreational Entertainment District', 'Recreational Business District', 'Regional Economic District', 'Rural Ecotourism District', 'B', 'RED is Recreational Business District.');

    -- Q78 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ stated that tourism avoids central places and is drawn to coastal or mountain peripheries.', 'fill_in_blank', 'Christaller (1963)', 'Christaller described tourism distribution patterns.');

    -- Q79 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Yankari Game Reserve is blessed with ______ springs.', 'multiple_choice', 'Three', 'Four', 'Five', 'Six', 'B', 'Yankari has four springs.');

    -- Q80 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Yankari Game Reserve was legally constituted in ______.', 'multiple_choice', '1956', '1962', '1970', '1980', 'A', 'Legally constituted in 1956.');

    -- Continue with next 120 questions...

    -- Q81 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In ______, Calabar had only two flights weekly.', 'multiple_choice', '1990', '1995', '1999', '2005', 'C', 'Calabar had two weekly flights in 1999.');

    -- Q82 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'La Campagne Tropicana Beach resort is located in ______.', 'multiple_choice', 'Ikegun village', 'Calabar', 'Bauchi', 'Obudu', 'A', 'Located in Ikegun village, Lagos.');

    -- Q83 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The Argungu fishing competition started in the ______.', 'multiple_choice', '1920s', '1930s', '1940s', '1950s', 'B', 'Started in 1930s.');

    -- Q84 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The winning perch weighed ______ pounds.', 'multiple_choice', '150', '165', '175', '185', 'B', 'Winning perch weighed 165 pounds.');

    -- Q85 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ areas and theme parks constitute dominant land use in tourism.', 'multiple_choice', 'Resort', 'Agricultural', 'Industrial', 'Residential', 'A', 'Resort areas dominant in tourism land use.');

    -- Q86 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ resources are vulnerable to alteration and destruction by tourist pressure.', 'fill_in_blank', 'Tourist', 'Tourist resources are vulnerable to pressure.');

    -- Q87 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In early ______ of post-war period, tourism was actively encouraged.', 'multiple_choice', 'years', 'decades', 'months', 'centuries', 'B', 'Early decades of post-war period.');

    -- Q88 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Tourism brings economic benefits such as employment, income and ______.', 'multiple_choice', 'development', 'pollution', 'congestion', 'inflation', 'A', 'Tourism brings development benefits.');

    -- Q89 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which Local Government plays host to Yankari National Park?', 'multiple_choice', 'Alkaleri', 'Bauchi', 'Maiduguri', 'Kano', 'A', 'Alkaleri Local Government hosts Yankari.');

    -- Q90 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Yankari National Park opened to public on 1st December ______.', 'multiple_choice', '1956', '1962', '1970', '1980', 'B', 'Opened to public in 1962.');

    -- Q91 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The concept of tourist resources refers to ______ objects of economic value.', 'multiple_choice', 'intangible', 'tangible', 'virtual', 'hypothetical', 'B', 'Refers to tangible objects of value.');

    -- Q92 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Tourism shares use with agriculture, forestry, water management with residents using ______ services.', 'multiple_choice', 'management', 'transport', 'communication', 'financial', 'A', 'Share management services.');

    -- Q93 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Some services such as ______ are impossible to stock and must be consumed where they exist.', 'multiple_choice', 'accommodation', 'souvenirs', 'food', 'transport', 'A', 'Accommodation cannot be stocked.');

    -- Q94 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The demand-driven anecdotal evidence in developing countries is known as ______.', 'multiple_choice', 'pioneering', 'spearheading', 'leading', 'guiding', 'B', 'Known as spearheading.');

    -- Q95 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The 1990s saw ______ considerations complementing economic needs.', 'fill_in_blank', 'Environmental', 'Environmental considerations grew in 1990s.');

    -- Q96 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which farm is regarded as leading tourist destination in Nigeria?', 'multiple_choice', 'Obudu cattle', 'La Campagne', 'Yankari', 'Argungu', 'A', 'Obudu cattle farm is leading destination.');

    -- Q97 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The 1992 international conference in Brazil focused on:', 'multiple_choice', 'tourism development', 'climate change', 'wildlife conservation', 'cultural heritage', 'B', '1992 Brazil conference on climate change.');

    -- Q98 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ acts as natural filter to reduce air and water pollution.', 'multiple_choice', 'Vegetative cover', 'Buildings', 'Roads', 'Concrete', 'A', 'Vegetative cover acts as natural filter.');

    -- Q99 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Tourism has been used to spur ______ economic growth.', 'multiple_choice', 'national', 'regional', 'global', 'urban', 'B', 'Tourism spurs regional economic growth.');

    -- Q100 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Demand for ecotourism depends on price, supply and ______ of people.', 'multiple_choice', 'class', 'age', 'gender', 'education', 'A', 'Depends on class of people.');

    -- Continue with remaining 100 questions...

    -- Q101 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ results from continued need for imported skills and technologies.', 'multiple_choice', 'Economic growth', 'Economic leakages', 'Economic development', 'Economic stability', 'B', 'Economic leakages from imports.');

    -- Q102 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Yankari Game Reserve first legally constituted in:', 'multiple_choice', '1956', '1962', '1970', '1985', 'A', 'First constituted in 1956.');

    -- Q103 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ is common way to generate revenue for tourism facilities.', 'multiple_choice', 'Donation', 'Taxation', 'Subscription', 'Volunteering', 'B', 'Taxation generates revenue.');

    -- Q104 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The 1992 Brazil conference theme was called:', 'multiple_choice', 'Earth Summit', 'Climate Conference', 'Tourism Forum', 'Conservation Meeting', 'A', 'Called Earth Summit.');

    -- Q105 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In tourism, ______ pressure shuns environmentally unsound destinations.', 'multiple_choice', 'government', 'consumer', 'industry', 'international', 'B', 'Consumer pressure influences destinations.');

    -- Q106 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Sustainable tourism does not compromise ability of ______ generations to enjoy resources.', 'fill_in_blank', 'future', 'Sustainable tourism considers future generations.');

    -- Q107 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Ideally tourism planning is based on sound:', 'multiple_choice', 'research', 'intuition', 'politics', 'speculation', 'A', 'Based on sound research.');

    -- Q108 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Despite emergence of tourism ______ as profession, plans often fail.', 'multiple_choice', 'management', 'planning', 'marketing', 'development', 'B', 'Tourism planning as profession.');

    -- Q109 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ plains are ideal for resort development with beach access.', 'multiple_choice', 'Mountain', 'Coastal', 'River', 'Desert', 'B', 'Coastal plains ideal for resorts.');

    -- Q110 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The source of revenue considered equitable is:', 'multiple_choice', 'taxation', 'user fees', 'donations', 'royalties', 'B', 'User fees considered equitable.');

    -- Q111 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Key elements of environmental education plan do NOT include:', 'multiple_choice', 'curriculum development', 'teacher training', 'park programmes', 'community involvement', 'C', 'Park programmes not typically included.');

    -- Q112 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Tourism-related employment includes all EXCEPT:', 'multiple_choice', 'direct employment', 'indirect employment', 'induced employment', 'general employment', 'D', 'General employment not specific category.');

    -- Q113 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which conservation area is found in Tanzania?', 'multiple_choice', 'Yankari', 'Serengeti', 'Cross River', 'Obudu', 'B', 'Serengeti in Tanzania.');

    -- Q114 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Lack of ______ prevents achieving conservation goals.', 'multiple_choice', 'funding', 'awareness', 'legislation', 'infrastructure', 'B', 'Lack of awareness prevents conservation.');

    -- Q115 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Geographical information is vital to tourism planning and:', 'multiple_choice', 'marketing', 'management', 'financing', 'advertising', 'B', 'Vital to planning and management.');

    -- Q116 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Tourists must recognize that a ______ feature has value to become tourist resource.', 'fill_in_blank', 'natural', 'Natural features become tourist resources.');

    -- Q117 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Tourist resources are:', 'multiple_choice', 'renewable', 'perishable', 'indestructible', 'permanent', 'B', 'Tourist resources are perishable.');

    -- Q118 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Tourism is attracted to ______ and fragile resources.', 'multiple_choice', 'common', 'unique', 'artificial', 'urban', 'B', 'Attracted to unique resources.');

    -- Q119 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Tourism is seen as industry without:', 'multiple_choice', 'smoke', 'chimney', 'pollution', 'waste', 'B', 'Industry without chimney.');

    -- Q120 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'International conference on climate change in Brazil was in:', 'multiple_choice', '1990', '1992', '1995', '2000', 'B', '1992 Brazil conference.');

    -- Q121 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The 1992 conference theme was called:', 'multiple_choice', 'Earth Summit', 'Climate Summit', 'Tourism Summit', 'Development Summit', 'A', 'Earth Summit theme.');

    -- Q122 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Ecotourism potential is limited by ______ factors.', 'multiple_choice', '2', '3', '4', '5', 'C', 'Limited by 4 factors.');

    -- Q123 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'La Campagne Tropicana Beach Resort located in:', 'multiple_choice', 'Ikegun', 'Calabar', 'Bauchi', 'Lagos', 'A', 'Located in Ikegun.');

    -- Q124 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Obudu hill is ______ meters above sea level.', 'multiple_choice', '1576', '1676', '1776', '1876', 'A', '1576 meters above sea level.');

    -- Q125 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'TINAPA officially opened on 2nd April:', 'multiple_choice', '2005', '2007', '2009', '2011', 'B', 'Opened 2nd April 2007.');

    -- Q126 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Current name for Yankari National Park is:', 'multiple_choice', 'Yankari Game Reserve', 'Yankari Wildlife Park', 'Yankari Conservation Area', 'Yankari Safari Park', 'A', 'Yankari Game Reserve.');

    -- Q127 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'At ______ scale, accessibility is vital for tourist developments.', 'multiple_choice', 'global', 'national', 'regional', 'local', 'D', 'Local scale accessibility vital.');

    -- Q128 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'There is erroneous belief that ______ structures may inhibit decision making.', 'multiple_choice', 'modern', 'traditional', 'government', 'corporate', 'B', 'Traditional structures may inhibit decisions.');

    -- Q129 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ are groups who primarily go on unusual trips.', 'multiple_choice', 'Hard core ecotourists', 'Mainstream ecotourists', 'Dedicated ecotourists', 'Casual ecotourists', 'B', 'Mainstream ecotourists seek unusual trips.');

    -- Q130 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'People of Kebbi state are predominantly:', 'multiple_choice', 'Christians', 'Muslims', 'Traditionalists', 'Buddhists', 'B', 'Predominantly Muslims.');

    -- Q131 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Cross River basin is home to ______ fish species.', 'multiple_choice', '150', '165', '175', '185', 'B', '165 fish species.');

    -- Q132 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Tourism is seen as industry without:', 'multiple_choice', 'smokestack', 'chimney', 'factory', 'mill', 'B', 'Industry without chimney.');

    -- Q133 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Obudu hill is ______ meters above sea level.', 'multiple_choice', '1576', '1676', '1776', '1876', 'A', '1576 meters.');

    -- Q134 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Key elements of environmental education plan do NOT include:', 'multiple_choice', 'curriculum', 'teacher training', 'park programmes', 'community involvement', 'C', 'Park programmes not included.');

    -- Q135 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ plays important role in lobbying tourists.', 'multiple_choice', 'Government', 'Industry', 'Community', 'Schools', 'B', 'Industry lobbies tourists.');

    -- Q136 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Tourism is attracted to ______ and fragile resources.', 'multiple_choice', 'common', 'unique', 'artificial', 'urban', 'B', 'Unique resources attract tourism.');

    -- Q137 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Government of ______ expanded tourism outlook in Cross River State.', 'multiple_choice', 'Donald Duke', 'Donald Luke', 'Donald Trump', 'Donald King', 'A', 'Donald Duke expanded tourism.');

    -- Q138 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Sustainable tourism considers ______ generations.', 'multiple_choice', 'past', 'present', 'future', 'ancient', 'C', 'Considers future generations.');

    -- Q139 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Current name for Yankari National Park is:', 'multiple_choice', 'Yankari Game Reserve', 'Yankari Wildlife Park', 'Yankari Safari Park', 'Yankari Conservation Area', 'A', 'Yankari Game Reserve.');

    -- Q140 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ pressure shuns environmentally unsound destinations.', 'multiple_choice', 'Government', 'Consumer', 'Industry', 'International', 'B', 'Consumer pressure influences choices.');

    -- Q141 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Serengeti conservation area is in:', 'multiple_choice', 'Kenya', 'Tanzania', 'Nigeria', 'Ghana', 'B', 'Serengeti in Tanzania.');

    -- Q142 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Geographical information vital to tourism planning and:', 'multiple_choice', 'marketing', 'management', 'finance', 'advertising', 'B', 'Vital to planning and management.');

    -- Q143 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Yankari National Park legally constituted in:', 'multiple_choice', '1956', '1962', '1970', '1980', 'A', 'Legally constituted 1956.');

    -- Q144 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Tourism ______ as profession faces challenges.', 'multiple_choice', 'management', 'planning', 'marketing', 'development', 'B', 'Tourism planning profession.');

    -- Q145 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Tourists recognize ______ features as valuable resources.', 'multiple_choice', 'artificial', 'natural', 'urban', 'industrial', 'B', 'Natural features valued.');

    -- Q146 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Tourism planning based on sound:', 'multiple_choice', 'research', 'intuition', 'politics', 'speculation', 'A', 'Based on sound research.');

    -- Q147 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Yankari National Park is found in:', 'multiple_choice', 'Bauchi', 'Kano', 'Lagos', 'Calabar', 'A', 'Found in Bauchi state.');

    -- Q148 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ plains ideal for resort development.', 'multiple_choice', 'Mountain', 'Coastal', 'River', 'Desert', 'B', 'Coastal plains ideal.');

    -- Q149 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Equitable revenue source is:', 'multiple_choice', 'taxation', 'user fees', 'donations', 'royalties', 'B', 'User fees equitable.');

    -- Q150 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Tourist resources are:', 'multiple_choice', 'renewable', 'perishable', 'indestructible', 'permanent', 'B', 'Tourist resources perishable.');

    -- Final 50 questions to reach 200...

    -- Q151 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The ______ of the earth is composed of various landforms.', 'fill_in_blank', 'land surface', 'Land surface has various landforms.');

    -- Q152 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which is NOT a type of landform?', 'multiple_choice', 'Mountains', 'Plateaux', 'Oceans', 'Plains', 'C', 'Oceans are water bodies, not landforms.');

    -- Q153 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ provide flat areas for building with beach access.', 'multiple_choice', 'Mountain peaks', 'Coastal plains', 'Hill lands', 'Plateaux', 'B', 'Coastal plains provide building areas.');

    -- Q154 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Lakes are common in ______ latitudes.', 'multiple_choice', 'tropical', 'temperate', 'higher', 'equatorial', 'C', 'Lakes common in higher latitudes.');

    -- Q155 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The reason for tourism existence is:', 'multiple_choice', 'transportation', 'attractions', 'accommodation', 'food', 'B', 'Attractions are raison d''être for tourism.');

    -- Q156 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'RED stands for:', 'multiple_choice', 'Recreational Entertainment District', 'Recreational Business District', 'Regional Economic District', 'Rural Ecotourism District', 'B', 'RED is Recreational Business District.');

    -- Q157 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Christaller stated tourism avoids:', 'multiple_choice', 'coastal areas', 'central places', 'mountain areas', 'rural areas', 'B', 'Avoids central places.');

    -- Q158 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Yankari has ______ natural springs.', 'multiple_choice', 'three', 'four', 'five', 'six', 'B', 'Yankari has four springs.');

    -- Q159 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Yankari established as Game Reserve in:', 'multiple_choice', '1956', '1962', '1970', '1980', 'A', 'Established 1956.');

    -- Q160 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Calabar had ______ flights weekly in 1999.', 'multiple_choice', 'two', 'three', 'four', 'five', 'A', 'Two flights weekly in 1999.');

    -- Q161 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'La Campagne resort in ______ village.', 'multiple_choice', 'Ikegun', 'Obudu', 'Calabar', 'Bauchi', 'A', 'Ikegun village.');

    -- Q162 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Argungu fishing started in:', 'multiple_choice', '1920s', '1930s', '1940s', '1950s', 'B', 'Started 1930s.');

    -- Q163 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Winning perch weighed ______ pounds.', 'multiple_choice', '165', '175', '185', '195', 'A', '165 pounds.');

    -- Q164 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Dominant land use in tourism:', 'multiple_choice', 'agriculture', 'resort areas', 'industry', 'residential', 'B', 'Resort areas dominant.');

    -- Q165 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Tourist resources vulnerable to:', 'multiple_choice', 'preservation', 'destruction', 'enhancement', 'development', 'B', 'Vulnerable to destruction.');

    -- Q166 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Tourism encouraged in early ______ period.', 'multiple_choice', 'pre-war', 'post-war', 'colonial', 'independence', 'B', 'Early post-war period.');

    -- Q167 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Tourism benefits include employment and:', 'multiple_choice', 'development', 'pollution', 'congestion', 'inflation', 'A', 'Employment and development.');

    -- Q168 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Yankari hosted by ______ Local Government.', 'multiple_choice', 'Alkaleri', 'Bauchi', 'Maiduguri', 'Kano', 'A', 'Alkaleri Local Government.');

    -- Q169 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Yankari opened to public in:', 'multiple_choice', '1956', '1962', '1970', '1980', 'B', 'Opened 1962.');

    -- Q170 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Tourist resources are ______ objects.', 'multiple_choice', 'intangible', 'tangible', 'virtual', 'hypothetical', 'B', 'Tangible objects of value.');

    -- Q171 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Tourism shares ______ services with other sectors.', 'multiple_choice', 'management', 'transport', 'communication', 'financial', 'A', 'Shares management services.');

    -- Q172 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ services cannot be stocked.', 'multiple_choice', 'Souvenirs', 'Accommodation', 'Food', 'Transport', 'B', 'Accommodation cannot be stocked.');

    -- Q173 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Demand-driven development called:', 'multiple_choice', 'pioneering', 'spearheading', 'leading', 'guiding', 'B', 'Called spearheading.');

    -- Q174 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '1990s emphasized ______ considerations.', 'multiple_choice', 'economic', 'environmental', 'political', 'social', 'B', 'Environmental considerations in 1990s.');

    -- Q175 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Leading Nigerian tourist destination:', 'multiple_choice', 'Obudu cattle farm', 'La Campagne', 'Yankari', 'Argungu', 'A', 'Obudu cattle farm leading destination.');

    -- Q176 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '1992 Brazil conference on:', 'multiple_choice', 'tourism', 'climate change', 'wildlife', 'culture', 'B', 'Climate change conference.');

    -- Q177 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Natural filter for pollution:', 'multiple_choice', 'buildings', 'vegetative cover', 'roads', 'concrete', 'B', 'Vegetative cover acts as filter.');

    -- Q178 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Tourism spurs ______ growth.', 'multiple_choice', 'national', 'regional', 'global', 'urban', 'B', 'Spurs regional growth.');

    -- Q179 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Ecotourism demand depends on:', 'multiple_choice', 'price and supply', 'supply and class', 'price, supply and class', 'price and class', 'C', 'Depends on price, supply and class.');

    -- Q180 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Economic leakages from:', 'multiple_choice', 'local spending', 'imported skills', 'domestic production', 'local employment', 'B', 'From imported skills/technologies.');

    -- Q181 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Yankari first constituted in:', 'multiple_choice', '1956', '1962', '1970', '1985', 'A', 'First constituted 1956.');

    -- Q182 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Revenue generation through:', 'multiple_choice', 'donation', 'taxation', 'subscription', 'volunteering', 'B', 'Taxation generates revenue.');

    -- Q183 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '1992 conference called:', 'multiple_choice', 'Earth Summit', 'Climate Conference', 'Tourism Forum', 'Conservation Meeting', 'A', 'Earth Summit.');

    -- Q184 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ pressure affects destinations.', 'multiple_choice', 'Government', 'Consumer', 'Industry', 'International', 'B', 'Consumer pressure influences.');

    -- Q185 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Sustainable tourism considers ______ generations.', 'multiple_choice', 'past', 'present', 'future', 'ancient', 'C', 'Considers future generations.');

    -- Q186 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Tourism planning based on:', 'multiple_choice', 'research', 'intuition', 'politics', 'speculation', 'A', 'Based on research.');

    -- Q187 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Tourism ______ profession faces challenges.', 'multiple_choice', 'management', 'planning', 'marketing', 'development', 'B', 'Planning profession.');

    -- Q188 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ plains ideal for resorts.', 'multiple_choice', 'Mountain', 'Coastal', 'River', 'Desert', 'B', 'Coastal plains ideal.');

    -- Q189 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Equitable revenue from:', 'multiple_choice', 'taxation', 'user fees', 'donations', 'royalties', 'B', 'User fees equitable.');

    -- Q190 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Environmental education excludes:', 'multiple_choice', 'curriculum', 'teacher training', 'park programmes', 'community involvement', 'C', 'Excludes park programmes.');

    -- Q191 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Tourism employment excludes:', 'multiple_choice', 'direct', 'indirect', 'induced', 'general', 'D', 'Excludes general employment.');

    -- Q192 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Tanzania conservation area:', 'multiple_choice', 'Yankari', 'Serengeti', 'Cross River', 'Obudu', 'B', 'Serengeti in Tanzania.');

    -- Q193 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Conservation hindered by lack of:', 'multiple_choice', 'funding', 'awareness', 'legislation', 'infrastructure', 'B', 'Lack of awareness hinders conservation.');

    -- Q194 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Geographical information vital for:', 'multiple_choice', 'planning and management', 'marketing and finance', 'advertising and sales', 'research and development', 'A', 'Vital for planning and management.');

    -- Q195 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Tourists value ______ features.', 'multiple_choice', 'artificial', 'natural', 'urban', 'industrial', 'B', 'Value natural features.');

    -- Q196 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Tourist resources are:', 'multiple_choice', 'renewable', 'perishable', 'indestructible', 'permanent', 'B', 'Tourist resources perishable.');

    -- Q197 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Tourism attracted to ______ resources.', 'multiple_choice', 'common', 'unique', 'artificial', 'urban', 'B', 'Attracted to unique resources.');

    -- Q198 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Tourism: industry without:', 'multiple_choice', 'smoke', 'chimney', 'pollution', 'waste', 'B', 'Industry without chimney.');

    -- Q199 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '1992 Brazil conference year:', 'multiple_choice', '1990', '1992', '1995', '2000', 'B', '1992 conference.');

    -- Q200 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '1992 conference theme:', 'multiple_choice', 'Earth Summit', 'Climate Summit', 'Tourism Summit', 'Development Summit', 'A', 'Earth Summit theme.');

END $$;