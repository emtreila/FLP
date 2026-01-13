; A. The following function definition in LISP is given

; (DEFUN F (L)
;   (COND
;     ((ATOM L) -1)
;     ((> (F (CAR L)) 0)
;      (+ (CAR L) (F (CAR L)) (F (CDR L))))
;     (T (F (CDR L)))
;   )
; )


; Rewrite the definition in order to avoid the double recursive call
; (F (CAR L)).

; Do NOT redefine the function.
; Do NOT use SET, SETQ, SETF.

; Justify your answer.

(defun f (l)
    (cond
        ((atom l) -1)
        (t
            ((lambda (v)
                (cond
                    ((> v 0)(+ (car l) v (f (cdr l))))
                    (t (f (cdr l)))
                )
            )
            (f (car l)))
        )
    )
)

; The recursive call f (car l) appears multiple times in the definition. To avoid repeated evaluation,
; we compute only once the recursive call and use its result as a parameter in a lambda function.