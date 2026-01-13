1.3 The LISP function F is defined by

(DEFUN F (X &REST Y)
  (COND
    ((NULL Y) X)
    (T (APPEND X (MAPCAR #'CAR Y)))
  )
)


What is the result of evaluating the form (APPEND (F '(1 2)) (F '(3 4) '(5 6) '(7 8)))
Justify the answer.

(f '(1 2)) -> x = (1 2) , y = NIL
-> the function returns (1 2)

(f '(3 4)'(5 6) '(7 8)) -> x = (3 4), y = ((5 6) (7 8))
-> (3 4) U (5) -> (3 4 5) U (7) -> (3 4 5 7 )

(APPEND (F '(1 2)) (F '(3 4) '(5 6) '(7 8))) -> (1 2 3 4 5 7 )