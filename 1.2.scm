(define (factorial x) 
  (if (= x 1)
      1
      (* x (factorial (- x 1)))))



;; Exercise 1.9
;; ============

;; Procedure 1: recursive

;; (+ 4 5)
;; (inc (+ (dec 4) 5))
;; (inc (+ 3 5))
;; (inc (inc (+ 2 5)))
;; (inc (inc (inc (+ 1 5))))
;; (inc (inc (inc (inc (+ 0 5)))))
;;                        ^ ^
;;                        a,b
;; (inc (inc (inc (inc 5))))
;; (inc (inc (inc 6)))
;; (inc (inc 7))
;; (inc 8)
;; 9

;; Procedure 2: iterative

;; (+ 4 5)
;; (+ (dec 4) (inc 5))
;; (+ (dec 3) (inc 6))
;; (+ (dec 2) (inc 7))
;; (+ (dec 1) (inc 8))
;; (+ (dec 0) (inc 9))
;; 9



;; Exercise 1.10
;; =============
;; Ackermann function

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

;; (A 1 10)
;; (A 0 (A 1 9))
;; (A 0 (A 0 (A 1 8)))
;; (A 0 (A 0 (A 0 (A 1 7))))
;; (A 0 (A 0 (A 0 (A 0 (A 1 6)))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 5))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 4)))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 3))))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 2)))))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 1))))))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2)))))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 4))))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 8)))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 16))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 32)))))
;; (A 0 (A 0 (A 0 (A 0 64))))
;; (A 0 (A 0 (A 0 128)))
;; (A 0 (A 0 256))
;; (A 0 512)
;; 1024

;; (A 2 4)
;; (A 1 (A 2 3))
;; (A 1 (A 1 (A 2 2)))
;; (A 1 (A 1 (A 1 (A 2 1))))
;; (A 1 (A 1 (A 1 2)))
;; (A 1 (A 1 (A 0 (A 1 1))))
;; (A 1 (A 1 (A 0 2)))
;; (A 1 (A 1 4))
;; (A 1 (A 0 (A 1 3)))
;; (A 1 (A 0 (A 0 (A 1 2))))
;; (A 1 (A 0 (A 0 (A 0 (A 1 1)))))
;; (A 1 (A 0 (A 0 (A 0 2))))
;; (A 1 (A 0 (A 0 4)))
;; (A 1 (A 0 8))
;; (A 1 16)
;; (A 0 (A 1 15))
;; (A 0 (A 0 (A 1 14)))
;; •••
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 1))))))))))))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2)))))))))))))))
;; •••
;; (A 0 ≈32,750)
;; ≈65,000, 2^16

(define (f n ) (A 0 n))
;; (f 4)
;; (A 0 4)
;; 8
;; f(n) = n * 

(define (g n ) (A 1 n))
;; (g 5)
;; (A 1 5)
;; (A 0 ( A 1 4))
;; (A 0 ( A 0 (A 1 3)))
;; (A 0 ( A 0 (A 0 (A 1 2))))
;; (A 0 ( A 0 (A 0 (A 0 (A 1 1)))))
;; (A 0 ( A 0 (A 0 (A 0 2))))
;; (A 0 ( A 0 (A 0 4)))
;; (A 0 ( A 0 8))
;; (A 0 16)
;; 32
;; g(n) = 2^n

(define (h n ) (A 2 n))
;; (h 3)
;; (A 2 3)
;; (A 1 (A 2 2))
;; (A 1 (A 1 (A 2 1)))
;; (A 1 (A 1 2))
;; (A 1 (A 0 (A 1 1)))
;; (A 1 (A 0 2))
;; (A 1 4) = 2^4   as above ^
;;           16
;;
;; (h 4)
;; (A 2 4)
;; (A 1 (A 2 3))
;; (A 1 (A 1 (A 2 2)))
;; (A 1 (A 1 (A 1 (A 2 1))))
;; (A 1 (A 1 (A 1 2)))
;; (A 1 (A 1 (A 0 (A 1 1))))
;; (A 1 (A 1 (A 0 2)))
;; (A 1 (A 1 4))
;; (A 1 (A 0 (A 1 3)))
;; (A 1 (A 0 (A 0 (A 1 2))))
;; (A 1 (A 0 (A 0 (A 0 (A 1 1)))))
;; (A 1 (A 0 (A 0 (A 0 2))))
;; (A 1 (A 0 (A 0 4)))
;; (A 1 (A 0 8))
;; (A 1 16) = 2^16   as above ^
;;            65_536
;;
;; 2^4   -> 2^2^2 
;; 2^16  -> 2^2^2^2
;; h(n) = 2^2^2.. n times (tetration)



;; Exercise 1.11
;; =============

;; recursive:
(define (f n)
  (if (< n 3)
      n
      (+ (* 1 (f (- n 2))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3)))))))

;; iterative:
(define (f1 n)
  (define (f-iter a b c count)
    (if (< count 3)
        a
        (f-iter (+ a (* 2 b) (* 3 c))
                    a
                    b
                    (- count 1))))
  (if (< n 3)
      n
      (f-iter 2 1 0 n)))

(define (f2 n)
  (define (f-iter i
                  f-i
                  f-i-minus-1
                  f-i-minus-2)
    (if (= i n)
        f-i
        (f-iter (+ i 1)
                (+ f-i
                   (* 2 f-i-minus-1)
                   (* 3 f-i-minus-2))
                f-i
                f-i-minus-1)))
  (if (< n 3)
      n
      (f-iter 2 2 1 0)))

(define (test-iterative-versions)
  (map (lambda (a) 
          (display (f a)) (newline) 
          (display (f2 a)) (newline)
          (newline))
      (iota 10 1)))



;; Exercise 1.12
;; =============
;; pascal's triangle

(define (is-edge? n)
  (define (is-edge?-iter x jump)
    (let ((new (- x jump)))
      (cond ((< new 0) jump)
            ((= new 0) "r")
            ((= new 1) "l")
            (else (is-edge?-iter new (+ jump 1))))))
  (is-edge?-iter n 1))

(define (test-is-edge? n)
  (map (lambda (b) 
         (let ((res (is-edge? b)))
           (display res) (display " ")
           (if (string? res)
               (if (string=? res "r") 
                   (newline)
                   #f))
               #f))
       (iota n 1))
  (newline))
; (test-is-edge? 80)

(define (pascal n)
  (let ((res (is-edge? n)))
    (if (string? res)
        1
        (+ (pascal (- n res))
           (pascal (- n (- res 1)))))))

(define (test-pascal n)
  (map (lambda (i)
         (let ((is-edge (is-edge? i)))
           (display (pascal i)) (display " ")
           (if (string? is-edge)
               (if (string=? is-edge "r")
                   (newline)
                   #f)
               #f)))
       (iota n 1)))
; (test-pascal 100)



