#lang sicp

(#%require rackunit)

; (define (fib n)
;   (cond  ((= n 0) 0)
;          ((= n 1) 1)
;          (else (+ (fib (- n 1)) (fib (- n 2))))
;          ))

(define (fib n) (fib-iter 1 0 n))

(define (fib-iter a b count)
  (if (= count 0)
    b
    (fib-iter (+ a b) a (- count 1)))
  )

(check-equal? (fib 0) 0)
(check-equal? (fib 1) 1)
(check-equal? (fib 3) 2)
(check-equal? (fib 4) 3)
(check-equal? (fib 5) 5)
(check-equal? (fib 6) 8)
