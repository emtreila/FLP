; B. Given a nonlinear list containing both numerical and non-numerical atoms, write a LISP program that computes the greatest common divisor of odd numbers on even levels of the list. The superficial level is considered to be 1.

; For example, for the list
; (A B 12 (9 D (A F (75 B) D (45 F) 1) 15) C 9),
; the result will be 3.

; We assume there is at least one odd number at each even level of the list.
; You are not allowed to use the predefined Lisp function gcd.

(defun my_gcd (a b)
    (cond
        ((= b 0) a)
        (t (my_gcd b (mod a b)))
    )
)

(defun f (l level)
    (cond
        ((null l) 0)
        ((atom l)
            (cond
                ((and   (numberp l)
                        (= (mod l 2) 1)
                        (= (mod level 2) 0))
                l)
                (t 0)
            )
        )
        (t
            (my_gcd
            (cond
                ((atom (car l))
                (f (car l) level))
                (t
                (f (car l) (+ level 1))))
            (f (cdr l) level))))
    )


(print (f '(A B 12 (9 D (A F (75 B) D (45 F) 1) 15) C 9) 1))