/obj/mecha/working/hermes
	desc = "The Einstein Engines Hermes mechanized industrial assistance unit is a fast, responsive and cheap mech meant for heavy lifting and field work over longer distances than others dominated by those of its Hephaestus counterparts."
	name = "Hermes"
	icon_state = "hermes"
	initial_icon = "hermes"
	step_in = 5
	step_energy_drain = 0
	max_temperature = 20000
	health = 150
	wreckage = /obj/effect/decal/mecha_wreckage/hermes
	cargo_capacity = 6
	damage_absorption = list("brute"=0.8,"fire"=1,"bullet"=0.9,"laser"=0.9,"energy"=1,"bomb"=1.25)
	internals_req_access = list()


/obj/mecha/working/hermes/Destroy()
	for(var/atom/movable/A in src.cargo)
		A.forceMove(loc)
		var/turf/T = loc
		if(istype(T))
			T.Entered(A)
		step_rand(A)
	cargo.Cut()
	return ..()