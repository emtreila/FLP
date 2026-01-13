1.3 The LISP function is defined by:
(DEFUN F (X &OPTIONAL Y)
    (cond
        ((NULL Y)(CDR X))
        (T (CONS (CAR X) Y))
    )
)
what is the result of evaluating the form (APPEND (F '(1 2)) (F '(3 4) '(5 6)))

(F '(1 2)) -> X = (1 2) , Y = NIL -> 2
(F '(3 4) (5 6)) -> X = (3 4), Y = (5 6) -> 3 5 6
->>> (2 3 5 6)