(define (domain Basic_Logistics)
    (:requirements :typing)
    ;; Declaring the types of objects used in the world
    (:types
    ;; Location, Package, Truck, Driver are the objects used in the world.
    ;; Package, Truck and Driver has to be tracked to identify its location, Hence they are defined as tracking objects
        Location Track_object - object
        Package Truck Driver - Track_object
    )
    (:predicates
        (Connections ?source ?destination - Location)
        (in ?package - Package ?truck - Truck)
        (Driving_truck ?driver - Driver ?truck - Truck)
        (at ?tb - Track_object ?loc - Location)
    )
    ;; This action loads the package into the truck from the specified location
    (:action Package_Load
        :parameters (?package - Package ?truck - Truck ?loc - Location)
        :precondition (and
                        (at ?package ?loc)
                        (at ?truck ?loc)
                     )
        :effect (and 
                    (in ?package ?truck)
                    (not(at ?package ?loc))
                )
    )
    ;; This action unloads the package from the truck to the specified location
    (:action Package_UnLoad
        :parameters (?package - Package ?truck - Truck ?loc - Location)
        :precondition (and
                        (in ?package ?truck)
                        (at ?truck ?loc)
                     )
        :effect (and 
                    (at ?package ?loc)
                    (not(in ?package ?truck))
                )
    )
    
    ;; This action moves the driver from source to destination
    (:action Driver_Walk
        :parameters (?driver - Driver ?source ?destination - Location)
        :precondition (and 
                        (Connections ?source ?destination)
                        (at ?driver ?source)
                    )
        :effect (and 
                    (at ?driver ?destination)
                    (not(at ?driver ?source)))
    )
    ;; This action makes the driver to board and drive the truck from a specified location
    (:action Driver_Get_Into
        :parameters (?driver - Driver ?truck - Truck ?loc - Location)
        :precondition (and
                        (at ?driver ?loc)
                        (at ?truck ?loc)
                     )
        :effect (and 
                    (not(at ?driver ?loc))
                    (Driving_truck ?driver ?truck)
                )
    )
    ;; This action makes the driver to stop the truck at specified location
    (:action Driver_Get_Out
        :parameters (?driver - Driver ?truck - Truck ?loc - Location)
        :precondition (and
                        (Driving_truck ?driver ?truck)
                        (at ?truck ?loc)
                     )
        :effect (and 
                    (at ?driver ?loc)
                    (not(Driving_truck ?driver ?truck))
                )
    )
    
    ;; This action makes the truck to move from source to destination
    (:action Truck_Tracking
        :parameters (?truck - Truck ?driver - Driver ?source ?destination - Location)
        :precondition (and
                        (Driving_truck ?driver ?truck)
                        (Connections ?source ?destination)
                        (at ?truck ?source)
                     )
        :effect (and 
                    (not(at ?truck ?source))
                    (at ?truck ?destination))
    )
    
    
)