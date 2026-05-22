DO $$ 
DECLARE 
    v_course_id UUID;
BEGIN 
    SELECT id INTO v_course_id FROM courses WHERE code = 'GST103' LIMIT 1;

    -- Q1 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is the basic definition of a computer?', 'multiple_choice', 'A tool for communication', 'A tool or machine used for processing data to give required information', 'A device for entertainment only', 'A machine for typing documents', 'B', 'A computer is defined as a tool or machine used for processing data to give required information.');

    -- Q2 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'The term _____ refers to raw facts about a person, object or place.', 'fill_in_blank', 'Data', 'Raw facts are referred to as data.');

    -- Q3 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is information?', 'multiple_choice', 'Raw facts', 'Processed data or meaningful statement', 'Computer hardware', 'Input devices', 'B', 'Information is processed data or a meaningful statement.');

    -- Q4 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Which method of data processing involves the use of chalk, pen, pencil and similar tools?', 'multiple_choice', 'Computer method', 'Mechanical method', 'Manual method', 'Electronic method', 'C', 'Manual method involves the use of chalk, pen, pencil and similar tools.');

    -- Q5 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'The manual method of data processing is described as cumbersome, tiresome, boring, frustrating and _____ consuming.', 'fill_in_blank', 'time', 'Manual method is time consuming.');

    -- Q6 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What are the disadvantages of manual data processing?', 'multiple_choice', 'High speed and accuracy', 'Affected by human errors, not suitable for large volume data', 'Requires electricity', 'Needs programming skills', 'B', 'Manual method is affected by human errors and does not allow processing of large volume data.');

    -- Q7 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Which method uses machines like typewriters, adding machines, and roneo machines?', 'multiple_choice', 'Manual method', 'Computer method', 'Mechanical method', 'Digital method', 'C', 'Mechanical method uses machines like typewriters and adding machines.');

    -- Q8 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Mechanical operations are described as noisy, hazardous, error prone and _____.', 'fill_in_blank', 'untidy', 'Mechanical operations are untidy.');

    -- Q9 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is a key feature of computer data processing?', 'multiple_choice', 'Data cannot be stored', 'Operations are very noisy', 'Data can be steadily and continuously processed', 'Errors cannot be corrected', 'C', 'Computer method allows data to be steadily and continuously processed.');

    -- Q10 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Which feature of computers allows data and instructions to be stored?', 'multiple_choice', 'Processing speed', 'Storage capacity', 'Output quality', 'Input methods', 'B', 'Computers have storage facilities for data and instructions.');

    -- Q11 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'In computer method, errors can be easily and _____ corrected.', 'fill_in_blank', 'neatly', 'Errors can be neatly corrected in computer method.');

    -- Q12 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is one characteristic of computer output reports?', 'multiple_choice', 'They are always handwritten', 'They are usually very neat and can include graphs', 'They cannot include pictures', 'They are only in text format', 'B', 'Output reports are neat and can include graphs, diagrams, and pictures.');

    -- Q13 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does computer accuracy refer to?', 'multiple_choice', 'Its high error rate', 'Its high consistency and reliability', 'Its slow processing', 'Its manual operations', 'B', 'Computer accuracy is very high and its consistency can be relied upon.');

    -- Q14 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Computer speed allows manipulation of large data at _____ speed.', 'fill_in_blank', 'incredible', 'Computers work at incredible speed.');

    -- Q15 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Where are errors in computing mostly from?', 'multiple_choice', 'Computer hardware failure', 'Technological weaknesses', 'Human errors', 'Software bugs only', 'C', 'Errors in computing are mostly due to human rather than technological weakness.');

    -- Q16 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What types of storage facilities do computers have?', 'multiple_choice', 'Only internal storage', 'Only external storage', 'Both internal and external storage', 'No storage facilities', 'C', 'Computers have both internal and external storage facilities.');

    -- Q17 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Computer memories are built up in K (Kilo) modules where K = _____ memory locations.', 'fill_in_blank', '1024', 'K equals 1024 memory locations.');

    -- Q18 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does automatic operation mean in computers?', 'multiple_choice', 'Computers need constant instructions', 'Once a program is loaded, it can run automatically', 'Computers cannot run programs', 'Programs must be manually executed each time', 'B', 'Once a program is in memory, it can run automatically each time it is opened.');

    -- Q19 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Why are computers considered reliable?', 'multiple_choice', 'They get tired easily', 'They dont suffer human traits of tiredness and lack of concentration', 'They make many errors', 'They need constant supervision', 'B', 'Computers dont suffer from tiredness and lack of concentration like humans.');

    -- Q20 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Computer _____ means it can perform any type of task once reduced to logical steps.', 'fill_in_blank', 'flexibility', 'Flexibility allows computers to perform any task reduced to logical steps.');

    -- Q21 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What makes up the computing system?', 'multiple_choice', 'Only the computer', 'Computer system, user, and environment', 'Only software', 'Only hardware', 'B', 'Computing system includes computer system, user, and environment.');

    -- Q22 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What are the two main components of a computer system?', 'multiple_choice', 'Input and output only', 'Hardware and software', 'CPU and memory only', 'Keyboard and mouse', 'B', 'Computer system is made up of hardware and software.');

    -- Q23 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Computer hardware comprises the input unit, processing unit, and _____ unit.', 'fill_in_blank', 'output', 'Hardware includes input, processing, and output units.');

    -- Q24 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Which of these is an example of an input unit?', 'multiple_choice', 'Monitor', 'Printer', 'Keyboard', 'Speaker', 'C', 'Keyboard is an input device.');

    -- Q25 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What makes up the processing unit?', 'multiple_choice', 'ALU, control unit, and main memory', 'Only keyboard and mouse', 'Monitor and printer', 'Only external storage', 'A', 'Processing unit includes ALU, control unit, and main memory.');

    -- Q26 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Main memory is also known as _____ memory.', 'fill_in_blank', 'primary', 'Main memory is primary memory.');

    -- Q27 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What are the components of main memory?', 'multiple_choice', 'Only ROM', 'Only RAM', 'ROM and RAM', 'External storage only', 'C', 'Main memory consists of ROM and RAM.');

    -- Q28 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Which is an example of an output unit?', 'multiple_choice', 'Scanner', 'Mouse', 'Monitor', 'Keyboard', 'C', 'Monitor is an output device.');

    -- Q29 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Computer _____ are series of instructions that enable the computer to perform tasks.', 'fill_in_blank', 'software', 'Software consists of instructions for tasks.');

    -- Q30 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is a program?', 'multiple_choice', 'Physical computer parts', 'Group of instructions to perform a task', 'Only the computer case', 'A type of hardware', 'B', 'A program is a group of instructions to perform a task.');

    -- Q31 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What categories can computer programs be divided into?', 'multiple_choice', 'Only application programs', 'System software, utility software, and application programs', 'Only hardware programs', 'Only operating systems', 'B', 'Programs can be system software, utility software, or application programs.');

    -- Q32 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Computer users are categorized into expert users and _____ users.', 'fill_in_blank', 'casual', 'Users can be expert or casual.');

    -- Q33 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Who are considered expert users?', 'multiple_choice', 'Only children', 'Computer engineers, programmers, and operators', 'Only casual users', 'People who never use computers', 'B', 'Expert users include engineers, programmers, and operators.');

    -- Q34 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does the computing environment include?', 'multiple_choice', 'Only the computer', 'Building, furniture, auxiliary devices', 'Only software', 'Only users', 'B', 'Environment includes building, furniture, voltage stabilizer, UPS, etc.');

    -- Q35 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'The earliest attempt to build an electronic computer was by J.V. Atanasoff in _____.', 'fill_in_blank', '1937', 'Atanasoff attempted in 1937.');

    -- Q36 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What did Atanasoff and Berry build?', 'multiple_choice', 'First general purpose computer', 'A machine that could solve 29 simultaneous equations', 'ENIAC', 'Personal computer', 'B', 'They built a machine solving 29 equations with 29 unknowns.');

    -- Q37 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What was the first general purpose programmable electronic computer?', 'multiple_choice', 'Atanasoff-Berry Computer', 'ENIAC', 'IBM 704', 'CRAY 1', 'B', 'ENIAC was the first general purpose programmable electronic computer.');

    -- Q38 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'ENIAC was built by J. Presper Eckert and John V. Mauchly at the University of _____.', 'fill_in_blank', 'Pennsylvania', 'ENIAC was built at University of Pennsylvania.');

    -- Q39 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'When was the second generation of computers?', 'multiple_choice', '1937-1953', '1954-1962', '1963-1972', '1972-1984', 'B', 'Second generation was 1954-1962.');

    -- Q40 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Which programming languages were introduced in the second generation?', 'multiple_choice', 'Python and Java', 'FORTRAN, ALGOL, and COBOL', 'C++ only', 'Assembly language only', 'B', 'FORTRAN (1956), ALGOL (1958), COBOL (1959) were introduced.');

    -- Q41 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'The term "_____" is reserved for machines much more powerful than others of its era.', 'fill_in_blank', 'supercomputer', 'Supercomputers are much more powerful.');

    -- Q42 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What were examples of early supercomputers?', 'multiple_choice', 'ENIAC and ABC', 'LARC and IBM 7030 (Stretch)', 'Personal computers', 'Laptops only', 'B', 'LARC and IBM 7030 were early supercomputers.');

    -- Q43 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'When was the third generation of computers?', 'multiple_choice', '1954-1962', '1963-1972', '1972-1984', '1984-1990', 'B', 'Third generation was 1963-1972.');

    -- Q44 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Third generation innovations included use of integrated circuits, semiconductor memories, microprogramming, and _____.', 'fill_in_blank', 'operating systems', 'Third generation saw operating systems and time-sharing.');

    -- Q45 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What technology defined the fourth generation?', 'multiple_choice', 'Vacuum tubes', 'Transistors', 'Integrated circuits', 'LSI and VLSI', 'D', 'Fourth generation used LSI (1000 devices/chip) and VLSI (100,000 devices/chip).');

    -- Q46 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What replaced core memories in the fourth generation?', 'multiple_choice', 'Vacuum tubes', 'Semiconductor memories', 'Magnetic tapes', 'Floppy disks', 'B', 'Semiconductor memories replaced core memories.');

    -- Q47 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'During fourth generation, high speed vector processors like CRAY 1 dominated _____ computing.', 'fill_in_blank', 'high performance', 'CRAY 1 dominated high performance computing.');

    -- Q48 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What characterized the fifth generation of computers?', 'multiple_choice', 'Vacuum tubes', 'Parallel processing acceptance', 'Manual processing', 'Mechanical parts', 'B', 'Fifth generation was characterized by acceptance of parallel processing.');

    -- Q49 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'How many processors could fifth generation machines have?', 'multiple_choice', 'Only one', '2-4 processors', 'Hundreds of processors', 'Thousands of processors', 'C', 'Fifth generation introduced machines with hundreds of processors.');

    -- Q50 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'By 1990, it was possible to build chips with a _____ components.', 'fill_in_blank', 'million', 'By 1990, chips had a million components.');

    -- Q51 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'When did the sixth generation begin?', 'multiple_choice', '1972', '1984', '1990', '2000', 'C', 'Sixth generation began around 1990.');

    -- Q52 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does WYSIWYG stand for in word processing?', 'multiple_choice', 'What You See Is What You Get', 'What You Say Is What You Give', 'Where You See Is Where You Go', 'When You Start Is When You Gain', 'A', 'WYSIWYG means "What You See Is What You Get".');

    -- Q53 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Word processing is the use of computers to create, revise, and _____ documents.', 'fill_in_blank', 'save', 'Word processing includes saving documents.');

    -- Q54 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does paragraph formatting affect?', 'multiple_choice', 'Only single words', 'The appearance of entire paragraphs', 'Only page margins', 'Only font size', 'B', 'Paragraph formatting affects the appearance of entire paragraphs.');

    -- Q55 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is the purpose of a spelling checker?', 'multiple_choice', 'To replace proofreading completely', 'To help eliminate errors from documents', 'To format paragraphs', 'To create spreadsheets', 'B', 'Spelling checker helps eliminate errors from documents.');

    -- Q56 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'A spreadsheet consists of information written in _____ form.', 'fill_in_blank', 'tabular', 'Spreadsheets use tabular form (rows and columns).');

    -- Q57 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is a horizontal series of data called in a spreadsheet?', 'multiple_choice', 'Column', 'Row', 'Cell', 'Table', 'B', 'Horizontal series is called a row.');

    -- Q58 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is the primary objective of a spreadsheet?', 'multiple_choice', 'To play games', 'To keep a record of numerical information', 'To browse the internet', 'To write letters', 'B', 'Spreadsheets keep records of numerical information.');

    -- Q59 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Formulas in Excel start with _____ sign.', 'fill_in_blank', 'equal', 'Excel formulas start with = sign.');

    -- Q60 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What happens when you change numbers in worksheet cells referenced by formulas?', 'multiple_choice', 'Nothing happens', 'Formulas give errors', 'Results update automatically', 'Computer crashes', 'C', 'Formula results update automatically when referenced cells change.');

    -- Q61 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is the computer symbol for multiplication?', 'multiple_choice', 'X', '*', '/', '+', 'B', 'Computer uses * for multiplication.');

    -- Q62 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Computer uses _____ symbol for division.', 'fill_in_blank', '/', 'Computer uses / for division.');

    -- Q63 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does formatting a worksheet change?', 'multiple_choice', 'The actual data values', 'The appearance of numbers and text', 'The formulas', 'The number of rows', 'B', 'Formatting changes appearance, not actual values.');

    -- Q64 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is an example of emphasizing text in a worksheet?', 'multiple_choice', 'Deleting it', 'Applying boldface or underlining', 'Changing row height', 'Adding more cells', 'B', 'Boldface or underlining emphasizes text.');

    -- Q65 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'The computer system is made up of hardware and _____.', 'fill_in_blank', 'software', 'Computer system includes hardware and software.');

    -- Q66 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does CPU stand for?', 'multiple_choice', 'Central Processing Unit', 'Computer Personal Unit', 'Central Program Unit', 'Computer Processing Unit', 'A', 'CPU stands for Central Processing Unit.');

    -- Q67 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Which generation used vacuum tubes?', 'multiple_choice', 'First generation', 'Second generation', 'Third generation', 'Fourth generation', 'A', 'First generation (1937-1953) used vacuum tubes.');

    -- Q68 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Second generation computers used _____ instead of vacuum tubes.', 'fill_in_blank', 'transistors', 'Second generation used transistors.');

    -- Q69 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does ALU stand for?', 'multiple_choice', 'Arithmetic Logic Unit', 'Advanced Logic Unit', 'Arithmetic Learning Unit', 'Automated Logic Unit', 'A', 'ALU is Arithmetic Logic Unit.');

    -- Q70 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is ROM?', 'multiple_choice', 'Read Only Memory', 'Random Output Memory', 'Read Output Memory', 'Random Only Memory', 'A', 'ROM is Read Only Memory.');

    -- Q71 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'RAM stands for Random _____ Memory.', 'fill_in_blank', 'Access', 'RAM is Random Access Memory.');

    -- Q72 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is an auxiliary device in computing environment?', 'multiple_choice', 'Only the computer', 'Voltage stabilizer or UPS', 'Only the monitor', 'Only the keyboard', 'B', 'Auxiliary devices include voltage stabilizer and UPS.');

    -- Q73 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does UPS stand for?', 'multiple_choice', 'Uninterruptible Power Supply', 'Universal Power System', 'Unified Power Source', 'Universal Program System', 'A', 'UPS is Uninterruptible Power Supply.');

    -- Q74 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Atanasoff was a professor of physics and _____ at Iowa State.', 'fill_in_blank', 'mathematics', 'Atanasoff taught physics and mathematics.');

    -- Q75 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What was the limitation of Atanasoff-Berry computer?', 'multiple_choice', 'It was too fast', 'It was not programmable', 'It was too large', 'It used transistors', 'B', 'It was not programmable, more like an electronic calculator.');

    -- Q76 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What did IBM 704 and 7094 introduce?', 'multiple_choice', 'Vacuum tubes', 'I/O processors for better throughput', 'Parallel processing', 'Personal computing', 'B', 'IBM 7094 introduced I/O processors for better throughput.');

    -- Q77 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Third generation brought huge gains in _____ power.', 'fill_in_blank', 'computational', 'Third generation increased computational power.');

    -- Q78 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What technology was used in third generation?', 'multiple_choice', 'Vacuum tubes', 'Transistors', 'Integrated circuits', 'VLSI', 'C', 'Third generation used integrated circuits (ICs).');

    -- Q79 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What did semiconductor memories replace in fourth generation?', 'multiple_choice', 'Vacuum tubes', 'Transistors', 'Core memories', 'Hard disks', 'C', 'Semiconductor memories replaced core memories.');

    -- Q80 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Fifth generation saw acceptance of _____ processing.', 'fill_in_blank', 'parallel', 'Fifth generation accepted parallel processing.');

    -- Q81 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What could fifth generation machines work on?', 'multiple_choice', 'Only one program at a time', 'Different parts of a single program', 'Only gaming applications', 'Only word processing', 'B', 'They could work on different parts of a single program.');

    -- Q82 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'When you type in word processing, where are words stored?', 'multiple_choice', 'On paper immediately', 'In computer memory', 'In printer only', 'On external disk only', 'B', 'Words are stored in computer memory.');

    -- Q83 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Paragraph alignment determines how text is positioned between left and right _____.', 'fill_in_blank', 'indents', 'Alignment positions text between indents.');

    -- Q84 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does a spelling checker compare words against?', 'multiple_choice', 'Internet databases', 'Its dictionaries', 'Other documents', 'User memory', 'B', 'It checks against its dictionaries.');

    -- Q85 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is a vertical series of data called?', 'multiple_choice', 'Row', 'Column', 'Cell', 'Sheet', 'B', 'Vertical series is a column.');

    -- Q86 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Spreadsheet data may consist of text, raw numbers, or _____ results.', 'fill_in_blank', 'calculated', 'Data can be calculated results.');

    -- Q87 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Why use cell references in formulas?', 'multiple_choice', 'To make formulas longer', 'So results update automatically when cells change', 'To confuse users', 'To prevent calculations', 'B', 'Cell references allow automatic updates.');

    -- Q88 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is the manual symbol for division?', 'multiple_choice', '/', '+', '÷', '*', 'C', 'Manual division uses ÷ symbol.');

    -- Q89 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Formatting changes only the _____ of a number, not its value.', 'fill_in_blank', 'appearance', 'Formatting changes appearance, not value.');

    -- Q90 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What can emphasize words in a worksheet?', 'multiple_choice', 'Boldface or underlining', 'Deleting them', 'Hiding them', 'Changing column width', 'A', 'Boldface or underlining emphasizes words.');

    -- Q91 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does VDU stand for?', 'multiple_choice', 'Visual Display Unit', 'Video Display Unit', 'Virtual Display Unit', 'Visible Display Unit', 'A', 'VDU is Visual Display Unit.');

    -- Q92 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'The output unit displays results for the user to _____.', 'fill_in_blank', 'see', 'Output is for users to see.');

    -- Q93 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is a series of programs linked together called?', 'multiple_choice', 'Hardware', 'Software', 'Firmware', 'Middleware', 'B', 'Series of programs make up software.');

    -- Q94 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What do expert users include?', 'multiple_choice', 'Only computer engineers', 'Computer engineers, programmers, operators', 'Only casual users', 'Only children', 'B', 'Expert users include engineers, programmers, operators.');

    -- Q95 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'The computing environment includes furniture, auxiliary devices, and _____.', 'fill_in_blank', 'building', 'Environment includes the building.');

    -- Q96 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Why was Atanasoff building a computer?', 'multiple_choice', 'For gaming', 'To help graduate students solve partial differential equations', 'For business accounting', 'For word processing', 'B', 'To help solve partial differential equations.');

    -- Q97 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'How many equations could Atanasoff-Berry computer solve?', 'multiple_choice', '10 equations', '29 simultaneous equations with 29 unknowns', '100 equations', 'Only simple arithmetic', 'B', 'It solved 29 simultaneous equations with 29 unknowns.');

    -- Q98 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'ENIAC stands for Electronic Numerical Integrator and _____.', 'fill_in_blank', 'Computer', 'ENIAC is Electronic Numerical Integrator and Computer.');

    -- Q99 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What characterized second generation computers?', 'multiple_choice', 'Vacuum tubes', 'High-level programming languages', 'Parallel processing', 'Artificial intelligence', 'B', 'Second generation introduced high-level languages.');

    -- Q100 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does LSI stand for?', 'multiple_choice', 'Large Scale Integration', 'Low Scale Integration', 'Local System Integration', 'Large System Interface', 'A', 'LSI is Large Scale Integration.');

    -- Q101 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'VLSI stands for Very _____ Scale Integration.', 'fill_in_blank', 'Large', 'VLSI is Very Large Scale Integration.');

    -- Q102 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What dominated high performance computing in fourth generation?', 'multiple_choice', 'Personal computers', 'High speed vector processors like CRAY 1', 'Laptops', 'Tablets', 'B', 'CRAY 1, CRAY X-MP, CYBER 205 dominated.');

    -- Q103 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What was parallelism limited to before fifth generation?', 'multiple_choice', 'Hundreds of processors', 'Pipelining and vector processing', 'Artificial intelligence', 'Quantum computing', 'B', 'Before fifth generation, parallelism was limited to pipelining and vector processing.');

    -- Q104 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Sixth generation transitions are hard to define because changes are often _____.', 'fill_in_blank', 'gradual', 'Sixth generation changes are gradual improvements.');

    -- Q105 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does WYSIWYG mean for word processors?', 'multiple_choice', 'Screen display matches printed output', 'Text is hidden', 'Formatting is impossible', 'Only text appears', 'A', 'WYSIWYG means screen matches printed output.');

    -- Q106 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'How do you apply paragraph formatting?', 'multiple_choice', 'By selecting the paragraph', 'By formatting each word separately', 'By restarting computer', 'By printing document', 'A', 'Select paragraph and apply format.');

    -- Q107 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Spelling checker highlights words it does not _____.', 'fill_in_blank', 'recognize', 'It highlights unrecognized words.');

    -- Q108 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is the advantage of using formulas with cell references?', 'multiple_choice', 'Makes worksheets slower', 'Allows automatic recalculation', 'Prevents any changes', 'Hides data', 'B', 'Cell references allow automatic recalculation.');

    -- Q109 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is the computer symbol for subtraction?', 'multiple_choice', '+', '-', '*', '/', 'B', 'Computer uses - for subtraction.');

    -- Q110 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Formatting can make number ten appear as 10, 10.00, R10, and so on, changing only its _____.', 'fill_in_blank', 'appearance', 'Formatting changes appearance only.');

    -- Q111 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is a computer capable of?', 'multiple_choice', 'Only taking input', 'Taking input, storing, processing, giving output', 'Only storing data', 'Only displaying output', 'B', 'Computers can take input, store, process, and give output.');

    -- Q112 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Examples of data include:', 'multiple_choice', 'Net pay of workers', 'Name, age, complexion, height', 'Processed statements', 'Information only', 'B', 'Data includes name, age, complexion, height.');

    -- Q113 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Information is referred to as _____ data.', 'fill_in_blank', 'processed', 'Information is processed data.');

    -- Q114 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does manual method not allow?', 'multiple_choice', 'Processing small data', 'Processing large volume of data regularly and timely', 'Writing with pen', 'Using chalk', 'B', 'Manual method cannot handle large volume data regularly and timely.');

    -- Q115 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What are mechanical operations like?', 'multiple_choice', 'Quiet and clean', 'Noisy, hazardous, error prone', 'Very accurate', 'Always creative', 'B', 'Mechanical operations are noisy, hazardous, error prone.');

    -- Q116 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Computer method operations are practically not _____.', 'fill_in_blank', 'noisy', 'Computer operations are not noisy.');

    -- Q117 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What enhances accuracy and reliability in computers?', 'multiple_choice', 'Human supervision', 'In-built error detecting schemes', 'Manual checking', 'Mechanical parts', 'B', 'In-built error detecting schemes enhance accuracy.');

    -- Q118 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What varies from one machine to another?', 'multiple_choice', 'Storage capacity', 'The purpose of computers', 'The definition of data', 'Manual methods', 'A', 'Storage capacity varies between machines.');

    -- Q119 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'A computer will perform the last job with same speed and accuracy as the first job, showing _____.', 'fill_in_blank', 'reliability', 'This shows reliability.');

    -- Q120 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What can modern computers perform?', 'multiple_choice', 'Only one task', 'A variety of functions like online processing, multiprogramming', 'Only manual tasks', 'Only mechanical tasks', 'B', 'Modern computers perform various functions like online processing.');

    -- Q121 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is the input unit?', 'multiple_choice', 'Media for feeding data into computer', 'Media for displaying output', 'Processing unit only', 'Storage only', 'A', 'Input unit includes media for feeding data.');

    -- Q122 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Examples of input unit include keyboard, mouse, joystick, trackball, and _____.', 'fill_in_blank', 'scanner', 'Scanner is an input device.');

    -- Q123 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does the control unit do?', 'multiple_choice', 'Processes arithmetic', 'Controls operations of CPU', 'Stores data permanently', 'Prints documents', 'B', 'Control unit controls CPU operations.');

    -- Q124 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does the output unit display?', 'multiple_choice', 'Only data', 'Data, instructions, processing results', 'Only instructions', 'Only hardware', 'B', 'Output unit displays data, instructions, and results.');

    -- Q125 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Examples of output unit are monitor and _____.', 'fill_in_blank', 'printer', 'Printer is an output device.');

    -- Q126 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What are computer software?', 'multiple_choice', 'Physical parts', 'Series of instructions for tasks', 'Only hardware manuals', 'Power cables', 'B', 'Software are instructions for tasks.');

    -- Q127 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Who are casual users?', 'multiple_choice', 'Expert programmers', 'Ordinary users without deep technical knowledge', 'Computer engineers', 'Only system administrators', 'B', 'Casual users are ordinary users without deep technical knowledge.');

    -- Q128 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'The computing environment includes fans and air _____ .', 'fill_in_blank', 'conditioners', 'Environment includes air conditioners.');

    -- Q129 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What did the second generation see?', 'multiple_choice', 'Decline in programming', 'Important developments at all levels', 'Only hardware changes', 'No software changes', 'B', 'Second generation saw developments at all levels.');

    -- Q130 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'When was FORTRAN introduced?', 'multiple_choice', '1956', '1958', '1959', '1962', 'A', 'FORTRAN was introduced in 1956.');

    -- Q131 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'ALGOL was introduced in _____.', 'fill_in_blank', '1958', 'ALGOL was introduced in 1958.');

    -- Q132 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'When was COBOL introduced?', 'multiple_choice', '1956', '1958', '1959', '1960', 'C', 'COBOL was introduced in 1959.');

    -- Q133 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What did early supercomputers overlap?', 'multiple_choice', 'Only input operations', 'Memory operations with processor operations', 'Only output operations', 'Only storage operations', 'B', 'They overlapped memory and processor operations.');

    -- Q134 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Third generation saw the coming of age of pipelining and other forms of _____ processing.', 'fill_in_blank', 'parallel', 'Pipelining is a form of parallel processing.');

    -- Q135 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What could fit on a single chip in fourth generation?', 'multiple_choice', 'Only transistors', 'Entire processors', 'Only vacuum tubes', 'Only power supply', 'B', 'Entire processors could fit on a single chip.');

    -- Q136 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What became standard on all computers by fifth generation?', 'multiple_choice', 'Vacuum tubes', 'Semiconductor memories', 'Magnetic cores', 'Mechanical parts', 'B', 'Semiconductor memories became standard.');

    -- Q137 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Sixth generation changes are sometimes clear only in _____.', 'fill_in_blank', 'retrospect', 'Some changes are clear only in retrospect.');

    -- Q138 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'How do you enter information in word processing?', 'multiple_choice', 'By speaking only', 'Using a keyboard', 'By thinking', 'By touching screen only', 'B', 'Information is entered using a keyboard.');

    -- Q139 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'When can paragraph alignment be applied?', 'multiple_choice', 'Only before typing', 'Only after typing', 'Before or after typing', 'Never', 'C', 'Alignment can be applied before or after typing.');

    -- Q140 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Spelling checker is no substitute for _____.', 'fill_in_blank', 'proofreading', 'Spelling checker does not replace proofreading.');

    -- Q141 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is a spreadsheet primarily for?', 'multiple_choice', 'Drawing pictures', 'Keeping numerical records', 'Playing music', 'Browsing internet', 'B', 'Spreadsheets keep numerical records.');

    -- Q142 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What can formulas be created with?', 'multiple_choice', 'Only cell references', 'Numbers or cell references', 'Only text', 'Only symbols', 'B', 'Formulas can use numbers or cell references.');

    -- Q143 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'In Excel, formulas are preceded by _____ sign.', 'fill_in_blank', 'equal', 'Formulas start with = sign.');

    -- Q144 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What operator is used for multiplication in computers?', 'multiple_choice', 'X', '*', '/', '+', 'B', 'Computer uses * for multiplication.');

    -- Q145 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does formatting a worksheet do to numbers?', 'multiple_choice', 'Changes their value', 'Changes only appearance', 'Deletes them', 'Hides them permanently', 'B', 'Formatting changes appearance, not value.');

    -- Q146 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'You can emphasize text by applying boldface or _____.', 'fill_in_blank', 'underlining', 'Underlining emphasizes text.');

    -- Q147 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is data?', 'multiple_choice', 'Processed information', 'Raw facts', 'Computer output', 'Software programs', 'B', 'Data are raw facts.');

    -- Q148 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is an example of information?', 'multiple_choice', 'Name and age', 'Net pay of workers', 'Height', 'Complexion', 'B', 'Net pay of workers is information (processed data).');

    -- Q149 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Manual data processing entails considerable manual _____.', 'fill_in_blank', 'efforts', 'Manual method requires manual efforts.');

    -- Q150 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What affects reliability of manual data processing?', 'multiple_choice', 'Computer speed', 'Human errors', 'Automatic processing', 'Software accuracy', 'B', 'Human errors affect manual processing reliability.');

    -- Q151 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is a disadvantage of mechanical method?', 'multiple_choice', 'Too quiet', 'Noisy, hazardous, error prone', 'Very creative', 'Always accurate', 'B', 'Mechanical method is noisy, hazardous, error prone.');

    -- Q152 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Computer method allows data to be stored temporarily and _____.', 'fill_in_blank', 'permanently', 'Computers allow temporary and permanent storage.');

    -- Q153 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is a characteristic of computer output reports?', 'multiple_choice', 'Usually messy', 'Very neat and can include graphs', 'Only text allowed', 'Cannot be printed', 'B', 'Output reports are neat and can include graphs.');

    -- Q154 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does computer speed refer to?', 'multiple_choice', 'Slow manipulation', 'Manipulating large data at incredible speed', 'Only small data processing', 'Manual speed', 'B', 'Computers manipulate large data at incredible speed.');

    -- Q155 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Computer accuracy is very high and its _____ can be relied upon.', 'fill_in_blank', 'consistency', 'Computers have high consistency.');

    -- Q156 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What detects errors in computers?', 'multiple_choice', 'Only users', 'In-built error detecting schemes', 'Manual checking', 'Mechanical sensors', 'B', 'Computers have in-built error detecting schemes.');

    -- Q157 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does computer storage include?', 'multiple_choice', 'Only internal storage', 'Only external storage', 'Both internal and external', 'No storage', 'C', 'Computers have both internal and external storage.');

    -- Q158 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'K in memory modules equals _____ memory locations.', 'fill_in_blank', '1024', 'K equals 1024 memory locations.');

    -- Q159 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does automatic operation mean?', 'multiple_choice', 'Program runs automatically once in memory', 'Manual input always needed', 'Program cannot run', 'Only one-time execution', 'A', 'Program runs automatically once loaded in memory.');

    -- Q160 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does computer reliability ensure?', 'multiple_choice', 'Gets tired after many jobs', 'Performs last job with same speed and accuracy as first', 'Slows down over time', 'Makes more errors with more jobs', 'B', 'Computers maintain speed and accuracy regardless of job count.');

    -- Q161 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Computer _____ means it can perform any task reduced to logical steps.', 'fill_in_blank', 'flexibility', 'Flexibility allows any logical task.');

    -- Q162 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does the computing system include?', 'multiple_choice', 'Only hardware', 'Computer system, user, environment', 'Only software', 'Only input devices', 'B', 'Computing system includes computer system, user, and environment.');

    -- Q163 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What are the two main parts of computer system?', 'multiple_choice', 'Input and output', 'Hardware and software', 'CPU and memory', 'Keyboard and monitor', 'B', 'Computer system consists of hardware and software.');

    -- Q164 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Computer hardware comprises input unit, processing unit, and _____ unit.', 'fill_in_blank', 'output', 'Hardware includes output unit.');

    -- Q165 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Which is NOT an input device?', 'multiple_choice', 'Keyboard', 'Mouse', 'Monitor', 'Scanner', 'C', 'Monitor is an output device, not input.');

    -- Q166 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What makes up the processing unit?', 'multiple_choice', 'ALU, control unit, main memory', 'Only keyboard', 'Only printer', 'Only hard disk', 'A', 'Processing unit includes ALU, control unit, main memory.');

    -- Q167 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Main memory consists of ROM and _____.', 'fill_in_blank', 'RAM', 'Main memory includes RAM.');

    -- Q168 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Which is an output device?', 'multiple_choice', 'Scanner', 'Printer', 'Mouse', 'Keyboard', 'B', 'Printer is an output device.');

    -- Q169 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is software?', 'multiple_choice', 'Physical components', 'Series of instructions for tasks', 'Only hardware tools', 'Power supply', 'B', 'Software are instructions for tasks.');

    -- Q170 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'A program is made up of group of _____ to perform a task.', 'fill_in_blank', 'instructions', 'Program consists of instructions.');

    -- Q171 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What are categories of computer programs?', 'multiple_choice', 'Only application programs', 'System software, utility software, application programs', 'Only games', 'Only operating systems', 'B', 'Programs include system, utility, and application software.');

    -- Q172 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Who are expert users?', 'multiple_choice', 'Only children', 'Computer engineers, programmers, operators', 'Only casual users', 'People avoiding computers', 'B', 'Expert users include engineers, programmers, operators.');

    -- Q173 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Computing environment includes building, furniture, and auxiliary devices like voltage stabilizer and _____.', 'fill_in_blank', 'UPS', 'UPS is an auxiliary device.');

    -- Q174 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'When was the first electronic computer attempt?', 'multiple_choice', '1920', '1937', '1945', '1950', 'B', 'First attempt was in 1937 by Atanasoff.');

    -- Q175 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What could Atanasoff-Berry computer do?', 'multiple_choice', 'Solve 29 simultaneous equations', 'Play games', 'Word processing', 'Browse internet', 'A', 'It solved 29 simultaneous equations.');

    -- Q176 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'ENIAC was built at University of _____.', 'fill_in_blank', 'Pennsylvania', 'ENIAC was built at University of Pennsylvania.');

    -- Q177 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'When was the second generation?', 'multiple_choice', '1937-1953', '1954-1962', '1963-1972', '1972-1984', 'B', 'Second generation was 1954-1962.');

    -- Q178 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Which languages were introduced in second generation?', 'multiple_choice', 'Python, Java', 'FORTRAN, ALGOL, COBOL', 'C++, C#', 'HTML, CSS', 'B', 'FORTRAN, ALGOL, COBOL were introduced.');

    -- Q179 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Supercomputer term is reserved for machines _____ more powerful than contemporary machines.', 'fill_in_blank', 'order of magnitude', 'Supercomputers are order of magnitude more powerful.');

    -- Q180 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Examples of early supercomputers?', 'multiple_choice', 'ENIAC, ABC', 'LARC, IBM 7030 (Stretch)', 'Personal computers', 'Laptops', 'B', 'LARC and IBM 7030 were early supercomputers.');

    -- Q181 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'When was third generation?', 'multiple_choice', '1954-1962', '1963-1972', '1972-1984', '1984-1990', 'B', 'Third generation was 1963-1972.');

    -- Q182 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Third generation innovations included integrated circuits, semiconductor memories, microprogramming, and _____.', 'fill_in_blank', 'operating systems', 'Third generation introduced operating systems.');

    -- Q183 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What defined fourth generation?', 'multiple_choice', 'Vacuum tubes', 'Transistors', 'LSI and VLSI', 'Parallel processing', 'C', 'Fourth generation used LSI and VLSI.');

    -- Q184 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What replaced core memories?', 'multiple_choice', 'Vacuum tubes', 'Semiconductor memories', 'Magnetic tapes', 'Floppy disks', 'B', 'Semiconductor memories replaced core memories.');

    -- Q185 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'High speed vector processors like CRAY 1 dominated _____ computing.', 'fill_in_blank', 'high performance', 'CRAY 1 dominated high performance computing.');

    -- Q186 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What characterized fifth generation?', 'multiple_choice', 'Vacuum tubes', 'Parallel processing acceptance', 'Manual processing', 'Mechanical parts', 'B', 'Fifth generation accepted parallel processing.');

    -- Q187 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'How many processors in fifth generation machines?', 'multiple_choice', 'One only', 'Few', 'Hundreds', 'Thousands', 'C', 'Fifth generation had hundreds of processors.');

    -- Q188 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'By 1990, chips could have _____ components.', 'fill_in_blank', 'million', 'Chips had million components by 1990.');

    -- Q189 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'When did sixth generation start?', 'multiple_choice', '1972', '1984', '1990', '2000', 'C', 'Sixth generation started around 1990.');

    -- Q190 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does WYSIWYG mean?', 'multiple_choice', 'What You See Is What You Get', 'What You Say Is What You Give', 'Where You See Is Where You Go', 'When You Start Is When You Gain', 'A', 'WYSIWYG means "What You See Is What You Get".');

    -- Q191 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Word processing includes creating, revising, and _____ documents.', 'fill_in_blank', 'saving', 'Word processing includes saving documents.');

    -- Q192 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does paragraph formatting affect?', 'multiple_choice', 'Single words only', 'Entire paragraph appearance', 'Page margins only', 'Font size only', 'B', 'Paragraph formatting affects entire paragraph appearance.');

    -- Q193 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is spelling checker for?', 'multiple_choice', 'Replace proofreading', 'Help eliminate errors', 'Format paragraphs', 'Create spreadsheets', 'B', 'Spelling checker helps eliminate errors.');

    -- Q194 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Spreadsheet information is in _____ form.', 'fill_in_blank', 'tabular', 'Spreadsheets use tabular form.');

    -- Q195 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is a horizontal data series called?', 'multiple_choice', 'Column', 'Row', 'Cell', 'Table', 'B', 'Horizontal series is a row.');

    -- Q196 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is spreadsheet primary objective?', 'multiple_choice', 'Play games', 'Keep numerical records', 'Browse internet', 'Write letters', 'B', 'Spreadsheets keep numerical records.');

    -- Q197 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Excel formulas start with _____ sign.', 'fill_in_blank', 'equal', 'Excel formulas start with =.');

    -- Q198 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What happens when referenced cells change?', 'multiple_choice', 'Nothing', 'Formula results update automatically', 'Errors occur', 'Computer crashes', 'B', 'Formula results update automatically.');

    -- Q199 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is computer multiplication symbol?', 'multiple_choice', 'X', '*', '/', '+', 'B', 'Computer uses * for multiplication.');

    -- Q200 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Formatting changes only _____ of numbers, not their value.', 'fill_in_blank', 'appearance', 'Formatting changes appearance only.');

END $$;