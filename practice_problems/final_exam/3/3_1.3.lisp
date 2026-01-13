1.3 The LISP function G is defined by
(DEFUN G (L)
    (LIST (CAR L) (CAR L))
)
In order to rename the function G we execute (SETQ Q 'G) followed by (SETQ P 'Q).
What is the result of evaluating the form (FUNCALL (EVAL P) '(A B C))?

(SETQ Q 'G) -> Q = G
(SETQ P 'Q) -> P = Q
(FUNCALL (EVAL P) '(A B C)) -> (FUNCALL (EVAL Q) '(A B C)) -> (FUNCALL 'G '(A B C)) -> (A A) 