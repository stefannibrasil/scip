;;;; Exercise 1.1 - What is the result printed by the interpreter in response to each expression?
;;;  Assume that the sequence is to be evaluated in the order in which it is presented.

10
;; 10

(+ 5 3 4)
;; 12

(- 9 1)
;; 8

(/ 6 2)
;; 3

(+ (* 2 4) (- 4 6))
;; 6

(define a 3)
a
;; 3

(define b (+ a 1))
b
;; 4

(+ a b (* a b))

  ;; (+ 3 4 (* 3 4))
  ;; (+ 7 12)
;; 19

(= a b)
;; f

(if (and (< b a) (> b (* a b)))
b
a)

  ;; (if (and (< 4 3) (> 4 (* 3 4)))
  ;; 4
  ;; 3)

  ;; (if (and f f) 4 3)
  ;; (if f 4 3)
;; 4

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))

    ;; (cond ((= a 4) 6) # f
    ;; ((= b 4) (+ 6 7 a)) # t
    ;; (else 25))
;; 16

(+ 2 (if (> b a) b a))
;; 6

(* (cond ((> a b) a)
          ((< a b) b)
          (else -1))
          (+ a 1))
;; 16


;;; Exercise 1.2 - Translate the following expression into prefix form 

; (- 3 (+ 6 1/3))
; -3.33333

; (- 2 (- 3 (+ 6 1/3)))
; 5.333333

; (+ 5 4 (- 2 (- 3 (+ 6 1/3))))
; 14.33333

;(* 3 (* (- 6 2)(- 2 7)))
; -60

(/ (+ 5 4 (- 2 (- 3 (+ 6 1/3)))) (* 3 (* (- 6 2)(- 2 7))))

;;; Exercise 1.3 -  Define a procedure that takes three numbers as arguments
;;; and returns the sum of the squares of the two larger numbers. 

(define (square x) (* x x))

(define (sum-of-squares x y)
(+ (square x)(square y))
)

(define (larger-number x y)
(if (> x y) x y)
)

(define (larger-number-from-three x y z)
(if (> x y) (if (> x z) x z) (if (> y z) y z)
)
)

(define (second-larger-number x y z)
(cond
((= (larger-number-from-three x y z) x) (larger-number y z))
((= (larger-number-from-three x y z) y) (larger-number x z))
(larger-number x y)
)
)

(define (sum-of-the-square-of-the-two-larger-numbers x y z)
(sum-of-squares (larger-number-from-three x y z)(second-larger-number x y z)))

; (sum-of-the-square-of-the-two-larger-numbers 1 5 9)
; 106

; (sum-of-the-square-of-the-two-larger-numbers 2 5 -1)
; 29

; (sum-of-the-square-of-the-two-larger-numbers 2 3 1)
; 13
; (sum-of-the-square-of-the-two-larger-numbers 10 1 9)
; 181

;(sum-of-the-square-of-the-two-larger-numbers 10 12 9)

;;; Exercise 1.4 - Observe that our model of evaluation allows for combinations whose
;;; operators are compound expressions.
;;; Use this observation to describe the behavior of the following procedure: 

(define (a-plus-abs-b a b)
((if (> b 0) + -) a b))

; Breaking it down into the applicative-order evaluation,
; calling (a-plus-abs-b 5 -3), gives us:

; ((if(-3 > 0) + -) 5 -3))
; (- 5 -3)
; 8

; or (a-plus-abs-b 5 3)

; ((if(3 > 0) + -) 5 3))
; (+ 5 3)
; 8


;;; Exercise 1.5.

;;; In applicative order evaluation, the operands are evaluated first
;;; (evaluates the aguments and then apply). Because of that, it will evaluate (p) first, but 
;;; when evaluating (p), the interpreter would get into a recursive call.


;;; But if the interpreter instead follows the normal-order evaluation, it would return 0 because
;;; (= 0 0) evaluates to #t, so, the consequent 0
;;; is returned and the alternative (p) is never evaluated and the interpreter never
;;; gets stuck in the recursion.