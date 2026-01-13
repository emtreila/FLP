; Definiti o functie care obtine dintr-o lista data lista tuturor atomilor nenumerici care apar, 
; pe orice nivel, dar in ordine inversa.
; ex : ((A B) 2 C 3 (D 1 E)) --> (E D C B A)

; my-reverse(l1...ln) = { [], if n = 0
;                         my-reverse(l2...ln) U l1, otherwise
(defun my-reverse (l)
    (cond
        ((null l) nil)
        (t 
            (append 
                (my-reverse (cdr l)) (list (car l)) ; add the first element at the end and recursively call for the rest of the list
            )
        )
    )
)

; my-function(l1...ln) = { [], if n = 0
;                          l1 U my-function(l2...ln), if l1 is a non-numerical atom
;                          my-function(l2...ln), if l1 is not a non-numerical atom
;                          my-function(l1) U my-function(l2...ln), if l1 is a list
(defun my-function (l)
    (cond
        ((null l) nil)
        ((atom l)
            (cond
                ((not (numberp l)) (list l)) ; check if l is a non-numerical atom
                (t nil)
            )
        )
        (t
            (append ; concatenate the results by processing the first element and the rest of the list
                (my-function (car l)) 
                (my-function (cdr l))  
            )
        )
    )
)

(print (my-reverse (my-function '((A B) 2 C 3 (D 1 E)))))
(print (my-reverse (my-function '((Z C) D 23 L 1))))
(print (my-reverse (my-function '(A (B 2) (C D) (1 3)))))
(print (my-reverse (my-function '((A 2 1) B C (3 D 7) E (F)))))

