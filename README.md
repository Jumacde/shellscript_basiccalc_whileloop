# shellscript basiccalc whileloop
training basic calclator by while loop 

- target this prokjects
    check basic while-loop by shellscript.

- activity diagram is in the directory " main-script-flow_activity".
    - main.puml

- structure this projects
    1. "main.sh": 
            - load and execute all functions from other scripts.
    2. ".env":  
            - save log directories for test- and prod version.
    3. ".gitignore":
            - .env is saved here and hide directorys path on the gitlab and github.    
    4. "log_manager.sh": 
            - get directorys path and connect this and run command.
    5. "term_controller.sh":
            - controll input number of term(1-3).
            - if user input 0 exit scripts.
    6. "digit_controller.sh": 
            - control the input digit.
            - digits are placed in each term.
    7. "arith.sh": 
            - set functions for 4 basic calculate(add, sub, mul, div) and they are include by a finction.
            - user can choose a arithmetic operation using by input a number(1: add, 2: sub, 3: mul, 4:div, 0:end scripts).
            - if you user choosen't 1,2,3,4 or 0 then they are asked again.
