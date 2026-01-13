; III. Given an n-ary tree represented as
; (root (subtree_1) (subtree_2) … (subtree_n))
; in which nodes are denoted using numbers and letters of the alphabet, create a list with all the nodes which are consonants.
; The root is on level 1.
; Use MAP functions. Write the mathematical model and the meaning of all parameters for each function used.

; Eg:
; (A (B (C) (7) (E) (F)) (2) (D)) ⇒ (B C F D)

(defun f (tree)
    (cond
        ((null tree) nil)
        ((atom tree)
            (cond
                ((and (symbolp tree) (not (or (equal tree 'A) (equal tree 'E) (equal tree 'I) (equal tree 'O) (equal tree 'U)))) (list tree))
                (t nil)
            )
        )
        (t
            (mapcan
                #'(lambda (v)
                    (f v)
                )
            (cdr tree)
            )
        )
    )
)

(print (f '(A (B (C) (7) (E) (F)) (2) (D))))
