; D. Given a nonlinear list, write a Lisp function to replace the numerical values on odd levels and greater
; than a given value k to their natural predecessor. The superficial level is assumed 1. A MAP function shall be used.

; Example for the list
; (1 s 4 (3 f (7))) and

; a) k = 0 the result is
; (0 s 3 (3 f (6)))

; b) k = 8 the result is
; (1 s 4 (3 f (7)))

(defun f (l level k)
    (cond
        ((atom l)
            (cond
                ((and (numberp l) (oddp level) (> l k))
                (- l 1))
            (t l))
        )
        (t
            (mapcar 
                #'(lambda (x)
                    (f x (+ level 1) k)
                )
            l )
        )
    
    )
)

(print (f '(1 s 4 (3 f (7))) 1 0))
;; (0 s 3 (3 f (6)))

(print (f '(1 s 4 (3 f (7))) 1 8))
;; (1 s 4 (3 f (7)))
