1.3 The LISP function G is defined by
(DEFUN G (L) 
    (MAPCON #'LIST L)
)

What is the result of evaluating the form (APPLY #'APPEND (MAPCON #'G '(1 2)))?
Justify the answer.

#'G '(1 2) -> MAPCON #'LIST (1 2) -> (1 2),(2)
(MAPCON #'G '(1 2)) -> ((1 2) (2))
(MAPCON #'G '(2)) -> ((2))
(APPLY #'APPEND (MAPCON #'G '(1 2))) -> ((1 2) (2) (2))