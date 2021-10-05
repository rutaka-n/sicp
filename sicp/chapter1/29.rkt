#lang sicp

(#%require rackunit)

(define (cube x) (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx)
  )

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (g k)
    (define (c k)
      (cond ((= k 0) 1)
            ((= k n) 1)
            ((even? k) 2)
            (else 4)))
    (* (c k) (f (+ a (* k h)))))
  (define (inc k) (+ k 1))
  (/ (* (sum g 0 inc n) h) 3.0))

(check-equal? (round (* 100 (simpson cube 0 1 100))) 25.0)
(check-equal? (round (* 100 (simpson cube 0 1 1000))) 25.0)
; (check-equal? (floor (* 1000 (simpson cube 0 1 100))) 249.0)
(check-equal? (floor (* 1000 (simpson cube 0 1 1000))) 250.0)
