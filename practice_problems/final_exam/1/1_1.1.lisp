; 1.1 Consider the following function definition in LISP

; (DEFUN F (L)
;   (COND
;     ((NULL L) 0)
;     ((> (F (CAR L)) 2) (+ (CAR L) (F (CDR L))))
;     (T (F (CAR L)))
;   )
; )


; Give a solution to avoid the double recursive call (F (CAR L)).
; You will not use SET, SETQ, SETF.

(defun f (l)
    (cond
        ((null l) 0)
        ((lambda (v)
            (cond
                ((> v 2) (+ (car l) (f (cdr l))))
                (t v)
            )
        )
        (f (car l))
        )
    )
)

; The recursive call f(car l) was executed in multiple clauses. To avoid repeated executions,
; we compute the recursive call f(car l) once and use it as a parameter in a lambda function, so we can improve the efficiency.