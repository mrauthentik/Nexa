DO $$ 
DECLARE 
    v_course_id UUID;
BEGIN 
    -- Get the course ID for CIT204
    SELECT id INTO v_course_id FROM courses WHERE code = 'CIT204' LIMIT 1;

    -- Q1 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ is the data processing function which allows one to inspect or withdraw specified data from a stored file.', 'fill_in_blank', 'Inquiry', 'Inquiry is the function that allows inspection or retrieval of data from a file.');

    -- Q2 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '________________ language uses symbols and mnemonics to code instructions.', 'fill_in_blank', 'Assembly', 'Assembly language uses symbols and mnemonics for coding instructions.');

    -- Q3 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The _______ Generation Computers was characterised by the use Integrated Circuits(IC).', 'fill_in_blank', 'Third', 'Third generation computers used Integrated Circuits.');

    -- Q4 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The ______ generation computer combines both hardware and software to produce human intelligence with voice recognition, natural language processing, language translation, speech processing, other multimedia application, video databases and optical discs.', 'fill_in_blank', 'Fifth', 'Fifth generation computers combine hardware and software for AI and multimedia.');

    -- Q5 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'In all modern Internet browsers pressing the function key ______ will refresh or reload the page or document window.', 'fill_in_blank', 'F5', 'F5 is the standard key for refreshing/reloading browsers.');

    -- Q6 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The function key - ______ is used by Windows to rename a highlighted icon, file, or folder in all versions of Windows.', 'fill_in_blank', 'F2', 'F2 is the function key for renaming in Windows.');

    -- Q7 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The function key - ______ is almost always used as the help key, almost every program will open the help screen when this key is pressed.', 'fill_in_blank', 'F1', 'F1 is the universal help key in most programs.');

    -- Q8 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The function key ______ often opens a search feature for many programs including Microsoft Windows when at the Windows Desktop.', 'fill_in_blank', 'F3', 'F3 is commonly used to open search features.');

    -- Q9 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The function key ______ is commonly used to spell check and grammar check a document in Microsoft programs such as Microsoft Word, Outlook, etc.', 'fill_in_blank', 'F7', 'F7 is used for spell and grammar check in Microsoft programs.');

    -- Q10 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'In the CPU data is moved between the registers and the memory via a data path called a typically known as a _______.', 'fill_in_blank', 'Bus', 'A bus is the data path between CPU registers and memory.');

    -- Q11 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ are the temporary storage areas for instructions or data WITHIN the processor.', 'fill_in_blank', 'Registers', 'Registers are temporary storage areas within the processor.');

    -- Q12 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The ________ unit communicates with both the arithmetic logic unit (ALU) and memory, and literally directs the entire computer system to carry out, or execute, stored program instructions.', 'fill_in_blank', 'Control', 'The control unit directs the computer system to execute instructions.');

    -- Q13 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '_____ are often used as part of a feedback cycle. They collect data continuously and are typically linked to a control program that specifies acceptable levels.', 'fill_in_blank', 'Sensors', 'Sensors collect data continuously for feedback cycles.');

    -- Q14 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '_____ cards allow distant computers to communicate with one another by converting electronic signals from within the system unit into electronic signals that can travel over telephone lines and other types of connections.', 'fill_in_blank', 'Modem', 'Modem cards convert signals for communication over lines.');

    -- Q15 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Most web browsers use a ______ to load regularly/frequently viewed web pages fast.', 'fill_in_blank', 'Cache', 'A cache stores frequently accessed web pages for faster loading.');

    -- Q16 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '_______________ software allows users to do things like creating text documents, playing games, listening to music or viewing websites.', 'fill_in_blank', 'Application', 'Application software allows users to perform various tasks.');

    -- Q17 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '_____________ is referred to as processed data.', 'fill_in_blank', 'Information', 'Information is processed data.');

    -- Q18 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '_______ is a pictorial representation of an algorithm with step of the algorithm enclosed in a box of various shapes and the flow of control.', 'fill_in_blank', 'Flowchart', 'A flowchart visually represents an algorithm.');

    -- Q19 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '________________ points indicate the starting and ending points of a process.', 'fill_in_blank', 'Terminal', 'Terminal points indicate the start and end of a process.');

    -- Q20 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'In a fully-featured word processor, ___________________ is a character or word that represents a series of keystrokes which can represent text or commands.', 'fill_in_blank', 'Macro', 'A macro represents a series of keystrokes or commands.');

    -- Q21 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '_______ refers to unprocessed facts about a person, object or place e.g. name, age, complexion, school, class, height etc.', 'multiple_choice', 'Data', 'Information', 'Knowledge', 'Wisdom', 'A', 'Data refers to unprocessed facts.');

    -- Q22 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '_______ is a collection of alphabets (both lower and upper case such as A, B, C, D to Z), numerals (0-9), and special characters.', 'multiple_choice', 'Text', 'Number', 'Symbol', 'Image', 'A', 'Text includes alphabets, numerals, and special characters.');

    -- Q23 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The Floating Point data type consists of three components namely: _______, base or radix and mantissa.', 'multiple_choice', 'Exponent', 'Integer', 'Character', 'Bit', 'A', 'Floating point numbers have exponent, base, and mantissa.');

    -- Q24 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Data manipulation consists of all the following options EXCEPT:', 'multiple_choice', 'Sorting', 'Merging', 'Collection', 'Summing', 'C', 'Collection is not a data manipulation operation.');

    -- Q25 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, '______ Colossus computer was used to break the German Enigma Code.', 'multiple_choice', 'Turing’s', 'Babbage’s', 'Atanasoff’s', 'Hollerith’s', 'A', 'Turing’s Colossus was used to break the Enigma Code.');
END $$;