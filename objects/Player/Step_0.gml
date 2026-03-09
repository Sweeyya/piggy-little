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
if place_meeting(x + xspd, y, obj_solid) xspd = 0;
if place_meeting(x, y + yspd, obj_solid) yspd = 0;

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
    image_blend = merge_color(c_white, c_red, 0.3);
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

//freeze during dialogue
if instance_exists(dialogue_obj) && dialogue_obj.active {
    exit;
}

var ix = x;
var iy = y;
if face == RIGHT ix = x + 16;
else if face == LEFT ix = x - 16;
if face == DOWN iy = y + 16;
else if face == UP iy = y - 16;
interactable = instance_nearest(x, y, snowman_char);
var door_nearest = instance_nearest(x, y, door_obj);


interactable = noone;
var nearest_dist = 100;

var snow = instance_nearest(x, y, snowman_char);
if instance_exists(snow) {
    var d = point_distance(x, y, snow.x, snow.y);
    if d < nearest_dist {
        nearest_dist = d;
        interactable = snow;
    }
}

var nearest_door = instance_nearest(x, y, door_obj);
if instance_exists(nearest_door) {
    var d = point_distance(x, y, nearest_door.x, nearest_door.y);
    if d < nearest_dist {
        nearest_dist = d;
        interactable = nearest_door;
    }
}

if (keyboard_check_pressed(ord("E"))) {
    if instance_exists(interactable) {
        if variable_instance_exists(interactable, "interactable_obj") {
            with (interactable) interact();
        }
    }
}

if (keyboard_check_pressed(ord("E"))) {
    var door_nearest = instance_nearest(x, y, door_obj);
    show_debug_message("door distance: " + string(point_distance(x, y, door_nearest.x, door_nearest.y)));
    show_debug_message("interactable: " + string(interactable));
}

if (keyboard_check_pressed(ord("E"))) {
    show_debug_message("E pressed");
    show_debug_message("interactable: " + string(interactable));
    if instance_exists(interactable) {
        show_debug_message("instance exists");
        show_debug_message("has var: " + string(variable_instance_exists(interactable, "interactable_obj")));
    }
}