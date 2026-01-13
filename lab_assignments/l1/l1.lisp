; 10) a) Write a function to return the product of all the numerical atoms from a list, at superficial level.

; product-numbers(l1...ln) = { return 1, if n = 0
;                              l1 * product-numbers(l2...ln), if l1 is a number
;                              product-numbers(l2...ln), otherwise

(defun product-numbers (lst)
    (cond
      ((null lst) 1) 

      ((numberp (car lst)) 
        (* (car lst) (product-numbers (cdr lst))) 
      )

      (t 
        (product-numbers (cdr lst)) 
      )
    )
)
(format t "a)~%" )
(format t "~A~%" (product-numbers '(1 2 3 4)))
(format t "~A~%" (product-numbers '(2 a 3 f a)))
(format t "~A~%" (product-numbers '(5 1 (2 3 4) a 3 a)))



; b) Write a function to replace the first occurence of an element E in a given list with an other element O. 

; replace-first-helper(e, o, (l1...ln), found) = { return (), if n = 0
;                                 l1 U replace-first-helper(e, o, (l2...ln), true), if found = true
;                                 o  U replace-first-helper(e, o, (l2...ln), true)), if found = false and l1 = e
;                                 replace-first-helper(e, o, l1, false) U (l2...ln), if found = false and l1 is a list and the sublist changed
;                                 l1 U replace-first-helper(e, o, (l2...ln), false)), if found = false and l1 is a list and the sublist didnt change
;                                 l1 U replace-first-helper(e, o, (l2...ln), false)), otherwise

(defun replace-first-helper (e o lst found)
  (cond
    ((null lst) nil)

    (found ; if already found, just copy rest of list
     (cons (car lst)
           (replace-first-helper e o (cdr lst) t)))

    ((eql (car lst) e) ; if l1 = e and not found yet -> replace with o and set found to true
     (cons o
           (replace-first-helper e o (cdr lst) t)))

    ((listp (car lst)) ; if l1 is a list and not found yet -> check inside sublist
     (cond
       ((not (equal
              (replace-first-helper e o (car lst) nil)
              (car lst))) ; if sublist changed -> use changed sublist and stop search
        (cons (replace-first-helper e o (car lst) nil)
              (cdr lst)))

       (t
        (cons (car lst) ; if sublist didnt change -> continue search in rest of list
              (replace-first-helper e o (cdr lst) nil)))))

    (t
     (cons (car lst)
           (replace-first-helper e o (cdr lst) found))
    )
  )
)


; replace-first(l1...ln, e, o) = { replace-first-helper(e, o, (l1...ln), false)

(defun replace-first (e o lst)
  (replace-first-helper e o lst nil)
)

(format t "b)~%" )
(format t "~A~%" (replace-first 3 100 '(1 2 4 3 5 6 1 3)))
(format t "~A~%" (replace-first 'a 'z '(b c (d a e) f a g)))


; c)  Write a function to compute the result of an arithmetic expression memorised  
;     in preorder on a stack. Examples: 
;     (+ 1 3) ==> 4  (1 + 3) 
;     (+ * 2 4 3) ==> 11  [((2 * 4) + 3) 
;     (+ * 2 4 - 5 * 2 2) ==> 9  ((2 * 4) + (5 - (2 * 2)) 

; eval-preorder-helper(l1 l2...ln) = { return (l1 . (l2...ln)), if l1 is a number
;                                      return ((l1 Lval Rval) . Rrest), if l1 is an operator
;                                                                       (Lval . Lrest) = eval-preorder-helper(l2 ... ln)
;                                                                       (Rval . Rrest) = eval-preorder-helper(Lrest)
;                                      return nil, otherwise



(defun eval-preorder-helper (tokens)
  (cond
    ((numberp (car tokens)) 
     (cons (car tokens) (cdr tokens)))

    ((member (car tokens) '(+ - * /)) ; if token is an operator -> evaluate left and right operands
     (cons
      (funcall
       (cond ((eql (car tokens) '+) #'+)
             ((eql (car tokens) '-) #'-)
             ((eql (car tokens) '*) #'*)
             ((eql (car tokens) '/) #'/))
       (car (eval-preorder-helper (cdr tokens))) ; evaluate left operand and the result is a pair (value . rest of tokens)
                                                 ; so we use car to get the value
       (car 
        (eval-preorder-helper
         (cdr (eval-preorder-helper (cdr tokens))))) ; evaluate right operand and get the value (must skip the tokens used for left operand evaluation)
      )
      (cdr
       (eval-preorder-helper
        (cdr (eval-preorder-helper (cdr tokens))))))) ; ; the rest of tokens after evaluating both operands

    (t nil)
  )
)

; eval-preorder(l1...ln) = { return car(eval-preorder-helper(l1...ln))

(defun eval-preorder (tokens)
  (car (eval-preorder-helper tokens))
)


(format t "c)~%" )
(format t "~A~%" (eval-preorder '(+ 1 3)))
(format t "~A~%" (eval-preorder '(+ * 2 4 3)))
(format t "~A~%" (eval-preorder '(+ * 2 4 - 5 * 2 2)))



; d) Write a function to produce the list of pairs (atom n), where atom appears for n times in the parameter 
; list. Example: 
;    (A B A B A C A) --> ((A 4) (B 2) (C 1)). 

; count-occ(elem, l1...ln) = { return 0, if n = 0
;                              1 + count-occ(elem, (l2...ln)), if l1 == elem and l1 is not a list
;                              count-occ(elem, l1) + count-occ(elem, (l2...ln)), if l1 is a list
;                              count-occ(elem, (l2...ln)), otherwise

(defun count-occ (x lst)
  (cond
    ((null lst) 0)

    ((eql x (car lst))
     (+ 1 (count-occ x (cdr lst))))

    ((listp (car lst))
     (+ (count-occ x (car lst))
        (count-occ x (cdr lst))))

    (t
     (count-occ x (cdr lst)))
  )
)


; remove-all(x, l1...ln) = { return (), if n = 0
;                            remove-all(x, (l2...ln)), if l1 == x and l1 is not a list
;                            remove-all(x, l1) U remove-all(x, (l2...ln)), if l1 is a list 
;                            l1 U remove-all(x, (l2...ln)), otherwise

(defun remove-all (x lst)
  (cond
    ((null lst) nil)

    ((eql x (car lst))
     (remove-all x (cdr lst)))

    ((listp (car lst))
     (cons (remove-all x (car lst))
           (remove-all x (cdr lst))))

    (t
     (cons (car lst)
           (remove-all x (cdr lst))))
  )
)

; count-all(l1...ln) = { return (), if n = 0
;                        (count-all(l1) U count-all((l2...ln)), if l1 is a list
;                        (l1 count-occ(l1, (l1...ln))) U count-all(remove-all(l1, (l1...ln))), otherwise

(defun count-all (lst)
  (cond
    ((null lst) nil)

    ((listp (car lst)) ; if l1 is a list -> process it recursively and append with rest of list
     (append (count-all (car lst)) 
             (count-all (cdr lst)))) 

    (t
     (cons (list (car lst) 
                 (count-occ (car lst) lst))
           (count-all (remove-all (car lst) lst))))
  )
)


(format t "d)~%" )
(format t "~A~%" (count-all '(A B A B A C A)))
(format t "~A~%" (count-all '(1 2 (3 2) 1 4 (1 5 3) 2 1)))
