(define (problem Trickery_Switches_Bonus)
(:domain Switches_Bonus)
;;Defining the number of objects present in the world
    (:objects
        s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - switch
    )
    (:init
    ;;Declaring the initial state of the switches
        
        (on s1)
        (off s2)
        (on s3)
        (off s4)
        (off s5)
        (on s6)
        (off s7)
        (off s8)
        (on s9)
        (off s10)
            
        (neighbours s1 s2)
        (neighbours s2 s3)
        (neighbours s3 s4)
        (neighbours s4 s5)
        (neighbours s5 s6)
        (neighbours s6 s7)
        (neighbours s7 s8)
        (neighbours s8 s9)
        (neighbours s9 s10)
        (neighbours s10 s9)
        
    )
    
    (:goal (and
    ;; Defining the final state of the switches
        (on s1)
        (on s2)
        (on s3)
        (on s4)
        (on s5)
        (on s6)
        (on s7)
        (on s8)
        (on s9)
        (on s10)
        )
    )
)