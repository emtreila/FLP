The LISP function G is defined by:
    (DEFUN G (L)
        (LIST (CAR L) (CAR L))
    )
In order to rename the function G we execute (SETQ Q 'G) followed by (SETQ P Q).
What is the result of evaluating the form (FUNCALL P '(A B C))? Justify the answer.

(setq q 'g) -> q = g
(setq p q) -> p = g
(funcall p '(a b c)) = (funcall g '(a b c)) -> (a a)