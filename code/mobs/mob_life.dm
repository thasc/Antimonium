/mob
	var/pain = 0
	var/shock = 0
	var/blood = 100

/mob/proc/HandleLifeTick()
	// Update wounds, healing, shock, infection, etc.
	for(var/thing in injured_limbs)
		var/obj/item/limb/limb = thing
		limb.Process()

	// Update some
	HandlePain()
	HandleBleeding()
	UpdateStance()
	health.UpdateIcon()

/mob/proc/HandlePain()
	return

/mob/proc/HandleBleeding()
	if(dead)
		return

	blood = min(100, blood + 3)
	if(blood <= 60)
		Die("blood loss")
	else if(prob(10))
		switch(blood)
			if(90 to 100)
				return
			if(80 to 90)
				Notify("You feel slightly light-headed.")
			if(70 to 80)
				Notify("The world lurches sickeningly as dizziness overtakes you.")
			if(60 to 70)
				Notify("Flickering darkness swims at the edges of vour vision as you struggle to remain conscious.")
