; 10. Define a function that replaces one node with another one in a n-tree represented as: root 
; list_of_nodes_subtree1... list_of_nodes_subtreen)  
;  Eg: tree is (a (b (c)) (d) (e (f))) and node 'b' will be replace with node 'g' => tree (a (g (c)) (d) (e (f)))

; l1...ln = the tree
; old = node to be replaced
; new = new node

; replace-node(l1...ln, old, new) = { new, if l1 = old
;                                l1, if l1 != old and l1 is an atom
;                                (replace-node(l1, old, new),..., replace-node(ln, old, new)), otherwise

(defun replace-node (tree old new)
    (cond
        ((atom tree) ; if tree is an atom
            (cond ; check if it is the old node
                ((equal tree old) new) ; replace with new
                (t tree)
            )
        )
        (t
            (mapcar ; apply replace recursively to each subtree
                #'(lambda (v)
                    (replace-node v old new)
                )
            tree
            )
        )
    )
)

(print (replace-node '(a (b (c)) (d) (e (f))) 'b 'g))
(print (replace-node '(a (b (c)) (d) (e (f))) 'e 'z))