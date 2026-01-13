; III. An n-ary tree is represented in LISP: (root subtree1 subtree2 ...) in which the nodes are numerical
; and non-numerical atoms, multiply each numerical node of the tree with its level. Root is on level 1.
; Use MAP functions.
; Ex: (1 (2)(3 (4 (5)))) -> (1 (4) (6 (12 (20))))

(defun f (tree level)
    (cond
        ((null tree) nil)
        ((atom tree)
            (cond
                ((numberp tree) (* tree level))
                (t tree)
            )
        )
        (t
            (mapcar
                #'(lambda (v)
                    (cond
                        ((atom v) (f v level))
                        (t
                            (f v (+ level 1))
                        )
                    )
                )
                tree    
            )
        )
    )
)

(print (f '(1 (2)(3 (4 (5)))) 1))
(print (f '(1 (2 (A (B))) (3 (4 (C (5))))) 1))