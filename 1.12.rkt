#lang racket

(define (inc x) (+ x 1))
(define (dec x) (- x 1))

(define (range n)
  (define (range-iter l i)
    (if (< i 0)
        l
        (range-iter (cons i l) (dec i))))
  (range-iter (list) (dec n)))

; (define (row n) (ceiling (sqrt (* 2 n))))
; (define (show x) (list x (row x)))
; (display (map show (range 10)))

; (define (pascal n)
;   (define (inner i row row-counter)
;     (let
;         (new-row (if (= row-counter row)
;                      (inc row)
;                      row))
;       ()))


(define (row x) (inexact->exact (floor (/ (+ (sqrt (* 8 x)) 1) 2))))

(define (edge? idx)
  (not (= (row idx)
          (row (dec idx))
          (row (inc idx)))))

(define (pascal x)
  (if (<= x 3)
      1
      (let ((rown (row x)))
        (if (edge? x)
            1
            (+ (pascal (- x rown))
               (pascal (inc (- x rown))))))))

(define l (map inc (range 30)))
(display (map pascal l))