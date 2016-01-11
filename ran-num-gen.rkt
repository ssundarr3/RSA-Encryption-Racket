#lang racket


;; A module for finding a random integer in [min, max) [description of module]
(provide random-number) ;; [list of functions]

;; (random-number min max) produces a random number in [min, max]
;; random-number: Int Int -> Int
;; if min = max, it produces min.

;;;;;;;;;; IMPLEMENTATION ;;;;;;;;;;

;; see interface above [no further info required]
(define (random-number min max)
  (floor (+ min (* (- max min) 
                   (/ (random 99999) 
                      99999)))))
