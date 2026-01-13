; III. An n-ary tree is represented in LISP: (root subtree1 subtree2 ...). Write a function to replace all nodes from 
; the odd levels in the tree with a given value e. The level of root is considered 0.
; Use a MAP function. Write mathematical model and the meaning of all parameters for each function used.
; Ex: (a (b (g)) (c (d (e)) (f))) and e = h -> (a (h (g)) (h (d (h)) (h)))

(defun f (tree level elem)
    (cond
        ((null tree) nil)
        ((atom tree)
            (cond
                ((= 1 (mod level 2)) elem)
                (t tree)
            )
        )
        (t
            (cons 
                (f (car tree) level elem)
                (mapcar
                    #'(lambda (v)
                        (f v (+ level 1) elem)
                    )
                (cdr tree)
                )
            )
        )
    )
)

(defun main (l e)
    (f l 0 e)
)

(print (main '(a (b (g)) (c (d (e)) (f))) 'h))