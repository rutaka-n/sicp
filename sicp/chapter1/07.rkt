#lang sicp

(#%require rackunit)

(define (square x) (* x x))

(define (good-enough? old-guess guess)
  (< (abs (- guess old-guess)) 0.0001))

(define (average a b)
  (/ (+ a b) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter old-guess guess x)
  (if (good-enough? old-guess guess)
        guess
        (sqrt-iter guess (improve guess x) x)))

(define (square-root num) (sqrt-iter 0 1 num))

(check-equal? (round (* 1000 (square-root 4.0))) 2000.0)
(check-equal? (round (* 1000 (square-root 100.0))) 10000.0)
(check-equal? (round (* 1000 (square-root 1000000.0))) 1000000.0)
(check-equal? (round (* 1000 (square-root 0.04))) 200.0)
