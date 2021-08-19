#lang sicp

(#%require rackunit)

(define (good-enough? old-guess guess)
  (< (abs (- guess old-guess)) 0.0001))

; (x/(y * y) + 2y) / 3
(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(define (cube-iter old-guess guess x)
  (if (good-enough? old-guess guess)
        guess
        (cube-iter guess (improve guess x) x)))

(define (cube-root num) (cube-iter 0 1 num))

(check-equal? (round (* 1000 (cube-root 8.0))) 2000.0)
(check-equal? (round (* 1000 (cube-root 1000.0))) 10000.0)
(check-equal? (round (* 1000 (cube-root 1000000000.0))) 1000000.0)
(check-equal? (round (* 1000 (cube-root 0.008))) 200.0)
