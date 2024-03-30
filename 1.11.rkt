#lang sicp

(define (range n)
  (define (range-iter l i)
    (if (< i 0)
        l
        (range-iter (cons i l) (dec i))))
  (range-iter (list) (dec n)))

(define (f-rec n)
  (if (< n 3)
      n
      (+ (f-rec (- n 1))
         (* 2 (f-rec (- n 2)))
         (* 3 (f-rec (- n 3))))))

(define (f-iter n)
  (define (inner a b c n)
    (if (= n 0)
        a
        (inner (+ a (* 2 b) (* 3 c)) a b (- n 1))))
  (if (< n 3)
      n
      (inner 2 1 0 (- n 2))))

(display (map (lambda (n) (f-rec n)) (range 10))) (display "\n")
(display (map (lambda (n) (f-iter n)) (range 10)))

