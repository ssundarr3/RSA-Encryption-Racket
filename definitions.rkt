#lang racket

(require math/number-theory)
(require "ran-num-gen.rkt")
(require "find-two-primes.rkt")

(provide encrypt)
(provide decrypt)
(provide public-key)
(provide private-key)

(define min-range (expt 10 3))
(define max-range (expt 10 5))

(define p (find-prime -1 min-range max-range))
(define q (find-prime p min-range max-range))
(define n (* p q))
(define phi (* (- p 1) (- q 1)))

(define (find-e x)
  (local[(define e  (random-number 2 phi))]
    (cond[(coprime? e phi) e]
         [else (find-e 0)])))

(define e (find-e 0))

(define d (modular-inverse e phi))

;; Finding (remainder Q^w n)
(define (en/decrypt Q w n)
  (cond[(= w 1) (remainder Q n)] 
       [(even? w) (en/decrypt (remainder (* Q Q) n) (/ w 2) n)]
       [else (remainder (* Q (en/decrypt (remainder (* Q Q) n) (floor (/ w 2)) n))
                        n)]))

(define public-key (list e n))
(define private-key (list d n))

(define (encrypt message [public-e e] [n1 n])
  (local[(define (main-func message)
           (cond[(empty? message) empty]
                [else (cons (en/decrypt (char->integer (first message)) public-e n1)
                            (main-func (rest message)))]))]
    (main-func (string->list message))))


(define (decrypt message [private-d d] [n1 n])
  (local [(define (main-func message)
            (cond[(empty? message) empty]
                 [else (cons (integer->char (en/decrypt (first message) private-d n1))
                             (main-func (rest message)))]))]
    (list->string (main-func message))))

