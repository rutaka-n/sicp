#lang sicp

(#%require rackunit)

(define (square x) (* x x))

(define (even? n)
  (= (remainder n 2) 0))

(define (expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (expt b (/ n 2))))
        (else (* b (expt b (- n 1))))))

(define (solution b n)
  (define (expt-iter b n prod)
    (cond ((= n 0) prod)
          ((even? n) (expt-iter (square b) (/ n 2) prod))
          (else (expt-iter b (- n 1) (* prod b)))
          )
    )

  (expt-iter b n 1)
  )

(check-equal? (solution 10 0) 1)
(check-equal? (solution 2 4) 16)
(check-equal? (solution 2 5) 32)
(check-equal? (solution 2 6) 64)
(check-equal? (solution 3 20) (expt 3 20))
(check-equal? (solution 2 10) (expt 2 10))
(check-equal? (solution 0 5) 0)
