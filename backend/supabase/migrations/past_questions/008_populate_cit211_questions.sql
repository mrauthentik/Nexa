-- Populate CIT211 Introduction to Operating Systems Questions (Part 1)
-- Questions with shuffled correct answers and proper fill-in-the-blank types
DO $$
DECLARE
  v_course_id UUID;
BEGIN
  -- Get or create course
  SELECT id INTO v_course_id FROM courses WHERE code = 'CIT211' LIMIT 1;
  IF v_course_id IS NULL THEN
    INSERT INTO courses (code, title, credits, department, level, semester)
    VALUES ('CIT211', 'Introduction to Operating Systems', 3, 'Computer Science', '200', 1)
    RETURNING id INTO v_course_id;
  END IF;

  -- Question 1 - Fill in blank (user types exact answer)
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'An _____ can be defined as a set of computer programs that manage the hardware and software resources of a computer.', 'fill_in_blank', 'Operating System', 'Answer is case-sensitive and must be word-for-word: "Operating System"');

  -- Question 2 - Multiple choice (Answer: B)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'An Operating System (OS) can be defined as a set of computer _____ that manage the hardware and software resources of a computer.', 'multiple_choice', 'files', 'programs', 'applications', 'processes', 'B', 'An OS is a set of programs that manage computer resources.');

  -- Question 3 - Fill in blank (user types exact answer)
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'An Operating System (OS) can be defined as a set of computer programs that manage the ______ and software resources of a computer.', 'fill_in_blank', 'hardware', 'Answer is case-sensitive and must be word-for-word: "hardware"');

  -- Question 4 - Multiple choice (Answer: D)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'An Operating System (OS) can be defined as a set of computer programs that manage the hardware and ______ resources of a computer.', 'multiple_choice', 'network', 'user', 'memory', 'software', 'D', 'OS manages both hardware and software resources.');

  -- Question 5 - Multiple choice (Answer: C)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, '_______ is the core of computer programming that primarily deals with computer architecture.', 'multiple_choice', 'Compiler', 'Database', 'Operating System', 'Application', 'C', 'Operating System is the core that deals with computer architecture.');

  -- Question 6 - Fill in blank (user types exact answer)
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'Operating System is the core of computer programming that primarily deals with computer _______.', 'fill_in_blank', 'architecture', 'Answer is case-sensitive and must be word-for-word: "architecture"');

  -- Question 7 - Multiple choice (Answer: A)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, '_______ is basically an application program that serves as an interface to coordinate different resources of computer.', 'multiple_choice', 'Operating system', 'Web browser', 'Text editor', 'Media player', 'A', 'Operating system serves as an interface to coordinate computer resources.');

  -- Question 8 - Multiple choice (Answer: D)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'An ______ processes raw system and user input and responds by allocating and managing tasks and internal system resources as a service to users and programs of the system.', 'multiple_choice', 'application', 'compiler', 'interpreter', 'operating system', 'D', 'An operating system processes input and manages tasks and resources.');

  -- Question 9 - Multiple choice (Answer: B)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'At the foundation of all system software, an operating system performs basic tasks such as _______', 'multiple_choice', 'Running applications only', 'Controlling and allocating memory, prioritizing system requests, controlling input and output devices, facilitating networking and managing file systems', 'Managing user accounts only', 'Providing internet connectivity only', 'B', 'OS performs multiple basic tasks including memory management, I/O control, and file system management.');

  -- Question 10 - True/False (Answer: A)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, correct_answer, explanation)
  VALUES (v_course_id, 'Most operating systems come with an application that provides an interface to the OS managed resources.', 'true_false', 'True', 'False', 'A', 'Most operating systems include applications that provide interfaces to OS resources.');

  -- Question 11 - Fill in blank (user types exact answer)
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'Most operating systems come with an application that provides an ______ to the OS managed resources.', 'fill_in_blank', 'Interface', 'Answer is case-sensitive and must be word-for-word: "Interface"');

  -- Question 12 - Multiple choice (Answer: C)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'GUI is an acronym for _______', 'multiple_choice', 'General User Interface', 'Global User Interface', 'Graphical User Interface', 'Guided User Interface', 'C', 'GUI stands for Graphical User Interface.');

  -- Question 13 - Fill in blank (user types exact answer)
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'The ______ forms a platform for other system software and for application software.', 'fill_in_blank', 'operating system', 'Answer is case-sensitive and must be word-for-word: "operating system"');

  -- Question 14 - Multiple choice (Answer: B)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'Windows, Linux, and Mac OS are some of the most popular examples of ______', 'multiple_choice', 'application software', 'operating system', 'programming languages', 'databases', 'B', 'Windows, Linux, and Mac OS are popular operating systems.');

  -- Question 15 - Multiple choice (Answer: D)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'When there is no OS, users of computer system will need to write _____ in order to manipulate the hardware.', 'multiple_choice', 'high-level program', 'scripts', 'macros', 'machine-level program', 'D', 'Without an OS, users must write machine-level programs to control hardware.');

  -- Question 16 - Fill in blank (user types exact answer)
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, '______ provide a convenient interface for using the computer system.', 'fill_in_blank', 'OS', 'Answer is case-sensitive and must be word-for-word: "OS"');

  -- Question 17 - Multiple choice (Answer: A)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'An ______ allows computer system resources to be used in an efficient manner.', 'multiple_choice', 'OS', 'application', 'compiler', 'browser', 'A', 'An OS allows efficient use of computer resources.');

  -- Question 18 - Fill in blank (user types exact answer)
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'An OS allows computer system resources to be used in an ______ manner.', 'fill_in_blank', 'efficient', 'Answer is case-sensitive and must be word-for-word: "efficient"');

  -- Question 19 - Multiple choice (Answer: C)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'A ______ can be viewed as a layered or hierarchical structure consisting of the hardware, operating system, utilities, application programs and users.', 'multiple_choice', 'network', 'database', 'computer system', 'program', 'C', 'A computer system has a layered structure from hardware to users.');

  -- Question 20 - Multiple choice (Answer: D)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'A computer system can be viewed as a layered or hierarchical structure consisting of the ______, operating system, utilities, application programs and users.', 'multiple_choice', 'software', 'network', 'database', 'hardware', 'D', 'Hardware is the foundation layer of a computer system.');

  -- Question 21 - Fill in blank (user types exact answer)
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'The users of application programs are called the ______ and are generally not concerned with the computer''s architecture.', 'fill_in_blank', 'end-users', 'Answer is case-sensitive and must be word-for-word: "end-users"');

  -- Question 22 - Multiple choice (Answer: B)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'The ______ views the computer system in terms of an application.', 'multiple_choice', 'programmer', 'end-user', 'administrator', 'designer', 'B', 'End-users view the system through applications.');

  -- Question 23 - Multiple choice (Answer: A)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'The ______ is developed by the application programmer who uses a programming language and a language translator.', 'multiple_choice', 'application', 'operating system', 'hardware', 'network', 'A', 'Applications are developed by programmers using programming languages.');

  -- Question 24 - Fill in blank (user types exact answer)
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'A set of programs called the _____ is provided to assist the programmer in program creation, file management and the control of Input/Output (I/O) devices.', 'fill_in_blank', 'Utilities', 'Answer is case-sensitive and must be word-for-word: "Utilities"');

  -- Question 25 - Multiple choice (Answer: C)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'The most important system program, ______ masks the details of the hardware from the programmer and provides a convenient interface for using the system.', 'multiple_choice', 'compiler', 'assembler', 'operating system', 'linker', 'C', 'The operating system hides hardware complexity from programmers.');

  -- Question 26 - Fill in blank (user types exact answer)
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'The portion of the OS that is always in main memory is called the _____ or nucleus.', 'fill_in_blank', 'Kernel', 'Answer is case-sensitive and must be word-for-word: "Kernel"');

  -- Question 27 - Fill in blank (user types exact answer)
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'The portion of the OS that is always in main memory is called the kernel or ______.', 'fill_in_blank', 'nucleus', 'Answer is case-sensitive and must be word-for-word: "nucleus"');

  -- Question 28 - Multiple choice (Answer: D)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'CDROM means ______', 'multiple_choice', 'Computer Disc Read Only Memory', 'Central Disc Read Only Memory', 'Common Disc Read Only Memory', 'Compact Disc Read Only Memory', 'D', 'CDROM stands for Compact Disc Read Only Memory.');

  -- Question 29 - Multiple choice (Answer: B)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'Operating system was absent in the first commercial form of electronic computer launched in ______.', 'multiple_choice', '1930''s', '1940''s', '1950''s', '1960''s', 'B', 'The first commercial computers in the 1940s had no operating systems.');

  -- Question 30 - Fill in blank (user types exact answer)
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, '______ of mechanical switches were used to enter programs.', 'fill_in_blank', 'Rows', 'Answer is case-sensitive and must be word-for-word: "Rows"');

END $$;
