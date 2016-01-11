#lang racket

;; A module for finding two distinct primes [description of module]
(provide find-prime) ;; [list of functions]
(require math/number-theory)

;; (find-prime n min max) finds a prime that is in between min and max
;; and is not equal to n.
;; find-prime: Nat Nat Nat -> Nat


;;;;;;;;;; IMPLEMENTATION ;;;;;;;;;;

;; see interface above [no further info required]
(define (find-prime p min max)
  (local[(define rp  (random-prime max))]
    (cond[(and (> rp min) (not (= p rp))) rp]
         [else (find-prime p min max)])))
