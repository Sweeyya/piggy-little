if keyboard_check_pressed(vk_tab) {
    visible_inv = !visible_inv;
}

if !visible_inv exit;

// navigate categories
if keyboard_check_pressed(vk_up) selected_category = max(0, selected_category - 1);
if keyboard_check_pressed(vk_down) selected_category = min(3, selected_category + 1);

// toggle dropdown
if keyboard_check_pressed(ord("E")) {
    categories_open[selected_category] = !categories_open[selected_category];
}

// rotate Piggy
if keyboard_check_pressed(vk_left) {
    if piggy_face == DOWN piggy_face = RIGHT;
    else if piggy_face == RIGHT piggy_face = UP;
    else if piggy_face == UP piggy_face = LEFT;
    else if piggy_face == LEFT piggy_face = DOWN;
}
if keyboard_check_pressed(vk_right) {
    if piggy_face == DOWN piggy_face = LEFT;
    else if piggy_face == LEFT piggy_face = UP;
    else if piggy_face == UP piggy_face = RIGHT;
    else if piggy_face == RIGHT piggy_face = DOWN;
}