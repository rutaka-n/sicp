#lang sicp

(#%require rackunit)


(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))
(define (test a n)
  (= (expmod a n n) a))

(define (carmichael-test n)
  (define (t-iter a n)
    (if (< a n)
      (if (test a n)
        (t-iter (+ a 1) n)
        #f
        )
      #t
      )
    )
  (t-iter 1 n)
  )


(check-equal? (carmichael-test 4) #f)
(check-equal? (carmichael-test 3) #t)
(check-equal? (carmichael-test 561) #t)
(check-equal? (carmichael-test 1105) #t)
(check-equal? (carmichael-test 1729) #t)
(check-equal? (carmichael-test 2465) #t)
(check-equal? (carmichael-test 2821) #t)
(check-equal? (carmichael-test 6601) #t)
