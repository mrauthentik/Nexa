DO $$
DECLARE
    v_course_id UUID;
BEGIN
    -- Get the course ID for CIT212
    SELECT id INTO v_course_id FROM courses WHERE code = 'CIT212' LIMIT 1;

   
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) VALUES
    (v_course_id, 'SDLC is an acronym for ______.', 'fill_in_blank', 'System Development Life Cycle', 'SDLC stands for System Development Life Cycle, the stages in system development.'),
    (v_course_id, 'The word "SYSTEM" is derived from the Greek word ______.', 'fill_in_blank', 'systema', 'The word "SYSTEM" comes from the Greek "systema", meaning an organised relationship among units.'),
    (v_course_id, 'The two major components of systems development are Systems Analysis and ______.', 'fill_in_blank', 'Systems Design', 'Systems development has two main parts: analysis (what to do) and design (how to do it).'),
    (v_course_id, 'The last characteristic of a system is ______.', 'fill_in_blank', 'Central objective', 'Central objective is the final characteristic; objectives may be real or stated.'),
    (v_course_id, 'There are ______ basic elements in systems analysis.', 'fill_in_blank', 'Four', 'The four basic elements are Output, Inputs, Files, and Processes.'),
    (v_course_id, 'An ______ system continually interacts with its environment.', 'fill_in_blank', 'open', 'An open system receives inputs from and delivers outputs to the outside.'),
    (v_course_id, 'A ______ system is one in which the occurrence of all events is perfectly predictable.', 'fill_in_blank', 'deterministic', 'Deterministic systems have predictable events, e.g., a numerically controlled machine tool.'),
    (v_course_id, 'The most fundamental computer-based system in an organization pertains to the processing of ______.', 'fill_in_blank', 'business transactions', 'Transaction Processing Systems (TPS) handle routine business transactions.'),
    (v_course_id, 'MIS is an acronym for ______.', 'fill_in_blank', 'Management Information System', 'MIS provides managers with essential information for smooth business operations.'),
    (v_course_id, 'A decision is considered ______ if there are no clear procedures and not all factors can be identified in advance.', 'fill_in_blank', 'unstructured', 'Unstructured decisions rely on manager judgement.'),
    (v_course_id, 'The first step in the system development life cycle is the ______ to determine the feasibility of the system.', 'fill_in_blank', 'preliminary investigation', 'The preliminary investigation evaluates project requests and feasibility.'),
    (v_course_id, 'HIPO stands for ______.', 'fill_in_blank', 'Hierarchy plus Input Process Output', 'HIPO consists of VTOC and IPO diagrams.'),
    (v_course_id, 'In a decision table, the ______ is a list of all the necessary tests or conditions.', 'fill_in_blank', 'condition stub', 'The condition stub lists all logical conditions.'),
    (v_course_id, 'A ______ is a working system developed to test ideas and assumptions about a new system.', 'fill_in_blank', 'prototype', 'Prototyping helps refine requirements and design.'),
    (v_course_id, 'The process of changing from the old system to the new one is called ______.', 'fill_in_blank', 'conversion', 'Conversion methods include direct, parallel, pilot, and phase-in.'),
    (v_course_id, 'MTBF stands for ______.', 'fill_in_blank', 'mean-time-between-failures', 'MTBF measures system reliability.'),
    (v_course_id, 'A coded set of tables describing the structure of a database is called a ______.', 'fill_in_blank', 'schema', 'Schema is a description of data structure separate from the data itself.'),
    (v_course_id, 'In file organization, ______ simply means storing and sorting in physical sequence on tape or disk.', 'fill_in_blank', 'sequential organization', 'Sequential files are maintained on magnetic tape or disk.'),
    (v_course_id, '______ is a Fourth Generation Language that is more an application development tool than a programming language.', 'fill_in_blank', 'dBASE', 'dBASE provides data storage and retrieval features.'),
    (v_course_id, '______ controls to a system are laws, regulations, and policies outside the scope of the system.', 'fill_in_blank', 'External', 'External controls affect the system from outside.'),
    (v_course_id, 'A ______ is the path a transaction traces through a data processing system from source documents to summary reports.', 'fill_in_blank', 'audit trail', 'Audit trail allows tracing transactions for verification.'),
    (v_course_id, 'The structured flowcharts are also called ______ charts.', 'fill_in_blank', 'Nassi-Schneiderman', 'Nassi-Shneidermann charts (Chapin charts) illustrate complex logic without arrows.'),
    (v_course_id, '______ is a commitment to use a system for a specific time, generally three to seven years.', 'fill_in_blank', 'Lease', 'Lease is longer than rent (1-12 months).'),
    (v_course_id, 'Benefits such as more satisfied customers or an improved corporate image are ______ benefits.', 'fill_in_blank', 'intangible', 'Intangible benefits cannot be precisely measured.'),
    (v_course_id, 'A video display screen has normally 80 columns and ______ rows.', 'fill_in_blank', '24', 'CRT screens typically display 80x24 characters.'),
    (v_course_id, '______ determines the ability of users to recover data or restart a system after failure.', 'fill_in_blank', 'Recovery test', 'Recovery testing is part of system testing.'),
    (v_course_id, 'The highest level in the data hierarchy is the ______.', 'fill_in_blank', 'database', 'Database is a set of interrelated files.'),
    (v_course_id, 'A ______ is a temporary file used for two purposes: often to hold transactions before updating.', 'fill_in_blank', 'transaction file', 'Transaction files are temporary and used for processing.'),
    (v_course_id, 'The process of creating a report file is known as ______.', 'fill_in_blank', 'spooling', 'Spooling collects output reports before printing.'),
    (v_course_id, 'In a hierarchical database structure, the stored data get more detailed as one branches out, also called a ______ structure.', 'fill_in_blank', 'tree', 'Hierarchical structure is also referred to as a tree structure.');

    -- ==================== MULTIPLE CHOICE (170 questions) ====================

    -- Q31
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) VALUES
    (v_course_id, 'Systems analysis and design refers to the process of examining a business situation with the intent of ______.', 'multiple_choice', 'replacing all employees', 'improving it through better procedures and methods', 'outsourcing all operations', 'ignoring user needs', 'B', 'Systems analysis and design aims to improve business situations via better procedures and methods.'),
    -- Q32
    (v_course_id, 'The word "SYSTEM" is derived from which language?', 'multiple_choice', 'Latin', 'Greek', 'French', 'German', 'B', 'The word "SYSTEM" comes from the Greek word "systema".'),
    -- Q33
    (v_course_id, 'Which of the following is NOT one of the basic elements in systems analysis?', 'multiple_choice', 'Output', 'Inputs', 'Algorithms', 'Files', 'C', 'The four basic elements are Output, Inputs, Files, and Processes.'),
    -- Q34
    (v_course_id, 'A system that continually interacts with its environment is called ______.', 'multiple_choice', 'closed system', 'abstract system', 'open system', 'deterministic system', 'C', 'An open system receives inputs from and delivers outputs to its environment.'),
    -- Q35
    (v_course_id, 'Which of the following is an example of a deterministic system?', 'multiple_choice', 'Weather forecasting', 'Stock market', 'Numerically controlled machine tool', 'Customer buying behavior', 'C', 'A numerically controlled machine tool has perfectly predictable events, making it deterministic.'),
    -- Q36
    (v_course_id, 'TPS stands for ______.', 'multiple_choice', 'Transaction Processing System', 'Total Programming System', 'Technical Problem Solver', 'Time Processing Standard', 'A', 'TPS processes routine business transactions.'),
    -- Q37
    (v_course_id, 'Which system assists managers with unstructured or semi-structured decisions?', 'multiple_choice', 'TPS', 'MIS', 'DSS', 'OAS', 'C', 'Decision Support Systems (DSS) help with non-structured decisions.'),
    -- Q38
    (v_course_id, 'What are the three aspects in the feasibility study portion of preliminary investigation?', 'multiple_choice', 'Technical, Economic, Operational', 'Social, Legal, Time', 'Tangible, Intangible, Fixed', 'Direct, Indirect, Variable', 'A', 'Feasibility study includes technical, economic, and operational feasibility.'),
    -- Q39
    (v_course_id, 'Who begins the design process by identifying reports and other outputs the system will produce?', 'multiple_choice', 'Programmer', 'System designer', 'System analyst', 'Database administrator', 'C', 'Systems analyst identifies outputs first during design.'),
    -- Q40
    (v_course_id, 'Which of the following is NOT a reason systems projects are initiated?', 'multiple_choice', 'Capability', 'Control', 'Confusion', 'Cost', 'C', 'Projects are initiated for Capability, Control, Communication, and Cost reasons.'),
    -- Q41
    (v_course_id, 'Which committee format is generally favoured because systems projects are considered business investments?', 'multiple_choice', 'Information Systems Committee', 'User-Group Committee', 'Steering Committee', 'Audit Committee', 'C', 'Steering committee approach treats projects as business investments.'),
    -- Q42
    (v_course_id, 'What is the purpose of on-site observation during preliminary investigation?', 'multiple_choice', 'To test software', 'To get as close as possible to the real system being studied', 'To write code', 'To train users', 'B', 'On-site observation helps analysts see the real environment and workload.'),
    -- Q43
    (v_course_id, 'A system suffers from problem of throughput when ______.', 'multiple_choice', 'information is unavailable', 'six people do the work of two', 'procedures work sometimes', 'processing is error-prone', 'B', 'Throughput problems relate to efficiency; six people doing work of two indicates low throughput.'),
    -- Q44
    (v_course_id, 'Which feasibility is concerned with specifying equipment and software that satisfy user requirements?', 'multiple_choice', 'Operational feasibility', 'Technical feasibility', 'Economic feasibility', 'Social feasibility', 'B', 'Technical feasibility deals with hardware and software specifications.'),
    -- Q45
    (v_course_id, 'What does DFD stand for?', 'multiple_choice', 'Data Flow Diagram', 'Digital File Design', 'Direct Flow Data', 'Dynamic Function Diagram', 'A', 'DFD is Data Flow Diagram, a graphical description of data flow.'),
    -- Q46
    (v_course_id, 'Which symbol in a DFD represents a source or destination of system data?', 'multiple_choice', 'Arrow', 'Circle', 'Open-ended box', 'Square', 'D', 'A square defines a source (originator) or destination of system data.'),
    -- Q47
    (v_course_id, 'A data dictionary defines each term called a ______.', 'multiple_choice', 'data element', 'data flow', 'data store', 'data process', 'A', 'Data dictionary defines each data element encountered during analysis and design.'),
    -- Q48
    (v_course_id, 'The VTOC in HIPO stands for ______.', 'multiple_choice', 'Visual Table of Contents', 'Variable Test of Criteria', 'Virtual Time of Computing', 'Verified Topology of Code', 'A', 'VTOC arranges program modules in priority order.'),
    -- Q49
    (v_course_id, 'Which chart has four sections listing all logical conditions and actions?', 'multiple_choice', 'Flowchart', 'Decision table', 'IPO chart', 'HIPO diagram', 'B', 'A decision table displays conditions and actions in four sections.'),
    -- Q50
    (v_course_id, 'A dialogue tree maps messages between the computer and the ______.', 'multiple_choice', 'programmer', 'analyst', 'user', 'manager', 'C', 'Dialogue tree shows static and dynamic messages between computer and user.'),
    -- Q51
    (v_course_id, 'System development life cycle consists of all the following EXCEPT:', 'multiple_choice', 'Preliminary investigation', 'System testing', 'Marketing of system', 'Implementation', 'C', 'Marketing is not part of SDLC; activities include investigation, design, testing, implementation, etc.'),
    -- Q52
    (v_course_id, 'What is the role of system planners regarding maintenance?', 'multiple_choice', 'Write code', 'Plan resource availability for maintenance', 'Train users', 'Sell the system', 'B', 'System planners must always plan for resource availability to carry out maintenance functions.'),
    -- Q53
    (v_course_id, 'Systems analysts are often referred to as ______.', 'multiple_choice', 'programmers', 'planners', 'managers', 'technicians', 'B', 'Systems analysts are often called planners because they develop plans to meet objectives.'),
    -- Q54
    (v_course_id, 'Which attribute is NOT required of a systems analyst?', 'multiple_choice', 'Knowledge of people', 'Knowledge of business functions', 'Ability to avoid communication', 'Analytical mind', 'C', 'Systems analysts must have ability to communicate, not avoid it.'),
    -- Q55
    (v_course_id, 'During system testing, what is input for processing?', 'multiple_choice', 'Live data', 'Special test data', 'Random data', 'User data', 'B', 'Special test data is used to examine results and ensure software does not fail.'),
    -- Q56
    (v_course_id, 'Which type of feasibility determines if a project infringes on known Acts or statutes?', 'multiple_choice', 'Legal feasibility', 'Management feasibility', 'Time feasibility', 'Social feasibility', 'A', 'Legal feasibility checks compliance with laws and pending legislation.'),
    -- Q57
    (v_course_id, 'Costs that are known to exist but whose financial value cannot be exactly measured are called ______.', 'multiple_choice', 'direct costs', 'fixed costs', 'intangible costs', 'variable costs', 'C', 'Intangible costs exist but cannot be precisely measured.'),
    -- Q58
    (v_course_id, 'Which of the following is a benefit of a project that eliminates future administrative and operational costs?', 'multiple_choice', 'Cost-savings benefits', 'Cost-avoidance benefits', 'Improved-service-level benefits', 'Improved-information benefits', 'B', 'Cost-avoidance benefits eliminate future costs.'),
    -- Q59
    (v_course_id, 'What does OLTP stand for?', 'multiple_choice', 'Online Line Transaction Protocol', 'Online Transaction Processing', 'Offline Transaction Program', 'Operational Logic Testing Process', 'B', 'OLTP stands for Online Transaction Processing.'),
    -- Q60
    (v_course_id, 'Which device translates special fonts printed in magnetic ink on checks into direct computer input?', 'multiple_choice', 'OCR', 'MICR', 'POS', 'CRT', 'B', 'MICR (Magnetic Ink Character Recognition) reads checks.'),
    -- Q61
    (v_course_id, 'What is the maximum number of characters a typical CRT screen displays per line?', 'multiple_choice', '40', '80', '120', '160', 'B', 'CRT screens generally display 80 characters simultaneously.'),
    -- Q62
    (v_course_id, 'Which type of printer uses a print head that strikes a ribbon?', 'multiple_choice', 'Non-impact printer', 'Laser printer', 'Inkjet printer', 'Impact printer', 'D', 'Impact printers have a print head that strikes a ribbon.'),
    -- Q63
    (v_course_id, 'COM stands for ______.', 'multiple_choice', 'Computer Output Microfilm', 'Central Operating Module', 'Common Output Method', 'Code Optimization Matrix', 'A', 'COM records output as microscopic images on film.'),
    -- Q64
    (v_course_id, 'An action form requests the user to ______.', 'multiple_choice', 'record historical data', 'do something', 'guide supervisors', 'store data', 'B', 'Action forms request the user to take action.'),
    -- Q65
    (v_course_id, 'Which file type is a copy of master, transaction, or table file made to ensure availability if original is lost?', 'multiple_choice', 'Archival file', 'Backup file', 'Library file', 'Dump file', 'B', 'Backup files are copies to protect against data loss.'),
    -- Q66
    (v_course_id, 'What is a dump?', 'multiple_choice', 'A temporary file', 'A copy of computer-held data at a particular point in time', 'A type of printer', 'A processing method', 'B', 'A dump is a point-in-time copy of computer-held data.'),
    -- Q67
    (v_course_id, 'Which file organization method offers simplicity of sequential while allowing direct access?', 'multiple_choice', 'Sequential', 'Indexed', 'Random', 'Hashed', 'B', 'Indexed files provide both sequential simplicity and direct access capability.'),
    -- Q68
    (v_course_id, 'DASD stands for ______.', 'multiple_choice', 'Data Access Storage Device', 'Direct Access Storage Services', 'Digital Array Storage Disk', 'Dynamic Access System Drive', 'B', 'DASD stands for Direct Access Storage Services, which handle file inquiries quickly.'),
    -- Q69
    (v_course_id, 'In a relational database, records are visualized as rows in a table called ______.', 'multiple_choice', 'Schema', 'Tuples', 'Attributes', 'Domains', 'B', 'Records in a relational table are called tuples.'),
    -- Q70
    (v_course_id, 'Which type of code uses letters or numbers that describe the items coded, derived from descriptions?', 'multiple_choice', 'Sequence code', 'Mnemonic code', 'Function code', 'Card code', 'B', 'Mnemonic codes describe items using letters/numbers from descriptions.'),
    -- Q71
    (v_course_id, 'What is the main advantage of FORTRAN?', 'multiple_choice', 'Business data processing', 'Large library of mathematical subroutines', 'Conversational programming', 'Database management', 'B', 'FORTRAN provides a large library of mathematical and engineering subroutines.'),
    -- Q72
    (v_course_id, 'Which testing strategy examines program specifications and writes test data for specific conditions?', 'multiple_choice', 'Code testing', 'Specification testing', 'Unit testing', 'String testing', 'B', 'Specification testing uses program specs to design test data.'),
    -- Q73
    (v_course_id, 'A syntax error is a program statement that violates ______.', 'multiple_choice', 'business rules', 'language rules', 'user expectations', 'hardware limits', 'B', 'Syntax error violates one or more rules of the programming language.'),
    -- Q74
    (v_course_id, 'Which test determines the length of time used by the system to process transaction data?', 'multiple_choice', 'Peak load test', 'Storage testing', 'Performance time testing', 'Recovery test', 'C', 'Performance time testing measures processing time.'),
    -- Q75
    (v_course_id, 'Internal controls are basically plans, procedures, and rules under which the system must ______.', 'multiple_choice', 'be developed', 'function', 'be sold', 'be outsourced', 'B', 'Internal controls guide how the system functions.'),
    -- Q76
    (v_course_id, 'Which conversion method switches from old to new system abruptly, often over a weekend?', 'multiple_choice', 'Parallel conversion', 'Direct conversion', 'Pilot system', 'Phase-in method', 'B', 'Direct conversion is abrupt, cutting over entirely at once.'),
    -- Q77
    (v_course_id, 'A post-implementation review evaluates a system in terms of ______.', 'multiple_choice', 'future features', 'extent of accomplishing stated objectives', 'user satisfaction only', 'hardware performance', 'B', 'Post-implementation review checks whether objectives are met and costs compared to estimates.'),
    -- Q78
    (v_course_id, 'What is a major benefit of using a data centre instead of an in-house facility?', 'multiple_choice', 'Total control over data', 'No dependency on second party', 'No initial large spending on computer', 'Familiarity with computers for staff', 'C', 'Data centres avoid large initial expenditure; they provide access without big upfront costs.'),
    -- Q79
    (v_course_id, 'Which of the following is a disadvantage of using a data centre?', 'multiple_choice', 'No fear of equipment obsolescence', 'Access to expert staff', 'Loss of control over vital business data', 'Short-term commitment', 'C', 'Data centres relinquish control of sensitive business data.'),
    -- Q80
    (v_course_id, 'Rent for a system is typically paid for a duration of ______.', 'multiple_choice', '1 to 12 months', '3 to 7 years', 'over 10 years', 'indefinitely', 'A', 'Rent is short-term, generally 1 to 12 months.'),
    -- Q81
    (v_course_id, 'Benefits such as completing jobs in fewer hours are ______ benefits.', 'multiple_choice', 'intangible', 'indirect', 'tangible', 'fixed', 'C', 'Time savings and error-free reports are tangible, measurable benefits.'),
    -- Q82
    (v_course_id, 'During fact-finding, an analyst acts as a researcher. At the end he may do all EXCEPT:', 'multiple_choice', 'Design a customized system', 'Install a new system', 'Hire more staff', 'Program the system', 'C', 'Hiring staff is not a typical output of fact-finding; analysis leads to design, programming, and installation.'),
    -- Q83
    (v_course_id, 'Which of the following is a primary source of project requests?', 'multiple_choice', 'Marketing team', 'Four primary sources', 'External consultants only', 'Government regulations', 'B', 'There are four primary sources of project requests (mentioned in text).'),
    -- Q84
    (v_course_id, 'A DFD that is an overview drawing of the system with no detail is called a ______.', 'multiple_choice', 'Level 0 DFD', 'Context diagram', 'Detailed DFD', 'Physical DFD', 'B', 'A context diagram is the highest-level DFD showing system overview.'),
    -- Q85
    (v_course_id, 'How many different sets of y’s and n’s would a decision table with four conditions have?', 'multiple_choice', '8', '16', '32', '64', 'B', '2^4 = 16 possible combinations of yes/no conditions.'),
    -- Q86
    (v_course_id, 'Which step in feasibility analysis involves preparing system flowcharts?', 'multiple_choice', 'First', 'Second', 'Third', 'Last', 'B', 'Preparing system flowcharts is the second step in feasibility analysis.'),
    -- Q87
    (v_course_id, 'What is the final step in feasibility analysis?', 'multiple_choice', 'Estimate costs', 'Prepare and report final project directives to management', 'Determine technical feasibility', 'Conduct interviews', 'B', 'The final step is to report findings and recommendations to management.'),
    -- Q88
    (v_course_id, 'Which of the following is NOT a symbol used in data flow diagrams?', 'multiple_choice', 'Arrows', 'Circles', 'Diamonds', 'Squares', 'C', 'DFD symbols include arrows, circles, open-ended boxes, and squares; diamonds are not used.'),
    -- Q89
    (v_course_id, 'Data dictionary is of how many categories?', 'multiple_choice', 'One', 'Two', 'Three', 'Four', 'B', 'Data dictionary has two categories (integrated and stand-alone).'),
    -- Q90
    (v_course_id, 'Absolute responsibility for all types of problems is a disadvantage of which method of computer acquisition?', 'multiple_choice', 'Lease', 'Rent', 'Outright purchase', 'Data centre service', 'C', 'Outright purchase makes the organization solely responsible for all problems.'),
    -- Q92
    (v_course_id, 'The process of deriving a storage address from a record key is called ______.', 'multiple_choice', 'indexing', 'hashing', 'sequencing', 'pointing', 'B', 'Hashing derives a storage address from a record key.'),
    -- Q93
    (v_course_id, 'Which of the following may NOT contribute to software crisis from a programmer’s point of view?', 'multiple_choice', 'Security problem for protected data in software', 'Poor documentation', 'Unrealistic schedules', 'Lack of user involvement', 'A', 'Security problems are not typically the main contributor to software crisis; issues like documentation, schedules, and user involvement are more common.'),
    -- Q94
    (v_course_id, 'Which system stakeholder is responsible for selecting file structures and storage devices?', 'multiple_choice', 'Systems analyst', 'System designers', 'Programmers', 'End users', 'B', 'Designers select file structures and storage devices such as disk or tape.'),
    -- Q95
    (v_course_id, 'Which committee method is used when major equipment decisions or long-term development commitments are needed?', 'multiple_choice', 'Steering committee', 'Information systems committee', 'User-group committee', 'Audit committee', 'B', 'Information systems committee handles major equipment and long-term commitments.'),
    -- Q96
    (v_course_id, 'Which of the following is NOT a problem that arises from the user’s end?', 'multiple_choice', 'Lack of training', 'Unclear requirements', 'Problems during actual runtime in the organization', 'Resistance to change', 'C', 'Runtime problems are system-related, not exclusively user-end issues.'),
    -- Q97
    (v_course_id, 'How many primary methods are used to gather data during preliminary investigation?', 'multiple_choice', 'Two', 'Three', 'Four', 'Five', 'B', 'Three primary methods: reviewing documents, on-site observation, conducting interviews.'),
    -- Q98
    (v_course_id, 'Which feasibility is the most frequently used technique for evaluating effectiveness of a proposed system?', 'multiple_choice', 'Technical', 'Operational', 'Economic', 'Social', 'C', 'Economic analysis (cost/benefit) is most frequently used.'),
    -- Q99
    (v_course_id, 'How many aspects are there in procedure design?', 'multiple_choice', 'One', 'Two', 'Three', 'Four', 'B', 'Two aspects: control design and procedure design.'),
    -- Q100
    (v_course_id, 'How many formats can questions in a questionnaire follow?', 'multiple_choice', 'Two', 'Three', 'Four', 'Five', 'C', 'Four formats: multiple choice, open-ended, rating, rank.'),
    -- Q101
    (v_course_id, 'In a DFD, what do circles represent?', 'multiple_choice', 'Data stores', 'External entities', 'Processes that convert data into information', 'Data flows', 'C', 'Circles (or bubbles) represent processes that transform data.'),
    -- Q102
    (v_course_id, 'How many rules govern the construction of data flow diagrams?', 'multiple_choice', 'Five', 'Seven', 'Ten', 'Twelve', 'B', 'Seven rules govern DFD construction.'),
    -- Q103
    (v_course_id, 'The condition stub in a decision table is a list of ______.', 'multiple_choice', 'actions', 'tests or conditions', 'yes/no permutations', 'results', 'B', 'Condition stub lists all necessary tests or conditions.'),
    -- Q104
    (v_course_id, 'The action entry in a decision table indicates via ______ whether something should happen.', 'multiple_choice', 'Y or N', 'dot or X', 'checkmark', 'color', 'B', 'Action entry uses dot or X to indicate actions.'),
    -- Q105
    (v_course_id, 'Which type of testing determines the clarity of documentation by having users follow manuals?', 'multiple_choice', 'Human factors testing', 'Procedure testing', 'Recovery test', 'Storage testing', 'B', 'Procedure testing checks documentation clarity.'),
    -- Q106
    (v_course_id, 'What does the acronym POS stand for?', 'multiple_choice', 'Point of Sale', 'Program Operating System', 'Primary Output Source', 'Processor of Signals', 'A', 'POS stands for Point of Sale.'),
    -- Q107
    (v_course_id, 'Which of the following is an example of an open system?', 'multiple_choice', 'A sealed jar', 'An information system', 'A closed loop control system', 'A wristwatch', 'B', 'Information systems interact with environment, so they are open systems.'),
    -- Q108
    (v_course_id, 'The hierarchical relationship starting with president down to workers represents which characteristic?', 'multiple_choice', 'Integration', 'Organization', 'Interaction', 'Central objective', 'B', 'Organization implies structure and order, like a hierarchy.'),
    -- Q109
    (v_course_id, 'Which of the following is NOT a type of computer-based information system?', 'multiple_choice', 'TPS', 'MIS', 'CIS', 'DSS', 'C', 'CIS is not listed; the four are TPS, MIS, DSS, OAS.'),
    -- Q110
    (v_course_id, 'What does OAS stand for?', 'multiple_choice', 'Office Automation System', 'Operational Analysis Suite', 'Output Accounting Standard', 'Online Access Service', 'A', 'OAS is Office Automation System.'),
    -- Q111
    (v_course_id, 'Which of the following best describes a transaction?', 'multiple_choice', 'A set of programs', 'An event that affects the whole organization', 'A hardware component', 'A design document', 'B', 'A transaction is any event or activity affecting the whole organization.'),
    -- Q112
    (v_course_id, 'What is the primary role of a systems analyst?', 'multiple_choice', 'Write all code', 'Design hardware', 'Conduct study, identify objectives, determine procedures', 'Maintain databases', 'C', 'Systems analyst conducts study, identifies activities/objectives, determines procedures.'),
    -- Q113
    (v_course_id, 'Which feasibility determines if a project will be acceptable to management?', 'multiple_choice', 'Social feasibility', 'Management feasibility', 'Operational feasibility', 'Technical feasibility', 'B', 'Management feasibility checks acceptability to management.'),
    -- Q114
    (v_course_id, 'The central objective is the ______ characteristic of a system.', 'multiple_choice', 'first', 'second', 'last', 'only', 'C', 'Central objective is the last characteristic of a system.'),
    -- Q115
    (v_course_id, 'What is the meaning of "integration" in systems thinking?', 'multiple_choice', 'Parts work independently', 'Parts work together even though each performs a unique function', 'The system is isolated', 'The system has no central goal', 'B', 'Integration means parts work together within the system.'),
    -- Q116
    (v_course_id, 'Which of the following is a tangible benefit?', 'multiple_choice', 'Improved corporate image', 'More satisfied customers', 'Error-free reports', 'Better employee morale', 'C', 'Error-free reports are measurable, hence tangible.'),
    -- Q117
    (v_course_id, 'What is the purpose of a pilot system?', 'multiple_choice', 'Test the system in one part of the organization', 'Switch all users at once', 'Run old and new together', 'Convert data only', 'A', 'Pilot system is implemented in one department as a trial.'),
    -- Q118
    (v_course_id, 'Which of the following is a characteristic of sequential files?', 'multiple_choice', 'Records can be added only at the end', 'Direct access is fast', 'No sorting needed', 'Best for random queries', 'A', 'In sequential organization, records can be added only at the end.'),
    -- Q119
    (v_course_id, 'Which language is the most popular conversational programming language?', 'multiple_choice', 'FORTRAN', 'COBOL', 'BASIC', 'dBASE', 'C', 'BASIC is the most popular conversational programming language.'),
    -- Q120
    (v_course_id, 'What does the acronym COBOL stand for?', 'multiple_choice', 'Common Business Oriented Language', 'Computer Basic Object Language', 'Code for Business Operations Language', 'Central Operating Binary Language', 'A', 'COBOL stands for Common Business Oriented Language.'),
    -- Q121
    (v_course_id, 'Which testing strategy develops test cases to execute every instruction and path in a program?', 'multiple_choice', 'Specification testing', 'Code testing', 'String testing', 'Unit testing', 'B', 'Code testing aims to execute all instructions and paths.'),
    -- Q122
    (v_course_id, 'What is the central location for maintenance of a new system called?', 'multiple_choice', 'Repository', 'Library', 'Database', 'Server', 'B', 'The library is the central location for system maintenance.'),
    -- Q123
    (v_course_id, 'Which test determines how users will use the system when processing data?', 'multiple_choice', 'Human factors testing', 'Procedure testing', 'Recovery test', 'Storage testing', 'A', 'Human factors testing examines user interaction with the system.'),
    -- Q124
    (v_course_id, 'What is the audit trail?', 'multiple_choice', 'A security device', 'The path a transaction traces through a data processing system', 'A type of database', 'A testing method', 'B', 'Audit trail traces a transaction from source document to final output.'),
    -- Q125
    (v_course_id, 'How many types of documentation are mentioned?', 'multiple_choice', 'Three', 'Four', 'Five', 'Six', 'C', 'Five types: Program, Operation, User, Management, Systems documentation.'),
    -- Q126
    (v_course_id, 'Which diagram is also called a Nassi-Shneiderman chart?', 'multiple_choice', 'Flowchart', 'Structured flowchart', 'HIPO', 'Warnier/Orr diagram', 'B', 'Structured flowcharts are also called Nassi-Shneiderman charts.'),
    -- Q127
    (v_course_id, 'In structured flowcharts, which symbol represents looping and repetition?', 'multiple_choice', 'Process', 'Decision', 'Iteration', 'Input', 'C', 'Iteration symbol represents looping while a condition exists.'),
    -- Q128
    (v_course_id, 'Which diagram clearly shows processes and sequences using braces?', 'multiple_choice', 'DFD', 'Flowchart', 'Warnier/Orr diagram', 'Decision tree', 'C', 'Warnier/Orr diagrams show processes and sequences.'),
    -- Q129
    (v_course_id, 'What is a cover letter in system design?', 'multiple_choice', 'A technical document', 'A correspondence to management describing benefits of new design', 'A user manual', 'A test plan', 'B', 'Cover letter sells the system to management.'),
    -- Q130
    (v_course_id, 'Which conversion method is used when a new system cannot be installed all at once throughout the organization?', 'multiple_choice', 'Direct conversion', 'Parallel conversion', 'Phase-in method', 'Pilot system', 'C', 'Phase-in method installs gradually across the organization.'),
    -- Q131
    (v_course_id, 'What is a major benefit of using a data centre?', 'multiple_choice', 'Full control over processing time', 'Eliminates staff management problems', 'Total data security', 'No dependency on external party', 'B', 'Data centres eliminate staff and management problems of hiring technical professionals.'),
    -- Q132
    (v_course_id, 'What is a lease for a system?', 'multiple_choice', 'Short-term rental', 'A commitment for 3 to 7 years', 'A one-time purchase', 'An open-ended contract', 'B', 'A lease is a commitment for a specific time, generally 3 to 7 years.'),
    -- Q133
    (v_course_id, 'Which type of file is a copy made from long-term storage for later use?', 'multiple_choice', 'Backup file', 'Archival file', 'Transaction file', 'Master file', 'B', 'Archival files are stored for long-term and may be needed much later.'),
    -- Q134
    (v_course_id, 'What does UPC stand for?', 'multiple_choice', 'Universal Product Code', 'Uniform Program Control', 'United Processing Code', 'Universal Price Check', 'A', 'UPC is Universal Product Code used in optical bar code readers.'),
    -- Q135
    (v_course_id, 'What is the role of a database management system (DBMS)?', 'multiple_choice', 'Store data only', 'Facilitate adding, modifying, and retrieving data', 'Design hardware', 'Compile programs', 'B', 'DBMS is a set of programs to manage database operations.'),
    -- Q136
    (v_course_id, 'In a hierarchical database model, the structure is also called a ______.', 'multiple_choice', 'network', 'relational', 'tree', 'flat file', 'C', 'Hierarchical structure is also called a tree structure.'),
    -- Q137
    (v_course_id, 'What is a schema?', 'multiple_choice', 'A type of data', 'A description of data structure separate from the data itself', 'A programming language', 'A testing method', 'B', 'Schema describes data structure, independent of the data.'),
    -- Q138
    (v_course_id, 'Which of the following is NOT one of the three database models?', 'multiple_choice', 'Hierarchical', 'Network', 'Relational', 'Sequential', 'D', 'Sequential is a file organization, not a database model. The three models are hierarchical, network, relational.'),
    -- Q139
    (v_course_id, 'What is a tuple in relational databases?', 'multiple_choice', 'A column', 'A row (record)', 'A table', 'A key', 'B', 'Tuples are rows in a relational table.'),
    -- Q140
    (v_course_id, 'Which code is formed from the first letter or letters of several words and often becomes a word itself?', 'multiple_choice', 'Mnemonic code', 'Sequence code', 'Acronym', 'Function code', 'C', 'An acronym is a mnemonic representation that becomes a word.'),
    -- Q141
    (v_course_id, 'What is the fourth phase in the system life cycle?', 'multiple_choice', 'Preliminary investigation', 'System design', 'Software development', 'Implementation', 'C', 'The fourth phase is software development (after design).'),
    -- Q142
    (v_course_id, 'What is a benchmark in vendor selection?', 'multiple_choice', 'A financial measure', 'A test to determine if parts are satisfactory', 'A type of contract', 'A user requirement', 'B', 'Benchmark originated from machinists measuring parts; in systems, its a test.'),
    -- Q143
    (v_course_id, 'Which structure is used when a series of steps must be carried out in linear sequence?', 'multiple_choice', 'If-then', 'Do-while', 'Simple sequence', 'Case', 'C', 'Simple sequence is linear execution.'),
    -- Q144
    (v_course_id, 'Which structure is used to loop through a sequence repeatedly?', 'multiple_choice', 'If-then', 'Do-while', 'Simple sequence', 'Goto', 'B', 'Do-while repeats a sequence while condition holds.'),
    -- Q145
    (v_course_id, 'What is pseudocode?', 'multiple_choice', 'Actual code', 'A graphical representation', 'English statements expressing program logic', 'A database language', 'C', 'Pseudocode uses English-like statements to describe logic.'),
    -- Q146
    (v_course_id, 'COBOL programs cannot directly read which type of file?', 'multiple_choice', 'Sequential file', 'Indexed file', 'dBASE III file', 'Flat file', 'C', 'COBOL cannot directly read dBASE III files.'),
    -- Q147
    (v_course_id, 'A system is said to be reliable if it does not produce ______ during normal use.', 'multiple_choice', 'errors', 'dangerous or costly failures', 'output', 'transactions', 'B', 'Reliability means no dangerous or costly failures.'),
    -- Q148
    (v_course_id, 'How many general strategies are there for testing software?', 'multiple_choice', 'One', 'Two', 'Three', 'Four', 'B', 'Two strategies: code testing and specification testing.'),
    -- Q149
    (v_course_id, 'Which test determines if the system will handle peak volume of activities?', 'multiple_choice', 'Storage testing', 'Performance time testing', 'Peak load test', 'Recovery test', 'C', 'Peak load test checks handling of maximum demand.'),
    -- Q150
    (v_course_id, 'What does the acronym JCL stand for?', 'multiple_choice', 'Java Control Language', 'Job Control Language', 'Just Common Logic', 'Joint Computing Library', 'B', 'JCL stands for Job Control Language.'),
    -- Q151
    (v_course_id, 'What is the purpose of a decision tree?', 'multiple_choice', 'To store data', 'To show paths possible after an action or decision', 'To compile code', 'To design hardware', 'B', 'Decision tree shows possible paths following a decision.'),
    -- Q152
    (v_course_id, 'Which design is a data flow based methodology?', 'multiple_choice', 'Top-down design', 'Structured design', 'Object-oriented design', 'Modular design', 'B', 'Structured design is data flow based.'),
    -- Q153
    (v_course_id, 'What does the term "top-down design" mean?', 'multiple_choice', 'Design from bottom up', 'Design from general to specific', 'Design from specific to general', 'Random design', 'B', 'Top-down design proceeds from the top (general) down to details.'),
    -- Q154
    (v_course_id, 'What is the result of the system design process?', 'multiple_choice', 'Program code', 'System specifications document', 'User manual', 'Test plan', 'B', 'System design results in a document called system specifications.'),
    -- Q155
    (v_course_id, 'Which design indicates necessary procedures to ensure correctness and timeliness?', 'multiple_choice', 'Procedure design', 'Control design', 'Output design', 'Input design', 'B', 'Control design ensures correctness, accuracy, timely output.'),
    -- Q156
    (v_course_id, 'What is the first step in selection of a vendor?', 'multiple_choice', 'Vendor selection', 'Understanding user requirements', 'Benchmark test', 'Contract negotiation', 'B', 'First step is understanding user requirements within organizational objectives.'),
    -- Q157
    (v_course_id, 'Which phase ranks vendor proposals and determines the best suited?', 'multiple_choice', 'Vendor selection', 'Evaluation phase', 'Benchmarking', 'Negotiation', 'B', 'The evaluation phase ranks proposals.'),
    -- Q158
    (v_course_id, 'A flowchart serves as a logical road map for ______.', 'multiple_choice', 'users', 'managers', 'programmers', 'analysts', 'C', 'Flowchart guides programmers to write code.'),
    -- Q159
    (v_course_id, 'Which loop structure repeats until a condition exists?', 'multiple_choice', 'Do-while', 'If-then-else', 'Repeat-until', 'For loop', 'A', 'Do-while repeats while condition exists (or until). The text says "do-while" for looping.'),
    -- Q160
    (v_course_id, 'What is a test case?', 'multiple_choice', 'A set of data the system processes as normal input', 'A program bug', 'A user requirement', 'A hardware component', 'A', 'Test case is a set of data for normal input processing.'),
    -- Q161
    (v_course_id, 'Which type of error deals with incorrect data fields or invalid combinations?', 'multiple_choice', 'Syntax error', 'Logic error', 'Runtime error', 'Compilation error', 'B', 'Logic error involves incorrect data fields or invalid combinations.'),
    -- Q162
    (v_course_id, 'What is the objective of an acceptance test?', 'multiple_choice', 'Find all bugs', 'Sell the user on the validity and reliability of the system', 'Measure performance', 'Check documentation', 'B', 'Acceptance test convinces users of system validity and reliability.'),
    -- Q163
    (v_course_id, 'Which test determines the capacity to store transaction data on disk?', 'multiple_choice', 'Peak load test', 'Storage testing', 'Performance time testing', 'Recovery test', 'B', 'Storage testing determines data storage capacity.'),
    -- Q164
    (v_course_id, 'External controls to a system include ______.', 'multiple_choice', 'program code', 'database schemas', 'laws and regulations', 'internal checks', 'C', 'External controls are laws, regulations, procedures outside the system.'),
    -- Q165
    (v_course_id, 'What is the purpose of a review plan in post-implementation review?', 'multiple_choice', 'To design new features', 'To outline objectives, evaluation type, and time schedule', 'To train users', 'To write code', 'B', 'Review plan states objectives, evaluation type, and schedule.'),
    -- Q166
    (v_course_id, 'Which of the following is a disadvantage of outright purchase?', 'multiple_choice', 'No control', 'Absolute responsibility for all types of problems', 'High monthly cost', 'Short-term commitment', 'B', 'Outright purchase makes you responsible for all problems.'),
    -- Q167
    (v_course_id, 'What is the main advantage of using questionnaires?', 'multiple_choice', 'High response rate', 'Economically gather data from large groups', 'In-depth answers', 'No follow-up needed', 'B', 'Questionnaires economically gather data from both large and small groups.'),
    -- Q168
    (v_course_id, 'Which type of question gives respondents a specific set of potential answers?', 'multiple_choice', 'Open-ended', 'Multiple choice', 'Rating', 'Rank', 'B', 'Multiple choice provides specific answer options.'),
    -- Q169
    (v_course_id, 'A report that shows demand increasing and additional stock should be ordered is an example of ______.', 'multiple_choice', 'transaction processing', 'management information', 'inventory report', 'decision support', 'C', 'The text mentions a report indicating need to order inventory.'),
    -- Q170
    (v_course_id, 'What does the acronym CBIS stand for?', 'multiple_choice', 'Computer-Based Information System', 'Central Business Integration Software', 'Core Binary Instruction Set', 'Common Basic Input System', 'A', 'CBIS is Computer-Based Information System.'),
    -- Q171
    (v_course_id, 'Which of the following is NOT a characteristic of a system?', 'multiple_choice', 'Organization', 'Interaction', 'Independence', 'Central objective', 'C', 'Systems have interdependence, not independence.'),
    -- Q172
    (v_course_id, 'What is the main function of Transaction Processing System?', 'multiple_choice', 'Support strategic planning', 'Capture and process routine business transactions', 'Provide decision support', 'Automate office tasks', 'B', 'TPS captures, classifies, stores, and retrieves transaction data.'),
    -- Q173
    (v_course_id, 'What does the acronym DSS refer to?', 'multiple_choice', 'Data Storage System', 'Decision Support System', 'Digital Security Service', 'Dynamic Software Solution', 'B', 'DSS is Decision Support System.'),
    -- Q174
    (v_course_id, 'Which of the following is an example of a probabilistic system?', 'multiple_choice', 'Numerically controlled machine tool', 'Inventory system with unpredictable demand', 'A clock', 'A calculator', 'B', 'Probabilistic systems have unpredictable events, like inventory demand.'),
    -- Q175
    (v_course_id, 'What is the purpose of system evaluation?', 'multiple_choice', 'To identify strengths and weaknesses', 'To write code', 'To design interfaces', 'To install hardware', 'A', 'Evaluation identifies strengths and weaknesses of the system.'),
    -- Q176
    (v_course_id, 'The process of gathering and interpreting facts to recommend improvement is called ______.', 'multiple_choice', 'System design', 'System analysis', 'System implementation', 'System maintenance', 'B', 'Systems analysis involves gathering facts and recommending improvements.'),
    -- Q177
    (v_course_id, 'What does the acronym MICR stand for?', 'multiple_choice', 'Magnetic Ink Character Recognition', 'Microphone Input Control Register', 'Memory Interface Card Reader', 'Multiple Integrated Circuit Reader', 'A', 'MICR reads magnetic ink on checks.'),
    -- Q178
    (v_course_id, 'What is spooling?', 'multiple_choice', 'Creating a backup', 'The process of creating a report file', 'Sorting data', 'Encrypting files', 'B', 'Spooling is the process of creating a report file.'),
    -- Q179
    (v_course_id, 'Which of the following is a type of memory form?', 'multiple_choice', 'A form that requests action', 'A record of historical data that remains in a file', 'A guide for supervisors', 'A report form', 'B', 'Memory form records historical data for reference and control.'),
    -- Q180
    (v_course_id, 'What is the main advantage of presentation graphics?', 'multiple_choice', 'Require less memory', 'Communicate ideas effectively to unfamiliar audiences', 'Are cheaper to produce', 'Eliminate need for reports', 'B', 'Presentation graphics effectively communicate ideas to those unfamiliar with a situation.'),
    -- Q181
    (v_course_id, 'Which type of file is a temporary file used for two purposes?', 'multiple_choice', 'Master file', 'Transaction file', 'Table file', 'Report file', 'B', 'Transaction file is temporary, used for two purposes (e.g., holding transactions).'),
    -- Q182
    (v_course_id, 'What does bpi stand for?', 'multiple_choice', 'Bytes per inch', 'Bits per inch', 'Blocks per index', 'Binary program instruction', 'B', 'bpi stands for bits per inch, measuring magnetic tape density.'),
    -- Q183
    (v_course_id, 'What is the simplest method to store and retrieve data from a file?', 'multiple_choice', 'Indexed', 'Sequential', 'Direct', 'Hashed', 'B', 'Sequential organization is the simplest method.'),
    -- Q184
    (v_course_id, 'What is a database?', 'multiple_choice', 'A collection of unrelated files', 'A set of logically related files organized to minimize redundancy', 'A single file', 'A type of software', 'B', 'Database is a set of logically related files to facilitate access and reduce redundancy.'),
    -- Q185
    (v_course_id, 'Which model stores data in two-dimensional tables?', 'multiple_choice', 'Hierarchical', 'Network', 'Relational', 'Object-oriented', 'C', 'Relational model uses two-dimensional tables (relations).'),
    -- Q186
    (v_course_id, 'What is classification in data management?', 'multiple_choice', 'Random grouping', 'Establishment of categories that bring like items together', 'Encryption of data', 'Deleting old data', 'B', 'Classification establishes categories to group similar items.'),
    -- Q187
    (v_course_id, 'What is a function code?', 'multiple_choice', 'A code that describes items', 'A code that states activities to be performed without narrative details', 'A sequence of numbers', 'A mnemonic', 'B', 'Function codes state activities or work to be performed without spelling out details.'),
    -- Q188
    (v_course_id, 'What is a card code?', 'multiple_choice', 'A code for credit cards', 'Code that allows program to distinguish card types and check correctness', 'A sequence code', 'An acronym', 'B', 'Card codes help distinguish types of cards and verify contents.'),
    -- Q189
    (v_course_id, 'Which language is commonly used for business data processing?', 'multiple_choice', 'FORTRAN', 'BASIC', 'COBOL', 'dBASE', 'C', 'COBOL is Common Business Oriented Language for business.'),
    -- Q190
    (v_course_id, 'What is the purpose of system documentation?', 'multiple_choice', 'Sell the system', 'Provide basis for review of internal controls by auditors', 'Train users only', 'Market the product', 'B', 'Documentation is the basis for internal control review by auditors.'),
    -- Q191
    (v_course_id, 'Which of the following is NOT a step in feasibility analysis?', 'multiple_choice', 'Prepare system flowcharts', 'Estimate costs', 'Write program code', 'Report to management', 'C', 'Writing code is not part of feasibility analysis.'),
    -- Q192
    (v_course_id, 'What does the acronym HIPO consist of?', 'multiple_choice', 'Three types of diagrams', 'Two types of diagrams', 'Four types', 'One type', 'B', 'HIPO consists of two types: VTOC and IPO.'),
    -- Q193
    (v_course_id, 'What is the condition entry in a decision table?', 'multiple_choice', 'List of actions', 'List of yes/no permutations', 'List of conditions', 'List of rules', 'B', 'Condition entry lists all yes/no permutations.'),
    -- Q194
    (v_course_id, 'Trees can be easily read by ______ who find tables too complex.', 'multiple_choice', 'technical users', 'non-technical users', 'programmers', 'analysts', 'B', 'Trees are readable by non-technical users who find tables complex.'),
    -- Q195
    (v_course_id, 'Logical design proceeds from ______.', 'multiple_choice', 'bottom up', 'middle out', 'top down', 'random', 'C', 'Logical design proceeds from the top down.'),
    -- Q196
    (v_course_id, 'What does the acronym VTOC stand for?', 'multiple_choice', 'Visual Table of Contents', 'Variable Test of Code', 'Virtual Time of Computing', 'Verified Table of Classes', 'A', 'VTOC is Visual Table of Contents.'),
    -- Q197
    (v_course_id, 'What is the main advantage of using structured flowcharts?', 'multiple_choice', 'Use many arrows', 'Provide proper modular structure', 'Are harder to read', 'Require special software', 'B', 'Structured flowcharts force modular top-down design.'),
    -- Q198
    (v_course_id, 'What is the purpose of a dialogue tree?', 'multiple_choice', 'Map messages between computer and user', 'Store data', 'Compile programs', 'Design databases', 'A', 'Dialogue tree maps static and dynamic messages.'),
    -- Q199
    (v_course_id, 'What does the acronym DBMS stand for?', 'multiple_choice', 'Database Management System', 'Data Binary Mainframe System', 'Digital Base Memory Storage', 'Dynamic Batch Management Software', 'A', 'DBMS is Database Management System.'),
    -- Q200
    (v_course_id, 'What is the main reason for system maintenance?', 'multiple_choice', 'Add new features only', 'Eliminate errors and tune system to variations in environment', 'Replace hardware', 'Sell the system', 'B', 'Maintenance eliminates errors and adapts to environment changes.');

END $$;