-- CIT211 Questions (Part 4 - Final) - Continued shuffled answers
DO $$
DECLARE
  v_course_id UUID;
BEGIN
  SELECT id INTO v_course_id FROM courses WHERE code = 'CIT211' LIMIT 1;

  -- Question 91 - Fill in blank
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'In ______, a high priority task waits because a low priority task has a semaphore.', 'fill_in_blank', 'priority inversion', 'Answer is case-sensitive and must be word-for-word: "priority inversion"');

  -- Question 92 - Multiple choice (Answer: B)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'Problems with semaphore based designs are well known: ______ and deadlocks.', 'multiple_choice', 'race conditions', 'priority inversion', 'memory leaks', 'buffer overflow', 'B', 'Semaphore designs face priority inversion and deadlock problems.');

  -- Question 93 - Multiple choice (Answer: C)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'In a ______, two or more tasks lock a number of binary semaphores and then wait forever for other binary semaphores, creating a cyclic dependency graph.', 'multiple_choice', 'Livelock', 'Starvation', 'Deadlock', 'Race condition', 'C', 'Deadlock creates cyclic dependencies between tasks.');

  -- Question 94 - True/False (Answer: A)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, correct_answer, explanation)
  VALUES (v_course_id, 'Handling multiple levels of inheritance without introducing instability in cycles is not straightforward.', 'true_false', 'True', 'False', 'A', 'Managing inheritance levels without instability is complex.');

  -- Question 95 - Fill in blank
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, '______ is usually prevented by careful design, or by having floored semaphores.', 'fill_in_blank', 'Deadlock', 'Answer is case-sensitive and must be word-for-word: "Deadlock"');

  -- Question 96 - Multiple choice (Answer: D)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'The _____ deadlock scenario occurs when two tasks lock two semaphores in lockstep, but in the opposite order.', 'multiple_choice', 'most complex', 'common', 'rare', 'simplest', 'D', 'The simplest deadlock involves two tasks locking semaphores in opposite order.');

  -- Question 97 - Fill in blank
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'The approach to resource sharing is for tasks to send _____.', 'fill_in_blank', 'Messages', 'Answer is case-sensitive and must be word-for-word: "Messages"');

  -- Question 98 - Multiple choice (Answer: A)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, '______ deadlocks occur when two or more tasks wait for each other to send response messages.', 'multiple_choice', 'Protocol', 'Resource', 'Communication', 'System', 'A', 'Protocol deadlocks happen when tasks wait for responses from each other.');

  -- Question 99 - Multiple choice (Answer: C)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'The ______ often provides the ability to unblock a task from interrupt handler', 'multiple_choice', 'Kernel', 'Driver', 'Scheduler', 'Service', 'C', 'The scheduler can unblock tasks from interrupt handlers.');

  -- Question 100 - Fill in blank
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'A standard ______ scheme scans a linked list of indeterminate length to find a suitable free memory block', 'fill_in_blank', 'memory allocation', 'Answer is case-sensitive and must be word-for-word: "memory allocation"');

  -- Question 101 - True/False (Answer: A)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, correct_answer, explanation)
  VALUES (v_course_id, 'Memory allocation is more critical in an RTOS than in other operating systems.', 'true_false', 'True', 'False', 'A', 'Memory allocation is more critical in RTOS due to timing constraints.');

  -- Question 102 - Multiple choice (Answer: B)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'An ______ is an operating system which internally uses object-oriented methodologies.', 'multiple_choice', 'procedural operating system', 'object-oriented operating system', 'functional operating system', 'structured operating system', 'B', 'Object-oriented OS uses OO methodologies internally.');

  -- Question 103 - Fill in blank
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'During the late ______, Steve Jobs formed the computer company NeXT.', 'fill_in_blank', '1980s', 'Answer is case-sensitive and must be word-for-word: "1980s"');

  -- Question 104 - Multiple choice (Answer: D)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, '______ is an object-oriented operating system that was developed at the University of Illinois at Urbana-Champaign.', 'multiple_choice', 'Unix', 'Linux', 'Windows', 'Choices', 'D', 'Choices OS was developed at University of Illinois.');

  -- Question 105 - Fill in blank
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'Choices has been ported to and runs on ______', 'fill_in_blank', 'SPARC, x86 and ARM', 'Answer is case-sensitive and must be word-for-word: "SPARC, x86 and ARM"');

  -- Question 106 - Multiple choice (Answer: A)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'A ______ kernel instead tends to include many policies, therefore restricting the rest of the system to rely on them', 'multiple_choice', 'monolithic', 'micro', 'hybrid', 'nano', 'A', 'Monolithic kernels include many policies.');

  -- Question 107 - Multiple choice (Answer: C)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'In a ______, all OS services run along with the main kernel thread', 'multiple_choice', 'microkernel', 'exokernel', 'monolithic kernel', 'nanokernel', 'C', 'In monolithic kernels, all services run with the main kernel thread.');

  -- Question 108 - Fill in blank
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'In the ______ approach, the kernel itself only provides basic functionality that allows the execution of servers.', 'fill_in_blank', 'Microkernel', 'Answer is case-sensitive and must be word-for-word: "Microkernel"');

  -- Question 109 - Multiple choice (Answer: D)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'The kernel such as networking are implemented in user-space programs referred to as _____.', 'multiple_choice', 'Clients', 'Daemons', 'Services', 'Servers', 'D', 'Kernel services in microkernels are implemented as servers.');

  -- Question 110 - True/False (Answer: A)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, correct_answer, explanation)
  VALUES (v_course_id, 'Microkernels are easier to maintain than monolithic kernels', 'true_false', 'True', 'False', 'A', 'Microkernels are generally easier to maintain.');

  -- Question 111 - Fill in blank
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, '_____ generally underperform traditional designs, sometimes dramatically.', 'fill_in_blank', 'Microkernels', 'Answer is case-sensitive and must be word-for-word: "Microkernels"');

  -- Question 112 - Multiple choice (Answer: B)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, '______ argued that while microkernel designs were more aesthetically appealing, monolithic kernels were easier to implement.', 'multiple_choice', 'Linus Torvalds', 'Ken Thompson', 'Dennis Ritchie', 'Andrew Tanenbaum', 'B', 'Ken Thompson argued monolithic kernels were easier to implement.');

  -- Question 113 - Multiple choice (Answer: C)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, '____ is a kernel architecture based on combining aspects of microkernel and monolithic kernel architectures.', 'multiple_choice', 'Pure kernel', 'Simple kernel', 'Hybrid kernel', 'Complex kernel', 'C', 'Hybrid kernel combines microkernel and monolithic approaches.');

  -- Question 114 - Fill in blank
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'The ______ kernel approach tries to combine the speed and simpler design of a monolithic kernel with the modularity and execution safety of a microkernel.', 'fill_in_blank', 'Hybrid', 'Answer is case-sensitive and must be word-for-word: "Hybrid"');

  -- Question 115 - Multiple choice (Answer: D)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'The term ______ is sometimes used informally to refer to a very light-weight microkernel such as L4.', 'multiple_choice', 'Minikernel', 'Tinykernel', 'Smallkernel', 'Nanokernel', 'D', 'Nanokernel refers to very lightweight microkernels.');

  -- Question 116 - Fill in blank
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'A nanokernel is also known as ______', 'fill_in_blank', 'Picokernel', 'Answer is case-sensitive and must be word-for-word: "Picokernel"');

  -- Question 117 - Multiple choice (Answer: A)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'A program running on an exokernel can link to a _____ that uses the exokernel to simulate the abstractions of a well-known OS', 'multiple_choice', 'library operating system', 'device driver', 'system service', 'kernel module', 'A', 'Exokernels use library operating systems for abstractions.');

  -- Question 118 - Fill in blank
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'RTOS means ______', 'fill_in_blank', 'Real-Time Operating Systems', 'Answer is case-sensitive and must be word-for-word: "Real-Time Operating Systems"');

  -- Question 119 - Multiple choice (Answer: B)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'A _____ RTOS guarantees that critical tasks are performed on time.', 'multiple_choice', 'soft', 'hard', 'medium', 'flexible', 'B', 'Hard RTOS guarantee timing constraints.');

  -- Question 120 - Multiple choice (Answer: C)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'A ______ RTOS is less restrictive.', 'multiple_choice', 'Hard', 'Firm', 'Soft', 'Strict', 'C', 'Soft RTOS have less strict timing requirements.');

  -- Question 121 - Fill in blank
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, '______ operating system is designed to manage the computer so that one user can effectively do one thing at a time.', 'fill_in_blank', 'Single-Tasking', 'Answer is case-sensitive and must be word-for-word: "Single-Tasking"');

  -- Question 122 - Multiple choice (Answer: D)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, '______ is the type of operating system most people use on their desktop and laptop computers today.', 'multiple_choice', 'Multi-User Operating System', 'Batch Operating System', 'Real-Time Operating System', 'Single-User, Multi-Tasking Operating System', 'D', 'Most desktop/laptop OS are single-user, multi-tasking.');

  -- Question 123 - Fill in blank
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'A ______ allows many different users to take advantage of the computer''s resources simultaneously.', 'fill_in_blank', 'multi-user operating system', 'Answer is case-sensitive and must be word-for-word: "multi-user operating system"');

  -- Question 124 - Multiple choice (Answer: B)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'Modern computer operating systems may be classified into ______ groups', 'multiple_choice', 'Two', 'Three', 'Four', 'Five', 'B', 'Modern OS are classified into three groups.');

  -- Question 125 - Multiple choice (Answer: C)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'Modern computer operating systems may be classified into three groups called batch, ______ and real time operating systems.', 'multiple_choice', 'network', 'distributed', 'time-shared', 'embedded', 'C', 'The three groups are batch, time-shared, and real-time.');

END $$;
