if state == "idle" {
    if selected {
        bob_timer += 0.1;
        y = base_y + sin(bob_timer) * 3;
    }
}

if state == "zooming" {
    scale = lerp(scale, 6, 0.12);
    x = lerp(x, base_x, 0.1);
    y = lerp(y, base_y, 0.1);
    if abs(scale - 6) < 0.2 {
        state = "open";
        scale = 6;
    }
}

if state == "open" && keyboard_check_pressed(vk_space) {
    // fade out letter and show paper
    state = "done";
    with (instance_create_layer(0, 0, "Instances_1", paper_obj)) {
        show();
    }
}