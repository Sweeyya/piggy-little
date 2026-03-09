if state == "showing" {
    scale = lerp(scale, 4, 0.12);
    if abs(scale - 4) < 0.1 {
        state = "open";
        scale = 6;
    }
}

if state == "open" && keyboard_check_pressed(vk_space) {
    state = "hidden";
    scale = 0;
}