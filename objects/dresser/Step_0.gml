if is_open {
    if keyboard_check_pressed(vk_left) {
        item_instances[selected_item].selected = false;
        selected_item = max(0, selected_item - 1);
        item_instances[selected_item].selected = true;
    }
    if keyboard_check_pressed(vk_right) {
        item_instances[selected_item].selected = false;
        selected_item = min(array_length(item_instances) - 1, selected_item + 1);
        item_instances[selected_item].selected = true;
    }
    
    if keyboard_check_pressed(vk_space) {
        if array_length(item_instances) > 0 {
            var sel = item_instances[selected_item];
            if instance_exists(sel) {
                sel.state = "zooming";
                sel.selected = false;
                array_delete(item_instances, selected_item, 1);
                selected_item = 0;
                is_open = false;
                image_index = 0;
                has_letter = false;
            }
        }
    }
    
    if keyboard_check_pressed(vk_escape) {
        for (var i = 0; i < array_length(item_instances); i++) {
            instance_destroy(item_instances[i]);
        }
        item_instances = [];
        selected_item = 0;
        is_open = false;
        image_index = 0;
    }
}