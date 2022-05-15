/// @desc DrawSetText(colour,font,halign,valign)
///@arg colour
///@arg font
///@arg halign
///@arg valign 
function DrawSetText(argument0, argument1, argument2, argument3) {

	draw_set_colour(argument0);
	draw_set_font(argument1);
	draw_set_halign(argument2);
	draw_set_valign(argument3);
}



// https://www.gmlscripts.com/script/collision_line_first
/// @desc collision_line_first(x1,y1,x2,y2,object,prec,notme)
///@arg x1
///@arg y1
///@arg x2
///@arg y2
///@arg object
///@arg prec
///@arg notme
function collision_line_first(argument0,argument1,argument2,argument3,argument4,argument5,argument6) 
{
    var ox,oy,dx,dy,object,prec,notme,sx,sy,inst,i;
    ox = argument0;
    oy = argument1;
    dx = argument2;
    dy = argument3;
    object = argument4;
    prec = argument5;
    notme = argument6;
    sx = dx - ox;
    sy = dy - oy;
    inst = collision_line(ox,oy,dx,dy,object,prec,notme);
    if (inst != noone) {
        while ((abs(sx) >= 1) || (abs(sy) >= 1)) {
            sx /= 2;
            sy /= 2;
            i = collision_line(ox,oy,dx,dy,object,prec,notme);
            if (i) {
                dx -= sx;
                dy -= sy;
                inst = i;
            }else{
                dx += sx;
                dy += sy;
            }
        }
    }
    return inst;
}

function instance_nearest_notme(argument0,argument1,argument3) /// instance_nearest_notme(x,y,obj)
///@arg x
///@arg y
///@arg obj
//  Returns the nearest instance to a given point,
//  disregarding the calling instance.
	

//      x,y         position, real
//      obj         object instance to find, real
//
//  GMLscripts.com/license
{
    instance_deactivate_object(self);
    var n = instance_nearest(argument0, argument1, argument2);
    instance_activate_object(self);
    return n;
}