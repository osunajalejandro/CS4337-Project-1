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

(define (getHistory i history)
    (cond 
        [(< i 1) 'error]
        [(> i (length history)) 'error]
        [else (list-ref history (- (length history) i))])
)

(define (replaceHistory input history)
    (define tokens (string-split input))
        (define newtokens
            (map (lambda (x)
                (cond
                    [(and (> (string-length x) 1) (char=? (string-ref x 0) #\$))
                        (cond
                            [(not (number? (string->number (substring x 1)))) 'error]
                            [else
                                (define value (getHistory (string->number (substring x 1)) history))
                                (cond
                                    [(equal? value 'error) 'error]
                                    [else (number->string value)]
                                )
                            ]
                        )
                        ]
                    [else x]
                )
            ) tokens)
        ) (cond
            [(member 'error newtokens) 'error]
            [else (string-join newtokens " ")]
        ))

(define (main history)
    ;prompt the user if batch mode is true
    (when prompt?
        (display "Enter an expression (or 'quit'): ")) 

    ;read input
    (define input (string-trim (read-line)))

    (define replaceHistoryCall (replaceHistory input history))
    ;if input is 'quit' exit the program
    (cond
        [(string=? input "quit") (exit)]
        ;Error checking
        [(string=? input "")
            (displayln "Error: Empty Expression")
            (main history)]
        [(equal? replaceHistoryCall 'error)
            (displayln "Error: Invalid Expression")
            (main history)
        ]
        ;else evaluate expression
        [else
            (define result (calcLogic (read (open-input-string replaceHistoryCall))))
            (define id (+ 1 (length history)))
            (displayln (string-append (number->string id) ": " (number->string result)))

            (main (cons result history))
        ]
    )
)

(main '())