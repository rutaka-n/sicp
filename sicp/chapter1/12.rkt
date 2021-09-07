#lang sicp

(#%require rackunit)

;    1
;   1 1
;  1 2 1
; 1 3 3 1
;1 4 6 4 1

(define (solution a b)
  (cond ((= a 0) 1)
        ((= a 1))
   )
  )

(check-equal? (solution 1 1) 1)
(check-equal? (solution 3 2) 2)
(check-equal? (solution 4 3) 3)
(check-equal? (solution 5 2) 4)
(check-equal? (solution 5 3) 6)
