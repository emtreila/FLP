; A. The following function definition in LISP is given

; (DEFUN F (N)
;   (COND
;     ((= N 1) 1)
;     ((> (F (- N 1)) 2) (- N 2))
;     ((> (F (- N 1)) 1) (F (- N 1)))
;     (T (- (F (- N 1)) 1))
;   )
; )


; Rewrite the definition in order to avoid the repeated call (F (- N 1)).
; Do NOT redefine the function.
; Do NOT use SET, SETQ, SETF.
; Justify your answer.

(defun f (n)
    (cond
        ((= n 1) 1)
        (t
            ((lambda (v)
                (cond
                    ((> v 2) (- n 2))
                    ((> v 1) v)
                    (t (- v 1))
                )
            )
            (f (- n 1)))
        )
    )
)

; The recursive call f(- n 1) appears many times in the definition. To avoid repeated evaluation,
; the call is computed only once and its result is passed as a parameter to a lambda function.