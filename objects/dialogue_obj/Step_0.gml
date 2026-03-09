if active && keyboard_check_pressed(vk_space) {
    current_line++;
    if current_line >= array_length(lines) {
        active = false;
        current_line = 0;
    }
}