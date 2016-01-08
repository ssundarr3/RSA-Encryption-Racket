#lang racket

(provide random-number)

;; Finds a random integer in [min, max)
;; if min = max, it produces min.
(define (random-number min max)
  (floor (+ min (* (- max min) 
                   (/ (random 99999) 
                      99999)))))

