-- CIT211 Questions (Part 2) - Shuffled answers
DO $$
DECLARE
  v_course_id UUID;
BEGIN
  SELECT id INTO v_course_id FROM courses WHERE code = 'CIT211' LIMIT 1;

  -- Question 31 - Multiple choice (Answer: C)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, '______ was a master of program debugging on the early Manchester Mark I machine', 'multiple_choice', 'John von Neumann', 'Charles Babbage', 'Alan Turing', 'Dennis Ritchie', 'C', 'Alan Turing was known for debugging on the Manchester Mark I.');

  -- Question 32 - Fill in blank
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'To facilitate the use of the ______, operating systems were developed', 'fill_in_blank', 'hardware', 'Answer is case-sensitive and must be word-for-word: "hardware"');

  -- Question 33 - Fill in blank
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'The history of computer operating systems parallels that of computer hardware which can be generally divided into five distinct time periods called ______', 'fill_in_blank', 'generations', 'Answer is case-sensitive and must be word-for-word: "generations"');

  -- Question 34 - Multiple choice (Answer: A)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'The term ______ is used to refer to the period when there was no OS.', 'multiple_choice', 'zeroth generation', 'first generation', 'pre-generation', 'initial generation', 'A', 'The zeroth generation refers to the period before operating systems.');

  -- Question 35 - Multiple choice (Answer: D)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'The development of the first commercial computer took place in ______', 'multiple_choice', '1940', '1945', '1960', '1951', 'D', 'The first commercial computer was developed in 1951.');

  -- Question 36 - Multiple choice (Answer: B)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'The first electronics digital computers on the ABC was designed by ______ in 1940', 'multiple_choice', 'Alan Turing', 'John Atanasoff', 'John von Neumann', 'Howard Aiken', 'B', 'John Atanasoff designed the ABC in 1940.');

  -- Question 37 - Fill in blank
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'The Mark I, built by Howard Aiken and a group of IBM engineers at Harvard in _____', 'fill_in_blank', '1944', 'Answer is case-sensitive and must be word-for-word: "1944"');

  -- Question 38 - Multiple choice (Answer: A)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'The ENIAC was designed and constructed at the University of Pennsylvania by ______', 'multiple_choice', 'Wallace Eckert and John Mauchly', 'Alan Turing and John von Neumann', 'Howard Aiken and Grace Hopper', 'Dennis Ritchie and Ken Thompson', 'A', 'ENIAC was designed by Wallace Eckert and John Mauchly.');

  -- Question 39 - Multiple choice (Answer: C)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'EDVAC was developed in 1944-46 by ______', 'multiple_choice', 'Alan Turing and Charles Babbage', 'Howard Aiken and Grace Hopper', 'John von Neumann, Arthur Burks, and Herman Goldstine', 'Dennis Ritchie and Ken Thompson', 'C', 'EDVAC was developed by von Neumann, Burks, and Goldstine.');

  -- Question 40 - Fill in blank
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'The mode of operation was called _____ and this meant that users signed up for computer time and when a user''s time arrived, the entire computer system was turned over to the user.', 'fill_in_blank', 'open-shop', 'Answer is case-sensitive and must be word-for-word: "open-shop"');

  -- Question 41 - Multiple choice (Answer: D)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'The ______ generation marked the beginning of commercial computing.', 'multiple_choice', 'second', 'zeroth', 'third', 'first', 'D', 'The first generation marked commercial computing''s beginning.');

  -- Question 42 - Multiple choice (Answer: B)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'IPL means ______', 'multiple_choice', 'Internal Program Load', 'Initial Program Load', 'Integrated Program Load', 'Initial Process Load', 'B', 'IPL stands for Initial Program Load.');

  -- Question 43 - Fill in blank
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'FORTRAN (Formula Translator) was developed by _____ in 1956.', 'fill_in_blank', 'John W. Backus', 'Answer is case-sensitive and must be word-for-word: "John W. Backus"');

  -- Question 44 - Multiple choice (Answer: A)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'FORTRAN stands for ______', 'multiple_choice', 'Formula Translator', 'Format Translator', 'Forward Translator', 'Function Translator', 'A', 'FORTRAN stands for Formula Translator.');

  -- Question 45 - Multiple choice (Answer: C)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'The ______ generation of computer hardware was most notably characterized by transistors replacing vacuum tubes as the hardware component technology.', 'multiple_choice', 'First', 'Third', 'Second', 'Fourth', 'C', 'The second generation used transistors instead of vacuum tubes.');

  -- Question 46 - Fill in blank
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'Compatible Time Sharing System (CTSS) was developed at MIT during the early ______', 'fill_in_blank', '1960s', 'Answer is case-sensitive and must be word-for-word: "1960s"');

  -- Question 47 - Multiple choice (Answer: D)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'CTSS means ______', 'multiple_choice', 'Central Time Sharing System', 'Computer Time Sharing System', 'Common Time Sharing System', 'Compatible Time Sharing System', 'D', 'CTSS stands for Compatible Time Sharing System.');

  -- Question 48 - Multiple choice (Answer: B)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'The ______ generation officially began in April 1964 with IBM''s announcement of its System/360 family of computers.', 'multiple_choice', 'second', 'third', 'fourth', 'first', 'B', 'The third generation began in April 1964 with IBM System/360.');

  -- Question 49 - Fill in blank
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'The third generation hardware technology used ______', 'fill_in_blank', 'integrated circuits', 'Answer is case-sensitive and must be word-for-word: "integrated circuits"');

  -- Question 50 - Multiple choice (Answer: A)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'The ______ generation is characterized by the appearance of the personal computer and the workstation.', 'multiple_choice', 'fourth', 'third', 'fifth', 'second', 'A', 'The fourth generation brought personal computers and workstations.');

  -- Question 51 - Multiple choice (Answer: C)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'LSI means ______', 'multiple_choice', 'Low Scale Integration', 'Limited Scale Integration', 'Large Scale Integration', 'Linear Scale Integration', 'C', 'LSI stands for Large Scale Integration.');

  -- Question 52 - Fill in blank
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'VLSI means ______', 'fill_in_blank', 'Very Large Scale Integration', 'Answer is case-sensitive and must be word-for-word: "Very Large Scale Integration"');

  -- Question 53 - Multiple choice (Answer: D)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'In computer science, the ______ is the central component of most computer operating systems (OS).', 'multiple_choice', 'shell', 'driver', 'service', 'kernel', 'D', 'The kernel is the central component of an OS.');

  -- Question 54 - Fill in blank
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'The responsibilities of ______ include managing the system''s resources and the communication between hardware and software components.', 'fill_in_blank', 'kernel', 'Answer is case-sensitive and must be word-for-word: "kernel"');

  -- Question 55 - Multiple choice (Answer: B)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'While it is today mostly called the ______, the same part of the operating system has also in the past been known as the nucleus or core.', 'multiple_choice', 'shell', 'kernel', 'driver', 'daemon', 'B', 'The kernel was historically called nucleus or core.');

  -- Question 56 - Fill in blank
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'Early computers used a form of memory called ______', 'fill_in_blank', 'Core memory', 'Answer is case-sensitive and must be word-for-word: "Core memory"');

  -- Question 57 - Multiple choice (Answer: A)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'The kernel typically provides a loop that is executed whenever no processes are available to run, this is often called the ______.', 'multiple_choice', 'idle process', 'null process', 'empty process', 'wait process', 'A', 'The idle process runs when no other processes are available.');

  -- Question 58 - Fill in blank
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'The CPU is frequently called the ______', 'fill_in_blank', 'processor', 'Answer is case-sensitive and must be word-for-word: "processor"');

  -- Question 59 - Multiple choice (Answer: C)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, '______ is used to store both program instructions and data.', 'multiple_choice', 'CPU', 'Hard disk', 'Memory', 'Cache', 'C', 'Memory stores both instructions and data.');

  -- Question 60 - Fill in blank
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'The ______ is responsible for deciding which memory each process can use, and determining what to do when not enough is available.', 'fill_in_blank', 'Kernel', 'Answer is case-sensitive and must be word-for-word: "Kernel"');

END $$;
