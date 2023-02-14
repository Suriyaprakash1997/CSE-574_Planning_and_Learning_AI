;; Defining a domain, where all the properties and actions are described for that world
(define (domain Switches)
    ;; Typing - This requirement is used to define the different types of objects present in its world
    (:requirements :typing)
    ;; Defining a one type of object - switch
    (:types switch)
    ;; Predicates are the properties of the switch
    (:predicates 
    ;; Each switch has ON and OFF property and a neighbour switches
        (off ?s - switch)
        (on ?s - switch)
        (neighbours ?s0 ?s1 - switch)
        
    )
    ;;Action describe the way in which the state can change
    (:action swtich_on
    ;; Describing the parameters used for that action
    ;; Switch_On action requires switch and neighbour switch 
        :parameters (?s ?n - switch)
        :precondition (and
    ;; To switch ON, the switch should be in OFF state
                (off ?s)
    ;; To switch ON, the neighbour should be in ON state
                (on ?n)
    ;; To switch ON, switch should have neighbour which is ON
                (neighbours ?s ?n)
            )
        :effect (and
    ;; After action the switch should be ON
                (on ?s)
    ;; The switch should not be OFF
                (not (off ?s))
            )
    )
)