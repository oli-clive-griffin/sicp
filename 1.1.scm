#lang sicp

;; ex1.1
;; not doing that that's stupid

;; ex1.2
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))

;; ex1.3
(define (sum-bar-least a b c)
  (cond ((and (< c a) (< c b)) (+ a b))
        ((and (< a b) (< a c)) (+ b c)) 
        ((and (< b c) (< b a)) (+ c a))))

;; ex 1.4
;; the get an operator, we test a predicate and are 
;; returned either + or -.

;; ex 1.5
;; it will infinitely loop depending on which order of evaluation.

;; ex 1.6 
;; it will infinitely loop, 
(define (p) 
  (display "adsf") (p))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

;; (display (new-if (< 0 1)
;;              "asdf"
;;              (p)))
;; hangs

;; ex 1.7

;; ex 1.8

(define (avg a b) 
	(/ (+ a b) 2))

(define (sqrtrec guess x )
	(if (< (abs (- (* guess guess) x)) 0.001)
		guess
		(sqrtrec (avg guess (/ x guess))
				 x)))

(define (sqrt x)
	(sqrtrec 1 x))


(display (sqrt 1)) (newline)
(display (sqrt 9)) (newline)

(define (square-root x)
  (define (new-guess guess)
    (avg guess (/ x guess)))
  (define (good-enough? guess)
    (< (abs (- x (* guess guess))) 0.000001))
  (define (square-root-iter guess)
    (if (good-enough? guess) 
      guess
      (square-root-iter (new-guess guess))))
  (square-root-iter 1))

(display (square-root 4000000000000000000000000))



(define (abs x)
  (if (> x 0) 
      x (- x)))

(define (cube-root x)
  (define (new-guess guess)
    (/ (+ (/ x (* guess guess)) (* 2 guess))
       3))
  (define (good-enough? guess)
    (< (abs (- x (* guess guess guess))) 0.000001))
  (define (cube-root-iter guess)
    (if (good-enough? guess) 
      guess
      (cube-root-iter (new-guess guess))))
  (cube-root-iter 1))


