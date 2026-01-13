; D. An n-ary tree is represented in Lisp as (node subtree1 subtree2 ...).

; Write a function to replace all nodes on odd levels with a given value e.
; The root level is assumed 0.
; A MAP function shall be used.

; Example:
; for the tree
; (a (b (g)) (c (d (e)) (f)))
; and e = h

; ⇒
; (a (h (g)) (h (d (h)) (h)))

(defun f (l level e)
  (cond
    ((null l) nil)
    (t
      (cons
        (cond
          ((oddp level) e)
          (t (car l))
        )
        (mapcar
          #'(lambda (x)
              (f x (+ level 1) e))
          (cdr l)
        )
      )
    )
  )
)


print(f '((a (b (g)) (c (d (e)) (f))) 0 h))