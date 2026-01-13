; D. Given a nonlinear list, write a Lisp function to return the list with all non-numerical atoms on even levels removed.
; The superficial level is assumed 1.
; A MAP function shall be used.

; Example: for the list

; (a (1 (2 b)) (c (d)))


; the result is

; (a (1 (2 b)) ((d)))
(defun filter-nil (l)
  (cond
    ((null l) nil)
    ((null (car l)) (filter-nil (cdr l)))
    (t (cons (car l) (filter-nil (cdr l))))))

(defun f (l level)
  (cond
    ;; atom: test at CURRENT level
    ((atom l)
     (cond
       ((and (not (numberp l))
             (= (mod level 2) 0))
        nil)
       (t l)))

    ;; list: DO NOT blindly increase level
    (t
    (filter-nil
     (mapcar
      #'(lambda (v)
          (cond 
          ((atom v) (f v level))          ; same level
              (t (f v (+ level 1)))))  ; go deeper
      l))))
)


(print (f '(a (1 (2 b)) (c (d))) 1))