; A. The following function definition in LISP is given

; (DEFUN F (L)
;   (COND
;     ((NULL L) NIL)
;     ((LISTP (CAR L))
;      (APPEND
;        (F (CAR L))
;        (F (CDR L))
;        (CAR (F (CAR L)))))
;     (T (LIST (CAR L)))
;   )
; )


; Rewrite the definition in order to avoid the double recursive call
; (F (CAR L)).

; Do NOT redefine the function.
; Do NOT use SET, SETQ, SETF.

; Justify your answer.

(defun f (l)
    (cond
        ((null l) nil)
        (t
                ((lambda (v)
                    (cond
                        ((listp (car l)) (append v (f (cdr l)) (car v)))
                        (t (list(car l)))
                    )
                )
                (f (car l))
                )
        )
    )
)
; The function call f (car l) appears in multiple calls. To avoid repetive evaluation we compute the call only once,
; and the result is given as a parameter to a lambda function.
