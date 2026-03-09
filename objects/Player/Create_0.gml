xspd = 0;
yspd = 0;

mspd = 1;

sprite[RIGHT] = Piggy_right;
sprite[LEFT] = Piggy_left;
sprite[UP] = Piggy_back;
sprite[DOWN] = Piggy_front;

face = DOWN;

dash_timer = 0;
dash_key = -1;
dashing = false;
dash_spd = 1.5;

idle_bob = 0;
idle_timer = 0;

hp = 30;
hp_max = 30;
invincible = 0;

take_damage = function(amount) {
    if invincible > 0 exit;
    hp -= amount;
    invincible = 10;
    if hp <= 0 {
        hp = 0;
    }
}

interactable = noone;

persistent = true;