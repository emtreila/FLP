1.1 Consider the following function definition in LISP

(DEFUN F (L)
    (cond
        ((NULL L) NIL)
        ((LISTP (CAR L)) (APPEND (F (CAR L)) (F (CDR L)) (CAR (F (CAR L)))))
        (T (LIST (CAR L)))
    )
)


Give a solution to avoid the double recursive call (F (CAR L)).
You will not use SET, SETQ, SETF.

(defun f (l)
    (cond
        ((null l) nil)
        (t 
            ((lambda (v)
                (cond
                    ((listp (car l)) (append v (f (cdr l)) (car v)))
                    (t (list v))
                )
            )
            (f (car l))
            )
        )
    )
)

; The function call (f (car l)) was computed in multiple clauses. To avoid repeated execution,
; we compute once the function call and its result is given to a lambda function as a parameter,
; to improve efficiency.