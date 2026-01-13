; D. An n-ary tree is represented in Lisp as:
; (node subtree1 subtree2 ...)
; Write a Lisp function to return the list of nodes on the given level k.
; The root level is assumed 0.
; A MAP function shall be used.

; Example for the tree: (a (b (g)) (c (d (e)) (f)))

; a) k = 2 -> (g d)
; b) k = 5 -> ()

(defun f (l level k)
    (cond
        ((null l) nil)
        ((= level k) (cons (car l) nil))
        (t
            (mapcan
                #'(lambda (v)
                    (f v (+ level 1) k)
                )
            (cdr l)
            )
        )
    )
)

(print (f '(a (b (g)) (c (d (e)) (f))) 0 2))
;; (g d)