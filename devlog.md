March 5 10:00pm
    A bit late but, finished reading and understanding the project description. This is the first devlog entry and my initial commit. I will work on it tomorrow starting hopefully in the morning.
    I hope that I can add another entry tonight before going to sleep with a possible plan on how I can tackle this project by breaking down the assignment into sectioned steps.

March 5 10:15pm
    For how I will build this program, I believe my schedule will look something similar to:
        - mode detection (paste the one given in the assignment) and user prompt
        - conditionals and error catching
        - prefix notation functionality
        - history implementation

Mar 6 11:40am
    In this session I want to build the overall structure of the program as stated in the previous log. I want to implement the first step which entails, the given mode detection code and accepting the user prompt, as well as hopefully moving forward with conditionals and error catching. 

    Finished the session at 12:27pm as I will take a break. I believe that I planned the steps to be too big. In this session I wanted to do so much such as moving forward to the conditionals and error catching but, that will be my task moving forward. In this session I did get to finish the implementation of the mode detection and I did a lot of researching through the documentation and google to find a way to read user prompt and now it works!

Mar 6 12:58pm
    After reviewing the documentation for read, I realized that it reads what they call a "single datum" so I will have problems getting 'quit' out of that to exit the program. Thankfully I found out this cool tip in the project description "read-line" and "string->number". I will now try to implement the conditional that reads quit and exits the program. I want to keep this session short before lunch and get this step done. 

    Ending the session before lunch. I managed to implement the conditional that reads the input and if it is quit it quits and else it goes to the logic part of the program. I encountered a problem with quit where the escape sequence on the input was making it fail but I managed to trim the string and keep the quit input as a token to exit the program. My next step will be the calculator logic.

Mar 6 2:27pm
    I will start implementing my expression evaluator function. While looking at the documentation I found there is an eval function that evaluates lists. Since my input is a string I would have to either convert the string to a list or use an open-output-string port. Here is where I found the implementation for the eval function https://stackoverflow.com/questions/10399315/how-to-eval-strings-in-racket The rest of knowledge from it comes from the documentation

    Yet to use it, I found out I must use racket/base to make it work. I will look into that and report back :D

    I found make-base-namespace which allows to attach racket/base into the environment. It now includes the operators from racket/base :p

    Ending a long session for some fresh air. I have now an evaluator function that works where I must pass the input as (+ 3 3) if I want to do 3 + 3. 

    Now I have to implement the history functionality and add error handling in the next sessions.

Mar 6 5:57pm
    Now I will focus on getting my error handling. I will now check what are possible errors that I might encounter and try to error proof my code using conditionals and error messages.

    List:
        - Empty string
        - Use error handling for wrong eval format or failed evaluation (I will try this after implementing the history function since I think it is kinda hard because of time and I dont know how exception handling works in racket 100%) for now it will crash.

Mar 6 7:25pm
    I will do the history function now. 

    It was a lot. I had to start doing error checking to debug since I could not understand why my history function was not working. It was, just not exactly how I wanted it. Testing the program, I realized that the token for history is split into $1) including the parenthesis, since the value for the history calls are only numeric, they yeld an invalid input error. However if I input it with a space before closing the parenthesis work. Looking back although it might have been the long way, I believe that it would have been smarter to parse the entire list instead of using the evaluator function which requires the specific racket list format. 

    Having said this, although the implementation is not perfect, the notation works, the calculator evaluates mathematical expressions, quit is implemented and the history (sadly) works with a couple hiccups. 

    As a side note, I will now close the session to study for midterms and other projects :D