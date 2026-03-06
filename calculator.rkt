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
        (display "Enter a number (or 'quit'): ")) 

    ;read input
    (define input (string-trim (read-line)))

    ;if input is 'quit' exit the program
    (cond
        [(string=? input "quit") (exit)]
        ;else evaluate expression
        [else
            (displayln "Test if quit works")
            (main)]
    )
)

(main)