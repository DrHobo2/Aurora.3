/datum/event/electrical_storm
	var/lightsoutAmount	= 1
	var/lightsoutRange	= 25
	ic_name = "an electrical storm"

/datum/event/electrical_storm/announce()
	command_announcement.Announce("An electrical storm has been detected in your area, please repair potential electronic overloads.", "Electrical Storm Alert", new_sound = 'sound/AI/electronicoverload.ogg')


/datum/event/electrical_storm/start()
	var/list/epicentreList = list()

	for(var/i=1, i <= lightsoutAmount, i++)
		var/list/possibleEpicentres = list()
		for(var/obj/effect/landmark/newEpicentre in landmarks_list)
			if(newEpicentre.name == "lightsout" && !(newEpicentre in epicentreList))
				possibleEpicentres += newEpicentre
		if(possibleEpicentres.len)
			epicentreList += pick(possibleEpicentres)
		else
			break

	if(!epicentreList.len)
		return

	for(var/obj/effect/landmark/epicentre in epicentreList)
		for(var/obj/machinery/power/apc/apc in range(epicentre,lightsoutRange))
			apc.overload_lighting()
