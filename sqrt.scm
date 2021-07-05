
(define (sqrt x)
	(sqrtrec 1 x))

(define (avg a b) 
	(/ (+ a b) 2))

(define (sqrtrec guess x )
	(if (< (abs (- (* guess guess) x)) 0.001)
		guess
		(sqrtrec (avg guess (/ x guess))
				 x)))

(display (sqrt 1))
