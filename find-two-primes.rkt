#lang racket

(provide find-prime)
(require math/number-theory)


(define (find-prime p min max)
  (local[(define rp  (random-prime max))]
    (cond[(and (> rp min) (not (= p rp))) rp]
         [else (find-prime p min max)])))

