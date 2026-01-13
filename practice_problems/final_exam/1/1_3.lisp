; III. A nonlinear list is given. Write a LISP function to return as result the initial list in which the atoms from the 
; level k from the initial list have been replaced with 0 (the superficial level is considered 1).
; Use a MAP function. Write the mathematical model and the meaning of all parameters for each function used.

; Eg: for list
; (a (1 (2 b)) (c (d))) and k = 2 ⇒
; (a (0 (2 b)) (0 (d)))

; my-function(l1...ln, k, level) = { nil, n = 0
;                                 0 U my-function(l2...ln), level == k
;                                 l1 U my-function(l2...ln), level != k
;                                 my-function(l1) U my-function(l2...ln), l1 is a list
(defun my-function (l k level)
    (cond
        ((null l) nil)
        ((atom l)
            (cond
                ((= level k) 0)
                (t l)
            )
        )
        (t
            (mapcar
                #'(lambda (v)
                    (cond
                        ((atom v) (my-function v k level))
                        (t
                            (my-function v k (+ level 1))
                        )
                    )
                )
                l
            )
        )
    )
)

; main(l1...ln, k) = { my-function(l1...ln, k, 1), level = 1 because that is the superficial level
(defun main (l k)
    (my-function l k 1)
)

(print (main '(a (1 (2 b)) (c (d))) 2))
(print (main '(a) -1))
