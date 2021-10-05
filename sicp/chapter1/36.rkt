#lang sicp

(#%require rackunit)

(define tolerance 1/1000)

; (define (fixed-point f first-guess)
;     (define (close-enough? v1 v2)
;         (< (abs (- v1 v2)) tolerance))
;     (define (try guess)
;         (let ((next (f guess)))
;             (if (close-enough? guess next)
;                 (exact-round next)
;                 (try next))))
;     (try first-guess))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess iteration)
    (display iteration)
    (display " : ")
    (display guess)
    (newline)
    (let ((next (f guess)))
         (if (close-enough? guess next)
             next
             (try next (+ iteration 1)))))
  (try first-guess 1))

; (check-equal? (round (* 100 (fixed-point cos 1.0))) 74)
; (check-equal? (round (* 100 (fixed-point (lambda (y) (+ (sin y) (cos y))) 1.0))) 126)
