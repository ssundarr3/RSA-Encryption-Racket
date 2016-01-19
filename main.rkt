#lang racket/base

(require "definitions.rkt")

(display "Enter \"create private public\" to create new keys and display them
Enter \"encrypt\" to encrypt (first provide message, then the public key)
Enter \"decrypt\" to decrypt (first provide encrypted message, then the private key)
Enter \"encrypt create new\" to encrypt and display new public and private keys
Enter \"exit\" to quit at any time!\n")

;; (main c) accepts a choice 'c' and checks if that choice is equivalent to an action.
;; If it is, it performs that actions, producing an error message otherwise.
;; main: Str -> Any 
(define (main c)
  (cond[(string=? c "exit") (exit)]
       [(string=? c "create private public") (values public-key private-key)]
       [(string=? c "encrypt create new") (values (encrypt (read-line)) public-key private-key)]
       [(string=? c "encrypt") (encrypt (read-line) (read))]
       [(string=? c "decrypt") (decrypt (read) (read))]
       [else (display "\nSorry, not in options...")]))


(define choice  (read-line))
(main choice)



#|Things to improve
Documentation
Level of Encryption(i.e. min-range and max-range in defenitions.rkt)
Style Guide...
(read) for cleaner input
Web based input and output
time
|#
