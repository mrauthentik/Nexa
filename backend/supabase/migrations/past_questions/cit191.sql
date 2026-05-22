DO $$ 
DECLARE 
    v_course_id UUID;
BEGIN 
    SELECT id INTO v_course_id FROM courses WHERE code = 'CIT191' LIMIT 1;

    -- Q1 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is the system unit?', 'multiple_choice', 'A peripheral device', 'The main unit of a PC, the computer itself', 'Only the monitor', 'Just the keyboard', 'B', 'The system unit is the main unit of a PC, the computer itself while other units are peripherals.');

    -- Q2 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'The system unit could be viewed as the _____ orchestrating your PC''s operation.', 'fill_in_blank', 'master conductor', 'The system unit acts as the master conductor.');

    -- Q3 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does the system unit consist of?', 'multiple_choice', 'Only the motherboard', 'Only the power supply', 'Components like motherboard, processor, buses, memory, power supply', 'Only external devices', 'C', 'The system unit consists of components like motherboard, processor, buses, memory, power supply unit, etc.');

    -- Q4 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What do lights on the front panel indicate?', 'multiple_choice', 'Only power status', 'Power and turbo signals, hard or floppy disk activity', 'Only internet connection', 'Only battery status', 'B', 'Lights indicate power and turbo signals, and if hard or floppy disks are being read or written to.');

    -- Q5 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'The key lock on the front panel prevents the _____ from working when turned.', 'fill_in_blank', 'keyboard', 'Turning the key lock prevents the keyboard from working.');

    -- Q6 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is the turbo button used for?', 'multiple_choice', 'To slow down the computer', 'To choose different running speeds, usually set to fastest', 'To lock the computer', 'To restart the computer', 'B', 'The turbo switch is usually left so the computer runs at its fastest speed.');

    -- Q7 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'When should you use the reset button?', 'multiple_choice', 'As a first option', 'Only as a last resort when PC freezes', 'To save work', 'To change settings', 'B', 'Use reset button only as last resort; it loses unsaved work.');

    -- Q8 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Pressing the reset button loses all work you have not _____ in that session.', 'fill_in_blank', 'saved', 'Reset button causes loss of unsaved work.');

    -- Q9 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Where is the main power switch usually located?', 'multiple_choice', 'Only on the monitor', 'On the system unit, sometimes on outside back panel', 'Only on keyboard', 'Only on mouse', 'B', 'Main power switch is on system unit, sometimes on outside back panel.');

    -- Q10 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does a CD-ROM drive do?', 'multiple_choice', 'Only plays audio CDs', 'Only reads data CDs', 'Reads Compact Disc Read-Only Memory, plays audio and reads data CDs', 'Only writes CDs', 'C', 'CD-ROM drives read CD-ROMs, play audio CDs, and read data CDs including CD-R and CD-RW.');

    -- Q11 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'A 72x CD-ROM drive reads CDs roughly _____ times faster than a 1x version.', 'fill_in_blank', '72', '72x drive is 72 times faster than 1x.');

    -- Q12 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Why is there a fan at the back of the system unit?', 'multiple_choice', 'To add heat', 'To prevent overheating by removing hot air', 'To make noise', 'For decoration', 'B', 'Fan removes hot air to prevent overheating.');

    -- Q13 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What do power "in" and "out" sockets do?', 'multiple_choice', 'Connect to internet', 'Carry power from outlet to system unit and from system unit to monitor', 'Only charge battery', 'Connect USB devices', 'B', 'They carry power from outlet to system unit and to monitor.');

    -- Q14 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'USB stands for Universal _____ Bus.', 'fill_in_blank', 'Serial', 'USB stands for Universal Serial Bus.');

    -- Q15 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is a USB port?', 'multiple_choice', 'A type of battery', 'Standard cable connection interface for short-distance digital data communications', 'A cooling device', 'A type of memory', 'B', 'USB port is standard cable connection interface for short-distance digital data communications.');

    -- Q16 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does the small battery in the system unit power?', 'multiple_choice', 'The main processor', 'A clock to keep time when PC is off and maintains power to certain RAM chips', 'The monitor', 'The keyboard', 'B', 'Battery powers clock and maintains low electricity to certain RAM chips.');

    -- Q17 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'The disk drive controller card controls the PC''s disk drive _____ and transfers data.', 'fill_in_blank', 'motors', 'Controller card controls disk drive motors and transfers data.');

    -- Q18 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does the display adapter card do?', 'multiple_choice', 'Controls sound', 'Links PC''s memory and monitor', 'Controls keyboard', 'Powers the system', 'B', 'Display adapter card links PC''s memory and monitor.');

    -- Q19 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What was the earliest Intel CPU for PCs?', 'multiple_choice', '80286', '80386', '80486', '8038', 'D', 'Earliest PCs used Intel 8038 CPU.');

    -- Q20 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'After 8038, next generation PCs used CPU known as _____ and were called PC/AT computers.', 'fill_in_blank', '80286', 'Next generation used 80286 CPU, called PC/AT computers.');

    -- Q21 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What are recent Intel CPU examples?', 'multiple_choice', 'Only 80386', 'Intel Pentium I, II, III, IV & M', 'Only 80486', 'Only 80286', 'B', 'Recent CPUs include Intel Pentium I, II, III, IV & M.');

    -- Q22 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'How does a computer keyboard compare to a typewriter keyboard?', 'multiple_choice', 'Has fewer keys', 'Identical but has more keys', 'Completely different', 'Has no alphabet keys', 'B', 'Computer keyboard is identical to typewriter but has more keys.');

    -- Q23 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'A computer keyboard can be a dummy type or _____ type.', 'fill_in_blank', 'intelligent', 'Computer keyboards can be dummy or intelligent type.');

    -- Q24 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is the ESC key?', 'multiple_choice', 'Enter key', 'Escape key', 'Control key', 'Alternate key', 'B', 'ESC stands for Escape key.');

    -- Q25 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does CTRL stand for?', 'multiple_choice', 'Center', 'Control', 'Cancel', 'Copy', 'B', 'CTRL stands for Control key.');

    -- Q26 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'ALT stands for _____ key.', 'fill_in_blank', 'Alternate', 'ALT stands for Alternate key.');

    -- Q27 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does DEL key stand for?', 'multiple_choice', 'Delay', 'Delete', 'Deliver', 'Dial', 'B', 'DEL stands for Delete key.');

    -- Q28 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does a mouse look like?', 'multiple_choice', 'A small animal', 'Electrical clipper in a barbing saloon', 'A square box', 'A ball', 'B', 'Mouse looks like electrical clipper in barbing saloon.');

    -- Q29 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'A mouse consists of a pointing device very sensitive to _____.', 'fill_in_blank', 'movements', 'Mouse is sensitive to movements.');

    -- Q30 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'How do you operate a mouse?', 'multiple_choice', 'By speaking to it', 'By moving it on flat surface and clicking buttons', 'By typing commands', 'By touching screen', 'B', 'Move mouse on flat surface and click buttons to operate.');

    -- Q31 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is a printer?', 'multiple_choice', 'Input device', 'Component that creates paper copies of computer information', 'Sound device', 'Storage device', 'B', 'Printer creates copies of computer information on paper.');

    -- Q32 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Printed material is often called _____ copy, differentiating from data on disk.', 'fill_in_blank', 'hard', 'Printed material is called hard copy.');

    -- Q33 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What do scanners do?', 'multiple_choice', 'Print documents', 'Digitize artwork, photos, text from hard copy', 'Play sound', 'Type text', 'B', 'Scanners digitize artwork, photographs, text from hard copy.');

    -- Q34 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'How does a scanner work?', 'multiple_choice', 'Like a pair of eyes for PC', 'Like a printer', 'Like a keyboard', 'Like a mouse', 'A', 'Scanner works as a pair of eyes for your PC.');

    -- Q35 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'The _____ emits the computer''s sound output.', 'fill_in_blank', 'speaker', 'Speaker emits computer sound output.');

    -- Q36 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Why is a power supply unit needed?', 'multiple_choice', 'To increase voltage', 'To convert high voltage to low voltage for PC components', 'To generate internet signal', 'To cool the system', 'B', 'Power supply converts high voltage to low voltage for PC components.');

    -- Q37 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What voltage do most PC components need?', 'multiple_choice', '220 volts', '5 volts', '12 volts', '110 volts', 'B', 'Most components need 5-volt supply.');

    -- Q38 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Floppy disk drive motors require _____ volts.', 'fill_in_blank', '12', 'Floppy disk drive motors need 12 volts.');

    -- Q39 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is the hard disk?', 'multiple_choice', 'Temporary storage', 'Main permanent storage unit holding large data and programs', 'Input device', 'Output device', 'B', 'Hard disk is main permanent storage unit.');

    -- Q40 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What happens to hard disk data when PC is turned off?', 'multiple_choice', 'It disappears', 'It remains unless overwritten or disk damaged', 'It transfers to RAM', 'It gets deleted', 'B', 'Hard disk data remains when PC is off unless overwritten or damaged.');

    -- Q41 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'All electronic components in a PC are mounted on a piece of fiberglass called the _____.', 'fill_in_blank', 'motherboard', 'Components are mounted on motherboard.');

    -- Q42 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Why is fiberglass used for motherboard?', 'multiple_choice', 'It conducts electricity well', 'It cannot conduct electricity, insulating components', 'It is cheap', 'It is flexible', 'B', 'Fiberglass cannot conduct electricity, insulating components from each other.');

    -- Q43 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What connects components on motherboard?', 'multiple_choice', 'Plastic tubes', 'Thin lines of metal on fiberglass surface', 'Wooden sticks', 'Rubber bands', 'B', 'Thin lines of metal on fiberglass connect components.');

    -- Q44 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'A computer is manufactured to operate in an environment with a specific _____ range.', 'fill_in_blank', 'temperature', 'Computers need specific temperature range.');

    -- Q45 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What happens when computer temperature falls outside specific range?', 'multiple_choice', 'Works better', 'May function badly and get damaged', 'No effect', 'Runs faster', 'B', 'Computer may function badly and get damaged outside temperature range.');

    -- Q46 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does UPS stand for?', 'multiple_choice', 'Universal Power System', 'Uninterruptible Power Supply', 'United Power Source', 'Unified Power System', 'B', 'UPS stands for Uninterruptible Power Supply.');

    -- Q47 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'UPS converts public electricity raw line into _____ line.', 'fill_in_blank', 'fine', 'UPS conditions voltage into fine line.');

    -- Q48 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does UPS do when public electricity line is live?', 'multiple_choice', 'Nothing', 'Stores electrical energy', 'Shuts down computer', 'Increases voltage', 'B', 'UPS stores electrical energy when public electricity is live.');

    -- Q49 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does UPS do when public electricity line is dead?', 'multiple_choice', 'Shuts down immediately', 'Releases stored energy to computer', 'Increases voltage', 'Does nothing', 'B', 'UPS releases stored energy when public electricity is dead.');

    -- Q50 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Coaxial cables have a single _____ conductor at the center.', 'fill_in_blank', 'copper', 'Coaxial cables have copper conductor at center.');

    -- Q51 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What provides insulation in coaxial cable?', 'multiple_choice', 'Metal shield', 'Plastic layer between center conductor and braided shield', 'Glass core', 'Rubber coating', 'B', 'Plastic layer provides insulation between center conductor and metal shield.');

    -- Q52 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does the metal shield in coaxial cable do?', 'multiple_choice', 'Conducts electricity', 'Blocks outside interference', 'Generates signals', 'Cools the cable', 'B', 'Metal shield outside prevents interference.');

    -- Q53 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Fiber optic cables have a center _____ core.', 'fill_in_blank', 'glass', 'Fiber optic cables have glass core.');

    -- Q54 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'How do fiber optic cables avoid electrical obstruction?', 'multiple_choice', 'Use thicker wires', 'Transmit light instead of electronic signals', 'Use metal shielding', 'Use plastic coating', 'B', 'They transmit light instead of electronic signals.');

    -- Q55 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is STP cable?', 'multiple_choice', 'Shielded Twisted Pair cable', 'Single Twisted Pair', 'Straight Through Pair', 'Simple Twisted Pair', 'A', 'STP stands for Shielded Twisted Pair.');

    -- Q56 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'STP cables are often referred to colloquially as simply _____ cables.', 'fill_in_blank', 'ethernet', 'STP cables are called ethernet cables.');

    -- Q57 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is added to STP cables?', 'multiple_choice', 'Extra wires', 'External shield functioning as ground', 'Glass core', 'Plastic coating', 'B', 'External shield acting as ground is added to twisted pair.');

    -- Q58 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does UTP stand for?', 'multiple_choice', 'Universal Twisted Pair', 'Unshielded Twisted Pair', 'United Twisted Pair', 'Uniform Twisted Pair', 'B', 'UTP stands for Unshielded Twisted Pair.');

    -- Q59 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'In UTP cables, conductors are twisted around one another to cancel out _____ from external sources.', 'fill_in_blank', 'electromagnetic interference', 'Twisting cancels electromagnetic interference (EMI).');

    -- Q60 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Why are repeaters needed?', 'multiple_choice', 'To slow down signals', 'To amplify weakened signals over long distances', 'To connect different networks', 'To filter packets', 'B', 'Repeaters amplify weakened signals due to attenuation.');

    -- Q61 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What causes signal weakening over long cables?', 'multiple_choice', 'Attenuation', 'Amplification', 'Interference', 'Reflection', 'A', 'Signal gets weakened due to attenuation.');

    -- Q62 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Bridges were created to allow network administrators to _____ their networks transparently.', 'fill_in_blank', 'segment', 'Bridges allow segmenting networks.');

    -- Q63 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'How do bridges manage network traffic?', 'multiple_choice', 'By amplifying signals', 'By filtering packets', 'By converting protocols', 'By storing data', 'B', 'Bridges filter packets to manage traffic.');

    -- Q64 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does a switch incorporate?', 'multiple_choice', 'Only hub functions', 'Bridge functions and point-to-point dedicated connections', 'Only router functions', 'Only repeater functions', 'B', 'Switch incorporates bridge functions and point-to-point connections.');

    -- Q65 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Hubs are multi-port _____ and obey same rules as repeaters.', 'fill_in_blank', 'repeaters', 'Hubs are multi-port repeaters.');

    -- Q66 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What topology do hubs provide?', 'multiple_choice', 'Bus topology', 'Ring topology', 'Physical Star Topology', 'Mesh topology', 'C', 'Hubs provide Physical Star Topology.');

    -- Q67 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'When may a bridge not be adequate?', 'multiple_choice', 'In small networks', 'In environments with different protocols and architecture', 'In home networks', 'In wireless networks', 'B', 'Bridge may not be adequate with different protocols and architecture.');

    -- Q68 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Routers are needed in environments with several network segments with different _____ and architecture.', 'fill_in_blank', 'protocols', 'Routers handle different protocols and architecture.');

    -- Q69 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What can gateways do?', 'multiple_choice', 'Only connect similar networks', 'Perform protocol conversion for all seven OSI layers', 'Only amplify signals', 'Only filter packets', 'B', 'Gateways perform protocol conversion for all seven OSI layers.');

    -- Q70 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does MODEM stand for?', 'multiple_choice', 'Modulation Demodulation', 'Mode Demodulator', 'Modulator Demodulator', 'Modern Demodulator', 'C', 'MODEM stands for Modulator Demodulator.');

    -- Q71 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Modem converts digital signals to _____ signals for telephone lines.', 'fill_in_blank', 'analog', 'Modem converts digital to analog for phone lines.');

    -- Q72 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does IP stand for?', 'multiple_choice', 'Internet Protocol', 'Internal Protocol', 'International Protocol', 'Integrated Protocol', 'A', 'IP stands for Internet Protocol.');

    -- Q73 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is an IP address?', 'multiple_choice', 'Phone number', 'Unique address identifying device on internet or local network', 'Computer brand', 'Software name', 'B', 'IP address uniquely identifies device on internet or network.');

    -- Q74 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'TCP/IP defines _____ classes of IP addresses.', 'fill_in_blank', 'five', 'TCP/IP defines five classes: A, B, C, D, E.');

    -- Q75 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Which IP classes can be used for host addresses?', 'multiple_choice', 'A, B, C', 'D and E only', 'A and B only', 'C and D only', 'A', 'Classes A, B, C can be used for host addresses.');

    -- Q76 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is class D used for?', 'multiple_choice', 'Host addresses', 'Multicast', 'Experimental purposes', 'Broadcast', 'B', 'Class D is for multicast.');

    -- Q77 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Class E is used for _____ purposes.', 'fill_in_blank', 'experimental', 'Class E is for experimental purposes.');

    -- Q78 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is subnetting?', 'multiple_choice', 'Combining networks', 'Dividing single large network into multiple smaller networks', 'Increasing network speed', 'Connecting to internet', 'B', 'Subnetting divides single large network into smaller networks.');

    -- Q79 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is supernetting?', 'multiple_choice', 'Dividing networks', 'Summarizing contiguous subnetted networks into single large network', 'Creating subnets', 'Deleting networks', 'B', 'Supernetting summarizes contiguous subnetted networks back into single network.');

    -- Q80 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Supernetting is also known as route _____ and route aggregation.', 'fill_in_blank', 'summarization', 'Supernetting is also called route summarization.');

    -- Q81 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What are network commands used for?', 'multiple_choice', 'Playing games', 'Network configuration including router interface configuration', 'Typing documents', 'Drawing pictures', 'B', 'Network commands are for network configuration.');

    -- Q82 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does tracert command show?', 'multiple_choice', 'File size', 'Path a packet takes from your computer to specified destination', 'IP address only', 'Network speed', 'B', 'Tracert shows path a packet takes from your computer.');

    -- Q83 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'A project is a collection of _____ that make up your application.', 'fill_in_blank', 'files', 'Project is collection of files making application.');

    -- Q84 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does the Form Layout window show?', 'multiple_choice', 'Code only', 'Preview of Form window''s location', 'Network status', 'System temperature', 'B', 'Form Layout window shows preview of Form window location.');

    -- Q85 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'How does the Project Window help?', 'multiple_choice', 'Manages application components in tree-structured listing', 'Shows network connections', 'Displays temperature', 'Shows battery status', 'A', 'Project Window manages application components in tree-structured listing.');

    -- Q86 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Related objects appear together in the _____ Window.', 'fill_in_blank', 'Project', 'Project Window shows related objects together.');

    -- Q87 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What units are attached to the system unit?', 'multiple_choice', 'They are the computer itself', 'They are regarded as peripherals', 'They are internal components', 'They are software', 'B', 'Other units attached to system unit are peripherals.');

    -- Q88 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does the key lock prevent?', 'multiple_choice', 'Monitor display', 'Keyboard from working', 'Mouse movement', 'Power supply', 'B', 'Key lock prevents keyboard from working.');

    -- Q89 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'The reset button is used when PC _____ and won''t respond.', 'fill_in_blank', 'freezes', 'Reset button is used when PC freezes.');

    -- Q90 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is CD-ROM drive speed measured in?', 'multiple_choice', 'GHz', 'MB/s', 'x (times)', 'RPM', 'C', 'CD-ROM drive speed is measured in x (times).');

    -- Q91 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What generates heat in PC?', 'multiple_choice', 'Only processor', 'Electronic components', 'Only power supply', 'Only hard disk', 'B', 'Electronic components generate heat.');

    -- Q92 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'USB ports allow devices to transfer _____ data over USB cables.', 'fill_in_blank', 'digital', 'USB ports transfer digital data.');

    -- Q93 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does the battery maintain power to?', 'multiple_choice', 'All RAM chips', 'Certain RAM chips recording installed components', 'Processor only', 'Monitor only', 'B', 'Battery maintains low electricity to certain RAM chips.');

    -- Q94 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What links internal components with external devices?', 'multiple_choice', 'Power supply', 'Serial and parallel ports on disk drive controller card', 'Battery', 'Fan', 'B', 'Serial and parallel ports on controller card link internal and external devices.');

    -- Q95 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'The display adapter card is the link between PC''s _____ and monitor.', 'fill_in_blank', 'memory', 'Display adapter links memory and monitor.');

    -- Q96 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does a computer keyboard have more of than typewriter?', 'multiple_choice', 'Larger size', 'More keys', 'More colors', 'More functions', 'B', 'Computer keyboard has more keys than typewriter.');

    -- Q97 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What special keys are mentioned?', 'multiple_choice', 'Only Enter key', 'Return/Enter, ESC, CTRL, ALT, DEL', 'Only space bar', 'Only shift key', 'B', 'Special keys include Return/Enter, ESC, CTRL, ALT, DEL.');

    -- Q98 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'A mouse has a roller ball and two or more _____ that can be pressed.', 'fill_in_blank', 'buttons', 'Mouse has buttons that can be pressed.');

    -- Q99 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What can you do with a mouse?', 'multiple_choice', 'Type text', 'Sensitize and command computer to carry out tasks', 'Print documents', 'Scan images', 'B', 'Mouse can sensitize and command computer to carry out tasks.');

    -- Q100 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What differentiates hard copy from data on disk?', 'multiple_choice', 'Hard copy is electronic', 'Hard copy is printed material', 'Hard copy is temporary', 'Hard copy is software', 'B', 'Hard copy is printed material, different from data on disk.');

    -- Q101 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Scanners convert hard copy to _____ format.', 'fill_in_blank', 'electronic', 'Scanners digitize to electronic format.');

    -- Q102 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What would happen if components connected to household current?', 'multiple_choice', 'Work normally', 'Blow up', 'Run slower', 'Get cooler', 'B', 'Components would blow up if connected to household current.');

    -- Q103 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'How does hard disk data compare to RAM data when PC is off?', 'multiple_choice', 'Both disappear', 'Hard disk data remains, RAM data lost', 'Both remain', 'Hard disk data lost, RAM data remains', 'B', 'Hard disk data remains when PC off, RAM data is lost.');

    -- Q104 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Fiberglass on motherboard cannot conduct _____.', 'fill_in_blank', 'electricity', 'Fiberglass does not conduct electricity.');

    -- Q105 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What forms computer''s electrical circuits on motherboard?', 'multiple_choice', 'Plastic lines', 'Thin lines of metal connecting component pins', 'Wooden sticks', 'Rubber bands', 'B', 'Thin lines of metal on fiberglass form electrical circuits.');

    -- Q106 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Why might a computer get damaged?', 'multiple_choice', 'If temperature is within range', 'If temperature falls outside specific range', 'If used normally', 'If turned off properly', 'B', 'Computer may get damaged if temperature outside specific range.');

    -- Q107 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'UPS conditions the _____ that is fed into the computer.', 'fill_in_blank', 'voltage', 'UPS conditions the voltage.');

    -- Q108 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is coaxial cable good at?', 'multiple_choice', 'Transmitting light', 'Preventing outside interference with metal shield', 'Being flexible', 'Being cheap', 'B', 'Metal shield prevents outside interference.');

    -- Q109 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Where are fiber optic cables perfect?', 'multiple_choice', 'In environments with electrical interference', 'In dry places', 'In cold environments', 'In small networks', 'A', 'Fiber optic perfect for environments with electrical interference.');

    -- Q110 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'STP cables use a special type of copper _____ wiring.', 'fill_in_blank', 'telephone', 'STP uses copper telephone wiring.');

    -- Q111 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Where are UTP cables used?', 'multiple_choice', 'Only in power lines', 'Telecommunications and computer industries as ethernet and telephone wires', 'Only in audio systems', 'Only in television', 'B', 'UTP used in telecommunications and computer industries.');

    -- Q112 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does attenuation cause?', 'multiple_choice', 'Signal strengthening', 'Signal weakening over long distances', 'No change', 'Signal conversion', 'B', 'Attenuation causes signal weakening.');

    -- Q113 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Repeaters _____ the weakened signal.', 'fill_in_blank', 'amplify', 'Repeaters amplify weakened signal.');

    -- Q114 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What do bridges filter?', 'multiple_choice', 'Air', 'Packets', 'Water', 'Sound', 'B', 'Bridges filter packets.');

    -- Q115 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What do switches connect?', 'multiple_choice', 'Only power sources', 'Devices or networks', 'Only monitors', 'Only keyboards', 'B', 'Switches connect devices or networks.');

    -- Q116 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Hubs interconnect various connections at the _____ layer of OSI Model.', 'fill_in_blank', 'Physical', 'Hubs work at Physical layer.');

    -- Q117 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What networks do gateways connect?', 'multiple_choice', 'Only similar networks', 'Totally dissimilar networks', 'Only small networks', 'Only wireless networks', 'B', 'Gateways connect totally dissimilar networks.');

    -- Q118 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does modem convert analog signals to?', 'multiple_choice', 'More analog signals', 'Digital signals usable by computer', 'Light signals', 'Sound signals', 'B', 'Modem converts analog to digital for computer use.');

    -- Q119 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'IP address identifies a device on internet or _____ network.', 'fill_in_blank', 'local', 'IP address identifies device on internet or local network.');

    -- Q120 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What determines IP address class?', 'multiple_choice', 'Last octet', 'First octet', 'Subnet mask', 'Gateway address', 'B', 'First octet determines IP address class.');

    -- Q121 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is route summarization also called?', 'multiple_choice', 'Subnetting', 'Supernetting', 'Networking', 'Routing', 'B', 'Route summarization is also called supernetting.');

    -- Q122 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Network commands help configure router _____ and save configuration.', 'fill_in_blank', 'interface', 'Network commands configure router interface.');

    -- Q123 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What might a single application consist of?', 'multiple_choice', 'One file only', 'Several files collected in a project', 'Only hardware', 'Only network connections', 'B', 'Application might consist of several files collected in project.');

    -- Q124 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does Form Layout window show preview of?', 'multiple_choice', 'Code execution', 'Form window''s location', 'Network path', 'System performance', 'B', 'Form Layout window shows preview of Form window location.');

    -- Q125 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Project Window lists components in a _____-structured listing.', 'fill_in_blank', 'tree', 'Project Window uses tree-structured listing.');

    -- Q126 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What do colored lights on front panel indicate?', 'multiple_choice', 'Only power', 'Power, turbo, disk activity', 'Only temperature', 'Only internet', 'B', 'Lights indicate power, turbo, and disk activity.');

    -- Q127 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Why use key lock?', 'multiple_choice', 'To speed up PC', 'To stop intruders tampering with PC', 'To improve graphics', 'To increase storage', 'B', 'Key lock stops intruders tampering with PC.');

    -- Q128 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Turbo switch is usually left so computer runs at its _____ speed.', 'fill_in_blank', 'fastest', 'Turbo switch usually set for fastest speed.');

    -- Q129 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is optical drive?', 'multiple_choice', 'Hard disk', 'CD-ROM drive', 'Floppy drive', 'USB drive', 'B', 'Optical drive is CD-ROM drive.');

    -- Q130 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What removes hot air from system?', 'multiple_choice', 'Battery', 'Fan at back', 'Power supply', 'Motherboard', 'B', 'Fan at back removes hot air.');

    -- Q131 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Power cables carry power from electrical outlet to _____ unit.', 'fill_in_blank', 'system', 'Cables carry power to system unit.');

    -- Q132 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What type of interface is USB port?', 'multiple_choice', 'Wireless', 'Standard cable connection interface', 'Optical', 'Audio', 'B', 'USB port is standard cable connection interface.');

    -- Q133 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does battery power when PC off?', 'multiple_choice', 'Monitor', 'Clock to keep time', 'Processor', 'Keyboard', 'B', 'Battery powers clock to keep time.');

    -- Q134 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Disk drive controller card transfers _____.', 'fill_in_blank', 'data', 'Controller card transfers data.');

    -- Q135 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Where is information stored for display?', 'multiple_choice', 'Only on monitor', 'In computer memory', 'Only on keyboard', 'Only on mouse', 'B', 'Information for display is stored in computer memory.');

    -- Q136 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What were PCs after 8038 called?', 'multiple_choice', 'PC/XT', 'PC/AT', 'PC/MT', 'PC/ST', 'B', 'PCs with 80286 were called PC/AT.');

    -- Q137 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Intel Pentium includes versions I, II, III, IV & _____.', 'fill_in_blank', 'M', 'Pentium includes M version.');

    -- Q138 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is Return key also called?', 'multiple_choice', 'ESC key', 'Enter key', 'DEL key', 'ALT key', 'B', 'Return key is also Enter key.');

    -- Q139 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'How is mouse used to command computer?', 'multiple_choice', 'By moving and clicking buttons', 'By speaking', 'By typing', 'By touching screen', 'A', 'Move mouse and click buttons to command.');

    -- Q140 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Printer creates copies on _____ from computer information.', 'fill_in_blank', 'paper', 'Printer creates paper copies.');

    -- Q141 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does scanner convert hard copy to?', 'multiple_choice', 'Another hard copy', 'Electronic format', 'Sound', 'Heat', 'B', 'Scanner converts to electronic format.');

    -- Q142 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What voltage does power supply convert?', 'multiple_choice', 'Low to high', 'High to low', 'AC to DC only', 'DC to AC only', 'B', 'Power supply converts high voltage to low.');

    -- Q143 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Hard disk holds large amount of data and _____.', 'fill_in_blank', 'programs', 'Hard disk holds data and programs.');

    -- Q144 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is motherboard made of?', 'multiple_choice', 'Metal', 'Fiberglass', 'Wood', 'Plastic', 'B', 'Motherboard is made of fiberglass.');

    -- Q145 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does air conditioner help with?', 'multiple_choice', 'Increasing heat', 'Maintaining specific temperature range', 'Generating electricity', 'Storing data', 'B', 'Air conditioner maintains temperature range.');

    -- Q146 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'UPS stores electrical energy when public electricity line is _____.', 'fill_in_blank', 'live', 'UPS stores energy when electricity is live.');

    -- Q147 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is in center of coaxial cable?', 'multiple_choice', 'Glass core', 'Single copper conductor', 'Multiple wires', 'Plastic tube', 'B', 'Coaxial cable has single copper conductor at center.');

    -- Q148 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'How do fiber optic cables transmit?', 'multiple_choice', 'Electronic signals', 'Light', 'Sound waves', 'Heat', 'B', 'Fiber optic transmits light.');

    -- Q149 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'STP cables have external shield functioning as _____.', 'fill_in_blank', 'ground', 'External shield acts as ground.');

    -- Q150 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does UTP cancel out?', 'multiple_choice', 'Sound', 'Electromagnetic interference (EMI)', 'Heat', 'Light', 'B', 'UTP cancels electromagnetic interference.');

    -- Q151 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does signal weakening result in?', 'multiple_choice', 'Faster transmission', 'Data loss', 'Stronger signal', 'No effect', 'B', 'Signal weakening can cause data loss.');

    -- Q152 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Bridges segment networks _____.', 'fill_in_blank', 'transparently', 'Bridges segment networks transparently.');

    -- Q153 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What do switches provide?', 'multiple_choice', 'Only wireless connection', 'Point-to-point dedicated connections', 'Only power', 'Only cooling', 'B', 'Switches provide point-to-point dedicated connections.');

    -- Q154 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What topology do hubs create?', 'multiple_choice', 'Bus', 'Star', 'Ring', 'Mesh', 'B', 'Hubs create Physical Star Topology.');

    -- Q155 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Routers ensure fast communication among network _____.', 'fill_in_blank', 'segments', 'Routers ensure communication among segments.');

    -- Q156 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'How many OSI layers can gateways perform conversion for?', 'multiple_choice', 'One layer', 'Three layers', 'All seven layers', 'No layers', 'C', 'Gateways perform protocol conversion for all seven OSI layers.');

    -- Q157 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does modem convert for telephone line?', 'multiple_choice', 'Analog to digital', 'Digital to analog', 'Light to sound', 'Sound to light', 'B', 'Modem converts digital to analog for telephone line.');

    -- Q158 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'IP address is _____ address identifying device.', 'fill_in_blank', 'unique', 'IP address is unique.');

    -- Q159 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'How many IP classes are there?', 'multiple_choice', '3', '4', '5', '6', 'C', 'There are five IP classes: A, B, C, D, E.');

    -- Q160 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is dividing large network into smaller networks called?', 'multiple_choice', 'Supernetting', 'Subnetting', 'Networking', 'Routing', 'B', 'Dividing network into smaller networks is subnetting.');

    -- Q161 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Supernetting summarizes _____ subnetted networks.', 'fill_in_blank', 'contiguous', 'Supernetting summarizes contiguous networks.');

    -- Q162 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does tracert show?', 'multiple_choice', 'File content', 'Packet path', 'IP class', 'Network cable type', 'B', 'Tracert shows packet path.');

    -- Q163 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is a project?', 'multiple_choice', 'Single file', 'Collection of files making application', 'Hardware component', 'Network device', 'B', 'Project is collection of files making application.');

    -- Q164 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Form Layout window is closely connected to _____ window.', 'fill_in_blank', 'Form', 'Form Layout window is connected to Form window.');

    -- Q165 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'How does Project Window list components?', 'multiple_choice', 'Randomly', 'Alphabetically', 'Tree-structured listing', 'By size', 'C', 'Project Window uses tree-structured listing.');

    -- Q166 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What are peripherals?', 'multiple_choice', 'Main computer unit', 'Units attached to system unit', 'Internal components only', 'Software only', 'B', 'Peripherals are units attached to system unit.');

    -- Q167 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Turning key lock _____ the keyboard.', 'fill_in_blank', 'prevents from working', 'Key lock prevents keyboard from working.');

    -- Q168 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is last resort for frozen PC?', 'multiple_choice', 'Turning off monitor', 'Reset button', 'Unplugging', 'Waiting', 'B', 'Reset button is last resort for frozen PC.');

    -- Q169 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What can CD-ROM drive play?', 'multiple_choice', 'Only data CDs', 'Audio CDs and read data CDs', 'Only video CDs', 'Only CD-RW', 'B', 'CD-ROM drives can play audio CDs and read data CDs.');

    -- Q170 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Fan removes _____ air from system.', 'fill_in_blank', 'hot', 'Fan removes hot air.');

    -- Q171 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does USB allow devices to do?', 'multiple_choice', 'Only charge', 'Be connected and transfer digital data', 'Only display video', 'Only produce sound', 'B', 'USB allows connection and digital data transfer.');

    -- Q172 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What records installed components?', 'multiple_choice', 'Processor', 'Certain RAM chips', 'Monitor', 'Keyboard', 'B', 'Certain RAM chips record installed components.');

    -- Q173 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Display adapter card makes information _____ to user.', 'fill_in_blank', 'visible/seen', 'Display adapter makes information visible.');

    -- Q174 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What CPU came after 8038?', 'multiple_choice', '80286', '80486', 'Pentium', '80386', 'A', '80286 came after 8038.');

    -- Q175 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What are extra keys on computer keyboard?', 'multiple_choice', 'Only alphabet', 'Special keys like ESC, CTRL, ALT', 'Only numbers', 'Only function keys', 'B', 'Extra keys include ESC, CTRL, ALT, etc.');

    -- Q176 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Mouse is sensitive to _____ on flat surface.', 'fill_in_blank', 'movements', 'Mouse is sensitive to movements.');

    -- Q177 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is hard copy?', 'multiple_choice', 'Data on disk', 'Printed material from computer', 'Data in memory', 'Software', 'B', 'Hard copy is printed material.');

    -- Q178 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does scanner work like?', 'multiple_choice', 'Printer', 'Eyes for PC', 'Keyboard', 'Mouse', 'B', 'Scanner works like eyes for PC.');

    -- Q179 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Speaker emits computer''s _____ output.', 'fill_in_blank', 'sound', 'Speaker emits sound output.');

    -- Q180 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What voltage do most components need?', 'multiple_choice', '12V', '5V', '220V', '110V', 'B', 'Most components need 5V.');

    -- Q181 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What remains on hard disk when PC off?', 'multiple_choice', 'Nothing', 'Information unless overwritten or damaged', 'Only programs', 'Only system files', 'B', 'Information remains unless overwritten or damaged.');

    -- Q182 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Components on motherboard are insulated because fiberglass cannot conduct _____.', 'fill_in_blank', 'electricity', 'Fiberglass does not conduct electricity.');

    -- Q183 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What connects component pins on motherboard?', 'multiple_choice', 'Plastic tubes', 'Metal lines', 'Wooden sticks', 'Rubber bands', 'B', 'Metal lines connect component pins.');

    -- Q184 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Why need specific temperature range?', 'multiple_choice', 'For color display', 'To prevent damage and bad function', 'For faster internet', 'For louder sound', 'B', 'To prevent damage and bad function.');

    -- Q185 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'UPS releases stored energy when public electricity line is _____.', 'fill_in_blank', 'dead', 'UPS releases energy when electricity is dead.');

    -- Q186 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is around copper conductor in coaxial cable?', 'multiple_choice', 'Glass core', 'Plastic layer and braided metal shield', 'Rubber coating', 'Wooden layer', 'B', 'Plastic layer and braided metal shield.');

    -- Q187 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'Why fiber optic good for electrical interference?', 'multiple_choice', 'Uses metal', 'Transmits light, not electronic signals', 'Is thicker', 'Is cheaper', 'B', 'Transmits light, avoiding electrical interference.');

    -- Q188 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'STP cables used for business _____ .', 'fill_in_blank', 'installations', 'STP used for business installations.');

    -- Q189 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What cancels EMI in UTP?', 'multiple_choice', 'Shielding', 'Twisting conductors', 'Thicker coating', 'Metal core', 'B', 'Twisting conductors cancels EMI.');

    -- Q190 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What boosts weakened signal?', 'multiple_choice', 'Bridge', 'Repeater', 'Router', 'Gateway', 'B', 'Repeater boosts weakened signal.');

    -- Q191 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Bridges manage traffic by filtering _____.', 'fill_in_blank', 'packets', 'Bridges filter packets.');

    -- Q192 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What do switches incorporate?', 'multiple_choice', 'Only hub functions', 'Bridge functions', 'Only router functions', 'Only modem functions', 'B', 'Switches incorporate bridge functions.');

    -- Q193 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What do hubs obey?', 'multiple_choice', 'Router rules', 'Same rules as repeaters', 'Switch rules', 'Gateway rules', 'B', 'Hubs obey same rules as repeaters.');

    -- Q194 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Routers needed for different _____ and architecture.', 'fill_in_blank', 'protocols', 'Routers handle different protocols.');

    -- Q195 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What can gateways connect?', 'multiple_choice', 'Only similar networks', 'Dissimilar networks', 'Only wireless', 'Only wired', 'B', 'Gateways connect dissimilar networks.');

    -- Q196 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What does modem convert for computer use?', 'multiple_choice', 'Analog to digital', 'Digital to analog for phone line', 'Light to sound', 'Sound to light', 'A', 'Modem converts analog to digital for computer use.');

    -- Q197 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'IP address governed by Internet _____.', 'fill_in_blank', 'Protocol', 'IP governed by Internet Protocol.');

    -- Q198 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What classes for host addresses?', 'multiple_choice', 'A, B, C', 'D, E', 'A only', 'B only', 'A', 'Classes A, B, C for host addresses.');

    -- Q199 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation) 
    VALUES (v_course_id, 'What is combining networks called?', 'multiple_choice', 'Subnetting', 'Supernetting', 'Networking', 'Routing', 'B', 'Combining networks is supernetting.');

    -- Q200 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation) 
    VALUES (v_course_id, 'Tracert shows _____ of packet from computer.', 'fill_in_blank', 'path', 'Tracert shows packet path.');

END $$;