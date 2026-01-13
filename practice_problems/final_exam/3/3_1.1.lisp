; 1.1 Consider the following function definition in LISP

(DEFUN F (G L)
    (cond
        ((NULL L) NIL)
        (> (FUNCALL G L) 0) (CONS (FUNCALL G L) (F (CDR L)))
        (T (FUNCALL G L))
    )
)

; Rewrite it in order to have only one recursive call (FUNCALL G L)

(defun f (g l)
    (cond
        ((null l) nil)
        (t
            ((lambda (v)
                (cond
                    ((> v 0) (cons v (f g (cdr l))))
                    (t v)
                )
            )
            (funcall g l)
            )
        )
    )
)

; The recursive call (funcall g l) was executed in multiple clauses. To avoid repeated execution, 
; we compute once the recursive call (funcall g l) and its result is given as a parameter to a lambda function,
; such that we improve efficiency.