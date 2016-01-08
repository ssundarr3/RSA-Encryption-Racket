#lang racket
#|Things to improve
Documentation
Level of Encryption(i.e. min-range and max-range in defenitions.rkt)
Style Guide...
(read) for cleaner input
Web based input and output
time
|#

(require "definitions.rkt")


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

