; B. Given a nonlinear list that contains numerical and non-numerical atoms, write a LISP program that replaces each even numerical atom on 
; odd levels with the sum of its digits. The superficial level is odd.

; For example, for the list
; (A 2 (B 31 F (D 102 5 T (66) E) (D 10 (E R 51)) 99))
; the result will be
; (A 2 (B 31 F (D 3 5 T (66) E) (D 1 (E R 51)) 99)).


; sum-digits(nr, sum) = { sum, nr = 0
;                         sum-digits( nr div 10, sum + (nr mod 10)), otherwise
(defun sum-digits (l s)
    (cond
        ((= l 0) s)
        (t (sum-digits (floor l 10) (+ s (mod l 10))))
    )
)

; sum-main(nr) = { sum-digits(nr, 0)
(defun sum-main (l)
    (sum-digits l 0)
)

; f(l1...ln, level) = { [], n = 0
;                       sum_main(l1) U f(l2...ln, level), l1 is an even number and level is an odd number
;                       l1 U f(l2...ln, level), l1 is an atom and the above conitions are false
;                       f(l1, level+1) U f(l2, level), if l1 is a list
(defun f (l level)
    (cond
        ((atom l)
            (cond
                ((and 
                (numberp l) (= 0 (mod l 2)) (= 1 (mod level 2))
                ) (sum-main l))
                (t l)
            )
        )
        (t
            (cons
                (cond
                    ((atom (car l)) (f (car l) level))
                    (t (f (car l) (+ level 1)))
                )
                (f (cdr l) level)
            )
        )
    )
)

(print (f '(A 2 (B 31 F (D 102 5 T (66) E) (D 10 (E R 51)) 99)) 1))