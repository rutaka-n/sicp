#lang sicp

(#%require rackunit)

(define (square a) (* a a))
(define (sum_of_squares a b) (+ (square a) (square b)) )
(define (solution a b c) (sum_of_squares (max a b c) (max (min a b) (min a c) (min b c)) ) )


(check-equal? (solution 1 2 3) 13)
(check-equal? (solution 4 2 3) 25)
(check-equal? (solution 0 0 0) 0)
(check-equal? (solution 1 0 1) 2)
(check-equal? (solution 2 3 0) 13)
