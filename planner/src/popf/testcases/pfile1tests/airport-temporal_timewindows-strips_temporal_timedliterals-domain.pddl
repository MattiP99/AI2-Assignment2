;;
;; PDDL file for the AIPS2000 Planning Competition
;; based on the data generated by the airport simulator Astras.
;;

;; Author: Sebastian Trueg thisshouldbethecurrentdateandtime :(
;; Created with PreInstancerDomainExporter 0.6 by Sebastian Trueg <trueg@informatik.uni-freiburg.de>
;;


(define (domain airport_fixed_structure)

(:requirements :fluents :timed-initial-literals :durative-actions :typing)

(:types airplane segment direction airplanetype)

(:constants
                north
                south - direction

                light
                medium
                heavy - airplanetype

                seg_pp_0_60
                seg_ppdoor_0_40
                seg_tww1_0_200
                seg_twe1_0_200
                seg_tww2_0_50
                seg_tww3_0_50
                seg_tww4_0_50
                seg_rww_0_50
                seg_rwtw1_0_10
                seg_rw_0_400
                seg_rwe_0_50
                seg_twe4_0_50
                seg_rwte1_0_10
                seg_twe3_0_50
                seg_twe2_0_50
                seg_rwte2_0_10
                seg_rwtw2_0_10 - segment

                airplane_CFBEG - airplane
                dummy_landing_airplane - airplane
)

(:predicates
                ;; airport information
                (has-type ?a - airplane ?t - airplanetype)
                ;; plane a has type t
                (at-segment ?a - airplane ?s - segment)
                ;; planes are at segments, ie at their end in driving direction
                (facing ?a - airplane ?d - direction)
                ;; planes face into their driving direction

                ;; how the planes affect the airport
                (occupied ?s - segment)
                ;; a plane is in here
                (not_occupied ?s - segment)
                (blocked ?s - segment ?a - airplane)
                ;; segment s is blocked if it is endangered by plane p
                (not_blocked ?s - segment ?a - airplane)

                ;; an airplane may lineup on segment s when facing d
                (is-start-runway ?s - segment ?d - direction)

                ;; airplane a is starting from runway s
                (airborne ?a - airplane ?s - segment)

                (is-moving ?a - airplane)
                (is-pushing ?a - airplane)
                (is-parked ?a - airplane ?s - segment)

)

(:functions
                ;; the length of a segment
                (length ?s - segment)

                ;; the number of engines of an airplane
                (engines ?a - airplane)
)

(:durative-action move_seg_pp_0_60_seg_ppdoor_0_40_north_north_medium

 :parameters    (?a - airplane)

 :duration
             ;; length of the segment divided through the speed of an airplane (fixed 30 m/s)
             (= ?duration 2)

 :condition  (and
                 (over all (has-type ?a medium))
                 (over all (is-moving ?a))
                 (at start (facing ?a north))
                 (at start (at-segment ?a seg_pp_0_60))
                 (at start (not_occupied seg_ppdoor_0_40))
                 (at start (not_blocked seg_ppdoor_0_40 airplane_CFBEG))

              )

 :effect        (and
                 (at end (not (occupied seg_pp_0_60)))
                 (at end (not_occupied seg_pp_0_60))
                 (at end (not (at-segment ?a seg_pp_0_60)))

                 (at start (occupied seg_ppdoor_0_40))
                 (at start (not (not_occupied seg_ppdoor_0_40)))
                 (at start (blocked seg_ppdoor_0_40 ?a))
                 (at start (not (not_blocked seg_ppdoor_0_40 ?a)))
                 (at end (at-segment ?a seg_ppdoor_0_40))


                )
)

(:durative-action move_seg_ppdoor_0_40_seg_tww1_0_200_north_south_medium

 :parameters    (?a - airplane)

 :duration
             ;; length of the segment divided through the speed of an airplane (fixed 30 m/s)
             (= ?duration 1)

 :condition  (and
                 (over all (has-type ?a medium))
                 (over all (is-moving ?a))
                 (at start (facing ?a north))
                 (at start (at-segment ?a seg_ppdoor_0_40))
                 (at start (not_occupied seg_tww1_0_200))
                 (at start (not_blocked seg_tww1_0_200 airplane_CFBEG))

                 (over all (not_occupied seg_twe1_0_200))
              )

 :effect        (and
                 (at end (not (occupied seg_ppdoor_0_40)))
                 (at end (not_occupied seg_ppdoor_0_40))
                 (at end (not (at-segment ?a seg_ppdoor_0_40)))

                 (at start (occupied seg_tww1_0_200))
                 (at start (not (not_occupied seg_tww1_0_200)))
                 (at start (blocked seg_tww1_0_200 ?a))
                 (at start (not (not_blocked seg_tww1_0_200 ?a)))
                 (at end (at-segment ?a seg_tww1_0_200))
                 (at end (not (facing ?a north)))
                 (at end (facing ?a south))

                 (at end (not (blocked seg_pp_0_60 ?a)))
                 (at end (not_blocked seg_pp_0_60 ?a))

                 (at end (blocked seg_twe1_0_200 ?a))
                 (at end (not (not_blocked seg_twe1_0_200 ?a)))
                )
)

(:durative-action move_seg_tww1_0_200_seg_twe1_0_200_north_south_medium

 :parameters    (?a - airplane)

 :duration
             ;; length of the segment divided through the speed of an airplane (fixed 30 m/s)
             (= ?duration 6)

 :condition  (and
                 (over all (has-type ?a medium))
                 (over all (is-moving ?a))
                 (at start (facing ?a north))
                 (at start (at-segment ?a seg_tww1_0_200))
                 (at start (not_occupied seg_twe1_0_200))
                 (at start (not_blocked seg_twe1_0_200 airplane_CFBEG))

                 (over all (not_occupied seg_ppdoor_0_40))
              )

 :effect        (and
                 (at end (not (occupied seg_tww1_0_200)))
                 (at end (not_occupied seg_tww1_0_200))
                 (at end (not (at-segment ?a seg_tww1_0_200)))

                 (at start (occupied seg_twe1_0_200))
                 (at start (not (not_occupied seg_twe1_0_200)))
                 (at start (blocked seg_twe1_0_200 ?a))
                 (at start (not (not_blocked seg_twe1_0_200 ?a)))
                 (at end (at-segment ?a seg_twe1_0_200))
                 (at end (not (facing ?a north)))
                 (at end (facing ?a south))

                 (at end (not (blocked seg_tww2_0_50 ?a)))
                 (at end (not_blocked seg_tww2_0_50 ?a))

                 (at end (blocked seg_ppdoor_0_40 ?a))
                 (at end (not (not_blocked seg_ppdoor_0_40 ?a)))
                )
)

(:durative-action move_seg_twe1_0_200_seg_twe2_0_50_south_south_medium

 :parameters    (?a - airplane)

 :duration
             ;; length of the segment divided through the speed of an airplane (fixed 30 m/s)
             (= ?duration 6)

 :condition  (and
                 (over all (has-type ?a medium))
                 (over all (is-moving ?a))
                 (at start (facing ?a south))
                 (at start (at-segment ?a seg_twe1_0_200))
                 (at start (not_occupied seg_twe2_0_50))
                 (at start (not_blocked seg_twe2_0_50 airplane_CFBEG))

              )

 :effect        (and
                 (at end (not (occupied seg_twe1_0_200)))
                 (at end (not_occupied seg_twe1_0_200))
                 (at end (not (at-segment ?a seg_twe1_0_200)))

                 (at start (occupied seg_twe2_0_50))
                 (at start (not (not_occupied seg_twe2_0_50)))
                 (at start (blocked seg_twe2_0_50 ?a))
                 (at start (not (not_blocked seg_twe2_0_50 ?a)))
                 (at end (at-segment ?a seg_twe2_0_50))

                 (at end (not (blocked seg_ppdoor_0_40 ?a)))
                 (at end (not_blocked seg_ppdoor_0_40 ?a))
                 (at end (not (blocked seg_tww1_0_200 ?a)))
                 (at end (not_blocked seg_tww1_0_200 ?a))

                )
)

(:durative-action move_seg_twe2_0_50_seg_twe3_0_50_south_south_medium

 :parameters    (?a - airplane)

 :duration
             ;; length of the segment divided through the speed of an airplane (fixed 30 m/s)
             (= ?duration 1)

 :condition  (and
                 (over all (has-type ?a medium))
                 (over all (is-moving ?a))
                 (at start (facing ?a south))
                 (at start (at-segment ?a seg_twe2_0_50))
                 (at start (not_occupied seg_twe3_0_50))
                 (at start (not_blocked seg_twe3_0_50 airplane_CFBEG))

              )

 :effect        (and
                 (at end (not (occupied seg_twe2_0_50)))
                 (at end (not_occupied seg_twe2_0_50))
                 (at end (not (at-segment ?a seg_twe2_0_50)))

                 (at start (occupied seg_twe3_0_50))
                 (at start (not (not_occupied seg_twe3_0_50)))
                 (at start (blocked seg_twe3_0_50 ?a))
                 (at start (not (not_blocked seg_twe3_0_50 ?a)))
                 (at end (at-segment ?a seg_twe3_0_50))

                 (at end (not (blocked seg_twe1_0_200 ?a)))
                 (at end (not_blocked seg_twe1_0_200 ?a))

                )
)

(:durative-action move_seg_twe3_0_50_seg_twe4_0_50_south_south_medium

 :parameters    (?a - airplane)

 :duration
             ;; length of the segment divided through the speed of an airplane (fixed 30 m/s)
             (= ?duration 1)

 :condition  (and
                 (over all (has-type ?a medium))
                 (over all (is-moving ?a))
                 (at start (facing ?a south))
                 (at start (at-segment ?a seg_twe3_0_50))
                 (at start (not_occupied seg_twe4_0_50))
                 (at start (not_blocked seg_twe4_0_50 airplane_CFBEG))

              )

 :effect        (and
                 (at end (not (occupied seg_twe3_0_50)))
                 (at end (not_occupied seg_twe3_0_50))
                 (at end (not (at-segment ?a seg_twe3_0_50)))

                 (at start (occupied seg_twe4_0_50))
                 (at start (not (not_occupied seg_twe4_0_50)))
                 (at start (blocked seg_twe4_0_50 ?a))
                 (at start (not (not_blocked seg_twe4_0_50 ?a)))
                 (at end (at-segment ?a seg_twe4_0_50))

                 (at end (not (blocked seg_twe2_0_50 ?a)))
                 (at end (not_blocked seg_twe2_0_50 ?a))

                )
)

(:durative-action move_seg_twe4_0_50_seg_rwe_0_50_south_south_medium

 :parameters    (?a - airplane)

 :duration
             ;; length of the segment divided through the speed of an airplane (fixed 30 m/s)
             (= ?duration 1)

 :condition  (and
                 (over all (has-type ?a medium))
                 (over all (is-moving ?a))
                 (at start (facing ?a south))
                 (at start (at-segment ?a seg_twe4_0_50))
                 (at start (not_occupied seg_rwe_0_50))
                 (at start (not_blocked seg_rwe_0_50 airplane_CFBEG))

                 (over all (not_occupied seg_rwte1_0_10))
              )

 :effect        (and
                 (at end (not (occupied seg_twe4_0_50)))
                 (at end (not_occupied seg_twe4_0_50))
                 (at end (not (at-segment ?a seg_twe4_0_50)))

                 (at start (occupied seg_rwe_0_50))
                 (at start (not (not_occupied seg_rwe_0_50)))
                 (at start (blocked seg_rwe_0_50 ?a))
                 (at start (not (not_blocked seg_rwe_0_50 ?a)))
                 (at end (at-segment ?a seg_rwe_0_50))

                 (at end (not (blocked seg_twe3_0_50 ?a)))
                 (at end (not_blocked seg_twe3_0_50 ?a))

                 (at end (blocked seg_rwte1_0_10 ?a))
                 (at end (not (not_blocked seg_rwte1_0_10 ?a)))
                )
)

(:durative-action move_seg_rwe_0_50_seg_rw_0_400_south_south_medium

 :parameters    (?a - airplane)

 :duration
             ;; length of the segment divided through the speed of an airplane (fixed 30 m/s)
             (= ?duration 1)

 :condition  (and
                 (over all (has-type ?a medium))
                 (over all (is-moving ?a))
                 (at start (facing ?a south))
                 (at start (at-segment ?a seg_rwe_0_50))
                 (at start (not_occupied seg_rw_0_400))
                 (at start (not_blocked seg_rw_0_400 airplane_CFBEG))

              )

 :effect        (and
                 (at end (not (occupied seg_rwe_0_50)))
                 (at end (not_occupied seg_rwe_0_50))
                 (at end (not (at-segment ?a seg_rwe_0_50)))

                 (at start (occupied seg_rw_0_400))
                 (at start (not (not_occupied seg_rw_0_400)))
                 (at start (blocked seg_rw_0_400 ?a))
                 (at start (not (not_blocked seg_rw_0_400 ?a)))
                 (at end (at-segment ?a seg_rw_0_400))

                 (at end (not (blocked seg_twe4_0_50 ?a)))
                 (at end (not_blocked seg_twe4_0_50 ?a))
                 (at end (not (blocked seg_rwte1_0_10 ?a)))
                 (at end (not_blocked seg_rwte1_0_10 ?a))

                )
)

(:durative-action move_seg_rw_0_400_seg_rww_0_50_south_south_medium

 :parameters    (?a - airplane)

 :duration
             ;; length of the segment divided through the speed of an airplane (fixed 30 m/s)
             (= ?duration 13)

 :condition  (and
                 (over all (has-type ?a medium))
                 (over all (is-moving ?a))
                 (at start (facing ?a south))
                 (at start (at-segment ?a seg_rw_0_400))
                 (at start (not_occupied seg_rww_0_50))
                 (at start (not_blocked seg_rww_0_50 airplane_CFBEG))

                 (over all (not_occupied seg_rwe_0_50))
              )

 :effect        (and
                 (at end (not (occupied seg_rw_0_400)))
                 (at end (not_occupied seg_rw_0_400))
                 (at end (not (at-segment ?a seg_rw_0_400)))

                 (at start (occupied seg_rww_0_50))
                 (at start (not (not_occupied seg_rww_0_50)))
                 (at start (blocked seg_rww_0_50 ?a))
                 (at start (not (not_blocked seg_rww_0_50 ?a)))
                 (at end (at-segment ?a seg_rww_0_50))


                )
)

(:durative-action move_seg_rww_0_50_seg_tww4_0_50_south_north_medium

 :parameters    (?a - airplane)

 :duration
             ;; length of the segment divided through the speed of an airplane (fixed 30 m/s)
             (= ?duration 1)

 :condition  (and
                 (over all (has-type ?a medium))
                 (over all (is-moving ?a))
                 (at start (facing ?a south))
                 (at start (at-segment ?a seg_rww_0_50))
                 (at start (not_occupied seg_tww4_0_50))
                 (at start (not_blocked seg_tww4_0_50 airplane_CFBEG))

                 (over all (not_occupied seg_rwtw1_0_10))
              )

 :effect        (and
                 (at end (not (occupied seg_rww_0_50)))
                 (at end (not_occupied seg_rww_0_50))
                 (at end (not (at-segment ?a seg_rww_0_50)))

                 (at start (occupied seg_tww4_0_50))
                 (at start (not (not_occupied seg_tww4_0_50)))
                 (at start (blocked seg_tww4_0_50 ?a))
                 (at start (not (not_blocked seg_tww4_0_50 ?a)))
                 (at end (at-segment ?a seg_tww4_0_50))
                 (at end (not (facing ?a south)))
                 (at end (facing ?a north))

                 (at end (not (blocked seg_rw_0_400 ?a)))
                 (at end (not_blocked seg_rw_0_400 ?a))
                 (at end (not (blocked seg_rwe_0_50 ?a)))
                 (at end (not_blocked seg_rwe_0_50 ?a))

                 (at end (blocked seg_rwtw1_0_10 ?a))
                 (at end (not (not_blocked seg_rwtw1_0_10 ?a)))
                )
)

(:durative-action move_seg_tww4_0_50_seg_tww3_0_50_north_north_medium

 :parameters    (?a - airplane)

 :duration
             ;; length of the segment divided through the speed of an airplane (fixed 30 m/s)
             (= ?duration 1)

 :condition  (and
                 (over all (has-type ?a medium))
                 (over all (is-moving ?a))
                 (at start (facing ?a north))
                 (at start (at-segment ?a seg_tww4_0_50))
                 (at start (not_occupied seg_tww3_0_50))
                 (at start (not_blocked seg_tww3_0_50 airplane_CFBEG))

              )

 :effect        (and
                 (at end (not (occupied seg_tww4_0_50)))
                 (at end (not_occupied seg_tww4_0_50))
                 (at end (not (at-segment ?a seg_tww4_0_50)))

                 (at start (occupied seg_tww3_0_50))
                 (at start (not (not_occupied seg_tww3_0_50)))
                 (at start (blocked seg_tww3_0_50 ?a))
                 (at start (not (not_blocked seg_tww3_0_50 ?a)))
                 (at end (at-segment ?a seg_tww3_0_50))

                 (at end (not (blocked seg_rww_0_50 ?a)))
                 (at end (not_blocked seg_rww_0_50 ?a))
                 (at end (not (blocked seg_rwtw1_0_10 ?a)))
                 (at end (not_blocked seg_rwtw1_0_10 ?a))

                )
)

(:durative-action move_seg_tww3_0_50_seg_tww2_0_50_north_north_medium

 :parameters    (?a - airplane)

 :duration
             ;; length of the segment divided through the speed of an airplane (fixed 30 m/s)
             (= ?duration 1)

 :condition  (and
                 (over all (has-type ?a medium))
                 (over all (is-moving ?a))
                 (at start (facing ?a north))
                 (at start (at-segment ?a seg_tww3_0_50))
                 (at start (not_occupied seg_tww2_0_50))
                 (at start (not_blocked seg_tww2_0_50 airplane_CFBEG))

              )

 :effect        (and
                 (at end (not (occupied seg_tww3_0_50)))
                 (at end (not_occupied seg_tww3_0_50))
                 (at end (not (at-segment ?a seg_tww3_0_50)))

                 (at start (occupied seg_tww2_0_50))
                 (at start (not (not_occupied seg_tww2_0_50)))
                 (at start (blocked seg_tww2_0_50 ?a))
                 (at start (not (not_blocked seg_tww2_0_50 ?a)))
                 (at end (at-segment ?a seg_tww2_0_50))

                 (at end (not (blocked seg_tww4_0_50 ?a)))
                 (at end (not_blocked seg_tww4_0_50 ?a))

                )
)

(:durative-action move_seg_tww2_0_50_seg_tww1_0_200_north_north_medium

 :parameters    (?a - airplane)

 :duration
             ;; length of the segment divided through the speed of an airplane (fixed 30 m/s)
             (= ?duration 1)

 :condition  (and
                 (over all (has-type ?a medium))
                 (over all (is-moving ?a))
                 (at start (facing ?a north))
                 (at start (at-segment ?a seg_tww2_0_50))
                 (at start (not_occupied seg_tww1_0_200))
                 (at start (not_blocked seg_tww1_0_200 airplane_CFBEG))

              )

 :effect        (and
                 (at end (not (occupied seg_tww2_0_50)))
                 (at end (not_occupied seg_tww2_0_50))
                 (at end (not (at-segment ?a seg_tww2_0_50)))

                 (at start (occupied seg_tww1_0_200))
                 (at start (not (not_occupied seg_tww1_0_200)))
                 (at start (blocked seg_tww1_0_200 ?a))
                 (at start (not (not_blocked seg_tww1_0_200 ?a)))
                 (at end (at-segment ?a seg_tww1_0_200))

                 (at end (not (blocked seg_tww3_0_50 ?a)))
                 (at end (not_blocked seg_tww3_0_50 ?a))

                )
)

(:durative-action move_seg_tww1_0_200_seg_ppdoor_0_40_north_south_medium

 :parameters    (?a - airplane)

 :duration
             ;; length of the segment divided through the speed of an airplane (fixed 30 m/s)
             (= ?duration 6)

 :condition  (and
                 (over all (has-type ?a medium))
                 (over all (is-moving ?a))
                 (at start (facing ?a north))
                 (at start (at-segment ?a seg_tww1_0_200))
                 (at start (not_occupied seg_ppdoor_0_40))
                 (at start (not_blocked seg_ppdoor_0_40 airplane_CFBEG))

                 (over all (not_occupied seg_twe1_0_200))
              )

 :effect        (and
                 (at end (not (occupied seg_tww1_0_200)))
                 (at end (not_occupied seg_tww1_0_200))
                 (at end (not (at-segment ?a seg_tww1_0_200)))

                 (at start (occupied seg_ppdoor_0_40))
                 (at start (not (not_occupied seg_ppdoor_0_40)))
                 (at start (blocked seg_ppdoor_0_40 ?a))
                 (at start (not (not_blocked seg_ppdoor_0_40 ?a)))
                 (at end (at-segment ?a seg_ppdoor_0_40))
                 (at end (not (facing ?a north)))
                 (at end (facing ?a south))

                 (at end (not (blocked seg_tww2_0_50 ?a)))
                 (at end (not_blocked seg_tww2_0_50 ?a))

                 (at end (blocked seg_twe1_0_200 ?a))
                 (at end (not (not_blocked seg_twe1_0_200 ?a)))
                )
)

(:durative-action move_seg_ppdoor_0_40_seg_pp_0_60_south_south_medium

 :parameters    (?a - airplane)

 :duration
             ;; length of the segment divided through the speed of an airplane (fixed 30 m/s)
             (= ?duration 1)

 :condition  (and
                 (over all (has-type ?a medium))
                 (over all (is-moving ?a))
                 (at start (facing ?a south))
                 (at start (at-segment ?a seg_ppdoor_0_40))
                 (at start (not_occupied seg_pp_0_60))
                 (at start (not_blocked seg_pp_0_60 airplane_CFBEG))

              )

 :effect        (and
                 (at end (not (occupied seg_ppdoor_0_40)))
                 (at end (not_occupied seg_ppdoor_0_40))
                 (at end (not (at-segment ?a seg_ppdoor_0_40)))

                 (at start (occupied seg_pp_0_60))
                 (at start (not (not_occupied seg_pp_0_60)))
                 (at start (blocked seg_pp_0_60 ?a))
                 (at start (not (not_blocked seg_pp_0_60 ?a)))
                 (at end (at-segment ?a seg_pp_0_60))

                 (at end (not (blocked seg_tww1_0_200 ?a)))
                 (at end (not_blocked seg_tww1_0_200 ?a))
                 (at end (not (blocked seg_twe1_0_200 ?a)))
                 (at end (not_blocked seg_twe1_0_200 ?a))

                )
)


(:durative-action takeoff_seg_rww_0_50_north

 :parameters (?a - airplane)

 :duration  (= ?duration 30 )

 :condition    (and (at start (at-segment ?a seg_rww_0_50))
                    (at start (facing ?a north))
                    (at start (is-moving ?a))
               )

 :effect (and (at end (not (occupied seg_rww_0_50)))
              (at end (not_occupied seg_rww_0_50))
              (at end (not (blocked seg_rww_0_50 ?a)))
              (at end (not_blocked seg_rww_0_50 ?a))
              (at start (not (at-segment ?a seg_rww_0_50)))
              (at end (airborne ?a seg_rww_0_50))
              (at end (not (is-moving ?a )))
              (at end (not (blocked seg_tww4_0_50 ?a)))
              (at end (not_blocked seg_tww4_0_50 ?a))
              (at end (not (blocked seg_rwtw1_0_10 ?a)))
              (at end (not_blocked seg_rwtw1_0_10 ?a))
         )
)

(:durative-action takeoff_seg_rwe_0_50_south

 :parameters (?a - airplane)

 :duration  (= ?duration 30 )

 :condition    (and (at start (at-segment ?a seg_rwe_0_50))
                    (at start (facing ?a south))
                    (at start (is-moving ?a))
               )

 :effect (and (at end (not (occupied seg_rwe_0_50)))
              (at end (not_occupied seg_rwe_0_50))
              (at end (not (blocked seg_rwe_0_50 ?a)))
              (at end (not_blocked seg_rwe_0_50 ?a))
              (at start (not (at-segment ?a seg_rwe_0_50)))
              (at end (airborne ?a seg_rwe_0_50))
              (at end (not (is-moving ?a )))
              (at end (not (blocked seg_twe4_0_50 ?a)))
              (at end (not_blocked seg_twe4_0_50 ?a))
              (at end (not (blocked seg_rwte1_0_10 ?a)))
              (at end (not_blocked seg_rwte1_0_10 ?a))
         )
)


(:durative-action park_seg_pp_0_60_north
 :parameters (?a - airplane)
 :duration (= ?duration 40)
 :condition (and    (over all (at-segment ?a seg_pp_0_60))
                    (over all (facing ?a north))
                    (at start (is-moving ?a))
            )
 :effect (and (at end (is-parked ?a seg_pp_0_60))
              (at end (not (is-moving ?a)))
         )
)
(:durative-action park_seg_pp_0_60_south
 :parameters (?a - airplane)
 :duration (= ?duration 40)
 :condition (and    (over all (at-segment ?a seg_pp_0_60))
                    (over all (facing ?a south))
                    (at start (is-moving ?a))
            )
 :effect (and (at end (is-parked ?a seg_pp_0_60))
              (at end (not (is-moving ?a)))
              (at end (not (blocked seg_ppdoor_0_40 ?a)))
              (at end (not_blocked seg_ppdoor_0_40 ?a))
         )
)
(:durative-action startup_seg_pp_0_60_north_medium

 :parameters (?a - airplane)

 :duration  (= ?duration (* 60 (engines ?a) ) )

 :condition    (and (at start (is-pushing ?a))
                    (over all (at-segment ?a seg_pp_0_60))
               )

 :effect       (and (at start (not (is-pushing ?a)))
                    (at end (is-moving ?a))
         )
)
(:durative-action startup_seg_pp_0_60_south_medium

 :parameters (?a - airplane)

 :duration  (= ?duration (* 60 (engines ?a) ) )

 :condition    (and (at start (is-pushing ?a))
                    (over all (at-segment ?a seg_pp_0_60))
                    (over all (not_occupied seg_ppdoor_0_40))
               )

 :effect       (and (at start (not (is-pushing ?a)))
                    (at end (is-moving ?a))
                    (at end (blocked seg_ppdoor_0_40 ?a))
                    (at end (not (not_blocked seg_ppdoor_0_40 ?a)))
         )
)
(:durative-action startup_seg_ppdoor_0_40_north_medium

 :parameters (?a - airplane)

 :duration  (= ?duration (* 60 (engines ?a) ) )

 :condition    (and (at start (is-pushing ?a))
                    (over all (at-segment ?a seg_ppdoor_0_40))
                    (over all (not_occupied seg_pp_0_60))
               )

 :effect       (and (at start (not (is-pushing ?a)))
                    (at end (is-moving ?a))
                    (at end (blocked seg_pp_0_60 ?a))
                    (at end (not (not_blocked seg_pp_0_60 ?a)))
         )
)
(:durative-action startup_seg_ppdoor_0_40_south_medium

 :parameters (?a - airplane)

 :duration  (= ?duration (* 60 (engines ?a) ) )

 :condition    (and (at start (is-pushing ?a))
                    (over all (at-segment ?a seg_ppdoor_0_40))
                    (over all (not_occupied seg_tww1_0_200))
                    (over all (not_occupied seg_twe1_0_200))
               )

 :effect       (and (at start (not (is-pushing ?a)))
                    (at end (is-moving ?a))
                    (at end (blocked seg_tww1_0_200 ?a))
                    (at end (not (not_blocked seg_tww1_0_200 ?a)))
                    (at end (blocked seg_twe1_0_200 ?a))
                    (at end (not (not_blocked seg_twe1_0_200 ?a)))
         )
)
(:durative-action startup_seg_tww1_0_200_north_medium

 :parameters (?a - airplane)

 :duration  (= ?duration (* 60 (engines ?a) ) )

 :condition    (and (at start (is-pushing ?a))
                    (over all (at-segment ?a seg_tww1_0_200))
                    (over all (not_occupied seg_tww2_0_50))
               )

 :effect       (and (at start (not (is-pushing ?a)))
                    (at end (is-moving ?a))
                    (at end (blocked seg_tww2_0_50 ?a))
                    (at end (not (not_blocked seg_tww2_0_50 ?a)))
         )
)
(:durative-action startup_seg_tww1_0_200_south_medium

 :parameters (?a - airplane)

 :duration  (= ?duration (* 60 (engines ?a) ) )

 :condition    (and (at start (is-pushing ?a))
                    (over all (at-segment ?a seg_tww1_0_200))
                    (over all (not_occupied seg_ppdoor_0_40))
                    (over all (not_occupied seg_twe1_0_200))
               )

 :effect       (and (at start (not (is-pushing ?a)))
                    (at end (is-moving ?a))
                    (at end (blocked seg_ppdoor_0_40 ?a))
                    (at end (not (not_blocked seg_ppdoor_0_40 ?a)))
                    (at end (blocked seg_twe1_0_200 ?a))
                    (at end (not (not_blocked seg_twe1_0_200 ?a)))
         )
)
(:durative-action startup_seg_twe1_0_200_north_medium

 :parameters (?a - airplane)

 :duration  (= ?duration (* 60 (engines ?a) ) )

 :condition    (and (at start (is-pushing ?a))
                    (over all (at-segment ?a seg_twe1_0_200))
                    (over all (not_occupied seg_twe2_0_50))
               )

 :effect       (and (at start (not (is-pushing ?a)))
                    (at end (is-moving ?a))
                    (at end (blocked seg_twe2_0_50 ?a))
                    (at end (not (not_blocked seg_twe2_0_50 ?a)))
         )
)
(:durative-action startup_seg_twe1_0_200_south_medium

 :parameters (?a - airplane)

 :duration  (= ?duration (* 60 (engines ?a) ) )

 :condition    (and (at start (is-pushing ?a))
                    (over all (at-segment ?a seg_twe1_0_200))
                    (over all (not_occupied seg_ppdoor_0_40))
                    (over all (not_occupied seg_tww1_0_200))
               )

 :effect       (and (at start (not (is-pushing ?a)))
                    (at end (is-moving ?a))
                    (at end (blocked seg_ppdoor_0_40 ?a))
                    (at end (not (not_blocked seg_ppdoor_0_40 ?a)))
                    (at end (blocked seg_tww1_0_200 ?a))
                    (at end (not (not_blocked seg_tww1_0_200 ?a)))
         )
)
(:durative-action startup_seg_tww2_0_50_north_medium

 :parameters (?a - airplane)

 :duration  (= ?duration (* 60 (engines ?a) ) )

 :condition    (and (at start (is-pushing ?a))
                    (over all (at-segment ?a seg_tww2_0_50))
                    (over all (not_occupied seg_tww3_0_50))
               )

 :effect       (and (at start (not (is-pushing ?a)))
                    (at end (is-moving ?a))
                    (at end (blocked seg_tww3_0_50 ?a))
                    (at end (not (not_blocked seg_tww3_0_50 ?a)))
         )
)
(:durative-action startup_seg_tww2_0_50_south_medium

 :parameters (?a - airplane)

 :duration  (= ?duration (* 60 (engines ?a) ) )

 :condition    (and (at start (is-pushing ?a))
                    (over all (at-segment ?a seg_tww2_0_50))
                    (over all (not_occupied seg_tww1_0_200))
               )

 :effect       (and (at start (not (is-pushing ?a)))
                    (at end (is-moving ?a))
                    (at end (blocked seg_tww1_0_200 ?a))
                    (at end (not (not_blocked seg_tww1_0_200 ?a)))
         )
)
(:durative-action startup_seg_tww3_0_50_north_medium

 :parameters (?a - airplane)

 :duration  (= ?duration (* 60 (engines ?a) ) )

 :condition    (and (at start (is-pushing ?a))
                    (over all (at-segment ?a seg_tww3_0_50))
                    (over all (not_occupied seg_tww4_0_50))
               )

 :effect       (and (at start (not (is-pushing ?a)))
                    (at end (is-moving ?a))
                    (at end (blocked seg_tww4_0_50 ?a))
                    (at end (not (not_blocked seg_tww4_0_50 ?a)))
         )
)
(:durative-action startup_seg_tww3_0_50_south_medium

 :parameters (?a - airplane)

 :duration  (= ?duration (* 60 (engines ?a) ) )

 :condition    (and (at start (is-pushing ?a))
                    (over all (at-segment ?a seg_tww3_0_50))
                    (over all (not_occupied seg_tww2_0_50))
               )

 :effect       (and (at start (not (is-pushing ?a)))
                    (at end (is-moving ?a))
                    (at end (blocked seg_tww2_0_50 ?a))
                    (at end (not (not_blocked seg_tww2_0_50 ?a)))
         )
)
(:durative-action startup_seg_tww4_0_50_north_medium

 :parameters (?a - airplane)

 :duration  (= ?duration (* 60 (engines ?a) ) )

 :condition    (and (at start (is-pushing ?a))
                    (over all (at-segment ?a seg_tww4_0_50))
                    (over all (not_occupied seg_rww_0_50))
                    (over all (not_occupied seg_rwtw1_0_10))
               )

 :effect       (and (at start (not (is-pushing ?a)))
                    (at end (is-moving ?a))
                    (at end (blocked seg_rww_0_50 ?a))
                    (at end (not (not_blocked seg_rww_0_50 ?a)))
                    (at end (blocked seg_rwtw1_0_10 ?a))
                    (at end (not (not_blocked seg_rwtw1_0_10 ?a)))
         )
)
(:durative-action startup_seg_tww4_0_50_south_medium

 :parameters (?a - airplane)

 :duration  (= ?duration (* 60 (engines ?a) ) )

 :condition    (and (at start (is-pushing ?a))
                    (over all (at-segment ?a seg_tww4_0_50))
                    (over all (not_occupied seg_tww3_0_50))
               )

 :effect       (and (at start (not (is-pushing ?a)))
                    (at end (is-moving ?a))
                    (at end (blocked seg_tww3_0_50 ?a))
                    (at end (not (not_blocked seg_tww3_0_50 ?a)))
         )
)
(:durative-action startup_seg_twe4_0_50_north_medium

 :parameters (?a - airplane)

 :duration  (= ?duration (* 60 (engines ?a) ) )

 :condition    (and (at start (is-pushing ?a))
                    (over all (at-segment ?a seg_twe4_0_50))
                    (over all (not_occupied seg_rwte1_0_10))
                    (over all (not_occupied seg_rwe_0_50))
               )

 :effect       (and (at start (not (is-pushing ?a)))
                    (at end (is-moving ?a))
                    (at end (blocked seg_rwte1_0_10 ?a))
                    (at end (not (not_blocked seg_rwte1_0_10 ?a)))
                    (at end (blocked seg_rwe_0_50 ?a))
                    (at end (not (not_blocked seg_rwe_0_50 ?a)))
         )
)
(:durative-action startup_seg_twe4_0_50_south_medium

 :parameters (?a - airplane)

 :duration  (= ?duration (* 60 (engines ?a) ) )

 :condition    (and (at start (is-pushing ?a))
                    (over all (at-segment ?a seg_twe4_0_50))
                    (over all (not_occupied seg_twe3_0_50))
               )

 :effect       (and (at start (not (is-pushing ?a)))
                    (at end (is-moving ?a))
                    (at end (blocked seg_twe3_0_50 ?a))
                    (at end (not (not_blocked seg_twe3_0_50 ?a)))
         )
)
(:durative-action startup_seg_twe3_0_50_north_medium

 :parameters (?a - airplane)

 :duration  (= ?duration (* 60 (engines ?a) ) )

 :condition    (and (at start (is-pushing ?a))
                    (over all (at-segment ?a seg_twe3_0_50))
                    (over all (not_occupied seg_twe4_0_50))
               )

 :effect       (and (at start (not (is-pushing ?a)))
                    (at end (is-moving ?a))
                    (at end (blocked seg_twe4_0_50 ?a))
                    (at end (not (not_blocked seg_twe4_0_50 ?a)))
         )
)
(:durative-action startup_seg_twe3_0_50_south_medium

 :parameters (?a - airplane)

 :duration  (= ?duration (* 60 (engines ?a) ) )

 :condition    (and (at start (is-pushing ?a))
                    (over all (at-segment ?a seg_twe3_0_50))
                    (over all (not_occupied seg_twe2_0_50))
               )

 :effect       (and (at start (not (is-pushing ?a)))
                    (at end (is-moving ?a))
                    (at end (blocked seg_twe2_0_50 ?a))
                    (at end (not (not_blocked seg_twe2_0_50 ?a)))
         )
)
(:durative-action startup_seg_twe2_0_50_north_medium

 :parameters (?a - airplane)

 :duration  (= ?duration (* 60 (engines ?a) ) )

 :condition    (and (at start (is-pushing ?a))
                    (over all (at-segment ?a seg_twe2_0_50))
                    (over all (not_occupied seg_twe3_0_50))
               )

 :effect       (and (at start (not (is-pushing ?a)))
                    (at end (is-moving ?a))
                    (at end (blocked seg_twe3_0_50 ?a))
                    (at end (not (not_blocked seg_twe3_0_50 ?a)))
         )
)
(:durative-action startup_seg_twe2_0_50_south_medium

 :parameters (?a - airplane)

 :duration  (= ?duration (* 60 (engines ?a) ) )

 :condition    (and (at start (is-pushing ?a))
                    (over all (at-segment ?a seg_twe2_0_50))
                    (over all (not_occupied seg_twe1_0_200))
               )

 :effect       (and (at start (not (is-pushing ?a)))
                    (at end (is-moving ?a))
                    (at end (blocked seg_twe1_0_200 ?a))
                    (at end (not (not_blocked seg_twe1_0_200 ?a)))
         )
)
)
