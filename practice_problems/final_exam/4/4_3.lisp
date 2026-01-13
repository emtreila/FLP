; III. Write a LISP function to substitute an element e with another element e1 at any odd level from a nonlinear list (the superficial level is considered 1).
; Use a MAP function. Write the mathematical model and the meaning of all parameters for each function used.

; Eg: for list
; (1 d (2 d (d))), e = d and e1 = f -> the resulted list is (1 f (2 d (f))).

(defun f (l e e1 level)
    (cond
        ((null l) nil)
        ((atom l)
            (cond
                ((and (= 1 (mod level 2)) (equal l e)) e1)
                (t l)
            )

        )
        (t
            (mapcar
                #'(lambda (v)
                    (cond
                        ((atom v) (f v e e1 level))
                        (t (f v e e1 (+ level 1)))
                    )
                )
                l
            )
        )
    )
)

(print (f '(1 d (2 d (d))) 'd 'f 1))
