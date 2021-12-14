/// @description draw arrow pointing at portal
with(oCamera) if distance_to_object(oLevelEnd) > 50 && oLevelEnd.boss_summon = true { //this isn't very chique, so only show if boss is summoned.
	var point_portal = point_direction(x,y,oLevelEnd.x,oLevelEnd.y); 
	draw_sprite_ext(sPortal_arrow,oPortalArrow.image_index,oCamera.x,oCamera.y-50,1,1,point_portal,c_white,1);
}
