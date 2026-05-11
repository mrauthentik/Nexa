DO $$ 
DECLARE 
    v_course_id UUID;
BEGIN 
    -- Get the course ID for MAC213
    SELECT id INTO v_course_id FROM courses WHERE code = 'MAC213' LIMIT 1;
    
    -- Q1 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'The term "research" has its etymological derivation from the French word ______.', 'fill_in_blank', 'recherche', 'The word "research" comes from the French word "recherche" meaning to investigate thoroughly.');
    
    -- Q2 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'NISER stands for:', 'multiple_choice', 'National Institute of Social Economic Research', 'National Institute of Scientific Economic Research', 'National Institute of Social Educational Research', 'National Institute of Scientific Educational Research', 'A', 'NISER stands for National Institute of Social Economic Research.');
    
    -- Q3 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Multinational corporations have departments whose major responsibility is research and product development called:', 'multiple_choice', 'Marketing departments', 'Research and Development departments', 'Human Resources departments', 'Finance departments', 'B', 'Research and Development departments handle research and product development in multinational corporations.');
    
    -- Q4 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'In the English language, the word research is composed of ______ syllables.', 'fill_in_blank', 'two', 'The word research is composed of two syllables: re-search.');
    
    -- Q5 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Man needs knowledge about the world around him so that:', 'multiple_choice', 'he can become wealthy', 'he can live a meaningful life on planet Earth', 'he can control others', 'he can avoid work', 'B', 'Knowledge enables humans to live meaningful lives on Earth.');
    
    -- Q6 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'According to Crosswell (2008), research is:', 'multiple_choice', 'a random collection of information', 'a process of steps used to collect and analyze information', 'only about laboratory experiments', 'exclusive to natural sciences', 'B', 'Crosswell defines research as a process of steps used to collect and analyze information.');
    
    -- Q7 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'According to Osuala (2005:1), research is the process of arriving at ______ solutions to problems through planned and systematic collection of data.', 'fill_in_blank', 'dependable', 'Osuala emphasizes that research leads to dependable solutions through systematic data collection.');
    
    -- Q8 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Which characteristic of research means following a rigid standard protocol?', 'multiple_choice', 'Empirical', 'Systematic', 'Critical', 'Rigorous', 'B', 'Systematic research follows a rigid standard protocol or logical sequence.');
    
    -- Q9 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Which characteristic means conclusions are based on hard evidence from fieldwork?', 'multiple_choice', 'Valid and verifiable', 'Empirical', 'Analytical', 'Organized', 'B', 'Empirical research bases conclusions on hard evidence from real-life experiences.');
    
    -- Q10 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, '______ implies that research exhibits careful and precise judgment.', 'fill_in_blank', 'Critical', 'Critical research involves careful and precise judgment in the research process.');
    
    -- Q11 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'The major purpose of research according to the document is to:', 'multiple_choice', 'make money', 'discover answers to questions through scientific procedures', 'prove personal opinions', 'create complicated theories', 'B', 'The primary purpose of research is to discover answers through scientific procedures.');
    
    -- Q12 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Which is NOT an objective of research according to Kotham (2009)?', 'multiple_choice', 'To contribute to knowledge', 'To gain familiarity with a phenomenon', 'To portray characteristics accurately', 'To promote personal biases', 'D', 'Research objectives include contributing to knowledge, gaining familiarity with phenomena, and accurate portrayal, but not promoting personal biases.');
    
    -- Q13 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, '______ implies that the researcher undertakes deep thinking and inquiry of things around him.', 'fill_in_blank', 'Intellectual curiosity', 'Intellectual curiosity drives researchers to deeply investigate their surroundings.');
    
    -- Q14 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Prudence in research means:', 'multiple_choice', 'being wealthy', 'conducting research at the right time and place efficiently', 'avoiding all risks', 'working alone', 'B', 'Prudence means conducting research wisely, efficiently and economically at the right time and place.');
    
    -- Q15 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Which value of research involves abandoning obsolete ideas?', 'multiple_choice', 'Research makes progress possible', 'Research leads to discovery of truth', 'Research leads to abandonment of invalid ideas', 'Research improves teachers competence', 'C', 'Research helps abandon obsolete and invalid ideas for new thinking.');
    
    -- Q16 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, '______ is a way of making sense out of the world, a way of explaining things that seem puzzling.', 'fill_in_blank', 'Theory', 'Theory provides explanations for puzzling phenomena in the world.');
    
    -- Q17 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'According to Onabajo (2010), theory and research are related through:', 'multiple_choice', 'personal opinion', 'the scientific method', 'financial resources', 'political ideology', 'B', 'Onabajo states theory and research are closely related through the scientific method.');
    
    -- Q18 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'A theory springs up from a ______ that begins a research.', 'multiple_choice', 'conclusion', 'hypothesis', 'funding source', 'personal interest', 'B', 'A theory typically originates from a hypothesis that initiates research.');
    
    -- Q19 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'The ______ approach means using research to test theories.', 'fill_in_blank', 'deduction', 'The deduction approach involves testing theories through research.');
    
    -- Q20 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'The two main research philosophies in social sciences are:', 'multiple_choice', 'quantitative and qualitative', 'positivistic and phenomenological', 'theoretical and practical', 'basic and applied', 'B', 'The main research philosophies are positivistic and phenomenological perspectives.');
    
    -- Q21 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Positivistic approach is also known as:', 'multiple_choice', 'qualitative approach', 'quantitative approach', 'phenomenological approach', 'exploratory approach', 'B', 'Positivistic approach is synonymous with quantitative approach.');
    
    -- Q22 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Phenomenological approach is also known as ______ approach.', 'fill_in_blank', 'qualitative', 'Phenomenological approach is the qualitative approach to research.');
    
    -- Q23 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Qualitative research is especially important in behavioral sciences to:', 'multiple_choice', 'count large populations', 'discover underlying motives of human behavior', 'conduct statistical analysis', 'measure physical properties', 'B', 'Qualitative research helps discover underlying motives in behavioral sciences.');
    
    -- Q24 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Data analysis in quantitative research is mainly:', 'multiple_choice', 'narrative description', 'statistical or deductive', 'theoretical speculation', 'personal interpretation', 'B', 'Quantitative research uses statistical or deductive data analysis.');
    
    -- Q25 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Research can be classified according to purpose as basic (fundamental) or ______.', 'fill_in_blank', 'applied', 'Research is classified as basic/fundamental or applied based on purpose.');
    
    -- Q26 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Applied research aims at:', 'multiple_choice', 'theory development only', 'finding solutions for immediate problems', 'academic purposes only', 'philosophical speculation', 'B', 'Applied research focuses on solving immediate practical problems.');
    
    -- Q27 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Basic research is conducted for:', 'multiple_choice', 'immediate profit', 'academic purposes', 'political campaigns', 'marketing products', 'B', 'Basic research is conducted primarily for academic purposes.');
    
    -- Q28 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'A very convenient way of classifying research is by ______.', 'fill_in_blank', 'design', 'Research design is a common classification method for research studies.');
    
    -- Q29 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'According to Popoola (2002), how many basic types of research designs are there?', 'multiple_choice', 'Two', 'Three', 'Four', 'Five', 'B', 'Popoola identifies three basic types: analytical, experimental and descriptive.');
    
    -- Q30 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'The term "ex post facto research" is used for:', 'multiple_choice', 'experimental designs', 'descriptive research designs', 'analytical designs', 'qualitative designs', 'B', 'Ex post facto research refers to descriptive research designs.');
    
    -- Q31 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Quantitative research designs include experimental research, survey research and ______.', 'fill_in_blank', 'content analysis', 'Content analysis is a quantitative research design method.');
    
    -- Q32 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Which research design is most frequently used to study cause and effect relationships?', 'multiple_choice', 'Descriptive research', 'Experimental research', 'Historical research', 'Ethnographic research', 'B', 'Experimental research is best for studying cause-effect relationships.');
    
    -- Q33 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'In experimental research, the researcher:', 'multiple_choice', 'only observes phenomena', 'manipulates one or more variables', 'analyzes historical documents', 'conducts surveys only', 'B', 'Experimental research involves manipulating variables to study effects.');
    
    -- Q34 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Survey research is about the most popular research design among ______ researchers.', 'fill_in_blank', 'social and management sciences', 'Survey research is widely used in social and management sciences.');
    
    -- Q35 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'The popularity of survey research derives from its:', 'multiple_choice', 'complexity and cost', 'versatility, efficiency and generalizability', 'subjectivity and bias', 'exclusivity and secrecy', 'B', 'Survey research is popular due to versatility, efficiency and generalizability.');
    
    -- Q36 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Generalizability in survey research means:', 'multiple_choice', 'results apply only to the sample', 'results can be applied to larger population', 'research is always correct', 'research is expensive', 'B', 'Generalizability means sample results can be applied to the larger population.');
    
    -- Q37 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, '______ survey documents current conditions or attitudes.', 'fill_in_blank', 'Descriptive', 'Descriptive surveys document existing conditions or attitudes.');
    
    -- Q38 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Which research design was originally peculiar to communication researchers?', 'multiple_choice', 'Experimental research', 'Content analysis', 'Ethnography', 'Historical research', 'B', 'Content analysis was originally unique to communication researchers.');
    
    -- Q39 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'The major concepts in content analysis are:', 'multiple_choice', 'subjective, biased, qualitative', 'systematic, objective, quantitative', 'random, personal, narrative', 'theoretical, philosophical, abstract', 'B', 'Content analysis emphasizes systematic, objective and quantitative analysis.');
    
    -- Q40 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'FGD stands for ______.', 'fill_in_blank', 'Focus group discussion', 'FGD is the abbreviation for Focus Group Discussion.');
    
    -- Q41 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'In a focus group, how many people are typically interviewed simultaneously?', 'multiple_choice', '1-3', '6-12', '20-30', '50-100', 'B', 'Focus groups typically involve 6-12 participants in unstructured discussion.');
    
    -- Q42 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Observational research is based on:', 'multiple_blank', 'things imagined', 'things seen', 'things heard only', 'things predicted', 'B', 'Observational research is based on direct observation of phenomena.');
    
    -- Q43 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Historical research relies significantly on ______ and logical reasoning.', 'fill_in_blank', 'inductive', 'Historical research uses inductive reasoning along with logical reasoning.');
    
    -- Q44 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Ethnography is the study of:', 'multiple_choice', 'historical documents only', 'an intact group in its natural context', 'laboratory experiments', 'statistical data', 'B', 'Ethnography studies intact groups in their natural contexts over time.');
    
    -- Q45 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Case studies are routinely utilized in:', 'multiple_choice', 'business, medicine and law', 'astronomy only', 'mathematics only', 'physics only', 'A', 'Case studies are commonly used in business, medicine and law fields.');
    
    -- Q46 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'There are ______ types of literature review designs.', 'fill_in_blank', 'three', 'The three types are narrative, systematic and meta-analysis.');
    
    -- Q47 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Evaluation research determines:', 'multiple_choice', 'historical trends', 'how well a program achieves its goals', 'theoretical frameworks', 'statistical formulas', 'B', 'Evaluation research assesses program effectiveness against stated goals.');
    
    -- Q48 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Phenomenology is rooted in:', 'multiple_choice', 'biology', 'philosophy', 'economics', 'engineering', 'B', 'Phenomenology has its foundations in philosophical traditions.');
    
    -- Q49 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, '______ reverses the approach in research which emphasizes data collection to test theories.', 'fill_in_blank', 'Grounded theory', 'Grounded theory emphasizes generating theory from data rather than testing existing theories.');
    
    -- Q50 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Research based on hard data with hypotheses and statistical tests is called:', 'multiple_choice', 'conceptual research', 'empirical research', 'philosophical research', 'theoretical research', 'B', 'Empirical research uses hard data, hypotheses and statistical testing.');
    
    -- Q51 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Triangulation is also referred to as:', 'multiple_choice', 'single method', 'mixed methods', 'quantitative only', 'qualitative only', 'B', 'Triangulation involves mixing quantitative and qualitative methods.');
    
    -- Q52 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Research can be classified from point of view of time as one-time or ______ research.', 'fill_in_blank', 'longitudinal', 'Longitudinal research studies phenomena over extended time periods.');
    
    -- Q53 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'The objective of exploratory research is:', 'multiple_choice', 'hypothesis testing', 'development of hypotheses', 'final conclusions', 'statistical proof', 'B', 'Exploratory research focuses on hypothesis development rather than testing.');
    
    -- Q54 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Research involving firsthand observation by the researcher is called:', 'multiple_choice', 'secondary research', 'primary research', 'tertiary research', 'desk research', 'B', 'Primary research involves direct data collection by the researcher.');
    
    -- Q55 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Secondary research is also known as ______ research.', 'fill_in_blank', 'library or desk', 'Secondary research uses existing sources, hence called library or desk research.');
    
    -- Q56 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'According to Starks and Roberts (2002), what is often a very reliable way of knowledge?', 'multiple_choice', 'intuition', 'experience', 'guesswork', 'dreams', 'B', 'Experience is considered a reliable source of knowledge according to Starks and Roberts.');
    
    -- Q57 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'The word "science" is derived from:', 'multiple_choice', 'Greek word "scientia"', 'Latin word "scientia"', 'French word "science"', 'German word "wissenschaft"', 'B', 'Science comes from the Latin "scientia" meaning knowledge.');
    
    -- Q58 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Science as it applies to natural sciences uses mostly observation and ______.', 'fill_in_blank', 'experimentation', 'Natural sciences rely on observation and experimentation to understand phenomena.');
    
    -- Q59 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'According to Wimmer and Dominick (2011), how many basic tenets distinguish scientific methods?', 'multiple_choice', 'Three', 'Five', 'Seven', 'Ten', 'B', 'Wimmer and Dominick identify five basic tenets of scientific methods.');
    
    -- Q60 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Science is described as:', 'multiple_choice', 'individual and private', 'collective and public', 'secretive and exclusive', 'random and chaotic', 'B', 'Scientific knowledge is collective and publicly shared.');
    
    -- Q61 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Scientific method is a body of techniques for investigating ______.', 'fill_in_blank', 'phenomena', 'The scientific method provides techniques for investigating various phenomena.');
    
    -- Q62 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What forms the core of the scientific method?', 'multiple_choice', 'intuition', 'the process of inquiry', 'financial resources', 'political support', 'B', 'The process of inquiry is central to the scientific method.');
    
    -- Q63 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Media research is:', 'multiple_choice', 'application of scientific method to mass media study', 'only about journalism practice', 'exclusive to television', 'non-scientific in nature', 'A', 'Media research applies scientific methods to study mass media.');
    
    -- Q64 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'According to Wimmer and Dominick (2011), mass media research has evolved in ______ definable stages.', 'fill_in_blank', 'four', 'Mass media research development occurred in four distinct stages.');
    
    -- Q65 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'A concept is:', 'multiple_choice', 'always a physical object', 'an abstraction formed by generalizations', 'only used in mathematics', 'the same as a theory', 'B', 'A concept is an abstraction formed by generalizing from particulars.');
    
    -- Q66 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Construct has been described as:', 'multiple_choice', 'lower concept', 'higher concept', 'simple concept', 'basic concept', 'B', 'A construct is considered a higher-level concept created for specific purposes.');
    
    -- Q67 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'The bedrock of research is to answer as many ______ as possible.', 'fill_in_blank', 'questions', 'Research fundamentally aims to answer questions about phenomena.');
    
    -- Q68 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Research questions are abbreviated as:', 'multiple_choice', 'RH', 'RQ', 'RS', 'RT', 'B', 'Researchers abbreviate research questions as RQ.');
    
    -- Q69 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'According to Ajala (1996), research questions are used when:', 'multiple_choice', 'researcher is sure about the problem', 'researcher is unsure about problem nature', 'funding is abundant', 'time is limited', 'B', 'Research questions help when researchers are uncertain about problem nature.');
    
    -- Q70 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'A ______ is a tentative prediction about relationship between variables.', 'fill_in_blank', 'hypothesis', 'A hypothesis makes tentative predictions about variable relationships.');
    
    -- Q71 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Hypotheses are always in:', 'multiple_choice', 'question form', 'declarative sentence form', 'poetic form', 'bullet points', 'B', 'Hypotheses are expressed as declarative statements, not questions.');
    
    -- Q72 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Hypotheses are abbreviated as:', 'multiple_choice', 'H', 'HP', 'HT', 'HS', 'A', 'Researchers use H as abbreviation for hypotheses.');
    
    -- Q73 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Hypotheses can either be ______ or inductive.', 'fill_in_blank', 'deductive', 'Hypotheses can follow deductive or inductive reasoning approaches.');
    
    -- Q74 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Research hypothesis can be either:', 'multiple_choice', 'directional only', 'non-directional only', 'directional or non-directional', 'neutral only', 'C', 'Research hypotheses can be directional or non-directional in nature.');
    
    -- Q75 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'The hypothesis opposite of the positively stated one is called:', 'multiple_choice', 'alternative hypothesis', 'null hypothesis', 'research hypothesis', 'directional hypothesis', 'B', 'The null hypothesis represents the opposite of the research hypothesis.');
    
    -- Q76 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'In general, quantitative research favors the ______.', 'fill_in_blank', 'hypothesis', 'Quantitative research typically emphasizes hypothesis testing.');
    
    -- Q77 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Research question is preferred in:', 'multiple_choice', 'quantitative research', 'qualitative research', 'mixed methods', 'experimental research', 'B', 'Qualitative research often uses research questions rather than hypotheses.');
    
    -- Q78 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'How many types of hypotheses are identified in the document?', 'multiple_choice', 'Two', 'Three', 'Four', 'Five', 'B', 'Three types: descriptive, comparative, and relational hypotheses.');
    
    -- Q79 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'In ______ hypothesis, there is just one variable describing an action.', 'fill_in_blank', 'descriptive', 'Descriptive hypotheses involve single variables describing actions.');
    
    -- Q80 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Hypothesis testing involves how many steps?', 'multiple_choice', 'Three', 'Four', 'Five', 'Six', 'B', 'Hypothesis testing follows a four-step procedure.');
    
    -- Q81 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'The most common research instrument for obtaining data is:', 'multiple_choice', 'interview', 'questionnaire', 'observation', 'experiment', 'B', 'Questionnaires are the most common data collection instrument.');
    
    -- Q82 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Questionnaire could be close ended or ______.', 'fill_in_blank', 'open ended', 'Questionnaires can use closed-ended or open-ended question formats.');
    
    -- Q83 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Interview is an oral form of:', 'multiple_choice', 'observation', 'questionnaire', 'experiment', 'content analysis', 'B', 'Interviews are essentially oral versions of questionnaires.');
    
    -- Q84 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'A term constantly used in research that represents measurable concepts is:', 'multiple_choice', 'constant', 'variable', 'theory', 'hypothesis', 'B', 'Variables are fundamental concepts representing measurable phenomena.');
    
    -- Q85 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'The opposite of variable is ______ as it has only one attribute.', 'fill_in_blank', 'constant', 'Constants have fixed values unlike variables which can vary.');
    
    -- Q86 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'A variable that is selected or controlled by the researcher is called:', 'multiple_choice', 'dependent variable', 'independent variable', 'intervening variable', 'moderator variable', 'B', 'Independent variables are manipulated or controlled by researchers.');
    
    -- Q87 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'The variable being measured as an outcome is called:', 'multiple_choice', 'independent variable', 'dependent variable', 'control variable', 'confounding variable', 'B', 'Dependent variables represent outcomes or effects being measured.');
    
    -- Q88 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Intervening variables is also known as ______ variables.', 'fill_in_blank', 'mediating', 'Intervening variables mediate relationships between independent and dependent variables.');
    
    -- Q89 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'If variable values can be divided into fractions, it is called:', 'multiple_choice', 'continuous variable', 'discontinuous variable', 'discrete variable', 'categorical variable', 'A', 'Continuous variables can take fractional values within a range.');
    
    -- Q90 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'How many types of operational definitions are there?', 'multiple_choice', 'One', 'Two', 'Three', 'Four', 'B', 'Two types: measured and experimental operational definitions.');
    
    -- Q91 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'A ______ operational definition specifies how to measure a variable.', 'fill_in_blank', 'measured', 'Measured operational definitions specify measurement procedures for variables.');
    
    -- Q92 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'According to Tejumaiye (2003), measurement is:', 'multiple_choice', 'ignoring data', 'assignment of numerals to objects according to rules', 'random guessing', 'subjective opinion', 'B', 'Measurement systematically assigns numerals to objects following rules.');
    
    -- Q93 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'How many levels of measurement are identified?', 'multiple_choice', 'Two', 'Three', 'Four', 'Five', 'C', 'Four levels: nominal, ordinal, interval, and ratio.');
    
    -- Q94 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'According to Wimmer and Dominick (2011), ______ is the weakest form of measurement.', 'fill_in_blank', 'nominal', 'Nominal measurement is the most basic level with limited mathematical properties.');
    
    -- Q95 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Nominal scale deals with:', 'multiple_choice', 'quantitative measurements', 'names, categories, or labels', 'precise rankings', 'mathematical calculations', 'B', 'Nominal measurement categorizes data without quantitative meaning.');
    
    -- Q96 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Ordinal measurement has to do with:', 'multiple_choice', 'precise quantification', 'ranking', 'mathematical operations', 'experimental control', 'B', 'Ordinal measurement involves ranking or ordering categories.');
    
    -- Q97 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'The most common example of an interval scale is ______.', 'fill_in_blank', 'temperature', 'Temperature measurement uses interval scales with equal intervals but no true zero.');
    
    -- Q98 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'The highest level of measurement is:', 'multiple_choice', 'nominal', 'ordinal', 'interval', 'ratio', 'D', 'Ratio measurement is the highest level with a true zero point.');
    
    -- Q99 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Examples of ratio measures include:', 'multiple_choice', 'temperature in Celsius', 'beauty pageant rankings', 'time and distance', 'political party affiliation', 'C', 'Time and distance are classic examples of ratio measurement.');
    
    -- Q100 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'The most commonly used scales is called ______ scale.', 'fill_in_blank', 'Likert', 'Likert scales are the most widely used measurement scales in social research.');
    
    -- Q101 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Likert scale is also called:', 'multiple_choice', 'scalogram analysis', 'summated rating approach', 'equal-appearing interval', 'social distance scale', 'B', 'Likert scales use summated rating approaches for attitude measurement.');
    
    -- Q102 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Guttman scale is also called:', 'multiple_choice', 'summated rating', 'scalogram analysis', 'semantic differential', 'Thurstone scale', 'B', 'Guttman scales use scalogram analysis techniques.');
    
    -- Q103 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Thurstone scale is also called ______ scales.', 'fill_in_blank', 'equal-appearing interval', 'Thurstone scales use equal-appearing interval techniques.');
    
    -- Q104 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Every measurement scale must have two qualities:', 'multiple_choice', 'beauty and simplicity', 'validity and reliability', 'length and width', 'cost and time', 'B', 'Validity and reliability are essential psychometric properties.');
    
    -- Q105 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Reliability is concerned with:', 'multiple_choice', 'what is being measured', 'accuracy of measuring instrument', 'theoretical frameworks', 'research funding', 'B', 'Reliability refers to consistency and accuracy of measurements.');
    
    -- Q106 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'An instrument can be said to be reliable if it constantly gives the ______ answer.', 'fill_in_blank', 'same', 'Reliable instruments produce consistent results under similar conditions.');
    
    -- Q107 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'According to Wimmer and Dominick, reliability consists of how many components?', 'multiple_choice', 'Two', 'Three', 'Four', 'Five', 'B', 'Three components: stability, internal consistency and equivalency.');
    
    -- Q108 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Validity is concerned with:', 'multiple_choice', 'cost of research', 'what the study actually measures', 'length of questionnaire', 'number of respondents', 'B', 'Validity refers to whether research measures what it intends to measure.');
    
    -- Q109 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'There are ______ major types of validity.', 'fill_in_blank', 'four', 'Four major types: face, predictive, construct, and concurrent validity.');
    
    -- Q110 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Predictive validity is also called:', 'multiple_choice', 'face validity', 'criterion-oriented validity', 'construct validity', 'concurrent validity', 'B', 'Predictive validity assesses future outcomes, hence criterion-oriented.');
    
    -- Q111 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'The most complex type of validity is:', 'multiple_choice', 'face validity', 'predictive validity', 'construct validity', 'concurrent validity', 'C', 'Construct validity is most complex as it involves theoretical frameworks.');
    
    -- Q112 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'The word "experimentation" is derived from Latin word ______.', 'fill_in_blank', 'experiri', 'Experimentation comes from Latin "experiri" meaning to try or test.');
    
    -- Q113 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Experiments are carried out to determine:', 'multiple_choice', 'only theoretical concepts', 'causal relationships between variables', 'historical trends', 'personal opinions', 'B', 'Experiments establish causal relationships between variables.');
    
    -- Q114 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Group Experimental Design takes two forms:', 'multiple_choice', 'simple and complex', 'single variable and factorial design', 'qualitative and quantitative', 'theoretical and applied', 'B', 'Group designs include single variable and factorial designs.');
    
    -- Q115 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, '______ have one-shot case studies, one-group pretest posttest design.', 'fill_in_blank', 'Pre-experimental designs', 'Pre-experimental designs have limited control and include these basic designs.');
    
    -- Q116 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'True Experimental designs can be classified into:', 'multiple_choice', 'only one type', 'posttest-only, pretest-posttest, Solomon four group', 'only qualitative designs', 'only field experiments', 'B', 'True experiments include posttest-only, pretest-posttest, and Solomon designs.');
    
    -- Q117 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'How many types of single subject experimental design are there?', 'multiple_choice', 'One', 'Two', 'Three', 'Four', 'C', 'Three types: A-B-A withdrawal, multiple-baseline, alternating treatments.');
    
    -- Q118 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'The two basic types of experimental research are laboratory and ______.', 'fill_in_blank', 'field experimentation', 'Experiments can be conducted in controlled labs or real-world field settings.');
    
    -- Q119 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Laboratory experiments are subject to researcher jurisdiction because:', 'multiple_choice', 'they are always unethical', 'researcher controls conditions', 'they are never accurate', 'they are too expensive', 'B', 'Researchers control laboratory conditions, procedures, and variables.');
    
    -- Q120 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'How many categories of field experiments are identified?', 'multiple_choice', 'One', 'Two', 'Three', 'Four', 'B', 'Field experiments are categorized into two main types.');
    
    -- Q121 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Survey research may be used for ______, explanatory and exploratory purposes.', 'fill_in_blank', 'descriptive', 'Surveys serve descriptive, explanatory, and exploratory research purposes.');
    
    -- Q122 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Survey research is probably the most widely used method according to:', 'multiple_choice', 'Babbie (2010)', 'Wimmer and Dominick', 'Kerlinger', 'Onabajo', 'A', 'Babbie notes surveys are the most widely used social research method.');
    
    -- Q123 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'How many major types of surveys are identified?', 'multiple_choice', 'Two', 'Three', 'Four', 'Five', 'A', 'Two major types: descriptive and analytical surveys.');
    
    -- Q124 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'A ______ survey makes an attempt to describe what exists at the moment.', 'fill_in_blank', 'descriptive', 'Descriptive surveys document current conditions or situations.');
    
    -- Q125 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Analytical survey deals with:', 'multiple_choice', 'the "why" of situations', 'only counting people', 'personal opinions', 'historical data', 'A', 'Analytical surveys explain why situations exist (the "why").');
    
    -- Q126 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'According to Wimmer and Dominick, how many basic methods for gathering survey data?', 'multiple_choice', 'Three', 'Four', 'Five', 'Six', 'C', 'Five basic methods: mail, telephone, personal interview, group, internet.');
    
    -- Q127 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'CAPI stands for ______.', 'fill_in_blank', 'computer-assisted personal interviewing', 'CAPI involves computer-assisted personal interviewing techniques.');
    
    -- Q128 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Mail surveys involve:', 'multiple_choice', 'face-to-face interviews', 'sending self-administered questionnaires', 'telephone calls', 'online forms only', 'B', 'Mail surveys use mailed questionnaires with return envelopes.');
    
    -- Q129 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'How many basic types of interviews are identified?', 'multiple_choice', 'Two', 'Three', 'Four', 'Five', 'A', 'Two types: structured and unstructured interviews.');
    
    -- Q130 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'In a ______ interview, questions are standardized and asked in predetermined order.', 'fill_in_blank', 'structured', 'Structured interviews use standardized questions in fixed sequence.');
    
    -- Q131 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'An online tool for creating questionnaires mentioned is:', 'multiple_choice', 'Facebook', 'Survey Monkey', 'Google Forms', 'Twitter', 'B', 'Survey Monkey is specifically mentioned as an online survey tool.');
    
    -- Q132 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'The data collection instrument for survey research is:', 'multiple_choice', 'microscope', 'questionnaire', 'thermometer', 'scale', 'B', 'Questionnaires are the primary data collection tool for surveys.');
    
    -- Q133 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Good questionnaires should be ______ and concise.', 'fill_in_blank', 'short', 'Effective questionnaires should be brief and to the point.');
    
    -- Q134 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Types of survey questions are:', 'multiple_choice', 'easy and difficult', 'open-ended and close-ended', 'long and short', 'personal and impersonal', 'B', 'Two main types: open-ended and close-ended questions.');
    
    -- Q135 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Close-ended questions refer to:', 'multiple_choice', 'questions with no answers', 'questions with provided answer choices', 'essay questions', 'ambiguous questions', 'B', 'Close-ended questions provide predetermined answer options.');
    
    -- Q136 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Response rate is also known as ______ rate.', 'fill_in_blank', 'completion or return', 'Response rate measures the proportion of completed/returned questionnaires.');
    
    -- Q137 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Content analysis involves study of:', 'multiple_choice', 'only live conversations', 'recorded human communication', 'biological specimens', 'chemical reactions', 'B', 'Content analysis examines recorded communications like texts, media.');
    
    -- Q138 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'According to Kerlinger (2000), content analysis is:', 'multiple_choice', 'subjective and qualitative', 'systematic, objective and quantitative', 'random and unstructured', 'theoretical only', 'B', 'Kerlinger defines it as systematic, objective, quantitative analysis.');
    
    -- Q139 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'The most basic element of content analysis is ______.', 'fill_in_blank', 'units of analysis', 'Units of analysis are the fundamental components examined in content analysis.');
    
    -- Q140 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Content categories must be:', 'multiple_choice', 'mutually exhaustive and exclusive', 'overlapping and inclusive', 'random and arbitrary', 'subjective and personal', 'A', 'Categories should cover all content (exhaustive) without overlap (exclusive).');
    
    -- Q141 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Coding in content analysis involves:', 'multiple_choice', 'only counting words', 'placing units into categories', 'conducting interviews', 'designing experiments', 'B', 'Coding classifies content units into predetermined categories.');
    
    -- Q142 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Case study is a research method that is ______ in nature.', 'fill_in_blank', 'qualitative', 'Case studies are primarily qualitative research methods.');
    
    -- Q143 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'How many stages are involved in conducting a case study?', 'multiple_choice', 'Three', 'Four', 'Five', 'Six', 'C', 'Five stages: design, pilot study, data collection, analysis, report writing.');
    
    -- Q144 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Case studies are particularistic means they:', 'multiple_choice', 'focus on general populations', 'focus on specific events/situations', 'use only statistics', 'ignore details', 'B', 'Particularistic means focusing on specific cases or situations.');
    
    -- Q145 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Observational research is more concerned with ______ and explanation than measurement.', 'fill_in_blank', 'description', 'Observational research emphasizes description and understanding over quantification.');
    
    -- Q146 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'How many stages in observational research?', 'multiple_choice', 'Four', 'Five', 'Six', 'Seven', 'C', 'Six stages: choosing site, access, sampling, collection, analysis, exiting.');
    
    -- Q147 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Ethnographic research involves:', 'multiple_choice', 'short online surveys', 'living with and observing cultures', 'laboratory experiments', 'statistical analysis only', 'B', 'Ethnography involves extended immersion in cultural settings.');
    
    -- Q148 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'There are ______ main forms of longitudinal research.', 'fill_in_blank', 'three', 'Three forms: trend studies, cohort analysis, and panel studies.');
    
    -- Q149 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Trend studies involve:', 'multiple_choice', 'same group over time', 'different groups from same population at different times', 'only one time point', 'only historical data', 'B', 'Trend studies sample different groups from same population over time.');
    
    -- Q150 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Focus group is also referred to as:', 'multiple_choice', 'individual interviewing', 'group interviewing', 'self-administered survey', 'content analysis', 'B', 'Focus groups involve group interviewing techniques.');
    
    -- Q151 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'In-depth interview could also be called ______ interview.', 'fill_in_blank', 'intensive or depth', 'In-depth interviews are also known as intensive or depth interviews.');
    
    -- Q152 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'In-depth interviews typically use:', 'multiple_choice', 'large random samples', 'smaller samples', 'entire populations', 'no samples', 'B', 'In-depth interviews use smaller, often purposive samples.');
    
    -- Q153 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Population is defined as:', 'multiple_choice', 'only people in a country', 'totality of items in a universe under study', 'sample selected for study', 'only respondents in a survey', 'B', 'Population includes all elements of interest in a study universe.');
    
    -- Q154 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'A ______ is a fractional or subset of the population selected for study.', 'fill_in_blank', 'sample', 'A sample is a subset drawn from the larger population for study.');
    
    -- Q155 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'The process of taking samples is known as:', 'multiple_choice', 'analysis', 'sampling', 'measurement', 'experimentation', 'B', 'Sampling is the process of selecting a subset from a population.');
    
    -- Q156 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'How many broad sampling techniques are identified?', 'multiple_choice', 'One', 'Two', 'Three', 'Four', 'B', 'Two broad categories: probability and non-probability sampling.');
    
    -- Q157 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'A ______ is a document containing all items in a universe of study.', 'fill_in_blank', 'sampling frame', 'Sampling frames list all population members for sample selection.');
    
    -- Q158 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Probability sampling methods include:', 'multiple_choice', 'only convenience sampling', 'simple random, stratified, cluster, systematic', 'only purposive sampling', 'only snowball sampling', 'B', 'Probability methods include random, stratified, cluster, systematic.');
    
    -- Q159 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Simple random sampling gives every member:', 'multiple_choice', 'no chance of selection', 'an equal chance of selection', 'higher chance if wealthy', 'lower chance if educated', 'B', 'Simple random sampling provides equal selection probability for all.');
    
    -- Q160 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'In ______ sampling, every nth individual is selected.', 'fill_in_blank', 'systematic', 'Systematic sampling selects every nth element from a sampling frame.');
    
    -- Q161 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Stratified sampling involves:', 'multiple_choice', 'dividing population into similar groups', 'selecting only convenient members', 'using referrals', 'ignoring subgroups', 'A', 'Stratification divides population into homogeneous subgroups.');
    
    -- Q162 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Cluster sampling is used when:', 'multiple_choice', 'population is geographically dispersed', 'list of all members is available', 'small population only', 'homogeneous population', 'A', 'Cluster sampling suits geographically dispersed populations.');
    
    -- Q163 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Non-probability sampling is based on researcher''s ______.', 'fill_in_blank', 'judgment', 'Non-probability sampling relies on researcher judgment rather than random selection.');
    
    -- Q164 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Convenience sampling is also called:', 'multiple_choice', 'random sampling', 'accidental, available or opportunity sampling', 'stratified sampling', 'systematic sampling', 'B', 'Convenience sampling uses readily available subjects (accidental/opportunity).');
    
    -- Q165 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Purposive sampling is also known as:', 'multiple_choice', 'random sampling', 'judgmental, selective or subjective sampling', 'cluster sampling', 'systematic sampling', 'B', 'Purposive sampling uses researcher judgment (judgmental/selective).');
    
    -- Q166 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, '______ sampling is useful for locating hard-to-find participants.', 'fill_in_blank', 'Snowball', 'Snowball sampling uses participant referrals to access hidden populations.');
    
    -- Q167 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Quota sampling is based on:', 'multiple_choice', 'random selection', 'pre-specified characteristics', 'geographic location only', 'time constraints only', 'B', 'Quota sampling ensures sample matches population characteristics.');
    
    -- Q168 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Sampling error is also called:', 'multiple_choice', 'sampling frame', 'margin of error', 'population error', 'measurement error', 'B', 'Sampling error is expressed as margin of error in statistics.');
    
    -- Q169 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'The first important step after topic selection is writing a ______.', 'fill_in_blank', 'research proposal', 'Research proposals outline planned research before implementation.');
    
    -- Q170 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'A research proposal is also known as:', 'multiple_choice', 'post-field', 'pre-field', 'mid-field', 'fieldwork', 'B', 'Research proposals are pre-field planning documents.');
    
    -- Q171 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Statement of research problem usually ends in how many forms?', 'multiple_choice', 'One', 'Two', 'Three', 'Four', 'C', 'Three forms: statement, question, or hypothesis.');
    
    -- Q172 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'CSR stands for ______.', 'fill_in_blank', 'Corporate Social Responsibility', 'CSR refers to Corporate Social Responsibility initiatives.');
    
    -- Q173 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Research questions are similar to hypotheses except:', 'multiple_choice', 'hypothesis is a statement', 'both are the same', 'both are questions', 'hypothesis is always wrong', 'A', 'Hypotheses are statements while research questions are questions.');
    
    -- Q174 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Significance of study is important because it:', 'multiple_choice', 'makes research unique and important', 'lists limitations only', 'describes methodology only', 'provides references only', 'A', 'Significance explains research uniqueness and importance.');
    
    -- Q175 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Limitations of study have to do with problems ______ by the researcher.', 'fill_in_blank', 'encountered', 'Limitations refer to problems or constraints faced during research.');
    
    -- Q176 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Literature review helps to:', 'multiple_choice', 'only list references', 'provide conceptual framework', 'ignore previous research', 'avoid methodology', 'B', 'Literature reviews provide theoretical/conceptual foundations.');
    
    -- Q177 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Research population refers to:', 'multiple_choice', 'only sample selected', 'group from which samples are drawn', 'only respondents', 'only researchers', 'B', 'Population is the entire group from which samples are drawn.');
    
    -- Q178 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Instruments for data collection include questionnaire and ______ sheet.', 'fill_in_blank', 'coding', 'Coding sheets are used for content analysis data collection.');
    
    -- Q179 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'A research proposal contains how many chapters?', 'multiple_choice', 'One', 'Two', 'Three', 'Four', 'C', 'Research proposals typically have three chapters.');
    
    -- Q180 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Data refers to:', 'multiple_choice', 'only numbers', 'only words', 'raw facts and figures', 'only conclusions', 'C', 'Data are raw facts and figures collected for analysis.');
    
    -- Q181 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'There are ______ types of data.', 'fill_in_blank', 'two', 'Two main types: quantitative and qualitative data.');
    
    -- Q182 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Qualitative data is also known as:', 'multiple_choice', 'measurement data', 'categorical data', 'numerical data', 'statistical data', 'B', 'Qualitative data is categorical (non-numerical) data.');
    
    -- Q183 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'When categories don''t follow natural ordering, they are:', 'multiple_choice', 'ordinal data', 'nominal data', 'interval data', 'ratio data', 'B', 'Nominal data categories have no inherent order.');
    
    -- Q184 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Quantitative data could be discrete or ______.', 'fill_in_blank', 'continuous', 'Quantitative data includes discrete (counted) and continuous (measured) types.');
    
    -- Q185 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Primary sources of data include:', 'multiple_choice', 'only books', 'data collected directly by researcher', 'only internet sources', 'only government reports', 'B', 'Primary data is collected firsthand by the researcher.');
    
    -- Q186 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Secondary sources refer to data:', 'multiple_choice', 'collected directly', 'not directly collected by researcher', 'only from experiments', 'only from observations', 'B', 'Secondary data is collected by others, not the current researcher.');
    
    -- Q187 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'The process of making meaning from data is known as ______.', 'fill_in_blank', 'data analysis', 'Data analysis transforms raw data into meaningful information.');
    
    -- Q188 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'How many types of data analyses are identified?', 'multiple_choice', 'One', 'Two', 'Three', 'Four', 'B', 'Two broad types: descriptive and inferential analysis.');
    
    -- Q189 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Descriptive analysis involves:', 'multiple_choice', 'predicting future trends', 'summarizing main features of data', 'testing hypotheses', 'making population inferences', 'B', 'Descriptive analysis summarizes and describes data characteristics.');
    
    -- Q190 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Inferential data analysis is used to make assertions about ______.', 'fill_in_blank', 'larger population', 'Inferential statistics generalize from samples to populations.');
    
    -- Q191 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'How many methods are used in descriptive statistics?', 'multiple_choice', 'One', 'Two', 'Three', 'Four', 'B', 'Two methods: data distribution and summary statistics.');
    
    -- Q192 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'One descriptive statistical tool under data distribution is:', 'multiple_choice', 'hypothesis testing', 'tabulation', 'regression', 'correlation', 'B', 'Tabulation organizes data into tables for distribution analysis.');
    
    -- Q193 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Measures of central tendency determine the ______ score of a distribution.', 'fill_in_blank', 'typical', 'Central tendency measures identify typical or average values in data.');
    
    -- Q194 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'The most widely used measure of central tendency is:', 'multiple_choice', 'mode', 'median', 'mean', 'range', 'C', 'Mean (average) is the most commonly used central tendency measure.');
    
    -- Q195 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Median is the:', 'multiple_choice', 'most frequent value', 'middle value', 'average value', 'highest value', 'B', 'Median represents the middle value in an ordered distribution.');
    
    -- Q196 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Mode is the value that occurs most ______.', 'fill_in_blank', 'frequently', 'Mode identifies the most frequently occurring value in data.');
    
    -- Q197 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Measure of dispersion is also known as:', 'multiple_choice', 'central tendency', 'measure of variation', 'average', 'mean', 'B', 'Dispersion measures (variation) show data spread or scatter.');
    
    -- Q198 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'The simplest measure of dispersion is:', 'multiple_choice', 'variance', 'standard deviation', 'range', 'mean', 'C', 'Range (difference between highest and lowest) is simplest dispersion measure.');
    
    -- Q199 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Inferential statistics is used and expressed through ______ testing.', 'fill_in_blank', 'hypothesis', 'Inferential statistics primarily involves hypothesis testing procedures.');
    
    -- Q200 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Null hypothesis is denoted by:', 'multiple_choice', 'H0', 'H1', 'H2', 'H3', 'A', 'Null hypothesis is conventionally represented as H0.');
    
END $$;