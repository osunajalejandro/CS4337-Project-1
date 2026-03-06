#lang racket

;mode implementation
(define prompt?
   (let [(args (current-command-line-arguments))]
     (cond
       [(= (vector-length args) 0) #t]
       [(string=? (vector-ref args 0) "-b") #f]
       [(string=? (vector-ref args 0) "--batch") #f]
       [else #t])))

(define (main)
    ;prompt the user if batch mode is true
    (when prompt?
        (display "Enter a number: ")) 

    (define n (read))
    (displayln (+ n 10))
)

(main)

;read input

;if input is 'quit' exit the program

;else evaluate expression