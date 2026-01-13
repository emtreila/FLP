; D. Given a nonlinear list, write a Lisp function to return the list with all even numerical atoms from an odd level removed. The superficial level is assumed 1. A MAP function shall be used.

; Example
; a) if the list is (1 (2 A (4 A)) (6)) ⇒ (1 (2 A (A)) (6))
; b) if the list is (1 (2 (C))) ⇒ (1 (2 (C)))

(defun filter-list (l)
    (cond
        ((null l) nil)
        ((null (car l)) (filter-list (cdr l)))
        (t (cons (car l) (filter-list (cdr l))))
    )
)

(defun f (l level)
    (cond
        ((atom l)
        (cond
            ((and (numberp l)
                (= 0 (mod l 2))
                (= 1 (mod level 2))
        )
            nil)
            (t l)
        ))
        (t 
            (filter-list
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
)
(print (f '(1 (2 A (4 A)) (6)) 1)) ; Output: (1 (2 A (A)) (6))
