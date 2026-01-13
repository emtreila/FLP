; (DEFUN F (L)
;   (COND
;     ((NULL L) 0)
;     ((> (F (CAR L)) 2)
;      (+ (CAR L) (F (CDR L))))
;     (T (F (CAR L)))
;   )
; )

; Rewrite the definition in order to avoid the double recursive call
; (F (CAR L)).
; Do NOT redefine the function.
; Do NOT use SET, SETQ, SETF.
; Justify your answer.

(defun f (l)
    (cond
        ((null l) 0)
        (t 
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
)

; JUSTIFICATION: The recursive call f (car l) appears multiple times in the definition. To avoid repeated evaluation,
; the call is computed once and its result is passed as a parameter to a lambda function.