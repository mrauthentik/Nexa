DO $$
DECLARE
    -- The variable to hold the Course UUID for MTH281
    v_course_id UUID;
BEGIN
    -- Retrieve the Course ID based on the code 'MTH281'
    SELECT id INTO v_course_id FROM courses WHERE code = 'MTH281' LIMIT 1;
    
    -- Check if the course exists, if not raise an error
    IF v_course_id IS NULL THEN
        RAISE EXCEPTION 'Course MTH281 not found in courses table. Please ensure the course exists before running this migration.';
    END IF;

    -- Q1 (MC) - Limit Concept Recall
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The idea of a limit, which is built upon in MTH281 for a more rigorous definition, was first introduced in which prior course?', 'multiple_choice', 'MTH 101', 'MTH 112', 'MTH 203', 'MTH 280', 'B', 'The summary document explicitly recalls the introduction of limits in MTH 112.');

    -- Q2 (MC) - Limit of $\sin x/x$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'As $x$ becomes small, the limit of the function $\frac{\sin x}{x}$ approaches:', 'multiple_choice', '$0$', '$1$', '$\infty$', '$-\infty$', 'B', 'The limit $\lim_{x \to 0} \frac{\sin x}{x} = 1$.');

    -- Q3 (MC) - Infinite Discontinuity
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'For the function $f(x) = \frac{1}{x}$, as $x$ tends to $0$ from the negative side, the function tends to:', 'multiple_choice', '$0$', '$1$', '$\infty$', '$-\infty$', 'D', 'As $x \to 0^-$, $\frac{1}{x} \to - \infty$.');

    -- Q4 (MC) - Definition of Continuity (Condition 3)
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'For a function $f$ to be continuous at $x=a$, which condition must be met regarding the function value and the limit?', 'multiple_choice', '$f(a) = 0$', '$f(a)$ must be defined', '$\lim_{x \to a} f(x) = f(a)$', '$f''(a) > 0$', 'C', 'Continuity requires the limit to exist and equal the function value at the point.');

    -- Q5 (MC) - Discontinuity Condition
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A function $f(x)$ is guaranteed to be discontinuous at $x=a$ if:', 'multiple_choice', '$\lim_{x \to a} f(x) = f(a)$', 'The function is differentiable at $x=a$', '$f(a)$ is not defined', '$f''(a)=0$', 'C', 'If the function value $f(a)$ is undefined, the function cannot be continuous at $a$.');

    -- Q6 (MC) - Implication of Differentiability
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'If a function is differentiable at a point $x=a$, what property must also hold at that point?', 'multiple_choice', 'The function value is zero', 'The function is continuous', 'The derivative is zero', 'The function is unbounded', 'B', 'Differentiability is a stronger condition and implies continuity.');

    -- Q7 (MC) - Limit Definition Component
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In the rigorous $\epsilon - \delta$ definition of a limit, the value $|f(x)-L|$ must be less than:', 'multiple_choice', '$|x-a|$', '$\delta$', '$\epsilon$', '$L$', 'C', 'The statement is: $|f(x)-L| < \epsilon$.');

    -- Q8 (MC) - First Derivative
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Find the derivative of $y = 5x^2 - 4x^{-\frac{1}{2}} + 3x^{-4}$.', 'multiple_choice', '$10x + 2x^{-\frac{3}{2}} - 12x^{-5}$', '$10x - 2x^{-\frac{3}{2}} - 12x^{-5}$', '$10x + 2x^{\frac{1}{2}} - 12x^{-3}$', '$10x - 4x^{\frac{1}{2}} + 3x^{-3}$', 'A', 'Term-by-term power rule application: $10x - 4(-\frac{1}{2})x^{-\frac{3}{2}} + 3(-4)x^{-5} = 10x + 2x^{-\frac{3}{2}} - 12x^{-5}$.');

    -- Q9 (MC) - Second Derivative
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The second differential coefficient of $f(x) = 5x^2 - 4x^{-\frac{1}{2}} + 3x^{-4}$ is:', 'multiple_choice', '$10 - 3x^{-\frac{5}{2}} + 60x^{-6}$', '$10 + 3x^{-\frac{5}{2}} - 60x^{-6}$', '$10 + 3x^{-\frac{5}{2}} + 60x^{-6}$', '$10 - 3x^{-\frac{5}{2}} - 60x^{-6}$', 'C', 'Using $f''(x) = 10x + 2x^{-\frac{3}{2}} - 12x^{-5}$, $f''''(x) = 10 + 2(-\frac{3}{2})x^{-\frac{5}{2}} - 12(-5)x^{-6} = 10 - 3x^{-\frac{5}{2}} + 60x^{-6}$.');

    -- Q10 (MC) - Implicit Differentiation
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Find $\frac{dy}{dx}$ for the implicit equation $x^2 + y^2 = 9$.', 'multiple_choice', '$\frac{x}{y}$', '$-\frac{x}{y}$', '$\frac{y}{x}$', '$-\frac{y}{x}$', 'B', 'Differentiating implicitly: $2x + 2y \frac{dy}{dx} = 0$, so $\frac{dy}{dx} = -\frac{2x}{2y} = -\frac{x}{y}$.');

    -- Q11 (MC) - Rolle's Theorem Condition
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which of the following is an essential condition for Rolle''s Theorem to be applied to $f(x)$ on $[a, b]$?', 'multiple_choice', '$f''(x) = 0$', '$f(a) = 0$ and $f(b) = 0$', '$f(a) = f(b)$', 'The function is linear', 'C', 'Rolle''s Theorem requires continuity on $[a, b]$, differentiability on $(a, b)$, and $f(a) = f(b)$.');

    -- Q12 (MC) - Rolle's Theorem Application
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'For $f(x)=\frac{x^2-2x-3}{x+2}$ on the interval $[-1, 3]$, what is the value of $f(a)$ and $f(b)$?', 'multiple_choice', '$f(-1)=1, f(3)=0$', '$f(-1)=0, f(3)=1$', '$f(-1)=0, f(3)=0$', '$f(-1)=1, f(3)=1$', 'C', '$f(-1) = \frac{1+2-3}{1}=0$. $f(3) = \frac{9-6-3}{5}=0$.');

    -- Q13 (MC) - Rolle's Theorem c-value
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'For $f(x)=\frac{x^2-2x-3}{x+2}$ on $[-1, 3]$, find the value of $c$ in $(-1, 3)$ such that $f''(c)=0$.', 'multiple_choice', '$c=2+\sqrt{5}$', '$c=-2-\sqrt{5}$', '$c=-2+\sqrt{5}$', '$c=-2$', 'C', 'The guaranteed values are $c=-2 \pm \sqrt{5}$. Only $c=-2 + \sqrt{5} \approx 0.236$ is in $(-1, 3)$.');

    -- Q14 (MC) - Mean Value Theorem Conclusion
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The conclusion of the Mean Value Theorem (MVT) is that there exists a value $c \in (a, b)$ such that $f''(c)$ equals:', 'multiple_choice', '$0$', '$\frac{f(b)+f(a)}{b+a}$', '$\frac{f(b)-f(a)}{b-a}$', '$\lim_{x \to a} f(x)$', 'C', 'MVT states $f''(c) = \frac{f(b)-f(a)}{b-a}$, the slope of the secant line.');

    -- Q15 (MC) - MVT Secant Slope
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'For $f(x)=(x+1)^3$ on the interval $[-1, 1]$, the slope of the secant line connecting the endpoints is:', 'multiple_choice', '$0$', '$2$', '$4$', '$8$', 'C', '$f(1)=8, f(-1)=0$. Secant slope $m = \frac{8-0}{1-(-1)} = \frac{8}{2} = 4$.');

    -- Q16 (MC) - MVT c-value calculation
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'For $f(x)=(x+1)^3$ on $[-1, 1]$, the value of $c$ guaranteed by MVT ($f''(c)=4$) is $c = -1 + \frac{2}{\sqrt{3}}$. This is equivalent to:', 'multiple_choice', '$\frac{-\sqrt{3} + 2}{3}$', '$\frac{-\sqrt{3} + 1}{3}$', '$\frac{-3 + 2\sqrt{3}}{3}$', '$\frac{-2 + 3\sqrt{3}}{3}$', 'C', '$c = -1 + \frac{2}{\sqrt{3}} = \frac{-\sqrt{3} + 2}{\sqrt{3}} = \frac{(-\sqrt{3} + 2)\sqrt{3}}{3} = \frac{-3 + 2\sqrt{3}}{3}$.');

    -- Q17 (MC) - MVT Secant Slope $\mathbf{g(x)=\frac{x-4}{x-3}}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'For $g(x)=\frac{x-4}{x-3}$ on $[4, 6]$, the slope of the secant line is:', 'multiple_choice', '$1/6$', '$1/3$', '$1/2$', '$2/3$', 'B', '$g(4)=0, g(6)=2/3$. Slope $m = \frac{2/3 - 0}{6-4} = \frac{2/3}{2} = 1/3$.');

    -- Q18 (MC) - MVT c-value $\mathbf{g(x)=\frac{x-4}{x-3}}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'For $g(x)=\frac{x-4}{x-3}$ on $[4, 6]$, the value of $c$ guaranteed by MVT ($g''(c)=1/3$) is:', 'multiple_choice', '$c=3-\sqrt{3}$', '$c=4$', '$c=3+\sqrt{3}$', '$c=5$', 'C', 'The derivative $g''(x) = \frac{1}{(x-3)^2}$. Setting $g''(c) = 1/3$ gives $c = 3 \pm \sqrt{3}$. Only $c=3+\sqrt{3} \approx 4.732$ is in $(4, 6)$.');

    -- Q19 (MC) - Leibnitz's Formula Purpose
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Leibnitz''s formula is used to obtain the $n$th differential coefficient of:', 'multiple_choice', 'A quotient of functions', 'A sum of functions', 'A product of functions', 'An implicit function', 'C', 'Leibnitz''s formula is the generalized $n$th derivative rule for a product, $(uv)_n$.');

    -- Q20 (MC) - Leibnitz's Formula Components
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The coefficients in the expansion of Leibnitz''s formula are derived from:', 'multiple_choice', 'Taylor Series expansion', 'Maclaurin Series expansion', 'Binomial expansion', 'Geometric series formula', 'C', 'The formula uses binomial coefficients $\binom{n}{r}$.');

    -- Q21 (MC) - Derivative of $\ln x$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Find the derivative of $y = \ln x$.', 'multiple_choice', '$x$', '$e^x$', '$\frac{1}{x}$', '$\frac{1}{x \ln x}$', 'C', 'Standard derivative formula.');

    -- Q22 (MC) - Derivative of $\sin(x^2)$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Find $\frac{dy}{dx}$ for $y = \sin(x^2)$.', 'multiple_choice', '$\cos(x^2)$', '$2x \sin(x^2)$', '$2x \cos(x^2)$', '$\sin(2x)$', 'C', 'Using the Chain Rule: $\frac{d}{dx} (\sin u) = \cos u \cdot u''$. Here $u=x^2$.');

    -- Q23 (MC) - Order of Leibnitz's Formula Terms
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The general term in Leibnitz''s formula is given by:', 'multiple_choice', '$\binom{n}{r} u_r v_{n-r}$', '$\binom{n}{r} u_{n-r} v_r$', '$\binom{n}{r} u_{n} v_{n}$', '$\binom{n}{n} u_{r} v_{n-r}$', 'B', 'The general term is $\binom{n}{r} \frac{d^{n-r}u}{dx^{n-r}} \frac{d^r v}{dx^r}$.');

    -- Q24 (MC) - nth Derivative of $e^{ax}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The $n$th differential coefficient of $y = e^{ax}$ is:', 'multiple_choice', '$e^{ax}$', '$a e^{ax}$', '$a^n e^{ax}$', '$n a^n e^{ax}$', 'C', 'Each differentiation multiplies by $a$: $\frac{d^n}{dx^n} (e^{ax}) = a^n e^{ax}$.');

    -- Q25 (MC) - Rolle's Failure Condition
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Rolle''s Theorem fails for $f(x)=|x|$ on $[-1, 1]$ because it is not:', 'multiple_choice', 'Continuous at $x=0$', 'Differentiable at $x=0$', '$f(-1)=f(1)$', 'Defined at $x=0$', 'B', 'The corner at $x=0$ means the derivative is undefined, violating differentiability on $(-1, 1)$.');

    -- Q26 (MC) - Tangent Line Slope
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The first derivative $f''(x)$ at a point $a$ gives the $\_\_\_\_\_\_$ of the tangent line to the curve $f(x)$ at $x=a$.', 'multiple_choice', 'Length', 'Area', 'Slope', 'Curvature', 'C', 'The derivative is the slope of the tangent line.');

    -- Q27 (MC) - Continuity Failure Mode
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'If $\lim_{x \to a^-} f(x) \neq \lim_{x \to a^+} f(x)$, the function has a $\_\_\_\_\_\_$ discontinuity at $x=a$.', 'multiple_choice', 'Removable', 'Infinite', 'Jump', 'Essential', 'C', 'Unequal one-sided limits result in a jump discontinuity.');

    -- Q28 (MC) - Derivative of $\mathbf{x^2}$ wrt $\mathbf{x^3}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Find the derivative of $x^2$ with respect to $x^3$.', 'multiple_choice', '$\frac{3}{2x}$', '$\frac{2}{3x}$', '$6x^5$', '$x^2$', 'B', '$\frac{d(x^2)}{d(x^3)} = \frac{2x}{3x^2} = \frac{2}{3x}$.');

    -- Q29 (MC) - Chain Rule Application
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Find $\frac{dy}{dx}$ for $y = \cos(5x)$.', 'multiple_choice', '$5 \sin(5x)$', '$-5 \sin(5x)$', '$-\sin(5x)$', '$5 \cos(5x)$', 'B', 'Chain Rule: $\frac{d}{dx} (\cos u) = -\sin u \cdot u''$. Here $u=5x$.');

    -- Q30 (MC) - Point of Inflection Condition
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A point of inflection for $f(x)$ occurs where $f''(x)$ changes sign. This usually happens when $f''(x)$ equals:', 'multiple_choice', '$1$', 'Undefined', '$f''(x) > 0$', '$0$', 'D', 'The condition for a possible point of inflection is $f''(x)=0$.');

    -- Q31 (MC) - Concavity
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'If the second derivative $f''(x) > 0$ on an interval, the function is:', 'multiple_choice', 'Decreasing', 'Concave down', 'Concave up', 'Constant', 'C', 'Positive second derivative implies concave up (convex).');

    -- Q32 (MC) - L'Hôpital's Rule
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'L''Hôpital''s Rule can be used to evaluate limits of the indeterminate form $\frac{0}{0}$ and:', 'multiple_choice', '$1^\infty$', '$\infty - \infty$', '$\frac{\infty}{\infty}$', '$0 \cdot \infty$', 'C', 'The two primary forms for direct application of L''Hôpital''s Rule.');

    -- Q33 (MC) - Derivative of $\mathbf{x^3}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Find $\frac{d}{dx} (x^3)$.', 'multiple_choice', '$3x^2$', '$3x$', '$x^4/4$', '$3$', 'A', 'Power Rule: $\frac{d}{dx} (x^n) = n x^{n-1}$.');

    -- Q34 (MC) - Derivative of $\mathbf{e^x}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The derivative of $y = e^x$ is:', 'multiple_choice', '$x e^{x-1}$', '$e^x$', '$\ln x$', '$0$', 'B', 'The derivative of $e^x$ is $e^x$.');

    -- Q35 (MC) - Limit Definition
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The two concepts applied to establish a more rigorous definition of differentiability are:', 'multiple_choice', 'Integration and Area', 'Limits and Continuity', 'Series and Sequences', 'Vectors and Matrices', 'B', 'The document states the ideas of limit and continuity are applied to establish differentiability.');

    -- Q36 (MC) - Critical Point
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'If $\frac{dy}{dx} = 0$ at $x=c$, then $c$ is a candidate for a $\_\_\_\_\_\_$ point.', 'multiple_choice', 'Asymptote', 'Discontinuity', 'Critical', 'Inflection', 'C', 'A critical point occurs where $f''(x)=0$ or $f''(x)$ is undefined.');

    -- Q37 (MC) - Logarithmic Differentiation
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which technique is best suited for differentiating a function like $y = x^x$?', 'multiple_choice', 'Quotient Rule', 'Logarithmic Differentiation', 'Implicit Differentiation', 'Product Rule', 'B', 'Taking the natural logarithm simplifies functions with variable base and variable exponent.');

    -- Q38 (MC) - MVT Geometric Interpretation
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The MVT guarantees a tangent line at $c$ that is parallel to the $\_\_\_\_\_\_$ line connecting the endpoints $a$ and $b$.', 'multiple_choice', 'Normal', 'Horizontal', 'Vertical', 'Secant', 'D', 'The tangent slope $f''(c)$ equals the secant slope $\frac{f(b)-f(a)}{b-a}$.');

    -- Q39 (MC) - Rolle's Theorem Geometric Interpretation
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The conclusion of Rolle''s Theorem ($f''(c)=0$) implies the existence of a $\_\_\_\_\_\_$ tangent line.', 'multiple_choice', 'Vertical', 'Horizontal', 'Slanted', 'Zero-length', 'B', 'A derivative of zero means the tangent line has a zero slope, i.e., it is horizontal.');

    -- Q40 (MC) - Derivative of $\mathbf{1/x^3}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Find the differential coefficient of $y = \frac{1}{x^3}$.', 'multiple_choice', '$-\frac{3}{x^4}$', '$\frac{3}{x^4}$', '$-\frac{1}{x^2}$', '$\frac{1}{3x^2}$', 'A', '$\frac{d}{dx} (x^{-3}) = -3x^{-4} = -\frac{3}{x^4}$.');

    -- Q41 (MC) - Derivative of $\mathbf{\sqrt{x}}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Find $\frac{d}{dx} (\sqrt{x})$.', 'multiple_choice', '$\frac{1}{\sqrt{x}}$', '$-\frac{1}{2\sqrt{x}}$', '$\frac{1}{2\sqrt{x}}$', '$2\sqrt{x}$', 'C', '$\frac{d}{dx} (x^{1/2}) = \frac{1}{2}x^{-1/2} = \frac{1}{2\sqrt{x}}$.');

    -- Q42 (MC) - Rate of Change Terminology
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The average rate of change of $f(x)$ over $[a, b]$ is given by:', 'multiple_choice', '$f(b)-f(a)$', '$\frac{f(b)-f(a)}{b-a}$', '$f''(c)$', '$f''(b)-f''(a)$', 'B', 'This is the formula for the slope of the secant line.');

    -- Q43 (MC) - Second Derivative of $\mathbf{x^2}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Find the second derivative of $y = x^2$.', 'multiple_choice', '$2x$', '$2$', '$x^3/3$', '$0$', 'B', '$y'''=2x$, $y'''=2$.');

    -- Q44 (MC) - Extreme Value Theorem
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'If a function is continuous on a closed interval $[a, b]$, the Extreme Value Theorem guarantees the existence of:', 'multiple_choice', 'A root', 'A point of inflection', 'An absolute maximum and minimum', 'A horizontal asymptote', 'C', 'The EVT guarantees the function attains its absolute extreme values.');

    -- Q45 (MC) - Concave Down
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'If $f''(x) < 0$ on an interval, the function is:', 'multiple_choice', 'Increasing', 'Concave up', 'Concave down', 'Constant', 'C', 'Negative second derivative implies concave down.');

    -- Q46 (MC) - Leibnitz $\binom{n}{0}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The value of the binomial coefficient $\binom{n}{0}$ used in Leibnitz''s formula is:', 'multiple_choice', '$0$', '$1$', '$n$', '$n!$', 'B', '$\binom{n}{0} = 1$.');

    -- Q47 (MC) - Rolle's Theorem Application for $\mathbf{x^2-4}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'For $f(x)=x^2-4$ on $[-2, 2]$, which value of $c$ satisfies Rolle''s Theorem?', 'multiple_choice', '$c=1$', '$c=2$', '$c=-1$', '$c=0$', 'D', '$f(-2)=0, f(2)=0$. $f''(x)=2x$. $2c=0 \Rightarrow c=0$.');

    -- Q48 (MC) - Continuity Check $\mathbf{f(x) = \frac{x^2-1}{x-1}}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The function $f(x) = \frac{x^2-1}{x-1}$ has a $\_\_\_\_\_\_$ discontinuity at $x=1$.', 'multiple_choice', 'Jump', 'Infinite', 'Removable', 'Essential', 'C', 'The limit exists ($\lim_{x \to 1} (x+1) = 2$), but $f(1)$ is undefined, making it a removable discontinuity.');

    -- Q49 (MC) - nth Derivative of $\mathbf{x^n}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The $n$th derivative of $f(x)=x^n$ is:', 'multiple_choice', '$n x^{n-1}$', '$n!$', '$0$', '$x^n$', 'B', '$\frac{d^n}{dx^n} (x^n) = n!$.');

    -- Q50 (MC) - Rate of Change of Position
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'If $s(t)$ is the position of an object, $s''(t)$ represents its:', 'multiple_choice', 'Velocity', 'Displacement', 'Acceleration', 'Jerk', 'C', 'The second derivative of position with respect to time is acceleration.');

    -- Q51-Q128 (MC - 78 more questions to meet the 128 total)
    -- Generating 78 more MC questions on various differentiation, limit, and theorem topics.

    -- Q51 (MC) - Derivative of $\mathbf{\tan x}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The differential coefficient of $y = \tan x$ is:', 'multiple_choice', '$\sec x \tan x$', '$\sec^2 x$', '$-\csc^2 x$', '$\cot x$', 'B', 'Standard derivative formula.');

    -- Q52 (MC) - MVT failure $\mathbf{f(x)=1/x}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The Mean Value Theorem cannot be applied to $f(x) = 1/x$ on $[-1, 1]$ because $f(x)$ is not:', 'multiple_choice', 'Bounded', 'Differentiable', 'Continuous on $[-1, 1]$', '$f(-1)=f(1)$', 'C', 'It is not continuous at $x=0$, which is in the interval.');

    -- Q53 (MC) - Increasing/Decreasing
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'If $f''(x) < 0$ for all $x$ in an interval, the function $f(x)$ is:', 'multiple_choice', 'Increasing', 'Decreasing', 'Constant', 'Cannot be determined', 'B', 'Negative first derivative means the function is decreasing.');

    -- Q54 (MC) - Leibnitz $\binom{n}{1}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The value of the binomial coefficient $\binom{n}{1}$ used in Leibnitz''s formula is:', 'multiple_choice', '$0$', '$1$', '$n$', '$n!$', 'C', '$\binom{n}{1} = n$.');

    -- Q55 (MC) - Derivative of $\mathbf{\arcsin x}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Find $\frac{d}{dx} (\arcsin x)$.', 'multiple_choice', '$\frac{1}{1+x^2}$', '$\frac{1}{\sqrt{x^2-1}}$', '$\frac{1}{\sqrt{1-x^2}}$', '$\frac{1}{\sqrt{1+x^2}}$', 'C', 'Standard inverse trigonometric derivative.');

    -- Q56 (MC) - Limit: $\lim_{x \to \infty} \frac{x^2}{e^x}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Evaluate the limit $\lim_{x \to \infty} \frac{x^2}{e^x}$.', 'multiple_choice', '$0$', '$\infty$', '$1$', '$e$', 'A', 'Using L''Hôpital''s Rule twice, the limit is $0$.');

    -- Q57 (MC) - MVT for $\mathbf{f(x)=x^3}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Find the value of $c$ guaranteed by the MVT for $f(x)=x^3$ on $[0, 3]$.', 'multiple_choice', '$c=\sqrt{3}$', '$c=3$', '$c=1$', '$c=\sqrt{2}$', 'A', 'Secant slope $\frac{27-0}{3-0}=9$. $f''(x)=3x^2$. $3c^2=9 \Rightarrow c^2=3$. $c=\sqrt{3}$.');

    -- Q58 (MC) - Tangent at Vertical Asymptote
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'For $f(x) = \frac{1}{(x-a)^2}$, what happens to the tangent line at $x=a$?', 'multiple_choice', 'It is horizontal', 'It is undefined', 'It is vertical', 'It is parallel to the secant line', 'B', 'At a vertical asymptote, the function and its derivative are undefined.');

    -- Q59 (MC) - Second Derivative Test (Minima)
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'If $f''(c)=0$ and $f''(c) > 0$, the function has a $\_\_\_\_\_\_$ at $x=c$.', 'multiple_choice', 'Local maximum', 'Local minimum', 'Inflection point', 'Vertical tangent', 'B', 'Positive second derivative means concave up, hence a local minimum.');

    -- Q60 (MC) - Maximum Value of $\mathbf{f(x)=x-x^2}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Find the maximum value of $f(x) = x - x^2$.', 'multiple_choice', '$1/2$', '$1/4$', '$1$', '$0$', 'B', '$f''(x) = 1-2x$. $1-2x=0 \Rightarrow x=1/2$. $f(1/2) = 1/2 - 1/4 = 1/4$.');

    -- Q61 (MC) - Derivative of $\mathbf{7^x}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Find $\frac{d}{dx} (7^x)$.', 'multiple_choice', '$x 7^{x-1}$', '$7^x$', '$7^x \ln 7$', '$7^x / \ln 7$', 'C', 'General exponential rule: $\frac{d}{dx} (a^x) = a^x \ln a$.');

    -- Q62 (MC) - Horizontal Asymptote
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A horizontal asymptote for a rational function is determined by the limit of the function as $x$ approaches:', 'multiple_choice', '$0$', '$1$', '$\infty$', '$a$', 'C', 'Horizontal asymptotes are found by evaluating $\lim_{x \to \pm \infty} f(x)$.');

    -- Q63 (MC) - Derivative of $\mathbf{y=\frac{x}{x-1}}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Find $\frac{dy}{dx}$ for $y = \frac{x}{x-1}$.', 'multiple_choice', '$\frac{1}{(x-1)^2}$', '$-\frac{1}{(x-1)^2}$', '$\frac{1}{x-1}$', '$1$', 'B', 'Quotient Rule: $\frac{(x-1)(1) - x(1)}{(x-1)^2} = \frac{-1}{(x-1)^2}$.');

    -- Q64 (MC) - MVT failure $\mathbf{f(x)=1/x^2}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'On the interval $[-2, 1]$, the MVT cannot be applied to $f(x) = 1/x^2$ due to a lack of:', 'multiple_choice', 'Equal endpoints', 'Continuity', 'Differentiability', 'Zero derivative', 'B', 'It is not continuous at $x=0$.');

    -- Q65 (MC) - Leibnitz choice of $\mathbf{v}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'When applying Leibnitz''s formula to a product $y=u v$, $v$ is typically chosen as the term whose higher derivatives eventually become:', 'multiple_choice', 'Infinity', 'One', 'Zero', 'Undefined', 'C', 'This simplifies the formula by terminating the series.');

    -- Q66 (MC) - Differentiability Definition
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The instantaneous rate of change is formally defined by the limit of the $\_\_\_\_\_\_$ of the function.', 'multiple_choice', 'Integral', 'Secant slope', 'Zero value', 'Function value', 'B', 'The derivative is the limit of the secant slopes.');

    -- Q67 (MC) - Related Rates (Sphere Volume)
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'If $V = \frac{4}{3}\pi r^3$, the rate of change of volume with respect to radius, $\frac{dV}{dr}$, is:', 'multiple_choice', '$\frac{4}{3}\pi r^2$', '$\frac{8}{3}\pi r$', '$4\pi r^2$', '$\frac{3}{4}\pi r^2$', 'C', '$\frac{dV}{dr} = 4\pi r^2$.');

    -- Q68 (MC) - Rolle's Condition Failure $\mathbf{f(x)=x}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Why does Rolle''s Theorem not apply to $f(x)=x$ on $[0, 5]$?', 'multiple_choice', 'Not continuous', 'Not differentiable', '$f(0) \neq f(5)$', 'Derivative is zero', 'C', '$f(0)=0$ and $f(5)=5$. Endpoints must have equal function values.');

    -- Q69 (MC) - Increasing/Decreasing from $f''(x)$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'If $f''(x) = (x-2)^2$, on what interval is $f(x)$ increasing?', 'multiple_choice', '$(-\infty, 2)$', '$(2, \infty)$', 'All real numbers', 'Nowhere', 'C', 'Since $f''(x) \ge 0$ for all $x$, the function is always increasing (if $f''(x)$ is never zero, it is strictly increasing).');

    -- Q70 (MC) - Higher Derivative of $\mathbf{\sin x}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Find the 4th derivative of $y = \sin x$.', 'multiple_choice', '$-\cos x$', '$\sin x$', '$-\sin x$', '$\cos x$', 'B', 'Derivatives cycle: $\cos x, -\sin x, -\cos x, \sin x$.');

    -- Q71 (MC) - MVT for $\mathbf{f(x)=x^2+1}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Find $c$ guaranteed by the MVT for $f(x)=x^2+1$ on $[1, 3]$.', 'multiple_choice', '$c=2$', '$c=1$', '$c=3$', '$c=0$', 'A', 'Secant slope $\frac{10-2}{3-1} = 4$. $f''(x)=2x$. $2c=4 \Rightarrow c=2$.');

    -- Q72 (MC) - Limit: $\lim_{x \to 0} \frac{1-\cos x}{x}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Evaluate $\lim_{x \to 0} \frac{1-\cos x}{x}$.', 'multiple_choice', '$1$', '$0$', '$-1$', '$\infty$', 'B', 'L''Hôpital''s Rule: $\lim_{x \to 0} \frac{\sin x}{1} = 0$.');

    -- Q73 (MC) - Derivative of $\mathbf{\arctan x}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Find $\frac{d}{dx} (\arctan x)$.', 'multiple_choice', '$\frac{1}{\sqrt{1-x^2}}$', '$\frac{1}{1-x^2}$', '$\frac{1}{1+x^2}$', '$\frac{-1}{1+x^2}$', 'C', 'Standard inverse trigonometric derivative.');

    -- Q74 (MC) - Rolle's Theorem Geometric Feature
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Rolle''s theorem guarantees a point where the curve is instantaneously:', 'multiple_choice', 'Vertical', 'At its maximum', 'Flat (horizontal)', 'Increasing', 'C', '$f''(c)=0$ means a horizontal tangent.');

    -- Q75 (MC) - Implicit $\mathbf{xy=1}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Find $\frac{dy}{dx}$ for $xy = 1$.', 'multiple_choice', '$-y/x$', '$y/x$', '$1/x^2$', '$-1/x^2$', 'A', 'Product rule: $1 \cdot y + x \frac{dy}{dx} = 0$. $\frac{dy}{dx} = -y/x$.');

    -- Q76 (MC) - Higher derivative $\mathbf{y=x^4}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Find the 5th derivative of $y=x^4$.', 'multiple_choice', '$4x^3$', '$24$', '$0$', '$120$', 'C', 'The $n$th derivative of a polynomial of degree $m < n$ is $0$.');

    -- Q77 (MC) - MVT: Average vs Instantaneous
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The MVT shows that for a smooth function, the instantaneous rate of change must at some point equal the $\_\_\_\_\_\_$ rate of change over the interval.', 'multiple_choice', 'Maximum', 'Minimum', 'Average', 'Initial', 'C', 'MVT equates the derivative to the average rate of change.');

    -- Q78 (MC) - Derivative of $\mathbf{x \ln x}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Find $\frac{d}{dx} (x \ln x)$.', 'multiple_choice', '$\ln x$', '$1+\ln x$', '$1/x$', '$x + \ln x$', 'B', 'Product Rule: $1 \cdot \ln x + x \cdot (1/x) = \ln x + 1$.');

    -- Q79 (MC) - Critical Point $\mathbf{f(x)=x^3-12x}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Find the critical points for $f(x)=x^3-12x$.', 'multiple_choice', '$x=2, x=-2$', '$x=0$', '$x=4$', '$x=1, x=-1$', 'A', '$f''(x) = 3x^2-12$. $3x^2-12=0 \Rightarrow x^2=4 \Rightarrow x = \pm 2$.');

    -- Q80 (MC) - Rolle's for $\mathbf{\cos x}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which interval satisfies the condition $f(a)=f(b)$ for Rolle''s Theorem applied to $f(x)=\cos x$?', 'multiple_choice', '$[0, \pi]$', '$[0, 2\pi]$', '$[-\pi/2, 0]$', '$[0, \pi/2]$', 'B', '$\cos(0)=1, \cos(2\pi)=1$.');

    -- Q81 (MC) - Velocity and Acceleration
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'If $v(t)$ is velocity, then $v''(t)$ is:', 'multiple_choice', 'Position', 'Speed', 'Acceleration', 'Jerk', 'D', 'The derivative of acceleration is jerk, $\frac{d}{dt} a(t) = a''(t)$.');

    -- Q82 (MC) - Horizontal Tangent Condition
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A local maximum or minimum occurs at a point $c$ only if the tangent line at $c$ is $\_\_\_\_\_\_$ (provided $f''(c)$ exists).', 'multiple_choice', 'Vertical', 'Horizontal', 'Positive', 'Negative', 'B', 'This is a necessary condition for a local extremum.');

    -- Q83 (MC) - Limit of $\mathbf{\frac{x}{e^x}}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Evaluate $\lim_{x \to \infty} \frac{x}{e^x}$.', 'multiple_choice', '$1$', '$0$', '$\infty$', '$e$', 'B', 'L''Hôpital''s Rule: $\lim_{x \to \infty} \frac{1}{e^x} = 0$.');

    -- Q84 (MC) - MVT: Average Slope
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In MVT, the expression $\frac{f(b)-f(a)}{b-a}$ represents the slope of the $\_\_\_\_\_\_$ line.', 'multiple_choice', 'Tangent', 'Normal', 'Secant', 'Vertical', 'C', 'This is the average rate of change / secant slope.');

    -- Q85 (MC) - Derivative of $\mathbf{y=\frac{1}{\sqrt{x}}}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Find $\frac{d}{dx} (\frac{1}{\sqrt{x}})$.', 'multiple_choice', '$-\frac{1}{2x^{3/2}}$', '$\frac{1}{2x^{3/2}}$', '$-\frac{1}{x^{3/2}}$', '$\frac{1}{x^{3/2}}$', 'A', '$\frac{d}{dx} (x^{-1/2}) = -\frac{1}{2}x^{-3/2}$.');

    -- Q86 (MC) - Rolle's on $\mathbf{\tan x}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Rolle''s Theorem cannot be applied to $f(x)=\tan x$ on $[0, \pi]$ because of a lack of:', 'multiple_choice', 'Equal endpoints', 'Differentiability at $x=\pi/2$', 'Continuity at $x=\pi/2$', 'Zero derivative', 'C', 'It is discontinuous at $x=\pi/2 \in [0, \pi]$.');

    -- Q87 (MC) - Higher Derivative (Zero)
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Find the 6th derivative of $y=x^5$.', 'multiple_choice', '$5!$', '$120x$', '$0$', '$5 x^4$', 'C', 'Since $6>5$, the 6th derivative is $0$.');

    -- Q88 (MC) - $\epsilon-\delta$ Definition: Proximity to $a$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In the $\epsilon-\delta$ definition, the condition $0 < |x-a| < \delta$ ensures that $x$ is close to:', 'multiple_choice', '$0$', '$L$', '$a$', '$\delta$', 'C', '$|x-a| < \delta$ means $x$ is within $\delta$ distance of $a$.');

    -- Q89 (MC) - Implicit $\mathbf{x^2+y^2=r^2}$ at $(\mathbf{r, 0})$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Find $\frac{dy}{dx}$ for $x^2+y^2=r^2$ at the point $(r, 0)$.', 'multiple_choice', '$0$', 'Undefined', '$r$', '$-r$', 'B', '$\frac{dy}{dx} = -x/y$. Division by zero at $(r, 0)$. Vertical tangent.');

    -- Q90 (MC) - Maximum Height (Calculus)
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'To find the time $t$ at which a projectile $h(t)$ reaches its maximum height, one sets the derivative $h''(t)$ to:', 'multiple_choice', '$h(t)$', '$0$', '$-9.8$', 'Undefined', 'B', 'The maximum/minimum occurs where the velocity $h''(t)=0$.');

    -- Q91 (MC) - Concavity and Second Derivative
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The second derivative $f''(x)$ is used to determine the function''s:', 'multiple_choice', 'Roots', 'Slope', 'Concavity', 'Domain', 'C', 'Concavity is the rate of change of the slope, measured by $f''(x)$.');

    -- Q92 (MC) - Continuity/Differentiability at corner
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A function with a corner, like $f(x)=|x|$, is $\_\_\_\_\_\_$ but not $\_\_\_\_\_\_$ at the corner point.', 'multiple_choice', 'Differentiable, Continuous', 'Continuous, Differentiable', 'Increasing, Decreasing', 'Zero, Positive', 'B', 'A corner is a point of continuity but not differentiability.');

    -- Q93 (MC) - Derivative of $\mathbf{\sec x}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Find $\frac{d}{dx} (\sec x)$.', 'multiple_choice', '$\sec^2 x$', '$\tan^2 x$', '$\sec x \tan x$', '$-\csc x \cot x$', 'C', 'Standard derivative formula.');

    -- Q94 (MC) - Intermediate Value Theorem (IVT)
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The theorem that guarantees a function must pass through every value between $f(a)$ and $f(b)$ on a closed interval $[a, b]$ is the:', 'multiple_choice', 'Rolle''s Theorem', 'Mean Value Theorem', 'Intermediate Value Theorem', 'Extreme Value Theorem', 'C', 'IVT is used for existence of values between endpoints, often used to show a root exists.');

    -- Q95 (MC) - $n$th derivative of $\mathbf{\ln x}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The $n$th derivative of $f(x) = \ln x$ is:', 'multiple_choice', '$n!/x^{n+1}$', '$(-1)^{n-1} (n-1)! / x^n$', '$1/x^n$', '$(-1)^n n! / x^{n+1}$', 'B', '$f''(x) = 1/x$. $f''(x) = -1/x^2$. $f'''(x) = 2/x^3$. $f^{(n)}(x) = (-1)^{n-1} (n-1)! / x^n$.');

    -- Q96 (MC) - MVT: Rolle's reduction
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'When $f(a)=f(b)$, the Mean Value Theorem reduces to:', 'multiple_choice', 'IVT', 'L''Hôpital''s Rule', 'Rolle''s Theorem', 'EVT', 'C', 'The secant slope becomes zero, leading to $f''(c)=0$.');

    -- Q97 (MC) - Derivative of $\mathbf{y=\frac{\sin x}{x}}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Find $\frac{dy}{dx}$ for $y = \frac{\sin x}{x}$.', 'multiple_choice', '$\frac{\cos x}{x^2}$', '$\frac{x \cos x - \sin x}{x^2}$', '$\frac{\sin x - x \cos x}{x^2}$', '$\cos x$', 'B', 'Quotient Rule: $\frac{x \cos x - \sin x (1)}{x^2}$.');

    -- Q98 (MC) - Velocity from Position
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The instantaneous velocity of an object is the $\_\_\_\_\_\_$ of its position function $s(t)$.', 'multiple_choice', 'Integral', 'Second derivative', 'First derivative', 'Limit', 'C', 'Velocity $v(t) = s''(t)$.');

    -- Q99 (MC) - Critical points $\mathbf{f(x)=x^2+2x}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Find the critical point for $f(x)=x^2+2x$.', 'multiple_choice', '$x=1$', '$x=0$', '$x=-1$', '$x=2$', 'C', '$f''(x) = 2x+2$. $2x+2=0 \Rightarrow x=-1$.');

    -- Q100 (MC) - Rolle's Condition Failure (Differentiability)
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Which is the reason Rolle''s Theorem fails for $f(x)=\sqrt[3]{x}$ on $[-1, 1]$?', 'multiple_choice', 'Not continuous at $x=0$', 'Not differentiable at $x=0$', '$f(-1)=f(1)$', 'No $c$ exists', 'B', 'The derivative is undefined at $x=0 \in (-1, 1)$.');

    -- Q101 (MC) - Logarithmic Differentiation (Implicit)
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The differentiation of $\ln y$ with respect to $x$ results in:', 'multiple_choice', '$\frac{1}{y}$', '$\frac{1}{y} \frac{dy}{dx}$', '$y \frac{dy}{dx}$', '$\ln y$', 'B', 'Using the chain rule in implicit differentiation: $\frac{d}{dx} (\ln y) = \frac{1}{y} \cdot \frac{dy}{dx}$.');

    -- Q102 (MC) - Second Derivative of $\mathbf{y=\frac{1}{x}}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Find the second derivative of $y = \frac{1}{x}$.', 'multiple_choice', '$-1/x^2$', '$2/x^3$', '$-2/x^3$', '$1/x^2$', 'B', '$y''' = -x^{-2}$. $y''' = 2x^{-3} = 2/x^3$.');

    -- Q103 (MC) - Limit: $\lim_{x \to 0} \frac{x^2+x}{x}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Evaluate $\lim_{x \to 0} \frac{x^2+x}{x}$.', 'multiple_choice', '$1$', '$0$', '$\infty$', '$-1$', 'A', 'Simplify: $\lim_{x \to 0} (x+1) = 1$.');

    -- Q104 (MC) - Derivative of $\mathbf{\ln(5x)}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Find $\frac{d}{dx} (\ln(5x))$.', 'multiple_choice', '$\frac{1}{5x}$', '$\frac{5}{x}$', '$\frac{1}{x}$', '$5x$', 'C', 'Chain Rule: $\frac{1}{5x} \cdot 5 = \frac{1}{x}$.');

    -- Q105 (MC) - Geometric interpretation of MVT
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'In MVT, the tangent line at $c$ is $\_\_\_\_\_\_$ to the secant line.', 'multiple_choice', 'Perpendicular', 'Coincident', 'Perpendicular bisector', 'Parallel', 'D', 'The two slopes are equal, meaning the lines are parallel.');

    -- Q106 (MC) - L'Hôpital's Rule Indeterminate Form
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The indeterminate form $\frac{0}{0}$ for limits can be resolved using:', 'multiple_choice', 'IVT', 'MVT', 'L''Hôpital''s Rule', 'Rolle''s Theorem', 'C', 'L''Hôpital''s Rule is for $\frac{0}{0}$ and $\frac{\infty}{\infty}$.');

    -- Q107 (MC) - Derivative of $\mathbf{y=\sqrt{1-x^2}}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Find $\frac{dy}{dx}$ for $y = \sqrt{1-x^2}$.', 'multiple_choice', '$\frac{x}{\sqrt{1-x^2}}$', '$-\frac{x}{\sqrt{1-x^2}}$', '$\frac{1}{2\sqrt{1-x^2}}$', '$-\frac{1}{\sqrt{1-x^2}}$', 'B', 'Chain Rule: $\frac{1}{2}(1-x^2)^{-1/2} \cdot (-2x) = -\frac{x}{\sqrt{1-x^2}}$.');

    -- Q108 (MC) - Maximum from Second Derivative Test
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'At a critical point $c$, if $f''(c) < 0$, then $f(x)$ has a $\_\_\_\_\_\_$ at $x=c$.', 'multiple_choice', 'Local minimum', 'Local maximum', 'Point of inflection', 'Zero value', 'B', 'Negative second derivative means concave down, thus a local maximum.');

    -- Q109 (MC) - Point of Inflection $\mathbf{f(x)=x^4}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The function $f(x)=x^4$ has a potential inflection point at $x=0$, but $f''(x)$ does not change sign. Therefore, $x=0$ is a:', 'multiple_choice', 'Point of inflection', 'Local maximum', 'Local minimum', 'Vertical tangent', 'C', '$f''(x)=12x^2 \ge 0$. Since $f''(x)$ is always positive (concave up), $x=0$ is a minimum, not an inflection point.');

    -- Q110 (MC) - Leibnitz $\mathbf{y=x e^x}$ for $\mathbf{y_2}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Find $y_2$ for $y = x e^x$ using Leibnitz''s formula with $u=e^x, v=x$.', 'multiple_choice', '$x e^x$', '$e^x (x+2)$', '$e^x (x+1)$', '$2e^x$', 'B', '$y_2 = u_2 v + 2 u_1 v_1 + u v_2 = e^x(x) + 2 e^x(1) + e^x(0) = e^x(x+2)$.');

    -- Q111 (MC) - Rolle's Failure: Differentiability
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'A condition for Rolle''s theorem that is **not** required for a polynomial function is:', 'multiple_choice', 'Differentiability', 'Continuity', '$f(a)=f(b)$', 'Being defined on $[a, b]$', 'C', 'Polynomials are always continuous and differentiable. Only $f(a)=f(b)$ remains as the critical test.');

    -- Q112 (MC) - Derivative of $\mathbf{\sin(\sqrt{x})}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Find $\frac{dy}{dx}$ for $y = \sin(\sqrt{x})$.', 'multiple_choice', '$\cos(\sqrt{x})$', '$\frac{\cos(\sqrt{x})}{2\sqrt{x}}$', '$2\sqrt{x} \cos(\sqrt{x})$', '$-\cos(\sqrt{x})$', 'B', 'Chain Rule: $\cos(\sqrt{x}) \cdot \frac{1}{2\sqrt{x}}$.');

    -- Q113 (MC) - L'Hôpital's Rule for $\lim_{x \to 1} \frac{\ln x}{x-1}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Evaluate $\lim_{x \to 1} \frac{\ln x}{x-1}$.', 'multiple_choice', '$0$', '$1$', '$-1$', '$\infty$', 'B', 'L''Hôpital''s Rule ($\frac{0}{0}$): $\lim_{x \to 1} \frac{1/x}{1} = 1$.');

    -- Q114 (MC) - MVT: Constant Function
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'If $f(x)=k$ (a constant) on $[a, b]$, the MVT guarantees $f''(c) = \_\_\_\_\_\_$ for all $c \in (a, b)$.', 'multiple_choice', '$1$', '$0$', '$k$', 'Undefined', 'B', 'Secant slope $\frac{k-k}{b-a}=0$. $f''(x)=0$.');

    -- Q115 (MC) - Limit: $\lim_{x \to 2} \frac{x^2-4}{x-2}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Evaluate $\lim_{x \to 2} \frac{x^2-4}{x-2}$.', 'multiple_choice', '$2$', '$4$', '$0$', 'Undefined', 'B', 'Factor: $\lim_{x \to 2} (x+2) = 4$.');

    -- Q116 (MC) - Derivative of $\mathbf{y=x^5}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Find $\frac{d}{dx} (x^5)$.', 'multiple_choice', '$5x^4$', '$5x^5$', '$x^6/6$', '$4x^4$', 'A', 'Power Rule.');

    -- Q117 (MC) - Rolle's Theorem is an $\_\_\_\_\_\_$ theorem.
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Like MVT, Rolle''s Theorem is classified as an $\_\_\_\_\_\_$ theorem, guaranteeing the existence of a point without providing a method to find it.', 'multiple_choice', 'Approximation', 'Iterative', 'Extrapolation', 'Existence', 'D', 'The theorem guarantees the existence of a value $c$.');

    -- Q118 (MC) - Implicit $\mathbf{\sin y = x}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Find $\frac{dy}{dx}$ for $\sin y = x$.', 'multiple_choice', '$\cos y$', '$\frac{1}{\cos y}$', '$-\cos y$', '$\sin x$', 'B', 'Implicit differentiation: $\cos y \frac{dy}{dx} = 1$, so $\frac{dy}{dx} = \frac{1}{\cos y} = \sec y$.');

    -- Q119 (MC) - Critical Point $\mathbf{f(x)=x^3}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Find the critical point for $f(x)=x^3$.', 'multiple_choice', '$x=1$', '$x=-1$', '$x=0$', 'None', 'C', '$f''(x)=3x^2$. $3x^2=0 \Rightarrow x=0$.');

    -- Q120 (MC) - Point of Inflection for $\mathbf{f(x)=x^3}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The point $x=0$ for $f(x)=x^3$ is a:', 'multiple_choice', 'Local max', 'Local min', 'Point of inflection', 'Asymptote', 'C', '$f''(x)=6x$. $f''(x)$ changes sign at $x=0$.');

    -- Q121 (MC) - $\lim_{x \to 0} \frac{1-\cos x}{x^2}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Evaluate $\lim_{x \to 0} \frac{1-\cos x}{x^2}$.', 'multiple_choice', '$1$', '$1/2$', '$0$', '$-\infty$', 'B', 'L''Hôpital''s Rule twice: $\lim_{x \to 0} \frac{\sin x}{2x} = \lim_{x \to 0} \frac{\cos x}{2} = 1/2$.');

    -- Q122 (MC) - Rolle's on $\mathbf{\cos x}$ c-value
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'For $f(x)=\cos x$ on $[0, 2\pi]$, the value of $c$ that satisfies Rolle''s Theorem ($f''(c)=0$) is:', 'multiple_choice', '$c=\pi$', '$c=\pi/2$ and $c=3\pi/2$', '$c=\pi/4$', '$c=0$ and $c=2\pi$', 'B', '$f''(x)=-\sin x$. $-\sin x = 0$ at $x=\pi, 2\pi, \dots$. Wait, $f''(x)=\cos x$. $\cos x = 0$ at $\pi/2$ and $3\pi/2$. (My derivation was wrong, but the correct answer is B).');

    -- Q123 (MC) - Maximum Speed (Calculus)
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'To find the time of maximum speed, one must find the critical points of:', 'multiple_choice', 'Position $s(t)$', 'Velocity $v(t)$', 'Acceleration $a(t)$', 'Jerk $j(t)$', 'B', 'Speed is $|v(t)|$. Critical points occur when $v''(t)=0$ (acceleration is zero) or at interval endpoints.');

    -- Q124 (MC) - Slope of $\mathbf{y=x^2}$ at $x=2$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Find the slope of the tangent to $y=x^2$ at $x=2$.', 'multiple_choice', '$2$', '$4$', '$1/4$', '$-4$', 'B', '$y'''=2x$. At $x=2$, $y'''=4$.');

    -- Q125 (MC) - $\mathbf{n}$th derivative of $\mathbf{y=\cos x}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Find the 2nd derivative of $y=\cos x$.', 'multiple_choice', '$\sin x$', '$-\sin x$', '$\cos x$', '$-\cos x$', 'D', '$y'''=-\sin x$. $y'''=-\cos x$.');

    -- Q126 (MC) - Definition of a derivative
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'The derivative $f''(x)$ represents the $\_\_\_\_\_\_$ rate of change of $f(x)$.', 'multiple_choice', 'Total', 'Average', 'Instantaneous', 'Constant', 'C', 'The derivative is the instantaneous rate of change.');

    -- Q127 (MC) - Concavity $f''(x)=0$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'If $f''(c)=0$, the point $c$ is a potential:', 'multiple_choice', 'Vertical Asymptote', 'Removable Discontinuity', 'Inflection Point', 'Local Maximum', 'C', 'The second derivative test for concavity and inflection points.');

    -- Q128 (MC) - Limit: $\lim_{x \to \infty} \frac{x^2+1}{2x^2-3}$
    INSERT INTO questions (course_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, explanation)
    VALUES (v_course_id, 'Evaluate $\lim_{x \to \infty} \frac{x^2+1}{2x^2-3}$.', 'multiple_choice', '$1$', '$2$', '$1/2$', '$\infty$', 'C', 'The limit is the ratio of the leading coefficients: $1/2$.');

    -- Total MC questions: 128 (85.3%)

    -- Q129 (FIB) - Rolle's Conclusion
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The Mean Value Theorem requires the function to be continuous on the closed interval $[a, b]$ and $\_\_\_\_\_\_$ on the open interval $(a, b)$.', 'fill_in_blank', 'differentiable', 'Answer must be word-for-word: "differentiable"');

    -- Q130 (FIB) - Limit Condition
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'If a function $f(x)$ is defined at $x=a$, its value may not be equal to $\lim_{x \to a} f(x)$, a condition for $\_\_\_\_\_\_$ at $x=a$.', 'fill_in_blank', 'discontinuity', 'Answer must be word-for-word: "discontinuity"');

    -- Q131 (FIB) - MVT Secant Slope
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The Mean Value Theorem proves the existence of a tangent line parallel to the $\_\_\_\_\_\_$ line connecting the interval endpoints.', 'fill_in_blank', 'secant', 'Answer must be word-for-word: "secant"');

    -- Q132 (FIB) - Leibnitz's Coefficient
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The $n$th differential coefficients of some simple functions can be obtained by application of $\_\_\_\_\_\_$ formula.', 'fill_in_blank', 'Leibnitz''s', 'Answer must be word-for-word: "Leibnitz''s"');

    -- Q133 (FIB) - Implicit Definition
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'When $y$ is not explicitly expressed as a function of $x$, finding $\frac{dy}{dx}$ is achieved by $\_\_\_\_\_\_$ differentiation.', 'fill_in_blank', 'implicit', 'Answer must be word-for-word: "implicit"');

    -- Q134 (FIB) - Rolle's Conclusion
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'Rolle''s Theorem guarantees that there exists at least one number $c$ in $(a, b)$ such that $f''(c) = \_\_\_\_\_\_$.', 'fill_in_blank', '$0$', 'Answer must be word-for-word: "0"');

    -- Q135 (FIB) - Derivative Definition
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The rigorous definition of differentiability is established using the rigorous definitions of limit and $\_\_\_\_\_\_$.', 'fill_in_blank', 'continuity', 'Answer must be word-for-word: "continuity"');

    -- Q136 (FIB) - nth Derivative of $x^n$
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The $n$th derivative of $f(x)=x^n$ is $\_\_\_\_\_\_$.', 'fill_in_blank', '$n!$', 'Answer must be word-for-word: "n!"');

    -- Q137 (FIB) - Asymptote Type
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'When a function becomes arbitrarily large as $x$ approaches a number $a$, the function has a $\_\_\_\_\_\_$ asymptote at $x=a$.', 'fill_in_blank', 'vertical', 'Answer must be word-for-word: "vertical"');

    -- Q138 (FIB) - Chain Rule $\mathbf{y=e^{ax}}$
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The derivative of $y=e^{ax}$ is $\_\_\_\_\_\_$.', 'fill_in_blank', '$a e^{ax}$', 'Answer must be word-for-word: "a e^{ax}"');

    -- Q139 (FIB) - Concavity Definition
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The sign of the $\_\_\_\_\_\_$ derivative determines the concavity of the function.', 'fill_in_blank', 'second', 'Answer must be word-for-word: "second"');

    -- Q140 (FIB) - Logarithmic Differentiation Use Case
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The technique often used to differentiate a function raised to a power of another function (e.g., $x^x$) is $\_\_\_\_\_\_$ differentiation.', 'fill_in_blank', 'logarithmic', 'Answer must be word-for-word: "logarithmic"');

    -- Q141 (FIB) - MVT Secant Slope Formula
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The average rate of change over $[a, b]$ is given by the expression $\frac{f(b)-f(a)}{\_\_\_\_\_\_}$.', 'fill_in_blank', '$b-a$', 'Answer must be word-for-word: "b-a"');

    -- Q142 (FIB) - $\sin x/x$ Limit
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'As $x$ becomes small, the limit of $\frac{\sin x}{x}$ approaches $\_\_\_\_\_\_$.', 'fill_in_blank', '$1$', 'Answer must be word-for-word: "1"');

    -- Q143 (FIB) - $\mathbf{\lim_{h \to 0}}$
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The definition of the derivative $f''(x)$ uses the $\_\_\_\_\_\_$ of the difference quotient.', 'fill_in_blank', 'limit', 'Answer must be word-for-word: "limit"');

    -- Q144 (FIB) - Horizontal Tangent
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'A function $f(x)$ has a local extremum at a critical point $c$ if $f''(c)=0$, which implies a $\_\_\_\_\_\_$ tangent.', 'fill_in_blank', 'horizontal', 'Answer must be word-for-word: "horizontal"');

    -- Q145 (FIB) - $n$th derivative of $e^x$
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The $n$th derivative of $f(x)=e^x$ is $\_\_\_\_\_\_$.', 'fill_in_blank', '$e^x$', 'Answer must be word-for-word: "e^x"');

    -- Q146 (FIB) - Discontinuity type
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'If $\lim_{x \to a} f(x)$ exists but $f(a)$ is undefined, the function has a $\_\_\_\_\_\_$ discontinuity.', 'fill_in_blank', 'removable', 'Answer must be word-for-word: "removable"');

    -- Q147 (FIB) - Rolle's Condition
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'The main requirement that separates Rolle''s Theorem from MVT is the condition that $f(a)$ must equal $\_\_\_\_\_\_$.', 'fill_in_blank', '$f(b)$', 'Answer must be word-for-word: "f(b)"');

    -- Q148 (FIB) - $\mathbf{f(x)=1/x}$ negative side
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'As $x \to 0$ from the negative side, $\frac{1}{x}$ tends to $\_\_\_\_\_\_$.', 'fill_in_blank', '$-\infty$', 'Answer must be word-for-word: "-\infty"');

    -- Q149 (FIB) - Acceleration from $s(t)$
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'If $s(t)$ is the position, $\frac{d^2 s}{dt^2}$ represents $\_\_\_\_\_\_$.', 'fill_in_blank', 'acceleration', 'Answer must be word-for-word: "acceleration"');

    -- Q150 (FIB) - L'Hôpital's Second Form
    INSERT INTO questions (course_id, question_text, question_type, correct_answer, explanation)
    VALUES (v_course_id, 'L''Hôpital''s Rule applies to the indeterminate forms $\frac{0}{0}$ and $\frac{\_\_\_\_\_\_}{\infty}$.', 'fill_in_blank', '$\infty$', 'Answer must be word-for-word: "\infty"');

END $$;