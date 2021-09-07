#lang sicp

(#%require rackunit)

;    1
;   1 1
;  1 2 1
; 1 3 3 1
;1 4 6 4 1

(define (solution a b)
  (define (pascal a b)
  (cond ((= b 1) 1)
        ((= a b) 1)
        (else (+ (pascal (- a 1) (- b 1)) (pascal (- a 1)  b)))
   )
  )
  (pascal a b)
  )

(check-equal? (solution 1 1) 1)
(check-equal? (solution 3 2) 2)
(check-equal? (solution 4 3) 3)
(check-equal? (solution 5 2) 4)
(check-equal? (solution 5 3) 6)
