;; Defining a domain, where all the properties and actions are described for that world
(define (domain Switches_Bonus)
    ;; Typing - This requirement is used to define the different types of objects present in its world
    (:requirements :typing :negative-preconditions :disjunctive-preconditions)
    ;; Defining a one type of object - switch
    (:types switch)
    ;; Predicates are the properties of the switch
    (:predicates 
    ;; Each switch has ON and OFF property and a neighbour switches
        (off ?s - switch)
        (on ?s - switch)
        (neighbours ?s1 ?s2 - switch)
        
    )
    ;;Action describe the way in which the state can change
    (:action swtich_on
    ;; Describing the parameters used for that action
    ;; Switch_On action requires switch and neighbour switch 
        :parameters (?s ?n - switch)
        :precondition (and
        ;;If Switch and Neighbour both are OFF then make them both ON
                (off ?s)
                (off ?n)
                (neighbours ?s ?n)
                )
        :effect (and
                (on ?s)
                (not (off ?s))
                (on ?n)
                (not (off ?n))
            )
    )

    ;; this action toggles a switch OFF
    (:action switch_off
        :parameters (?s ?n - switch)
        :precondition (and
        ;; If switch is OFF and Neighbour is ON then make the switch ON and Neighbour ON
                    (off ?s)
                    (on ?n)
                    (neighbours ?s ?n)
                    )
        :effect (and
            (off ?n)
            (not (on ?n))
            (on ?s)
            (not (off ?s))
            )
        )
)    
