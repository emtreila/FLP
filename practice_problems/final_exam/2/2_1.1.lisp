1.1 Consider the following function definition in LISP

(DEFUN F (L)
  (COND
    ((NULL L) NIL)
    ((FUNCALL F (CAR L)) (CONS (FUNCALL F (CAR L)) (FCT F (CDR L))))
    (T NIL)
  )
)


Give a solution to avoid the double recursive call FUNCALL F (CAR L).
You will not use SET, SETQ, SETF.

(defun f (l)
    (cond
        ((null l) nil)
        ((lambda (v)
            (cond
                (v (cons v (fct f (cdr l))))
                (t nil)
            )
        )
        (funcall f (car l))
        )
    )
)

; The recursive call (funcall f (car l)) was computed in multiple clauses. To avoid repeated executions,
; we compute the recursive call only once and take its result as a parameter in a lambda function, to be more efficient.