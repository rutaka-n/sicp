#lang sicp

(#%require rackunit)

; (define (product term a next b)
;   (if (> a b)
;       1
;       (* (term a)
;          (product term (next a) next b))))

(define (product term a next b)
  (define (iter a result)
    (if (= a b)
      (* (term a) result)
      (iter (next a) (* (term a) result))
     )
    )
  (iter a 1)
  )

(define (factorial n)
  (product * 1 inc n)
  )

(define (inc n) (+ n 1))

(define (square x) (* x x))

(define (identity x) x)

(check-equal? (product square 1 inc 3) 36)
(check-equal? (product identity 3 inc 5) 60)
(check-equal? (factorial 5) 120)

