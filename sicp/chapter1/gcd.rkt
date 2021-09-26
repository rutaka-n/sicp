#lang sicp

(#%require rackunit)

(define (my-gcd a b)
  (if (= b 0) a
    (my-gcd b (remainder a b))
    )
  )

(check-equal? (my-gcd 206 40) 2)
(check-equal? (my-gcd 40 206) 2)
(check-equal? (my-gcd 16 28) 4)
(check-equal? (my-gcd 28 16) 4)
