#lang racket

(define (inc x) (+ x 1))
(define (dec x) (- x 1))

(define (range n)
  (define (range-iter l i)
    (if (< i 0)
        l
        (range-iter (cons i l) (dec i))))
  (range-iter (list) (dec n)))

