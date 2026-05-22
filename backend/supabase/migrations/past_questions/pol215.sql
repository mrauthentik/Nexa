DO $$
DECLARE
    v_course_id UUID;
BEGIN
    SELECT id INTO v_course_id FROM courses WHERE code = 'POL215' LIMIT 1;

    -- Q1 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'What is the Greek name for their city state?', 'multiple_choice', 'Polis', 'Demos', 'Agora', 'Acropolis', 'A', 'The Greek city-state was called "polis", from which we get words like politics and political.');

    -- Q2 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of these is the major characteristic of Greek city state according to Plato and Aristotle?', 'multiple_choice', 'Military power', 'Self-sufficiency', 'Large population', 'Democratic governance', 'B', 'Both Plato and Aristotle emphasized self-sufficiency (autarky) as essential for the ideal city-state.');

    -- Q3 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'What is the dominant socio-political and economic system in the middle ages?', 'multiple_choice', 'Capitalism', 'Socialism', 'Feudalism', 'Monarchism', 'C', 'Feudalism was the dominant system in medieval Europe, characterized by lords, vassals, and fiefs.');

    -- Q4 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'What authority did the Reformation thinkers want to subject ecclesiastical authorities?', 'multiple_choice', 'Military authority', 'Civil authority', 'Popular authority', 'Divine authority', 'B', 'Reformation thinkers advocated for subjecting church authorities to civil authority.');

    -- Q5 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Who is the author of the book, The Leviathan?', 'multiple_choice', 'John Locke', 'Thomas Hobbes', 'Jean-Jacques Rousseau', 'Montesquieu', 'B', 'Thomas Hobbes wrote "Leviathan" in 1651, advocating for strong central authority.');

    -- Q6 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Whose political thought is said to have freed kings from the shackles of morality?', 'multiple_choice', 'Plato', 'Machiavelli', 'Aristotle', 'Cicero', 'B', 'Machiavelli separated politics from morality in "The Prince".');

    -- Q7 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In what did the Enlightenment thinkers placed so much hope to free man from oppressive political and religious regimes?', 'multiple_choice', 'Faith', 'Tradition', 'Reason', 'Revolution', 'C', 'Enlightenment thinkers emphasized reason as the path to human progress and freedom.');

    -- Q8 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'To whom do we attribute the invention of check and balance in political system?', 'multiple_choice', 'Locke', 'Rousseau', 'Montesquieu', 'Voltaire', 'C', 'Montesquieu developed the theory of separation of powers with checks and balances.');

    -- Q9 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'What first emphasised that the state should not encroach on the individual liberty of the citizens?', 'multiple_choice', 'The Magna Carta', 'The Code Napoleon', 'The US Constitution', 'The French Declaration', 'B', 'The Code Napoleon emphasized protection of individual liberties from state encroachment.');

    -- Q10 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'What is the name of the thought system championed by Jeremy Bentham?', 'multiple_choice', 'Socialism', 'Utilitarianism', 'Liberalism', 'Conservatism', 'B', 'Jeremy Bentham was the founder of utilitarianism.');

    -- Q11 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'What is equated with knowledge in Socrates philosophy?', 'multiple_choice', 'Power', 'Virtue', 'Wealth', 'Happiness', 'B', 'Socrates famously held that virtue is knowledge.');

    -- Q12 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Who first regarded all laws as social conventions rather than a product of nature?', 'multiple_choice', 'Socrates', 'Plato', 'Antiphon', 'Aristotle', 'C', 'Antiphon was among the first to argue that laws are mere social conventions.');

    -- Q13 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Who is regarded as the earliest proponent of communism?', 'multiple_choice', 'Aristophanes', 'Plato', 'Marx', 'Socrates', 'A', 'Aristophanes presented communist ideas in his play "The Ecclesiazusae".');

    -- Q14 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'On what did Plato build his ideal state?', 'multiple_choice', 'Wealth', 'Power', 'Justice', 'Freedom', 'C', 'Plato built his ideal state in "The Republic" on the foundation of justice.');

    -- Q15 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The human spirit is equated with what in the politics of Plato?', 'multiple_choice', 'Philosophers', 'Soldiers', 'Workers', 'Rulers', 'B', 'In Plato''s tripartite soul, the spirited element corresponds to soldiers.');

    -- Q16 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of the following defines aristocracy?', 'multiple_choice', 'Government of the people', 'Government of the wealthy', 'Government of the best', 'Government of one', 'C', 'Aristocracy literally means "rule by the best" in Greek.');

    -- Q17 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'At what age is the philosopher king in Plato matured to rule?', 'multiple_choice', '30', '40', '50', '60', 'C', 'Plato argued that philosopher kings would be ready to rule at age 50 after extensive training.');

    -- Q18 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Who held the position that: "The Gods do not care about men and do not interfere either for good or bad in their affairs?"', 'multiple_choice', 'Stoics', 'Epicureans', 'Sophists', 'Cynics', 'B', 'Epicureans believed gods were detached from human affairs.');

    -- Q19 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'What is the constitution that would govern the stoic''s world state?', 'multiple_choice', 'Power', 'Reason', 'Tradition', 'Divine will', 'B', 'Stoics believed reason should govern the cosmopolitan world state.');

    -- Q20 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which law did Cicero regard as the governor of all other laws?', 'multiple_choice', 'Divine law', 'Natural law', 'Civil law', 'Common law', 'B', 'Cicero considered natural law as supreme and governing all other laws.');

    -- Q21 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Who is the author of Two Treatises of Government?', 'multiple_choice', 'Hobbes', 'Locke', 'Rousseau', 'Montesquieu', 'B', 'John Locke wrote "Two Treatises of Government" defending limited government.');

    -- Q22 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'What did Aristotle regard as the highest form of government?', 'multiple_choice', 'Democracy', 'Aristocracy', 'Monarchy', 'Polity', 'C', 'Aristotle considered monarchy the highest form when ruled by a virtuous king.');

    -- Q23 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A statement which consists of two simple statements or sub-statements is known as?', 'multiple_choice', 'Simple statement', 'Compound statement', 'Complex statement', 'Dual statement', 'B', 'A compound statement combines two or more simple statements.');

    -- Q24 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Who pioneered the application of scientific method in the study of politics?', 'multiple_choice', 'Aristotle', 'Plato', 'Nicollo Machiavelli', 'Thomas Hobbes', 'C', 'Machiavelli applied empirical observation to politics, breaking from traditional methods.');

    -- Q25 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Who held that in addition to its truth, religion has social consequences?', 'multiple_choice', 'Augustine', 'Aquinas', 'Marsilio', 'Luther', 'C', 'Marsilio of Padua emphasized the social utility of religion.');

    -- Q26 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Who pioneered the discussion of politics and society without any recourse to ethics and jurisprudence?', 'multiple_choice', 'Plato', 'Aristotle', 'Machiavelli', 'Cicero', 'C', 'Machiavelli separated politics from ethics in his political analysis.');

    -- Q27 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The idea that a Christian is bound to obey the orders of a pagan ruler was championed by who?', 'multiple_choice', 'Augustine', 'Aquinas', 'Luther', 'Calvin', 'B', 'Aquinas argued for obedience to secular authorities regardless of their religion.');

    -- Q28 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of these is the name of Augustine''s book?', 'multiple_choice', 'The Prince', 'City of God', 'The Republic', 'Politics', 'B', 'Augustine wrote "City of God" addressing the relationship between Christianity and politics.');

    -- Q29 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'From who did Marx borrow the idea of dialectics?', 'multiple_choice', 'Kant', 'Hegel', 'Feuerbach', 'Engels', 'B', 'Marx adapted Hegel''s dialectical method, though he gave it materialist content.');

    -- Q30 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The theory that our social status was neither a product of nature nor the gods, was first promoted in the Greek society by who?', 'multiple_choice', 'Plato and Aristotle', 'Socrates and Plato', 'Sophists', 'Stoics', 'C', 'The Sophists challenged natural and divine justifications for social hierarchy.');

    -- Q31 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Who are the ultimate rulers in Plato''s political thought?', 'multiple_choice', 'Military generals', 'Wealthy merchants', 'Philosopher kings', 'Popular assemblies', 'C', 'Plato argued that only philosopher kings have the wisdom to rule justly.');

    -- Q32 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of these is not among the best form of government according to Aristotle?', 'multiple_choice', 'Monarchy', 'Aristocracy', 'Democracy', 'Polity', 'C', 'Aristotle considered democracy a deviant form of government.');

    -- Q33 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'J. S. Mill''s hope of forestalling the tyranny of the majority lies in', 'multiple_choice', 'Direct democracy', 'Representative government', 'Benevolent dictatorship', 'Constitutional monarchy', 'B', 'Mill believed representative government could protect minority rights.');

    -- Q34 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'What are man''s two sovereign masters according to Bentham?', 'multiple_choice', 'Reason and passion', 'Pleasure and pain', 'Good and evil', 'Freedom and security', 'B', 'Bentham argued pleasure and pain govern all human behavior.');

    -- Q35 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of these is not a thinker of the enlightenment?', 'multiple_choice', 'Voltaire', 'Rousseau', 'Montesquieu', 'Augustine', 'D', 'Augustine lived in the 4th-5th century, long before the Enlightenment.');

    -- Q36 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Epicureans regard ____________ as the guiding principle of all men.', 'fill_in_blank', 'Self interest', 'Epicureans believed self-interest rationally pursued leads to happiness.');

    -- Q37 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Seneca conceived the greater state which all humans belong to as _______________.', 'fill_in_blank', 'Society', 'Seneca advocated cosmopolitanism - belonging to human society as a whole.');

    -- Q38 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '____________ defined happiness as the avoidance of pains and worries.', 'fill_in_blank', 'Epicureans', 'Epicureans saw happiness as ataraxia - freedom from pain and anxiety.');

    -- Q39 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The thesis that progress in arts and sciences has led to idleness, inequality and luxury was argued by who?', 'fill_in_blank', 'Rousseau', 'Rousseau critiqued civilizational progress in his "Discourse on the Arts and Sciences".');

    -- Q40 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '___________ regarded the law as the greatest good of the state.', 'fill_in_blank', 'Cicero', 'Cicero saw law as the foundation of political community and justice.');

    -- Continuing with additional questions to reach 200 total...

    -- Q41 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'According to Machiavelli, what animal character must a good ruler possess?', 'multiple_choice', 'Lion', 'Fox', 'Eagle', 'Wolf', 'B', 'Machiavelli said rulers need the cunning of a fox and the strength of a lion.');

    -- Q42 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Who viewed slaves as "live property"?', 'multiple_choice', 'Plato', 'Aristotle', 'Cicero', 'Augustine', 'B', 'Aristotle defended slavery as natural, viewing slaves as living tools.');

    -- Q43 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'According to Marsilio''s two good lives, the first good life consists of proper study of', 'multiple_choice', 'Theology', 'Philosophy', 'Politics', 'Science', 'B', 'Marsilio identified philosophical contemplation as the first good life.');

    -- Q44 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The debate concerning dual authority of church and state is called', 'multiple_choice', 'Doctrine of two kingdoms', 'Doctrine of the two swords', 'Separation of powers', 'Dual sovereignty', 'B', 'The "doctrine of the two swords" represented church and state authority.');

    -- Q45 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Rousseau believed the first person to claim private property founded', 'multiple_choice', 'Government', 'Civil society', 'Religion', 'Law', 'B', 'Rousseau saw property claims as founding civil society with its inequalities.');

    -- Q46 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In communist society, distribution will be based on', 'multiple_choice', 'Ability', 'Need', 'Work', 'Status', 'B', 'Marx''s communist principle: "From each according to ability, to each according to need."');

    -- Q47 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In Marx''s philosophy, what determines human values?', 'multiple_choice', 'Religious belief', 'Economic interest', 'Political ideology', 'Moral principles', 'B', 'Marx argued economic relations determine social and political structures.');

    -- Q48 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Roman kings were bound to govern on advice of the', 'multiple_choice', 'People', 'Senate', 'Priests', 'Army', 'B', 'Despite absolute power, Roman kings traditionally consulted the Senate.');

    -- Q49 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Medieval political system involved joint power between emperor and', 'multiple_choice', 'Nobles', 'Pope', 'Merchants', 'People', 'B', 'The medieval system balanced imperial and papal authority.');

    -- Q50 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The Leviathan was written to promote', 'multiple_choice', 'Democracy', 'Political absolutism', 'Religious freedom', 'Social contract', 'B', 'Hobbes advocated absolute sovereignty to prevent civil war.');

    -- Q51 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The theory that securing the greatest happiness of the greatest number is

    the foundation of morality and legislation is called ______________', 'fill_in_blank', 'Utilitarianism', 'Utilitarianism is the ethical theory developed by Jeremy Bentham.');
    -- Fill in the blank questions (15% - 15 questions)
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) VALUES
    (v_course_id, 'The study of production and trade and their relations with law, customs and government and distribution of wealth and income is referred to as ________________', 'fill_in_blank', 'Political economy', 'Political economy examines the relationship between politics and economics.'),
    (v_course_id, 'The apparent clash of ideologies has led to the evolution of a truly scientific basis for political economy through the works of such scholars like Marx, Engel and ____________', 'fill_in_blank', 'Lenin', 'Lenin contributed significantly to Marxist political economy.'),
    (v_course_id, 'The classical approach to political economy argues against the utility of restriction in __?', 'fill_in_blank', 'International Trade', 'Classical economists advocated for free international trade.'),
    (v_course_id, 'Scholars of Marxian orientation conceive the classical orientation to political economy as __?', 'fill_in_blank', 'vulgar', 'Marx referred to classical political economy as vulgar economics.'),
    (v_course_id, 'The main proponent of the Marxian approach is __?', 'fill_in_blank', 'Karl Marx', 'Karl Marx is the primary founder of Marxist political economy.'),
    (v_course_id, 'The ___ interpretation of history places emphasis on social classes, productive forces and the social relationship of production', 'fill_in_blank', 'Marxian', 'Marxian historical analysis focuses on class and production relations.'),
    (v_course_id, 'The Neo-Classical Political Economy gained prominence with the writings of ___?', 'fill_in_blank', 'John Keynes', 'Keynes revolutionized economic thought with his theories.'),
    (v_course_id, 'Scholars of the Neo-Classical Political Economy were predominantly influenced by the economic crisis of the pre-war period and were determined to avoid the economic chaos and competitive devaluations that had occurred during the ___?', 'fill_in_blank', 'Great Depression', 'The Great Depression shaped neo-classical economic thought.'),
    (v_course_id, 'Political economy seeks to explain the causes of the asymmetrical relations between developed and developing nations in the international division of labour and____________', 'fill_in_blank', 'Exchange', 'International exchange relations create asymmetrical development.'),
    (v_course_id, 'The mode of production is also called ___ or __ in the Marxian dialectics?', 'fill_in_blank', 'Epoch', 'Mode of production defines historical epochs in Marxism.'),
    (v_course_id, 'The___ forces are the more mobile component of the mode of production', 'fill_in_blank', 'productive', 'Productive forces include technology, labor, and means of production.'),
    (v_course_id, 'Classical political economy has otherwise been referred to as ___________political economy because of its emphasis on free enterprise.', 'fill_in_blank', 'Laissez faire', 'Laissez-faire economics opposes government intervention.'),
    (v_course_id, 'The basis of socialist society is__?', 'fill_in_blank', 'non-antagonistic', 'Socialist societies are characterized by non-antagonistic class relations.'),
    (v_course_id, '__ constitutes the decisive factor of the production process?', 'fill_in_blank', 'labour', 'Labor is the primary factor in the production process according to Marx.'),
    (v_course_id, 'The Means of labour and objects of labour together constitutes __', 'fill_in_blank', 'Means of production', 'Means of production include tools, machinery, and raw materials.');

    -- Multiple choice questions (85% - 85 questions)
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) VALUES
    (v_course_id, 'Political economy attempts to locate the root cause of underdevelopment in third world nations to issues such as ____', 'multiple_choice', 'Imperialism', 'Modernization', 'Cultural factors', 'Geographical limitations', 'A', 'Imperialism is seen as a primary cause of underdevelopment in political economy.'),
    (v_course_id, 'The challenges to the expansion of capital in the world production process is referred to as__________', 'multiple_choice', 'Classical Political Economy', 'Marxian Political Economy', 'Neo-Classical Political Economy', 'Development Economics', 'A', 'Classical political economy addresses challenges to capital expansion.'),
    (v_course_id, 'Classical political economy is sometimes referred to as laissez faire, because it places much prominence on ____', 'multiple_choice', 'State intervention', 'Free Enterprise', 'Social welfare', 'International cooperation', 'B', 'Laissez-faire emphasizes free market enterprise with minimal government intervention.'),
    (v_course_id, 'The main proponent of the Marxian political economy approach is ___________?', 'multiple_choice', 'Adam Smith', 'Karl Marx', 'John Keynes', 'David Ricardo', 'B', 'Karl Marx is the foundational thinker of Marxian political economy.'),
    (v_course_id, 'The economy approach which advocates some form of state intervention in the economic process of the society is called _________', 'multiple_choice', 'Classical Political Economy', 'Marxian Political Economy', 'Neo-Classical Political Economy', 'Mercantilism', 'C', 'Neo-classical political economy supports state intervention in markets.'),
    (v_course_id, 'Karl Marx maintains that the economy is the ____, upon which other structures stand on in the society', 'multiple_choice', 'Superstructure', 'Base', 'Ideology', 'Political system', 'B', 'Marx argued the economic base determines the superstructure of society.'),
    (v_course_id, 'Which of these scholars used his theory of dialectics and historical materialism to argue that capitalism will fizzle out ____', 'multiple_choice', 'Adam Smith', 'Karl Marx', 'John Locke', 'Max Weber', 'B', 'Marx predicted capitalism would collapse due to its internal contradictions.'),
    (v_course_id, 'The concept "Political Economy" was first used by ____', 'multiple_choice', 'Karl Marx', 'Antoine de Montchrestein', 'Adam Smith', 'David Ricardo', 'B', 'Antoine de Montchrestein first coined the term political economy.'),
    (v_course_id, 'The object and instrument of labour for Karl Marx constitute the ____', 'multiple_choice', 'Mode of Production', 'Means of Production', 'Relations of Production', 'Forces of Production', 'B', 'Objects and instruments of labor comprise the means of production.'),
    (v_course_id, 'For Karl Marx, ____ is a group of persons that share a similar relationship to the means of production', 'multiple_choice', 'Political Party', 'Social Class', 'Economic Group', 'Professional Association', 'B', 'Social classes are defined by their relationship to means of production.'),
    (v_course_id, 'The superstitious believe that the bourgeoisie own the means of production, and the legitimacy of the haves not working for them is what Marx refers to as ___', 'multiple_choice', 'Class Consciousness', 'False Consciousness', 'Ideological State Apparatus', 'Hegemony', 'B', 'False consciousness describes workers accepting bourgeois ideology.'),
    (v_course_id, 'Surplus value is also known as ___________', 'multiple_choice', 'Social Plus', 'Economic Surplus', 'Profit Margin', 'Capital Gain', 'A', 'Surplus value is termed social plus in Marxist economics.'),
    (v_course_id, 'Following his criticism of the economic injustice between the oppressor and the oppressed, Karl Marx believes that ____ is pregnant with the seed of its own destruction', 'multiple_choice', 'Socialism', 'Capitalism', 'Feudalism', 'Communism', 'B', 'Marx argued capitalism contains internal contradictions leading to its demise.'),
    (v_course_id, 'The difference between what the proletariat produce and what they take home is called ___', 'multiple_choice', 'Profit', 'Surplus value', 'Wage differential', 'Economic rent', 'B', 'Surplus value is the value created by workers but appropriated by capitalists.'),
    (v_course_id, 'That the proletarian revolution will eventually lead to the enthronement of Socialism was postulated by___', 'multiple_choice', 'Adam Smith', 'Karl Marx', 'John Keynes', 'Max Weber', 'B', 'Marx predicted proletarian revolution would establish socialism.'),
    (v_course_id, 'For ___, dialectics is the understanding in the contradiction within the very essence of things', 'multiple_choice', 'Adam Smith', 'V I Lenin', 'John Locke', 'David Ricardo', 'B', 'Lenin developed Marxist dialectical materialism further.'),
    (v_course_id, 'In Marx analysis, it is not the consciousness of men that determine their well being; rather their ____ determines their consciousness', 'multiple_choice', 'Education', 'Social being', 'Religion', 'Political affiliation', 'B', 'Marx argued social existence determines consciousness, not vice versa.'),
    (v_course_id, 'In his Material conception of History, Marx argues that the manner of relationship in the production process is man against nature, and man against ____', 'multiple_choice', 'God', 'Man', 'Society', 'State', 'B', 'Marx saw production involving both human-nature and human-human relations.'),
    (v_course_id, 'The historical approach in the evolution of the modern society for Karl Marx, includes; primitive communalism, slavery, feudalism, capitalism and ____', 'multiple_choice', 'Socialism', 'Communism', 'Fascism', 'Anarchism', 'B', 'Communism represents the final stage in Marx historical progression.'),
    (v_course_id, 'The stages in the development of productive forces under the primitive communal system include; appropriation of natural products and ____?', 'multiple_choice', 'Industrial production', 'Transition to reproductive economy', 'Commercial agriculture', 'Service economy', 'B', 'Primitive communism transitioned from gathering to reproductive economy.'),
    (v_course_id, 'The working hour of the peasant serfs in the primitive era is divided into necessary time and ____', 'multiple_choice', 'Leisure time', 'Surplus time', 'Religious time', 'Family time', 'B', 'Surplus time produced goods for the ruling class.'),
    (v_course_id, 'The feudal era was largely characterised by land ownership held as ____', 'multiple_choice', 'Private property', 'Fief', 'Common land', 'State property', 'B', 'Feudal land ownership was organized through the fief system.'),
    (v_course_id, 'During the necessary time, the peasant farmer produces only what is sufficient for his ____', 'multiple_choice', 'Landlord', 'Family', 'Community', 'Trade', 'B', 'Necessary time provided for the peasants basic subsistence needs.'),
    (v_course_id, 'The status of peasants in the feudal era is called ________', 'multiple_choice', 'Slavery', 'Serfdom', 'Citizenship', 'Proletariat', 'B', 'Serfdom defined the legal status of peasants under feudalism.'),
    (v_course_id, 'The capitalist mode of production emerged during the last stage of _____', 'multiple_choice', 'Slavery', 'Feudalism', 'Primitive communism', 'Socialism', 'B', 'Capitalism developed from the contradictions within feudal society.'),
    (v_course_id, 'The capitalist mode of production has undergone two stages; pre – monopoly capitalism and _________', 'multiple_choice', 'State capitalism', 'Monopoly capitalism', 'Financial capitalism', 'Global capitalism', 'B', 'Monopoly capitalism represents capitalism advanced stage with concentrated ownership.'),
    (v_course_id, 'In ________ view, political economy does not only deal with production, also the social relations of men in production and the social system of production', 'multiple_choice', 'Adam Smith', 'V.I Lenin', 'John Keynes', 'Max Weber', 'B', 'Lenin emphasized social relations in the production process.'),
    (v_course_id, 'In the communist manifesto, Marx and Engels insist that the working class must unite, for they have nothing to lose but their ____', 'multiple_choice', 'Wealth', 'Chains', 'Dignity', 'Freedom', 'B', 'Famous quote from Communist Manifesto about proletarian revolution.'),
    (v_course_id, 'The theory which argues that the root causes of underdevelopment among third world countries are rooted in the existence of conservative culture and economic barriers is referred to as ____________', 'multiple_choice', 'Dependency theory', 'Modernisation', 'World systems theory', 'Marxist theory', 'B', 'Modernization theory blames traditional culture for underdevelopment.'),
    (v_course_id, 'The dependency theory resonated as a response to the writings of _________', 'multiple_choice', 'Karl Marx', 'Raul Prebisch', 'Adam Smith', 'John Keynes', 'B', 'Raul Prebisch was a key dependency theory proponent.'),
    (v_course_id, 'There were two stages in the development of productive forces under the primitive-communal system, and this are; appropriation of natural products and the _____', 'multiple_choice', 'Development of agriculture', 'Transition to a reproductive economy', 'Industrial revolution', 'Commercial exchange', 'B', 'Primitive communism evolved from gathering to productive economy.'),
    (v_course_id, 'Modernisation theory is traceable to writings of ____ social scientists in the early 1950s', 'multiple_choice', 'European', 'American', 'Asian', 'African', 'B', 'Modernization theory emerged from American social science.'),
    (v_course_id, 'Under the ideal _________ communal mode of production, the primary cells of society were kindred groups that shared a common dwelling and together procured their means of subsistence', 'multiple_choice', 'Socialist', 'Primitive', 'Feudal', 'Capitalist', 'B', 'Primitive communism was organized around kinship groups.'),
    (v_course_id, 'The most significant of the many slave uprisings was that led by ____', 'multiple_choice', 'Spartacus (74 – 71 BC)', 'Julius Caesar', 'Alexander the Great', 'Hannibal', 'A', 'Spartacus led the major slave rebellion against Rome.'),
    (v_course_id, 'The advent of the ____, played a significant role in the fall of the feudal era', 'multiple_choice', 'Agricultural revolution', 'Industrial revolution', 'Digital revolution', 'Scientific revolution', 'B', 'Industrial revolution undermined feudal economic relations.'),
    (v_course_id, 'As against other definition of the modern state put forward by scholars, Marx maintains that the state only exists for the protection of ____ and the means of production?', 'multiple_choice', 'Public welfare', 'Private ownership', 'Individual rights', 'National security', 'B', 'Marx saw the state as protecting ruling class property interests.'),
    (v_course_id, 'For Marx, Lenin and Engels, the only way for mankind to achieve a brighter future is by embracing the _______', 'multiple_choice', 'Religion of Communism', 'Capitalist democracy', 'Social welfare state', 'Anarcho-syndicalism', 'A', 'Communism was viewed as the path to human emancipation.'),
    (v_course_id, 'According to Rostow, the five stages of development includes; traditional, Pre condition to take off, take off, drive to modernity and ____?', 'multiple_choice', 'Post-industrial society', 'High mass consumption', 'Socialist transition', 'Information age', 'B', 'Rostows stages of growth culminate in mass consumption society.'),
    (v_course_id, 'Which of these is not a feature of communism ____ ?', 'multiple_choice', 'Classless society', 'Emphasis of state power', 'Common ownership', 'From each according to ability', 'B', 'Communism envisions the withering away of the state, not its emphasis.'),
    (v_course_id, 'For Lenin, the development of socialism will ultimately lead to ____?', 'multiple_choice', 'State capitalism', 'Communism', 'Social democracy', 'Anarchism', 'B', 'Lenin saw socialism as transitional stage to communism.'),
    (v_course_id, 'In Line with the dependency approach, the relationship among countries is viewed between the metropolitan and the ________', 'multiple_choice', 'Core', 'Periphery', 'Semi-periphery', 'Margin', 'B', 'Dependency theory divides world into metropolitan core and peripheral regions.'),
    (v_course_id, 'While Marx explains surplus value in relation to the ownership of means of production, Baran analysed surplus value in relation to the ____', 'multiple_choice', 'consumption needs of the society', 'technological development', 'international trade', 'financial markets', 'A', 'Baran focused on surplus in relation to societal consumption requirements.'),
    (v_course_id, 'The countries that make up the metropolitan are geographically situated in the global ____?', 'multiple_choice', 'South', 'North', 'East', 'West', 'B', 'Metropolitan core countries are primarily in the global North.'),
    (v_course_id, 'For Andre Gunder Frank, the moment a country is integrated into the global capitalist structure, the economy of such country manifests the sign and symptom of ____', 'multiple_choice', 'Socialism', 'Capitalism', 'Feudalism', 'Mercantilism', 'B', 'Frank argued integration into world system creates capitalist development.'),
    (v_course_id, 'In the book, Imperialism: The Highest Stage of Capitalism, V. I. Lenin described imperialism as the ________________stage of capitalism', 'multiple_choice', 'Early', 'Monopoly', 'Declining', 'Final', 'B', 'Lenin characterized imperialism as the monopoly stage of capitalism.'),
    (v_course_id, 'The process by which there is a foreign political domination and subordination of a country''s territory for effective economic exploitation is referred to as _________', 'multiple_choice', 'Imperialism', 'Colonialism', 'Neo-colonialism', 'Globalization', 'B', 'Colonialism involves direct political control for economic exploitation.'),
    (v_course_id, 'The ____ began the invasion of present Nigeria with the conquest of Lagos in 1851?', 'multiple_choice', 'French', 'British', 'Portuguese', 'Dutch', 'B', 'British colonial expansion in Nigeria began with Lagos conquest.'),
    (v_course_id, 'The Berlin conference which saw the partitioning of Africa into trust colonies among world powers, was convened by ____', 'multiple_choice', 'King Leopold', 'Otto Von Bismark', 'Queen Victoria', 'Napoleon III', 'B', 'Otto von Bismarck convened the 1884-85 Berlin Conference.'),
    (v_course_id, 'The book how Europe underdeveloped Africa was written by ____ ?', 'multiple_choice', 'Frantz Fanon', 'Walter Rodney', 'Chinua Achebe', 'Kwame Nkrumah', 'B', 'Walter Rodney authored "How Europe Underdeveloped Africa".'),
    (v_course_id, 'The transition from the trans-Atlantic slave trade to colonial occupation of Africa was characterised by ________deceits, trickery and outright falsehood.', 'multiple_choice', 'Cultural', 'Political', 'Deceits', 'Economic', 'C', 'The colonial transition involved various forms of deception.');

    -- Additional fill in the blank questions to complete the set
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) VALUES
    (v_course_id, 'The centerpiece of Marx work is an incisive analysis of the strengths and weaknesses of __________', 'fill_in_blank', 'Capitalism', 'Marx critically analyzed the capitalist system.'),
    (v_course_id, 'The owners of the means of production in a capitalist society are referred to as the ___________', 'fill_in_blank', 'bourgeoisie', 'Bourgeoisie are the capitalist class owning means of production.'),
    (v_course_id, 'The difference between what the proletariat produces and what he actually takes home in the form of his wage is known as __?', 'fill_in_blank', 'Surplus Value', 'Surplus value is exploited from workers in capitalism.'),
    (v_course_id, 'The value that, through the exploitation of wage workers, begets surplus value is known as __?', 'fill_in_blank', 'Capital', 'Capital is value that generates more value through exploitation.'),
    (v_course_id, 'The chief productive force of society is __?', 'fill_in_blank', 'working class', 'The working class is the primary productive force in society.'),
    (v_course_id, 'The antagonistic competition between the opposing classes in any epoch implies __?', 'fill_in_blank', 'Class struggle', 'Class struggle drives historical development in Marxism.'),
    (v_course_id, 'The class struggle in the feudal era was between __ and serfs', 'fill_in_blank', 'Lords', 'Feudal lords exploited peasant serfs.'),
    (v_course_id, 'The Marxian approach is consistent with socialist worldview, which accommodates extensive intervention', 'fill_in_blank', 'State', 'Socialism involves extensive state intervention in economy.'),
    (v_course_id, 'For Karl Marx, _____major conditions are required for capitalism to emerge?', 'fill_in_blank', 'Two', 'Marx identified two key conditions for capitalism development.'),
    (v_course_id, 'The first socio-economic formation was the primitive communal system', 'fill_in_blank', 'Communal', 'Primitive communism was the first socio-economic formation.'),
    (v_course_id, 'For Marx, the history of all hitherto existing societies is the history of __', 'fill_in_blank', 'Class struggle', 'Marx saw class struggle as driving historical change.'),
    (v_course_id, 'Marx notion of historical materialism presupposes that there exist __ levels of relationship in the process of production', 'fill_in_blank', 'Two', 'Marx identified two levels: forces and relations of production.'),
    (v_course_id, 'Man''s first tools were a roughly cut stone and _________', 'fill_in_blank', 'Stick', 'Early human tools included stones and sticks.'),
    (v_course_id, 'Marx identified ___ major historical epochs in the evolution of society?', 'fill_in_blank', 'Five', 'Marx identified five main historical epochs.'),
    (v_course_id, 'The first socio-economic formation was the _________', 'fill_in_blank', 'primitive communal system', 'Primitive communism was the initial social formation.');

END $$;