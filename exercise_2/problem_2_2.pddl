(define (problem Trickery_Switches)
;; Importing the respective domain
(:domain Switches)
    (:objects
    ;; Defining the number of objects present in the world
        s1 s2 s3 s4 s5 - switch
    )
    (:init
    ;; Declaring the initial states of the switches
        (off s1)
        (off s2)
        (on s3)
        (off s4)
        (off s5)
        
    ;; Describing the sequence of the switches which is arranged in row
        (neighbours s1 s2)
        (neighbours s2 s1)
        (neighbours s2 s3)
        (neighbours s3 s2)
        (neighbours s3 s4)
        (neighbours s4 s3)
        (neighbours s4 s5)
        (neighbours s5 s4)
    )
    
    (:goal (and
    ;; Defining the final state of the switches
        (on s1)
        (on s2)
        (on s3)
        (on s4)
        (on s5)
        )
    )
)