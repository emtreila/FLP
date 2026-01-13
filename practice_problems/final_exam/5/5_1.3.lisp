1.3 The LISP function G is defined by

(DEFUN G (F L)
  (FUNCALL F L)
)

What is the result of evaluating the form
(G #'(LAMBDA (L) (G #'CDR L)) '(1 2 3))

-> 2 3