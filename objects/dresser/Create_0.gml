depth = -y;
is_open = false;
image_speed = 0;
image_index = 0;
interactable_obj = true;
has_letter = true;
selected_item = 0;
item_instances = [];

interact = function() {
    if !is_open {
        is_open = true;
        image_index = 1;
        if has_letter {
            var l = instance_create_layer(x - 20, y - 40, "Instances_1", letter_obj);
            l.base_x = x - 20;
            l.base_y = y - 40;
            l.scale = 0.3;
            l.selected = true;
            array_push(item_instances, l);
        }
        if array_length(item_instances) > 0 {
            item_instances[0].selected = true;
        }
    }
}