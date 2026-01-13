;     A 
;    / \         ->    (A (B) (C (D) (E)))
;   B   C 
;  / \ 
;  D  E 

; 10. Return the level of a node X in a tree of type (2). The level of the root element is 0.

; level-in-children(x, l1...ln) ={ nil, if n = 0
;                                  1 + level-of(x, l1), if level-of(x, l1) != nil
;                                  level-in-children(x,  l2...ln), otherwise

(defun level-in-children (x children)
  (cond

        ((null children) nil)

        ((not (null (level-of x (car children)))) ; if x is found in the first child
        (+ 1 (level-of x (car children))) ; then add 1 to the level found in that child 
        )

        (t (level-in-children x (cdr children))) ; otherwise, search in the rest of the children
    )
)

; level-of(x, l1...ln) = { 0, if x = l1
;                          level-in-children(x, l2...ln), otherwise

(defun level-of (x tree)
    (cond

        ((null tree) nil)

        ((equal (car tree) x) 0) ; if the root = x -> level 0
    
        (t (level-in-children x (cdr tree))) ; otherwise search inside the subtree
    )
)

(format t "Level of D: ~A~%" (level-of 'D '(A (B) (C (D) (E)))))
(format t "Level of C: ~A~%" (level-of 'C '(A (B) (C (D) (E)))))
(format t "Level of A: ~A~%" (level-of 'A '(A (B) (C (D) (E)))))
