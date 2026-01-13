; D. Given a nonlinear list, write a Lisp function to return the list with all the numerical atoms that are multiples of 3 removed.
; A MAP function shall be used.

; Example
; a) if the list is (1 (2 A (3 A)) (6)) ⇒ (1 (2 A (A)) NIL)
; b) if the list is (1 (2 (C))) ⇒ (1 (2 (C)))


; f(l1...ln) = { [], n = 0
;                f(l2...ln), l1 is multiple of 3
;                l1 U f(l2...ln), if l1 is an atom and not a multiple of 3
;                f(l1) U f(l2...ln), if l1 is a list
(defun f (l)
    (cond
        ((atom l)
            (cond
                ((and (numberp l) (= 0 (mod l 3))) nil)
                (t l)
            )
        )
        (t
            (mapcar
                #'(lambda (v)
                    (f v)
                )
            l
            )
        )

    )
)

(print (f '(1 (2 A (3 A)) (6))))