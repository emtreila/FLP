; A. The following function definition in LISP is given

; (DEFUN F (G L)
;   (COND
;     ((NULL L) NIL)
;     ((> (FUNCALL G L) 0)
;      (CONS (FUNCALL G L) (F (CDR L))))
;     (T (FUNCALL G L))
;   )
; )


; Rewrite the definition in order to avoid the repeated call
; (FUNCALL G L).

; Do NOT redefine the function.
; Do NOT use SET, SETQ, SETF.

; Justify your answer.

(defun f (g l)
    (cond
        ((null l) nil)
        (t
            ((lambda (v)
                (cond
                    ((> v 0) (cons v (f  g (cdr l))))
                    (t v)
                )
            )
            )
            (funcall g l)
        )
    )
)

; The recursive call (funcall g l) appears multiple times in the definition. To avoid repeated evaluation, the call is computed
; only once and its result is passed as a parameter to a lambda function
