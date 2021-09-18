#lang sicp

(#%require rackunit)

(define (double x) (* x 2))
(define (halve x) (/ x 2))

(define (fast-mul a b)
  (define (fast-mul-iter a b prod)
    (cond ((= a 0) prod)
          ((even? a) (fast-mul-iter (halve a) (double b) prod))
          (else (fast-mul-iter (- a 1) b (+ prod b)))
      )
    )
  (fast-mul-iter a b 0)
  )

(check-equal? (fast-mul 1 1) 1)
(check-equal? (fast-mul 40 30) (* 40 30))
(check-equal? (fast-mul 5 0) 0)
(check-equal? (fast-mul 5 15) (* 5 15))
