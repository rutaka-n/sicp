#lang sicp

(#%require rackunit)

(define (f n)
  (if  (< n 3) n
    (+ (f (- n 1))
                 (f (- n 2))
                 (f (- n 3))
                 )
    ))

(define (f-iter n)
  (define (iter a b c count)
    (cond ((= count 0) a)
          ((= count 1) b)
          ((= count 2) c)
          (else (iter b  c (+ a  b  c) (- count 1)))))
  (iter 0 1 2 n)
  )

(check-equal? (f 5) 11)
(check-equal? (f-iter 5) 11)
(check-equal? (f 3) 3)
(check-equal? (f-iter 1) 1)
