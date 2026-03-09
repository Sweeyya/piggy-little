// FREEZE 
if instance_exists(dialogue_obj) && dialogue_obj.active exit;
if instance_exists(dresser) && dresser.is_open exit;
if instance_exists(paper_obj) && paper_obj.state != "hidden" exit;
if instance_exists(inventory_obj) && inventory_obj.visible_inv exit;


// INPUT
right_key = keyboard_check(vk_right);
left_key  = keyboard_check(vk_left);
up_key    = keyboard_check(vk_up);
down_key  = keyboard_check(vk_down);

// MOVEMENT INPUT
xinput = right_key - left_key;
yinput = down_key - up_key;

// SPEED
var spd = dashing ? dash_spd : mspd;
xspd = xinput * spd;
yspd = yinput * spd;
if (xinput == 0 && yinput == 0) dashing = false;

// DEFAULT MASK
mask_index = sprite[DOWN];

// FACING
if xspd > 0 face = RIGHT;
else if xspd < 0 face = LEFT;
else if yspd > 0 face = DOWN;
else if yspd < 0 face = UP;
else face = DOWN;

sprite_index = sprite[face];

// COLLISIONS
if place_meeting(x + xspd, y, obj_solid) xspd = 0;
if place_meeting(x, y + yspd, obj_solid) yspd = 0;
if place_meeting(x + xspd, y, bed_obj) xspd = 0;
if place_meeting(x, y + yspd, bed_obj) yspd = 0;
if place_meeting(x + xspd, y, dresser) xspd = 0;
if place_meeting(x, y + yspd, dresser) yspd = 0;

depth = -y;

// MOVE
x += xspd;
y += yspd;

// ANIMATION + IDLE BOB
if xspd != 0 || yspd != 0 {
    var actual_spd = point_distance(0, 0, xspd, yspd);
    image_speed = actual_spd * 0.5;
    idle_timer = 0;
    idle_bob = 0;
} else {
    image_speed = 0;
    image_index = 0;
    idle_timer += 0.04;
    idle_bob = sin(idle_timer) * 0.6;
}

// CAMERA
var cam = view_camera[0];
var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);
camera_set_view_pos(cam,
    lerp(cam_x, x - 144, 0.1),
    lerp(cam_y, y - 108, 0.1)
);

// IFRAMES + FLASH
if invincible > 0 invincible--;
if invincible > 0 && invincible mod 20 < 10 {
    image_blend = merge_color(c_white, c_red, 0.3);
} else {
    image_blend = c_white;
}

// TEMP DAMAGE TEST
if keyboard_check_pressed(vk_space) take_damage(1);

// DOUBLE TAP DASH
if (keyboard_check_pressed(vk_right)) {
    if dash_key == vk_right && dash_timer > 0 dashing = true;
    dash_key = vk_right;
    dash_timer = 15;
}
if (keyboard_check_pressed(vk_left)) {
    if dash_key == vk_left && dash_timer > 0 dashing = true;
    dash_key = vk_left;
    dash_timer = 15;
}
if (keyboard_check_pressed(vk_up)) {
    if dash_key == vk_up && dash_timer > 0 dashing = true;
    dash_key = vk_up;
    dash_timer = 15;
}
if (keyboard_check_pressed(vk_down)) {
    if dash_key == vk_down && dash_timer > 0 dashing = true;
    dash_key = vk_down;
    dash_timer = 15;
}
if dash_timer > 0 dash_timer--;
else dash_key = -1;

// INTERACTION
interactable = noone;
var nearest_dist = 50;
var check_objects = [snowman_char, door_obj, bed_obj, dresser, letter_obj];
for (var i = 0; i < array_length(check_objects); i++) {
    var nearest = instance_nearest(x, y, check_objects[i]);
    if instance_exists(nearest) {
        var d = point_distance(x, y, nearest.x, nearest.y);
        if d < nearest_dist {
            nearest_dist = d;
            interactable = nearest;
        }
    }
}

if (keyboard_check_pressed(ord("E"))) {
    if instance_exists(interactable) {
        if variable_instance_exists(interactable, "interactable_obj") {
            with (interactable) interact();
        }
    }
}