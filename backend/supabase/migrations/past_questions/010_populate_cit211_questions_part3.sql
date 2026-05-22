-- CIT211 Questions (Part 3) - Continued shuffled answers
DO $$
DECLARE
  v_course_id UUID;
BEGIN
  SELECT id INTO v_course_id FROM courses WHERE code = 'CIT211' LIMIT 1;

  -- Question 61 - Fill in blank
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'Kernels also usually provide methods for synchronization and communication between processes called ______', 'fill_in_blank', 'inter-process communication or IPC', 'Answer is case-sensitive and must be word-for-word: "inter-process communication or IPC"');

  -- Question 62 - Multiple choice (Answer: D)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'A situation where each process is allowed to run uninterrupted until it makes a special request that tells the kernel it may switch to another process. Such requests are known as _____', 'multiple_choice', 'Blocking', 'Waiting', 'Sleeping', 'Yielding', 'D', 'Yielding allows voluntary process switching.');

  -- Question 63 - Multiple choice (Answer: B)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, '______ allows creation of virtual partitions of memory in two disjointed areas, one being reserved for the kernel (kernel space) and the other for the applications (user space).', 'multiple_choice', 'Physical addressing', 'Virtual addressing', 'Direct addressing', 'Indirect addressing', 'B', 'Virtual addressing separates kernel and user space.');

  -- Question 64 - Fill in blank
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'PCI means ______', 'fill_in_blank', 'Peripheral Component Interconnect', 'Answer is case-sensitive and must be word-for-word: "Peripheral Component Interconnect"');

  -- Question 65 - Fill in blank
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'USB means ______', 'fill_in_blank', 'Universal Serial Bus', 'Answer is case-sensitive and must be word-for-word: "Universal Serial Bus"');

  -- Question 66 - Multiple choice (Answer: C)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'Approaches that delegate enforcement of security policy to the compiler and/or the application level are often called ______.', 'multiple_choice', 'hardware-based security', 'network-based security', 'language-based security', 'system-based security', 'C', 'Language-based security delegates policy enforcement to compilers/applications.');

  -- Question 67 - Multiple choice (Answer: A)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, '______ proved that from a logical point of view, atomic lock and unlock operations operating on binary semaphores are sufficient primitives to express any functionality of process cooperation.', 'multiple_choice', 'Edsger Dijkstra', 'Alan Turing', 'Dennis Ritchie', 'Ken Thompson', 'A', 'Edsger Dijkstra proved semaphores are sufficient for process cooperation.');

  -- Question 68 - Fill in blank
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'The Xen hypervisor, for example, is an ______.', 'fill_in_blank', 'Exokernel', 'Answer is case-sensitive and must be word-for-word: "Exokernel"');

  -- Question 69 - Multiple choice (Answer: D)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'Most kernels do not fit exactly into one of these categories, but are rather found in between these two designs. These are called ______.', 'multiple_choice', 'mixed kernels', 'combined kernels', 'merged kernels', 'hybrid kernels', 'D', 'Hybrid kernels combine features of different kernel types.');

  -- Question 70 - Fill in blank
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'The principle of _____ is the substantial difference between the philosophy of micro and monolithic kernels.', 'fill_in_blank', 'separation of mechanism and policy', 'Answer is case-sensitive and must be word-for-word: "separation of mechanism and policy"');

  -- Question 71 - Multiple choice (Answer: B)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'A ______ is the support that allows the implementation of many different policies', 'multiple_choice', 'policy', 'mechanism', 'protocol', 'procedure', 'B', 'A mechanism enables implementation of various policies.');

  -- Question 72 - Fill in blank
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'A ______ is a particular "mode of operation".', 'fill_in_blank', 'Policy', 'Answer is case-sensitive and must be word-for-word: "Policy"');

  -- Question 73 - Multiple choice (Answer: C)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'The idea of a kernel where I/O devices are handled uniformly with other processes, as parallel co-operating processes, was first proposed and implemented by _____', 'multiple_choice', 'Dennis Ritchie', 'Ken Thompson', 'Brinch Hansen', 'Linus Torvalds', 'C', 'Brinch Hansen first proposed uniform I/O device handling.');

  -- Question 74 - Fill in blank
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'When a program needs data which is not currently in RAM, the CPU signals to the kernel that this has happened, and replacing it with the data requested by the program. The program can then be resumed from the point where it was stopped. This scheme is generally known as _____', 'fill_in_blank', 'demand paging', 'Answer is case-sensitive and must be word-for-word: "demand paging"');

  -- Question 75 - Multiple choice (Answer: A)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'A ______ is a system that allows more than one active user program (or part of user program) to be stored in main memory simultaneously.', 'multiple_choice', 'multiprogramming operating system', 'single-tasking system', 'batch system', 'real-time system', 'A', 'Multiprogramming allows multiple programs in memory simultaneously.');

  -- Question 76 - Multiple choice (Answer: D)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'A ______ is a computer hardware configuration that includes more than one independent processing unit.', 'multiple_choice', 'single processor system', 'embedded system', 'distributed system', 'multiprocessing system', 'D', 'Multiprocessing systems have multiple independent processors.');

  -- Question 77 - Fill in blank
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'A ______ is a collection of physical interconnected computers.', 'fill_in_blank', 'networked computing system', 'Answer is case-sensitive and must be word-for-word: "networked computing system"');

  -- Question 78 - Multiple choice (Answer: B)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'In a ______ operating system, the users are aware of the existence of multiple computers, and can log in to remote machines and copy files from one machine to another.', 'multiple_choice', 'Distributed', 'Network', 'Centralized', 'Standalone', 'B', 'Network OS makes users aware of multiple computers.');

  -- Question 79 - True/False (Answer: A)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, correct_answer, explanation)
  VALUES (v_course_id, 'Network operating systems are not fundamentally different from single processor operating systems.', 'true_false', 'True', 'False', 'A', 'Network OS are similar to single processor OS in fundamentals.');

  -- Question 80 - Fill in blank
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'A ______ consists of a number of computers that are connected and managed so that they automatically share the job processing load among the constituent computers.', 'fill_in_blank', 'distributed computing system', 'Answer is case-sensitive and must be word-for-word: "distributed computing system"');

  -- Question 81 - Multiple choice (Answer: C)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'DOS means ______', 'multiple_choice', 'Digital Operating System', 'Direct Operating System', 'Disk Operating System', 'Dynamic Operating System', 'C', 'DOS stands for Disk Operating System.');

  -- Question 82 - Multiple choice (Answer: D)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'A ______ is a multitasking operating system intended for real-time applications.', 'multiple_choice', 'batch operating system', 'time-sharing system', 'network operating system', 'real-time operating system (RTOS)', 'D', 'RTOS is designed for real-time applications.');

  -- Question 83 - Fill in blank
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'An ______ facilitates the creation of a real-time system, but does not guarantee the final result will be real-time.', 'fill_in_blank', 'RTOS', 'Answer is case-sensitive and must be word-for-word: "RTOS"');

  -- Question 84 - Multiple choice (Answer: B)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'In typical designs, a task has _____ states', 'multiple_choice', 'two', 'three', 'four', 'five', 'B', 'Tasks typically have three states: running, ready, and blocked.');

  -- Question 85 - Fill in blank
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, 'Most tasks are _____, most of the time.', 'fill_in_blank', 'Blocked', 'Answer is case-sensitive and must be word-for-word: "Blocked"');

  -- Question 86 - Multiple choice (Answer: A)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'The critical response time, sometimes called the ______, is the time it takes to queue a new ready task and restore the state of the highest priority task.', 'multiple_choice', 'flyback time', 'response time', 'turnaround time', 'waiting time', 'A', 'Flyback time is the critical response time for task switching.');

  -- Question 87 - Fill in blank
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, '______ operating systems usually do not allow user programs to mask (disable) interrupts.', 'fill_in_blank', 'General-purpose', 'Answer is case-sensitive and must be word-for-word: "General-purpose"');

  -- Question 88 - Multiple choice (Answer: C)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'A significant problem that multitasking systems must address is ______', 'multiple_choice', 'memory management', 'file management', 'sharing data and hardware resources among multiple tasks', 'network management', 'C', 'Multitasking systems must manage resource sharing.');

  -- Question 89 - Fill in blank
  INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
  VALUES (v_course_id, '______ means the results are inconsistent or unpredictable, particularly when one task is in the midst of changing a data collection.', 'fill_in_blank', 'Unsafe', 'Answer is case-sensitive and must be word-for-word: "Unsafe"');

  -- Question 90 - Multiple choice (Answer: D)
  INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
  VALUES (v_course_id, 'A binary ______ is either locked or unlocked.', 'multiple_choice', 'Mutex', 'Monitor', 'Lock', 'Semaphore', 'D', 'A binary semaphore has two states: locked or unlocked.');

END $$;
