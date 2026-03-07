#lang racket

;mode implementation
(define prompt?
   (let [(args (current-command-line-arguments))]
     (cond
       [(= (vector-length args) 0) #t]
       [(string=? (vector-ref args 0) "-b") #f]
       [(string=? (vector-ref args 0) "--batch") #f]
       [else #t])))

(define namespace (make-base-namespace))

(define (calcLogic expression)
    (eval expression namespace)
)

(define (main)
    ;prompt the user if batch mode is true
    (when prompt?
        (display "Enter an expression (or 'quit'): ")) 

    ;read input
    (define input (string-trim (read-line)))

    ;if input is 'quit' exit the program
    (cond
        [(string=? input "quit") (exit)]
        ;Error checking
        [(string=? input "")
            (displayln "Error: Empty Expression")]
        ;else evaluate expression
        [else
            (displayln (calcLogic (read (open-input-string input))))
            (main)]
    )
)

(main)