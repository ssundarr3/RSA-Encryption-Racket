#lang racket/base

(require "definitions.rkt")

;; (main) to start...

(define (main)
   (disp)
    (define new-choice (read-line))
   (options new-choice))

;; (options c) accepts a choice 'c' and checks if that choice is equivalent to an action.
;; If it is, it performs that actions, producing an error message otherwise.
;; ooptions: Str -> Any 
(define (options c)
  (cond[(string=? c "exit") (exit)]
       [(string=? c "create private public")
        (printf "The Private key is:\n")
        (display private-key)
        (printf "\nThe Public key is:\n")
        (display public-key)
        (main)]
       [(string=? c "encrypt create new")
        (printf "\nEnter the string of text you would like to encrypt:\n")
        (define text (read-line))
        (printf "The Encrypted list of numbers are:\n")
        (display (encrypt text))
        (printf "\nThe Private key is:\n")
        (display private-key)
        (printf "\nThe Public key is:\n")
        (display public-key)
        (main)]
       [(string=? c "encrypt")
        (printf "\nEnter the string of text you would like to encrypt:\n")
        (define text (read-line))
        (printf "\nEnter the public key with which you would like to encrypt:\n")
        (define pkey (read))
        (printf "\nThe Encrypted list of numbers are:\n")
        (display (encrypt text pkey))
        (main)]
       [(string=? c "decrypt")
        (printf "\nEnter the list of Encrypted numbers:\n")
        (define encr-num (read))
        (printf "\nEnter the Private key:\n")
        (define pkey (read))
        (display (decrypt encr-num pkey))
        (main)]
       [else (printf "\nThat is not in the options...\nPlease enter again\n")
             (main)]))


  
  (define (disp)
    (display "\nEnter \"create private public\" to show the new keys and display them
Enter \"encrypt\" to encrypt (first provide message, then the public key)
Enter \"decrypt\" to decrypt (first provide encrypted message, then the private key)
Enter \"encrypt create new\" to encrypt and display private and public keys
Enter \"exit\" to quit at any time!\n"))
(main)
  
  
  #|Things to improve
Documentation
Level of Encryption(i.e. min-range and max-range in defenitions.rkt)
Style Guide...
(read) for cleaner input
Web based, input and output
time?
|#
