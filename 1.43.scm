#lang racket

(define (repeated f n)
  (define (repeated-iter f-inner n)
    (if (= n 0)
        f-inner
        (repeated-iter
         (lambda (x) (f (f-inner x)))
         (- n 1))))
  (repeated-iter f (- n 1)))

(define (inc x) (+ 1 x))
(define (square x) (* x x))

(let ((inc5 (repeated inc 5))
      (8th (repeated square 3)))
  (display (inc5 10))
  (newline)
  (display (8th 2)))