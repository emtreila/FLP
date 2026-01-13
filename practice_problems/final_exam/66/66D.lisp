; D. An n-ary tree is represented in Lisp as
; (node subtree1 subtree2 ...).
; Write a Lisp function to determine the path from the root to a given node.
; A MAP function shall be used.

; Example: for the tree
; (a (b (g)) (c (d (e)) (f)))

; (a) node = e ⇒ (a c d e)

; (b) node = v ⇒ ()

(defun path-to-node (tree x)
    (cond
        ((null tree) nil)
        ((= (car tree) x) (list x))
        (t
            ((lambda (paths)
                (cond
                    ((null (car paths)) nil)
                    (t
                        (cons (car tree) (car paths))
                    )
                )
            )
            (remove nil
                (mapcar 
                    #'(lambda (subtree)
                        (path-to-node subtree x)
                    )
                    (cdr tree)
                )
            )
            )
        )
    )
)