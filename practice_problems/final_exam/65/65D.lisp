; D. Given a nonlinear list, write a Lisp function to replace all the odd values from even levels with their natural successor. The superficial level is assumed 1. A MAP function shall be used.

; Example: for the list
; (1 s 4 (3 f (7)))
; the result is
; (1 s 4 (4 f (7))).

(defun f (l level)
    (cond
        ((atom l)
            (cond
                ((and (numberp l) (= 1 (mod l 2)) (= 0 (mod level 2))) (+ l 1))
                (t l)
            )
        )
        (t
            (mapcar
                #'(lambda (v)
                    (cond 
                        ((atom v) (f v level))
                        (t (f v (+ level 1)))
                    )
                )
                l
            )
        )
    )
)

(defun f-main (l)
    (f l 1)
)

(print (f-main '(1 s 4 (3 f (7)))))