; III. Determine the maximum element from a list at any level, using MAP functions.
; The list may contain numerical and non-numerical atoms and other lists.
; If the list does not contain any numerical atoms, we consider that the maximum is NIL.
; Write the mathematical model and the meaning of all parameters for each function used.

; E.g.
; (a 12 2 (3) A 4 (B (() ((13))) 10) ()) → 13

(defun max2 (a b)
    (cond
        ((null a) b)
        ((null b) a)
        ((> a b) a)
        (t b)
    )
)

(defun max-list (l)
    (cond
        ((null l) nil)
        (t (max2 (car l) (max-list (cdr l))))
    )
)

(defun f (l)
    (cond
        ((atom l)
            (cond
                ((numberp l) l)
                (t nil)
            )
        )
        (t
            (max-list
                (mapcar
                    #'f l
                )
            )
        )
    )
)