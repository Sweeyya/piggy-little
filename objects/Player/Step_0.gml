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
if xspd > 0
{
    face = RIGHT;
}
else if xspd < 0
{
    face = LEFT;
}
else if yspd > 0
{
    face = DOWN;
}
else if yspd < 0
{
    face = UP;
}
else
{
    // when not moving, return to front-facing
    face = DOWN;
}

sprite_index = sprite[face];

// COLLISIONS
if place_meeting(x + xspd, y, bed_obj) xspd = 0;
if place_meeting(x, y + yspd, bed_obj) yspd = 0;
depth = -y;

// MOVE
x += xspd;
y += yspd;

// ANIMATION + IDLE BOB
if xspd != 0 || yspd != 0
{
    var actual_spd = point_distance(0, 0, xspd, yspd);
	image_speed = actual_spd * 0.5;
    idle_timer = 0;
    idle_bob = 0;
}
else
{
    image_speed = 0;
    image_index = 0;

    // subtle idle bounce
    idle_timer += 0.04;
    idle_bob = sin(idle_timer) * 0.6;
}

var cam = view_camera[0];
var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);

camera_set_view_pos(cam,
    lerp(cam_x, x - 160, 0.1),
    lerp(cam_y, y - 120, 0.1)
);

// tick down iframes
if invincible > 0 invincible--;

// flash red when hit
if invincible > 0 && invincible mod 20 < 10 {
    image_blend = merge_color(c_white, c_red, 0.2);
} else {
    image_blend = c_white;
}

if keyboard_check_pressed(vk_space) take_damage(1);

// double tap dash detection
if (keyboard_check_pressed(vk_right)) {
    if dash_key == vk_right && dash_timer > 0 {
        dashing = true;
    }
    dash_key = vk_right;
    dash_timer = 15;
}
if (keyboard_check_pressed(vk_left)) {
    if dash_key == vk_left && dash_timer > 0 {
        dashing = true;
    }
    dash_key = vk_left;
    dash_timer = 15;
}
if (keyboard_check_pressed(vk_up)) {
    if dash_key == vk_up && dash_timer > 0 {
        dashing = true;
    }
    dash_key = vk_up;
    dash_timer = 15;
}
if (keyboard_check_pressed(vk_down)) {
    if dash_key == vk_down && dash_timer > 0 {
        dashing = true;
    }
    dash_key = vk_down;
    dash_timer = 15;
}

if dash_timer > 0 dash_timer--;
else dash_key = -1;

// check for nearby interactable in the direction Piggy is facing
//var ix = x + (face == RIGHT ? 16 : face == LEFT ? -16 : 0);
//var iy = y + (face == DOWN ? 16 : face == UP ? -16 : 0);

//interactable = instance_place(ix, iy, all);

//if (keyboard_check_pressed(ord("E"))) {
//    if instance_exists(interactable) && variable_instance_exists(interactable, "interactable_obj") {
//        with (interactable) interact();
//    }
//}