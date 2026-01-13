; 1.1 Consider the following function definition in LISP

(defun f (l1 l2)
  (append
    (f (car l1) l2)
    (cond
      ((null l1) (cdr l2))
      (t (list (f (car l1) l2) (car l2)))
    )
  )
)

; Rewrite it in order to have only one recursive call (f (car l1) l2)

(defun f (l1 l2)
    (cond
        ((null l1) (cdr l2))
        (t 
            ((lambda (v)
                (append v
                     (list v (car l2))
                )
            )
            (f (car l1) l2)
            )
        )
    )
)