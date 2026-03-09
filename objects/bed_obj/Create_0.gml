depth = -y;
in_use = false;
image_speed = 0;
image_index = 0;
interactable_obj = true;
zzz_timer = 0;

interact = function() {
    with (Player) {
        visible = false;
        x = other.x;
        y = other.y;
    }
    image_index = 1;
    in_use = true;
}