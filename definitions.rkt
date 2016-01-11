#lang racket

(require math/number-theory)
(require "ran-num-gen.rkt")
(require "find-two-primes.rkt")

;; A module for encrypting/decrypting a string [description of module]

(provide encrypt decrypt public-key private-key) ;; [list of functions/definitions]

;; (encrypt message [public-key (list e n)]) consumes a string (message) and a
;; public-key (if public-key is not passed when encrypt is called, it takes it to be
;; (list e n)). The function produces a list of encrypted numbers using the RSA
;; encryption algorithm
;; encrypt: Str (list Nat Nat) -> (listof Nat)

;; (decrypt message [private-key (list d n)]) consumes an encrypted list of numbers
;; and a private-key. The function produces the string that was originally encrypted.
;; decrypt: (listof Nat) (list Nat Nat) -> Str

;; public-key is (list e n) where n = pq (p and q are distinct primes) and e is a
;; random number in the set of numbers such that gcd(e, (p-1)(q-1)) = 1, 1<e<(p-1)(q-1)

;; private-key is (list d n) where n = pq (p and q are distinct primes) and d is the
;; modular multiplicative inverse of e.

;;;;;;;;;; IMPLEMENTATION ;;;;;;;;;;

;; Setting the minimum and maximum ranges. Numbers are chosen between these two values.
(define min-range (expt 10 25))
(define max-range (expt 10 30))

;; Defining p and q to be the two distinct primes in [min-range, max-range]
(define p (find-prime -1 min-range max-range))
(define q (find-prime p min-range max-range))
;; n = pq
(define n (* p q))
;; phi = (p-1)(q-1)
(define phi (* (- p 1) (- q 1)))

;; (find-e x) consumes x a namesake-argument (not necessary in full racket) and produces
;; e by taking a random number between 2 and phi and checking against the set conditions.
;; find-e: Any -> Nat
(define (find-e x)
  ;; e is a random number between 2 and phi
  (local[(define e  (random-number 2 phi))]
    (cond[(coprime? e phi) e]
         [else (find-e 0)])))

;; defining e as a constant
(define e (find-e 0))

;; d is the modular multiplicative inverse of e-- using inbuilt function to calculate
(define d (modular-inverse e phi))

;; Finding (remainder Q^w n)
(define (en/decrypt Q w n)
  (cond[(= w 1) (remainder Q n)] 
       [(even? w) (en/decrypt (remainder (* Q Q) n) (/ w 2) n)]
       [else (remainder (* Q (en/decrypt (remainder (* Q Q) n) (floor (/ w 2)) n))
                        n)]))

;; see interface above [no further info required]
(define public-key (list e n))

;; see interface above [no further info required]
(define private-key (list d n))

;; see interface above [no further info required]
(define (encrypt message [public-key (list e n)])
  (define public-e (first public-key))
  (define n1 (second public-key))
  (local[(define (main-func message)
           (cond[(empty? message) empty]
                [else (cons (en/decrypt (char->integer (first message)) public-e n1)
                            (main-func (rest message)))]))]
    (main-func (string->list message))))

;; see interface above [no further info required]
(define (decrypt message [private-key (list d n)])
  (define private-d (first private-key))
  (define n1 (second private-key))
  (local [(define (main-func message)
            (cond[(empty? message) empty]
                 [else (cons (integer->char (en/decrypt (first message) private-d n1))
                             (main-func (rest message)))]))]
    (list->string (main-func message))))
