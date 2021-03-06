/turf/proc/CheckThrownCollision(var/atom/movable/thrown)
	if(density)
		if(!(thrown.flags & FLAG_ETHEREAL) && !(flags & FLAG_ETHEREAL))
			return TRUE
		ThrownHitBy(thrown)
	for(var/thing in (contents - thrown))
		var/atom/movable/obstacle = thing
		if(obstacle.ThrownHitBy(thrown))
			return TRUE
	return FALSE

/atom/proc/ThrownHitBy(var/atom/movable/projectile)
	return FALSE

/obj/structure/ThrownHitBy(var/atom/movable/projectile)
	if(density)
		projectile.ForceMove(get_turf(src))
		PlayLocalSound(src, hit_sound, 100)
		NotifyNearby("\The [src] has been hit by \the [projectile]!")
		return TRUE
	return FALSE

/mob/ThrownHitBy(var/atom/movable/projectile)
	if(density)
		projectile.ForceMove(get_turf(src))
		NotifyNearby("\The [src] has been hit by \the [projectile]!")
		if(istype(projectile, /obj/item))
			var/obj/item/weapon = projectile
			PlayLocalSound(src, weapon.hit_sound, 75)
			ResolvePhysicalAttack(null, weapon.weight, weapon.sharpness, weapon.contact_size, weapon)
		else
			ResolvePhysicalAttack(null, 5, 0, 5, projectile)

		return TRUE
	return FALSE
