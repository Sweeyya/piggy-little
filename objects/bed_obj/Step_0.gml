if in_use {
    image_speed = 0;
    image_index = 1;
    zzz_timer++;
    show_debug_message("timer: " + string(zzz_timer));
    if zzz_timer >= 60 {
        zzz_timer = 0;
        show_debug_message("spawning z");
        instance_create_layer(x + 5, y - 50, "Instances_1", zzz_obj);
    }
}

if in_use && keyboard_check_pressed(vk_escape) {
    image_index = 0;
    in_use = false;
    with (Player) {
        visible = true;
        x = other.x;
        y = other.y + 20;
    }
}