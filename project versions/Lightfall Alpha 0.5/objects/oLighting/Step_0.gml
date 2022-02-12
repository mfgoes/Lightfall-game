/// @description  This is where you want the light source to be 

// damn simple collisions for HTML version


/// find walls to cast shadows  
with(oWall) {

    /*
    but doing some if statments you can 
    find out if the person is above or below the wall and then to the left or the right
    from this you know the two walls the line could be projected onto. 
    
    you just need to work out which of the two walls is the best to project it onto 
    
    I think we can optimize this as well, 
     - do a collision line and dont bother to run this code on walls already behind another wall 
     - do a simple field of view and dont work out walls massively behind the person 
     - dont do walls off the screen
*/
	//if collision_line(x,y,oLighting.x,oLighting.y,obj_wall,0,0)
	
	
	if instance_exists(oPlayer) {
		target = oPlayer;
	} else
		target = id; 
	
	if distance_to_point(target.x,target.y) < 120 {
		ds_stack_push(other.wallthatblock,id)
	}
}
