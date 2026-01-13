; B. Given a nonlinear list that contains numerical and non-numerical atoms, write a Lisp program that verifies if the average of the numerical atoms 
;on even levels is equal to the average of the numerical atoms on odd levels.
; For example, for the list
; (10 A 10 V (10 B (4 H 5)) (3 (A B (1) 5 L))),
; the result will be true.

(defun sum-all (l)
    (cond
        ((null l) 0)
        ((numberp l) l)
        ((atom l) 0)
        (t (+ (sum-all (car l)) (sum-all (cdr l))))
    )
)

(defun sum-odd (l level)
    (cond
        ((null l) 0)
        ((numberp l)
            (cond
                ((= 0 (mod level 2)) l)
                (t 0)
            )
        )
        ((atom l) 0)
        (t (+ (sum-odd (car l) (+ level 1)) (sum-odd (cdr l) level)))
    )
)

(defun len-all (l)
    (cond
        ((null l) 0)
        ((numberp l) 1)
        ((atom l) 0)
        (t (+ (len-all(car l)) (len-all (cdr l))))
    )
)

(defun len-odd (l level)
    (cond
        ((null l) 0)
        ((and (numberp l) (= 0 (mod level 2))) 1)
        ((atom l) 0)
        (t (+ (len-odd (car l) (+ level 1)) (len-odd (cdr l) level)))
    )
)

(defun my-average (s le)
    (cond
        ((= le 0) 0)
        (t (/ s le))
    )
)

(defun my-function (l)
        (= (my-average (sum-odd l 1) (len-odd l 1))
            (my-average (- (sum-all l) (sum-odd l 1)) (- (len-all l) (len-odd l 1)))
            ) T
        
    
)

(print (my-function '(10 A 10 V (10 B (4 H 5)) (3 (A B (1) 5 L)))))