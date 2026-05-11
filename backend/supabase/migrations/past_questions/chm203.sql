DO $$
DECLARE
    v_course_id UUID;
BEGIN
    SELECT id INTO v_course_id FROM courses WHERE code = 'CHM203' LIMIT 1;

    -- Q1 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The ______ and structural features of a compound are manifested in its physical properties.', 'fill_in_blank', 'Bonding', 'Bonding and structural features determine physical properties.');

    -- Q2 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The physical properties of a compound include the following EXCEPT:', 'multiple_choice', 'melting point', 'boiling point', 'solubility', 'molecular weight', 'D', 'Molecular weight is not typically listed as a physical property like melting point, boiling point, and solubility.');

    -- Q3 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'In ______ compounds, the positive and negative ions are held together by strong electrostatic forces.', 'fill_in_blank', 'Ionic', 'Ionic compounds have strong electrostatic forces between ions.');

    -- Q4 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of the following is NOT an intermolecular force?', 'multiple_choice', 'dipole-dipole interactions', 'London forces', 'Hydrogen bonding', 'Covalent bonding', 'D', 'Covalent bonding is an intramolecular force, not intermolecular.');

    -- Q5 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The intermolecular interactions which exist between non-polar molecules is known as:', 'multiple_choice', 'Hydrogen bonding', 'Dipole-dipole interactions', 'London forces', 'Ionic bonding', 'C', 'London forces exist between non-polar molecules.');

    -- Q6 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ occurs when a hydrogen atom is covalently bonded to a strongly electronegative atom such as oxygen, nitrogen or fluorine.', 'fill_in_blank', 'Hydrogen Bonding', 'Hydrogen bonding requires H bonded to O, N, or F.');

    -- Q7 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The strength of a hydrogen bond ranges from:', 'multiple_choice', '1 to 5 kJ mol⁻¹', '10 to 40 kJ mol⁻¹', '50 to 100 kJ mol⁻¹', '100 to 200 kJ mol⁻¹', 'B', 'Hydrogen bonds range from 10 to 40 kJ mol⁻¹ in strength.');

    -- Q8 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Dipole-dipole and London forces are collectively known as:', 'multiple_choice', 'Hydrogen bonding', 'Covalent forces', 'Van der Waals forces', 'Ionic forces', 'C', 'Dipole-dipole and London forces are Van der Waals forces.');

    -- Q9 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The ______ of a substance can be defined as the temperature at which it undergoes the transition from the solid to the liquid state.', 'fill_in_blank', 'Melting point', 'Melting point is solid to liquid transition temperature.');

    -- Q10 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Pure crystalline solids have:', 'multiple_choice', 'wide melting ranges', 'sharp melting points', 'no melting points', 'variable melting points', 'B', 'Pure crystalline solids have sharp melting points.');

    -- Q11 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Pure crystalline solids melt over a temperature range of:', 'multiple_choice', '1° or less', '5-10°', '10-20°', '20-30°', 'A', 'Pure crystalline solids melt within 1° or less.');

    -- Q12 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ crystalline solids melt over wider ranges of temperatures.', 'fill_in_blank', 'Impure', 'Impure solids melt over wider temperature ranges.');

    -- Q13 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In a crystalline solid, the constituent ions or molecules are arranged:', 'multiple_choice', 'randomly', 'in an orderly and rigid fashion', 'in liquid state', 'as gases', 'B', 'Crystalline solids have orderly, rigid arrangements.');

    -- Q14 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The melting point of sodium chloride is:', 'multiple_choice', '90 K', '351 K', '595 K', '1074 K', 'D', 'Sodium chloride melts at 1074 K.');

    -- Q15 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The ______ of a substance is the temperature at which it changes from the liquid to the gaseous state.', 'fill_in_blank', 'Boiling point', 'Boiling point is liquid to gas transition temperature.');

    -- Q16 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'At the boiling point, the vapour pressure of a liquid is equal to:', 'multiple_choice', 'internal pressure', 'external pressure', 'atmospheric pressure', 'both B and C', 'D', 'At boiling point, vapor pressure equals external/atmospheric pressure.');

    -- Q17 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Normally, boiling points are reported at:', 'multiple_choice', 'vacuum pressure', 'atmospheric pressure', 'high pressure', 'low pressure', 'B', 'Standard boiling points are at atmospheric pressure.');

    -- Q18 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The boiling point of a substance depends on its ______ structure.', 'fill_in_blank', 'Molecular', 'Molecular structure determines boiling point.');

    -- Q19 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In a homologous series, boiling points increase with:', 'multiple_choice', 'decrease in carbon atoms', 'increase in carbon atoms', 'branching', 'decrease in molecular weight', 'B', 'Boiling points increase with more carbon atoms in homologous series.');

    -- Q20 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which compounds have unusually high boiling points?', 'multiple_choice', 'Alkanes', 'Alkenes', 'Alcohols', 'Ethers', 'C', 'Alcohols have high boiling points due to hydrogen bonding.');

    -- Continue with 180 more questions following the same pattern...

    -- Q21 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Ethanol CH₃CH₂OH has the boiling point ______', 'fill_in_blank', '351 K', 'Ethanol boils at 351 K due to hydrogen bonding.');

    -- Q22 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Hydrogen bonding within the same molecule is called:', 'multiple_choice', 'intermolecular', 'intramolecular', 'resonance', 'tautomerism', 'B', 'Intramolecular hydrogen bonding occurs within the same molecule.');

    -- Q23 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The process where solvent molecules surround dissolved species is called:', 'multiple_choice', 'evaporation', 'solvation', 'distillation', 'sublimation', 'B', 'Solvation involves solvent molecules surrounding solute particles.');

    -- Q24 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The amount of substance dissolved in a certain amount of solvent is referred to as its ______ in that solvent.', 'fill_in_blank', 'Solubility', 'Solubility is amount dissolved in solvent.');

    -- Q25 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In a homologous series, solubility:', 'multiple_choice', 'increases with molecular weight', 'decreases with molecular weight', 'stays constant', 'is unpredictable', 'B', 'Solubility decreases with increasing molecular weight in homologous series.');

    -- Q26 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Branching of the carbon chain leads to:', 'multiple_choice', 'increase in intermolecular forces', 'decrease in intermolecular forces', 'no change in intermolecular forces', 'increase in melting point', 'B', 'Branching decreases intermolecular forces.');

    -- Q27 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'According to Arrhenius (1884), an ______ is a substance which ionizes in aqueous solution to produce hydrogen ions (H⁺).', 'fill_in_blank', 'Acid', 'Arrhenius acid produces H⁺ ions in water.');

    -- Q28 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Hydrogen ions (H⁺) are also known as:', 'multiple_choice', 'electrons', 'protons', 'neutrons', 'anions', 'B', 'H⁺ ions are protons.');

    -- Q29 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Arrhenius was a ______ chemist.', 'multiple_choice', 'German', 'Swedish', 'French', 'British', 'B', 'Arrhenius was Swedish.');

    -- Q30 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'An alternative theory of acids and bases was devised independently by ______ in 1922.', 'fill_in_blank', 'Bronsted and Lowry', 'Bronsted-Lowry theory was developed in 1922.');

        -- Q31 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'According to Bronsted-Lowry theory, an acid is a:', 'multiple_choice', 'proton donor', 'proton acceptor', 'electron donor', 'electron acceptor', 'A', 'Bronsted-Lowry acid donates protons.');

    -- Q32 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'According to Bronsted-Lowry theory, a base is a:', 'multiple_choice', 'proton donor', 'proton acceptor', 'electron donor', 'electron acceptor', 'B', 'Bronsted-Lowry base accepts protons.');

    -- Q33 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The Bronsted acids are also called ______ acids.', 'fill_in_blank', 'Protic', 'Bronsted acids are protic acids.');

    -- Q34 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The ethanoate ion is called the ______ of ethanoic acid.', 'multiple_choice', 'conjugate acid', 'conjugate base', 'isomer', 'tautomer', 'B', 'Ethanoate is conjugate base of ethanoic acid.');

    -- Q35 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The equilibrium constant for acid dissociation is called:', 'multiple_choice', 'Kb', 'Ka', 'Kw', 'Ksp', 'B', 'Ka is acidity constant.');

    -- Q36 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The expression relating pKa and pH is known as ______ equation.', 'fill_in_blank', 'Henderson-Hasselbalch', 'Henderson-Hasselbalch relates pKa and pH.');

    -- Q37 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The stronger the acid, the ______ the pKa value.', 'multiple_choice', 'larger', 'smaller', 'same', 'unpredictable', 'B', 'Stronger acids have smaller pKa values.');

    -- Q38 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A change in molecular structure affecting electron distribution is called:', 'multiple_choice', 'steric effect', 'electronic effect', 'resonance effect', 'tautomeric effect', 'B', 'Electronic effect changes electron distribution.');

    -- Q39 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'When polarization of a bond is felt by adjacent groups, this is called ______ effect.', 'fill_in_blank', 'Inductive', 'Inductive effect transmits charge through bonds.');

    -- Q40 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The acid-base theory involving electron-pair acceptors/donors was proposed by:', 'multiple_choice', 'Arrhenius', 'Bronsted', 'Lowry', 'Lewis', 'D', 'Lewis theory involves electron pairs.');

    -- Q41 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'According to Lewis theory, acids are:', 'multiple_choice', 'proton donors', 'proton acceptors', 'electron-pair acceptors', 'electron-pair donors', 'C', 'Lewis acids accept electron pairs.');

    -- Q42 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The presence of a positively charged group ______ the acidity of a molecule.', 'fill_in_blank', 'Increases', 'Positive groups increase acidity.');

    -- Q43 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Carbocations are classified as primary, secondary, or:', 'multiple_choice', 'quaternary', 'tertiary', 'aromatic', 'aliphatic', 'B', 'Carbocations are primary, secondary, or tertiary.');

    -- Q44 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which carbocation is most stable?', 'multiple_choice', 'primary', 'secondary', 'tertiary', 'methyl', 'C', 'Tertiary carbocations are most stable.');

    -- Q45 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The effect arising from spatial interactions between groups is called ______ effect.', 'fill_in_blank', 'steric', 'Steric effect involves spatial interactions.');

    -- Q46 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The rapid reversible interconversion of isomers is called:', 'multiple_choice', 'isomerism', 'tautomerism', 'resonance', 'hybridization', 'B', 'Tautomerism involves rapid reversible interconversion.');

    -- Q47 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Tautomers that differ in hydrogen and double bond location are called:', 'multiple_choice', 'valence tautomers', 'proton tautomers', 'ring tautomers', 'chain tautomers', 'B', 'Proton tautomers differ in H and double bond position.');

    -- Q48 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Keto-enol tautomerism is an example of ______ tautomerism.', 'fill_in_blank', 'proton', 'Keto-enol is proton tautomerism.');

    -- Q49 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Benzene was isolated by Michael Faraday in:', 'multiple_choice', '1825', '1845', '1931', '1884', 'A', 'Faraday isolated benzene in 1825.');

    -- Q50 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Benzene was discovered in coal tar by Holman in:', 'multiple_choice', '1825', '1845', '1931', '1884', 'B', 'Holman found benzene in coal tar in 1845.');

    -- Q51 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Prolonged exposure to ______ leads to bone-marrow depression.', 'fill_in_blank', 'Benzene', 'Benzene causes bone-marrow depression.');

    -- Q52 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Hydroforming is carried out at temperatures of:', 'multiple_choice', '100-200 K', '300-400 K', '500-600 K', '750-820 K', 'D', 'Hydroforming occurs at 750-820 K.');

    -- Q53 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Hydroforming uses which catalyst?', 'multiple_choice', 'iron', 'platinum', 'nickel', 'copper', 'B', 'Platinum catalyst is used in hydroforming.');

    -- Q54 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The presence of an aromatic ring is detectable by ______ spectroscopy.', 'fill_in_blank', 'UV', 'UV spectroscopy detects aromatic rings.');

    -- Q55 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Aromatic compounds show intense absorption near:', 'multiple_choice', '150 nm', '205 nm', '300 nm', '400 nm', 'B', 'Aromatics absorb intensely near 205 nm.');

    -- Q56 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Benzene is described as planar and symmetrical by:', 'multiple_choice', 'VSEPR theory', 'Molecular Orbital theory', 'Valence Bond theory', 'Crystal Field theory', 'B', 'Molecular Orbital theory describes benzene structure.');

    -- Q57 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The energy difference giving benzene stability is called ______ energy.', 'fill_in_blank', 'Resonance', 'Resonance energy stabilizes benzene.');

    -- Q58 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Hückels rule was proposed in:', 'multiple_choice', '1825', '1845', '1931', '1922', 'C', 'Hückels rule was proposed in 1931.');

    -- Q59 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The replacement of hydrogen by nitro-group is called:', 'multiple_choice', 'nitration', 'sulphonation', 'halogenation', 'alkylation', 'A', 'Nitration introduces nitro group.');

    -- Q60 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Nitration of benzene uses concentrated nitric and ______ acids.', 'fill_in_blank', 'Sulphuric', 'Nitration uses HNO3 and H2SO4.');

    -- Q61 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Benzene reacts with halogens in presence of FeBr3 to yield:', 'multiple_choice', 'alkyl halides', 'aryl halides', 'vinyl halides', 'acyl halides', 'B', 'Benzene gives aryl halides with halogens.');

    -- Q62 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which halogen is too reactive for good yield of aryl halide?', 'multiple_choice', 'chlorine', 'bromine', 'iodine', 'fluorine', 'D', 'Fluorine is too reactive.');

    -- Q63 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Aromatic compounds with -SO3H group are called ______ acids.', 'fill_in_blank', 'Aromatic sulphonic', 'Aromatic sulphonic acids have -SO3H group.');

    -- Q64 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Sulphonation is an example of:', 'multiple_choice', 'nucleophilic substitution', 'electrophilic substitution', 'free radical substitution', 'addition reaction', 'B', 'Sulphonation is electrophilic substitution.');

    -- Q65 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Friedel-Crafts alkylation uses which catalyst?', 'multiple_choice', 'FeCl3', 'AlCl3', 'Pt', 'Ni', 'B', 'Friedel-Crafts uses AlCl3 catalyst.');

    -- Q66 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Gammexane is an isomer of ______ used as insecticide.', 'fill_in_blank', 'hexachlorocyclohexane', 'Gammexane is hexachlorocyclohexane isomer.');

    -- Q67 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Hydrogenation of benzene yields:', 'multiple_choice', 'cyclohexane', 'cyclohexene', 'hexane', 'benzene hexachloride', 'A', 'Hydrogenation gives cyclohexane.');

    -- Q68 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Lithium in ethylamine reduces benzene to:', 'multiple_choice', 'cyclohexane only', 'cyclohexene only', 'cyclohexane and cyclohexene', 'hexane', 'C', 'Li/ethylamine gives cyclohexene and cyclohexane.');

    -- Q69 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ is the parent compound of polynuclear hydrocarbons.', 'fill_in_blank', 'Naphthalene', 'Naphthalene is parent polynuclear hydrocarbon.');

    -- Q70 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Naphthalene melting point is:', 'multiple_choice', '273 K', '355 K', '451 K', '515 K', 'B', 'Naphthalene melts at 355 K.');

    -- Q71 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Naphthalene has how many resonance structures?', 'multiple_choice', 'two', 'three', 'four', 'five', 'B', 'Naphthalene has three resonance structures.');

    -- Q72 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Oxidation of naphthalene gives ______.', 'fill_in_blank', '1,4-naphthoquinone', 'Naphthalene oxidizes to 1,4-naphthoquinone.');

    -- Q73 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Halogen derivatives are divided into how many classes?', 'multiple_choice', 'two', 'three', 'four', 'five', 'B', 'Halogen derivatives have three classes.');

    -- Q74 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Compounds with halogen attached to aromatic ring are called:', 'multiple_choice', 'alkyl halides', 'aryl halides', 'vinyl halides', 'acyl halides', 'B', 'Aryl halides have halogen on aromatic ring.');

    -- Q75 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Geminal dihalides are also called ______ halides.', 'fill_in_blank', 'alkyldene', 'Geminal dihalides are alkyldene halides.');

    -- Q76 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Hunsdiecker reaction converts silver salts to:', 'multiple_choice', 'alkyl bromides', 'alkyl chlorides', 'aryl halides', 'acyl halides', 'A', 'Hunsdiecker gives alkyl bromides.');

    -- Q77 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Common refrigerant Freon 12 is a:', 'multiple_choice', 'chlorofluorocarbon', 'hydrocarbon', 'alcohol', 'ether', 'A', 'Freon 12 is a chlorofluorocarbon.');

    -- Q78 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Dehydrohalogenation of alkyl halides produces ______.', 'fill_in_blank', 'Alkenes', 'Dehydrohalogenation gives alkenes.');

    -- Q79 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Trichloromethane is prepared from ethanol and:', 'multiple_choice', 'bleaching powder', 'sodium hydroxide', 'sulphuric acid', 'nitric acid', 'A', 'Chloroform from ethanol and bleaching powder.');

    -- Q80 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Halogen test in organic compounds uses:', 'multiple_choice', 'Lassaigne test', 'Belistein test', 'Molisch test', 'Benedict test', 'B', 'Belistein test detects halogens.');

    -- Q81 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Conversion of toluene to benzene is called ______.', 'fill_in_blank', 'Hydrodealkylation', 'Hydrodealkylation converts toluene to benzene.');

    -- Q82 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Catalytic reforming involves:', 'multiple_choice', 'dehydrogenation only', 'cyclisation only', 'isomerisation only', 'all of the above', 'D', 'Catalytic reforming involves all processes.');

    -- Q83 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Heptane in catalytic reforming gives:', 'multiple_choice', 'benzene', 'toluene', 'xylene', 'naphthalene', 'B', 'Heptane gives toluene in reforming.');

    -- Q84 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Benzene undergoes ______ substitution reactions.', 'fill_in_blank', 'electrophilic', 'Benzene undergoes electrophilic substitution.');

    -- Q85 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The two types of tautomerism are:', 'multiple_choice', 'keto-enol and ring-chain', 'proton and valence', 'chain and ring', 'electronic and steric', 'B', 'Proton and valence are tautomerism types.');

    -- Q86 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Solvent shell refers to:', 'multiple_choice', 'solvent molecules surrounding solute', 'solute molecules surrounding solvent', 'solid shell around liquid', 'gas molecules around solid', 'A', 'Solvent shell is solvent around solute.');

    -- Q87 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Friedel-Crafts alkylation requires ______ acid catalyst.', 'fill_in_blank', 'Lewis', 'Friedel-Crafts uses Lewis acid catalyst.');

    -- Q88 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Friedel-Crafts reaction is limited to:', 'multiple_choice', 'alkyl halides', 'aryl halides', 'vinyl halides', 'all halides', 'A', 'Limited to alkyl halides.');

    -- Q89 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Steric hindrance occurs when:', 'multiple_choice', 'small groups block reaction', 'bulky groups block active sites', 'electrons are donated', 'protons are transferred', 'B', 'Bulky groups block active sites.');

    -- Q90 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Hyperconjugation involves ______ and pi electrons.', 'fill_in_blank', 'sigma', 'Hyperconjugation involves sigma and pi electrons.');

    -- Q91 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Groups that donate electrons by resonance are:', 'multiple_choice', '+R groups', '-R groups', '+I groups', '-I groups', 'A', '+R groups donate by resonance.');

    -- Q92 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Electron donating group near carboxylic acid:', 'multiple_choice', 'increases acidity', 'decreases acidity', 'no effect', 'creates base', 'B', 'Electron donors decrease acidity.');

    -- Q93 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Factors affecting acid strength include ______ and inductive effects.', 'fill_in_blank', 'steric', 'Steric and inductive effects affect acidity.');

    -- Q94 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Lewis theory defines bases as:', 'multiple_choice', 'proton donors', 'proton acceptors', 'electron-pair donors', 'electron-pair acceptors', 'C', 'Lewis bases donate electron pairs.');

    -- Q95 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Hydroxyl ion is conjugate base of:', 'multiple_choice', 'water', 'hydrogen ion', 'oxygen', 'hydroxide', 'A', 'OH- is conjugate base of water.');

    -- Q96 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Methylammonium ion is conjugate ______ of methylamine.', 'fill_in_blank', 'acid', 'Methylammonium is conjugate acid.');

    -- Q97 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Acid and its conjugate base form a:', 'multiple_choice', 'tautomeric pair', 'resonance pair', 'conjugate pair', 'isomeric pair', 'C', 'They form conjugate acid-base pair.');

    -- Q98 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Bronsted acids are called protic because they:', 'multiple_choice', 'accept protons', 'donate protons', 'accept electrons', 'donate electrons', 'B', 'They transfer protons.');

    -- Q99 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Acid strength is measured by its ability to ______ in aqueous solution.', 'fill_in_blank', 'dissociate', 'Strong acids dissociate completely.');

    -- Q100 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Valence tautomerism involves:', 'multiple_choice', 'hydrogen movement', 'electron movement only', 'atom separation', 'interatomic distance shift', 'D', 'Valence tautomerism involves interatomic distance shift.');

    -- Continue with next 100 questions...

    -- Q101 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Branched isomers have ______ solubility than straight chain.', 'multiple_choice', 'lower', 'higher', 'same', 'unpredictable', 'B', 'Branched isomers are more soluble.');

    -- Q102 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Branched chain hydrocarbons have lower:', 'multiple_choice', 'boiling point', 'melting point', 'solubility', 'density', 'B', 'Branched chains have lower melting points.');

    -- Q103 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Unbranched isomer has higher ______ than branched isomer.', 'fill_in_blank', 'boiling point', 'Straight chains have higher boiling points.');

    -- Q104 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Acid strength is determined by proton transfer to:', 'multiple_choice', 'standard acid', 'standard base', 'water', 'solvent', 'B', 'Transfer to standard base determines strength.');

    -- Q105 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Proton donor definition was given by:', 'multiple_choice', 'Arrhenius', 'Bronsted and Lowry', 'Lewis', 'Faraday', 'B', 'Bronsted-Lowry defined proton donors.');

    -- Q106 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Hydrogen no-bond resonance is called ______.', 'fill_in_blank', 'Hyperconjugation', 'Hyperconjugation is no-bond resonance.');

    -- Q107 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Inductive effect becomes negligible after carbon:', 'multiple_choice', 'second', 'third', 'fourth', 'fifth', 'C', 'Negligible after fourth carbon.');

    -- Q108 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Carbonyl reduction in Friedel-Crafts uses:', 'multiple_choice', 'Clemmenson reduction', 'Wolff-Kishner', 'Catalytic hydrogenation', 'LiAlH4 reduction', 'A', 'Clemmenson reduces carbonyl groups.');

    -- Q109 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The backbone of organic molecules is ______ bond.', 'fill_in_blank', 'Carbon-carbon', 'C-C bonds form organic backbone.');

    -- Q110 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Saytzeff rule applies to:', 'multiple_choice', 'substitution', 'elimination', 'addition', 'tautomerism', 'B', 'Saytzeff rule for elimination reactions.');

    -- Q111 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'E2 elimination is also called:', 'multiple_choice', 'syn elimination', 'anti elimination', 'random elimination', 'concerted elimination', 'B', 'E2 is anti elimination.');

    -- Q112 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Sandmeyer reaction converts amines to ______.', 'fill_in_blank', 'aryl halides', 'Sandmeyer gives aryl halides from amines.');

    -- Q113 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Fused benzenoid with three rings is:', 'multiple_choice', 'naphthalene', 'anthracene', 'phenanthrene', 'benzene', 'B', 'Anthracene has three fused rings.');

    -- Q114 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In keto-enol, predominant form is:', 'multiple_choice', 'enol', 'keto', 'both equal', 'neither', 'B', 'Keto form predominates.');

    -- Q115 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Naphthalene has ______ pi electrons.', 'fill_in_blank', '10', 'Naphthalene has 10 pi electrons.');

    -- Q116 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Benzene reduction with Ni gives:', 'multiple_choice', 'cyclohexane', 'cyclohexene', 'hexane', 'benzene hexachloride', 'A', 'Ni reduction gives cyclohexane.');

    -- Q117 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Nitration of nitrobenzene gives:', 'multiple_choice', 'ortho-dinitrobenzene', 'meta-dinitrobenzene', 'para-dinitrobenzene', 'mixed isomers', 'B', 'Gives meta-dinitrobenzene.');

    -- Q118 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'More stable conformational isomer has ______ arrangement.', 'fill_in_blank', 'staggered', 'Staggered conformation is more stable.');

    -- Q119 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Inductive effect is a type of:', 'multiple_choice', 'steric effect', 'electronic effect', 'resonance effect', 'tautomeric effect', 'B', 'Inductive effect is electronic.');

    -- Q120 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Chloro compounds are used to make:', 'multiple_choice', 'DDT', 'Freon', 'PVC', 'all of above', 'D', 'Chloro compounds make all these.');

    -- Q121 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Ethanol with PCl5 gives ______.', 'fill_in_blank', '1,1-dichloroethane', 'Ethanol with PCl5 gives 1,1-dichloroethane.');

    -- Q122 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Chlorination of ethene gives:', 'multiple_choice', 'chloroethane', 'chloroethene', 'dichloroethane', 'trichloroethane', 'B', 'Gives chloroethene (vinyl chloride).');

    -- Q123 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Geminal dihalides have halogens on:', 'multiple_choice', 'adjacent carbons', 'same carbon', 'alternate carbons', 'terminal carbons', 'B', 'Geminal: same carbon.');

    -- Q124 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Benzene with acetyl chloride gives ______.', 'fill_in_blank', 'Acetophenone', 'Friedel-Crafts acylation gives acetophenone.');

    -- Q125 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Factors affecting boiling point include:', 'multiple_choice', 'molecular structure', 'London forces', 'hydrogen bonding', 'all of above', 'D', 'All factors affect boiling point.');

    -- Q126 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Important intermolecular force is:', 'multiple_choice', 'covalent bonding', 'hydrogen bonding', 'ionic bonding', 'metallic bonding', 'B', 'Hydrogen bonding is important.');

    -- Q127 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Lewis structures are also called ______ structures.', 'fill_in_blank', 'Resonance', 'Lewis structures are resonance structures.');

    -- Q128 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Actual molecule with multiple Lewis structures is:', 'multiple_choice', 'resonance hybrid', 'tautomer', 'isomer', 'conformer', 'A', 'Resonance hybrid is actual molecule.');

    -- Q129 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Steric effect results from:', 'multiple_choice', 'electron distribution', 'spatial interactions', 'charge transmission', 'proton transfer', 'B', 'Steric effect from spatial interactions.');

    -- Q130 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Benzene extraction from petroleum is called ______.', 'fill_in_blank', 'Hydroforming', 'Hydroforming extracts benzene.');

    -- Q131 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Aromatic ring detection uses:', 'multiple_choice', 'IR spectroscopy', 'UV spectroscopy', 'NMR spectroscopy', 'Mass spectroscopy', 'B', 'UV detects aromatic rings.');

    -- Q132 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Benzene canonical forms proposed by:', 'multiple_choice', 'Faraday and Holman', 'Kekule and Dewar', 'Bronsted and Lowry', 'Arrhenius and Lewis', 'B', 'Kekule and Dewar proposed structures.');

    -- Q133 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Friedel-Crafts ______ introduces acyl group.', 'fill_in_blank', 'acylation', 'Friedel-Crafts acylation adds acyl group.');

    -- Q134 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Benzene has how many resonance structures?', 'multiple_choice', 'three', 'four', 'five', 'six', 'C', 'Benzene has five resonance structures.');

    -- Q135 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Carbonyl reduction after Friedel-Crafts uses:', 'multiple_choice', 'Clemmenson reduction', 'Wolff-Kishner', 'Both A and B', 'Neither', 'C', 'Both methods can be used.');

    -- Q136 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Sulphonation of benzene yields ______ acid.', 'fill_in_blank', 'Sulphonic', 'Sulphonation gives sulphonic acid.');

    -- Q137 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Electronegativity ______ down the group.', 'multiple_choice', 'increases', 'decreases', 'stays same', 'varies', 'B', 'Electronegativity decreases down group.');

    -- Q138 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Naphthalene has benzene rings fused at:', 'multiple_choice', 'meta position', 'para position', 'ortho position', 'alternate positions', 'C', 'Fused at ortho position.');

    -- Q139 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Friedel-Crafts acylation uses ______ catalyst.', 'fill_in_blank', 'Aluminium trichloride', 'AlCl3 is used in Friedel-Crafts acylation.');

    -- Q140 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Sandmeyer reaction converts diazonium salts to:', 'multiple_choice', 'aryl halides', 'alkyl halides', 'amines', 'nitriles', 'A', 'Sandmeyer gives aryl halides.');

    -- Q141 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Methyl benzene is also called:', 'multiple_choice', 'xylene', 'toluene', 'mesitylene', 'cumene', 'B', 'Methyl benzene is toluene.');

    -- Q142 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'E2 reactions are favored by ______ base.', 'fill_in_blank', 'strong', 'Strong bases favor E2 reactions.');

    -- Q143 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Bleaching powder oxidizes ethanol to:', 'multiple_choice', 'ethanoic acid', 'ethanal', 'ethene', 'ethane', 'B', 'Oxidizes to ethanal (acetaldehyde).');

    -- Q144 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Hydrogen halides with alkenes give:', 'multiple_choice', 'alkyl halides', 'aryl halides', 'vinyl halides', 'acyl halides', 'A', 'Give alkyl halides.');

    -- Q145 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Alkyl halides are commonly prepared from ______.', 'fill_in_blank', 'Alcohols', 'Alcohols are common precursors.');

    -- Q146 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Vicinal dihalides have halogens on:', 'multiple_choice', 'same carbon', 'adjacent carbons', 'alternate carbons', 'terminal carbons', 'B', 'Vicinal: adjacent carbons.');

    -- Q147 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Resonance energy is the difference between:', 'multiple_choice', 'expected and experimental heat', 'melting and boiling points', 'acid and base strengths', 'tautomer energies', 'A', 'Difference in expected/experimental heat.');

    -- Q148 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Halogen attached to double-bonded carbon gives ______ halide.', 'fill_in_blank', 'Vinyl', 'Vinyl halides have halogen on sp2 carbon.');

    -- Q149 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Hydrogenation of benzene requires:', 'multiple_choice', 'high temperature and pressure', 'low temperature', 'room temperature', 'vacuum', 'A', 'Requires high temperature and pressure.');

    -- Q150 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Halogen derivatives are classified into:', 'multiple_choice', 'two classes', 'three classes', 'four classes', 'five classes', 'B', 'Three classes of halogen derivatives.');

    -- Q151 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Henderson-Hasselbalch relates ______ and pH.', 'fill_in_blank', 'pKa', 'Relates pKa and pH.');

    -- Q152 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Molecular reactivity depends on:', 'multiple_choice', 'number of hydrogens', 'molecular structure', 'color', 'state', 'B', 'Depends on molecular structure.');

    -- Q153 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Induced dipole interactions are also called:', 'multiple_choice', 'hydrogen bonding', 'London forces', 'dipole-dipole', 'ionic bonding', 'B', 'Induced dipole are London forces.');

    -- Q154 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Pure crystalline solids have ______ melting points.', 'fill_in_blank', 'sharp', 'Pure crystals have sharp melting points.');

    -- Q155 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Van der Waals forces include:', 'multiple_choice', 'dipole-dipole and London', 'hydrogen bonding only', 'covalent bonding', 'ionic bonding', 'A', 'Include dipole-dipole and London forces.');

    -- Q156 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Substance producing hydroxide ions is:', 'multiple_choice', 'acid', 'base', 'salt', 'ester', 'B', 'Base produces OH- ions.');

    -- Q157 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Benzene ring is a ______ system.', 'fill_in_blank', 'conjugated', 'Benzene is conjugated system.');

    -- Q158 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'More soluble isomer is:', 'multiple_choice', 'straight chain', 'branched', 'cyclic', 'aromatic', 'B', 'Branched isomers are more soluble.');

    -- Q159 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Increased intermolecular forces cause:', 'multiple_choice', 'higher solubility', 'lower solubility', 'no change', 'variable effect', 'B', 'Lower solubility with stronger forces.');

    -- Q160 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Separation of ions in solvent is called ______.', 'fill_in_blank', 'Solvation', 'Solvation separates ions.');

    -- Q161 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Solvent ability to separate ions is measured by:', 'multiple_choice', 'viscosity', 'dielectric constant', 'boiling point', 'density', 'B', 'Dielectric constant measures this ability.');

    -- Q162 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Main source of benzene is:', 'multiple_choice', 'petroleum', 'coal tar', 'natural gas', 'biomass', 'B', 'Coal tar is main source.');

    -- Q163 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Boiling point is when vapor pressure equals ______ pressure.', 'fill_in_blank', 'external', 'Equals external pressure.');

    -- Q164 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Toluene with hydrogen under pressure gives:', 'multiple_choice', 'benzene', 'xylene', 'naphthalene', 'anthracene', 'A', 'Gives benzene.');

    -- Q165 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Geometric isomerism yields:', 'multiple_choice', 'one isomer', 'two isomers', 'three isomers', 'four isomers', 'B', 'Yields two geometric isomers.');

    -- Q166 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, '______ isomer has higher melting point.', 'fill_in_blank', 'Trans', 'Trans isomer has higher melting point.');

    -- Q167 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'London forces exist between:', 'multiple_choice', 'polar molecules', 'non-polar molecules', 'ions', 'metals', 'B', 'Between non-polar molecules.');

    -- Q168 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Intermolecular forces include:', 'multiple_choice', 'London forces', 'hydrogen bonding', 'dipole-dipole', 'all of above', 'D', 'All are intermolecular forces.');

    -- Q169 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Hückels rule is the ______ rule.', 'fill_in_blank', '4n+2', 'Hückels is 4n+2 rule.');

    -- Q170 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Simplest aromatic compound is:', 'multiple_choice', 'naphthalene', 'benzene', 'toluene', 'anthracene', 'B', 'Benzene is simplest aromatic.');

    -- Q171 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Halogen with same electronegativity as carbon:', 'multiple_choice', 'fluorine', 'chlorine', 'bromine', 'iodine', 'D', 'Iodine has similar electronegativity.');

    -- Q172 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Benzene and chlorine yield isomers by ______ reaction.', 'fill_in_blank', 'addition', 'Chlorine addition gives isomers.');

    -- Q173 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Chlorobenzene is prepared by:', 'multiple_choice', 'Sandmeyer', 'Rasching process', 'Friedel-Crafts', 'Hunsdiecker', 'B', 'Rasching process industrially.');

    -- Q174 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Benzene properties require:', 'multiple_choice', 'single structure', 'canonical forms', 'tautomers', 'conformers', 'B', 'Require canonical forms for properties.');

    -- Q175 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Tautomers are physically ______ while resonance is not.', 'fill_in_blank', 'real', 'Tautomers are real compounds.');

    -- Q176 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Steric effect affects reactivity by:', 'multiple_choice', 'electron distribution', 'spatial congestion', 'charge distribution', 'proton transfer', 'B', 'By spatial congestion.');

    -- Q177 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Lewis ion is also called resonance:', 'multiple_choice', 'structure', 'hybrid', 'tautomer', 'isomer', 'B', 'Called resonance hybrid.');

    -- Q178 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Induced dipole is peculiar to ______ forces.', 'fill_in_blank', 'London', 'Induced dipole is London forces.');

    -- Q179 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The word "aliphatic" means:', 'multiple_choice', 'fatty', 'aromatic', 'cyclic', 'branched', 'A', 'Aliphatic means fatty.');

    -- Q180 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Greek word "aroma" means:', 'multiple_choice', 'fatty', 'fragrant smell', 'cyclic', 'burning', 'B', 'Aroma means fragrant smell.');

    -- Q181 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Benzene is ______ and injurious to health.', 'fill_in_blank', 'carcinogenic', 'Benzene is carcinogenic.');

    -- Q182 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Hydroforming converts alkanes over:', 'multiple_choice', 'iron catalyst', 'platinum catalyst', 'nickel catalyst', 'copper catalyst', 'B', 'Uses platinum catalyst.');

    -- Q183 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Aromatic compounds absorb in range:', 'multiple_choice', '200-220 nm', '255-275 nm', '300-320 nm', '350-370 nm', 'B', 'Absorb in 255-275 nm range.');

    -- Q184 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Molecular Orbital theory provides benzene ______.', 'fill_in_blank', 'description', 'MO theory describes benzene.');

    -- Q185 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Iodine in aromatic substitution is:', 'multiple_choice', 'very reactive', 'moderately reactive', 'unreactive', 'catalyst', 'C', 'Iodine itself is unreactive.');

    -- Q186 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Sulphonation is favored by:', 'multiple_choice', 'dilute acid', 'concentrated H2SO4', 'water', 'base', 'B', 'Favored by concentrated H2SO4.');

    -- Q187 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Alkylation substitutes ring hydrogen with ______ group.', 'fill_in_blank', 'alkyl', 'Alkylation adds alkyl group.');

    -- Q188 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Biphenyl is example of:', 'multiple_choice', 'fused system', 'isolated system', 'conjugated system', 'aliphatic system', 'B', 'Biphenyl is isolated system.');

    -- Q189 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Naphthalene substitution mechanism is similar to:', 'multiple_choice', 'alkanes', 'alkenes', 'benzene', 'alkynes', 'C', 'Similar to benzene substitution.');

    -- Q190 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Alkenyl halides have halogen on ______ carbon.', 'fill_in_blank', 'double-bonded', 'Alkenyl halides on sp2 carbon.');

    -- Q191 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'HBr with alkenes gives:', 'multiple_choice', 'aryl bromides', 'alkyl bromides', 'vinyl bromides', 'acyl bromides', 'B', 'Gives alkyl bromides.');

    -- Q192 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Bleaching powder provides:', 'multiple_choice', 'oxygen', 'chlorine', 'bromine', 'iodine', 'B', 'Provides chlorine.');

    -- Q193 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Calcium hydroxide with chlorine gives ______.', 'fill_in_blank', 'bleaching powder', 'Ca(OH)2 with Cl2 gives bleaching powder.');

    -- Q194 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Benzene does NOT undergo:', 'multiple_choice', 'electrophilic substitution', 'Friedel-Crafts alkylation', 'electrophilic addition', 'nitration', 'C', 'Does not undergo electrophilic addition.');

    -- Q195 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Keto-enol tautomerism is example of:', 'multiple_choice', 'valence tautomerism', 'proton tautomerism', 'ring-chain tautomerism', 'geometric isomerism', 'B', 'Keto-enol is proton tautomerism.');

    -- Q196 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Proton tautomerism forming rings is called ______ tautomerism.', 'fill_in_blank', 'Ring-chain', 'Ring-chain tautomerism forms rings.');

    -- Q197 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Valence tautomerism involves:', 'multiple_choice', 'hydrogen movement', 'electron movement', 'interatomic distance shift', 'proton transfer', 'C', 'Involves interatomic distance shift.');

    -- Q198 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Aromatic compounds show less intense absorption at:', 'multiple_choice', '205 nm', '255-275 nm', '300-320 nm', '350-370 nm', 'B', 'Less intense at 255-275 nm.');

    -- Q199 - Fill in the blank
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Chlorine reacts smoothly to give excellent yield of ______.', 'fill_in_blank', 'Chlorobenzene', 'Chlorine gives chlorobenzene.');

    -- Q200 - Multiple choice
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Naphthalene is a:', 'multiple_choice', 'colorless volatile solid', 'colored liquid', 'gas', 'metallic solid', 'A', 'Naphthalene is colorless volatile solid.');

END $$;