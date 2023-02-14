(define (problem Logistics) (:domain Basic_Logistics)
;; Defining the objects present in the domain world 
(:objects 
    driver_1 driver_2 - Driver
    truck_1 truck_2 - Truck
    package_1 package_2 package_3 package_4 - Package
    wp1 wp2 wp3 wp4 wp5 wp6 wp7 wp8 wp9 wp10 wp11 - Location
)

(:init
    ;; Setting up the initial states of the drivers
    (at driver_1 wp1)
    (at driver_2 wp4)

    ;; Setting up the initial states of the packages
    (at package_1 wp2)
    (at package_2 wp3)
    (at package_3 wp5)
    (at package_4 wp11)

    ;; Setting up the initial states of the trucks
    (at truck_1 wp6)
    (at truck_2 wp9)

    ;;Describing the connections between the locations
    (Connections wp1 wp2)
    (Connections wp2 wp1)
    (Connections wp2 wp3)
    (Connections wp3 wp2)
    (Connections wp3 wp8)
    (Connections wp8 wp3)
    (Connections wp8 wp11)
    (Connections wp11 wp8)
    (Connections wp11 wp10)
    (Connections wp10 wp11)
    (Connections wp10 wp9)
    (Connections wp9 wp10)
    (Connections wp9 wp4)
    (Connections wp4 wp9)
    (Connections wp4 wp1)
    (Connections wp1 wp4)
    (Connections wp1 wp5)
    (Connections wp5 wp1)
    (Connections wp5 wp6)
    (Connections wp6 wp5)
    (Connections wp6 wp2)
    (Connections wp2 wp6)
    (Connections wp6 wp7)
    (Connections wp7 wp6)
)

(:goal (and
    ;;Defining the final states of the drivers and the packages
    (at driver_1 wp1)
    (at driver_2 wp1)
    (at package_1 wp9)
    (at package_3 wp9)
    (at package_2 wp2)
    (at package_4 wp2) 
))

)
