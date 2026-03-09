interactable_obj = true;
target_room = Room2; // change to your next room name later
image_speed = 0;
image_index = 0; // start on closed frame

interact = function() {
    image_index = 1; // switch to open frame
    alarm[0] = 60; // wait 1 second then switch rooms
}