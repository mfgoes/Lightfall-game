// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/// @desc Handles the player shooting
function handleShooting() {
    // Set weapon position and visibility
    x = oPlayer.x - lengthdir_x(3, oPlayer.facing_direction) - lengthdir_x(weapon_recoil, image_angle);
    y = oPlayer.y + 2;

    // Handle weapon angle
    timer_init("change_angle");
    if (oPlayer.key_primary || oPlayer.key_secondary || oPlayer.key_primary_released) {
        var mouse_angle = round(point_direction(x, y, mouse_x, mouse_y));
        if (mouse_angle < 90 || mouse_angle > 270) {
            image_angle = aim_360 ? mouse_angle : 0;
        } else {
            image_angle = aim_360 ? mouse_angle : 180;
        }
        timer_set("change_angle", room_speed * 0.5);
    } else if (timer_get("change_angle") <= 0) {
        image_angle = lerp(image_angle, oPlayer.facing_direction, 0.3);
    }

    // Set image angle for player if using mouse
    if (mouse_check_button(mb_left) || mouse_check_button(mb_right)) {
        oPlayer.facing_direction = image_angle;
    }
}


function ShootingAnimation() {
    timer_init("resetShot");

    if ((mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right)) && !isShooting) {
        isShooting = true;
        image_index = 1;
        image_speed = 1;
        timer_set("resetShot", 10);
    }

    if (isShooting && !animationEnd) {
        if (mouse_check_button(mb_left)) {
            timer_set("resetShot", 10);
            image_speed = 0;
            image_index = 1;
        } else if (mouse_check_button_released(mb_left) || image_index >= 2) {
            image_index = 2;
            image_speed = 0;
            animationEnd = true;
        }
    } else if (animationEnd && timer_end("resetShot")) {
        image_index = 0;
        image_speed = 0;
        isShooting = false;
        animationEnd = false;
    }
}
