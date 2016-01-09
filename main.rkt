#lang racket/base
#|Things to improve
Documentation
Level of Encryption(i.e. min-range and max-range in defenitions.rkt)
Style Guide...
(read) for cleaner input
Web based input and output
time
|#
(require "definitions.rkt")
#|
;; Encrypting a message with random computer generated private and public keys... 
(encrypt "HEllo")

;; encrypting a message by passing in 'e' and 'n'. it produces the same output everytime...
(encrypt "Hello" 4912549 393070103)

;; decrypting a message 
(decrypt '(86285626 276165677 215848601 215848601 65811084 232907824) 266106749 464101487)

;; public key is (list e n)
;; private key is (list d n)

public-key

private-key
|#
(display "Enter \"create private public\" to create new keys and display them
Enter \"encrypt\" to encrypt (first provide message, then the public key)
Enter \"decrypt\" to decrypt (first provide encrypted message, then the private key)
Enter \"encrypt create new\" to encrypt and display new public and private keys
Enter \"exit\" to quit at any time!\n")
(define (main c)
  (cond[(string=? c "exit") (exit)]
       [(string=? c "create private public") (values public-key private-key)]
       [(string=? c "encrypt create new") (values (encrypt c) public-key private-key)]
       [(string=? c "encrypt") (encrypt (read-line) (read))]
       [(string=? c "decrypt") (decrypt (read) (read))]
       [else (display "\nSorry, not in options...")])) 
(define choice  (read-line))
(main choice)
