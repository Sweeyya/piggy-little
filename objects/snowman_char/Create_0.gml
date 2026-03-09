interactable_obj = true;
interact = function() {
    var d = instance_find(dialogue_obj, 0);
    d.lines = ["Piggy! Your brothers are in trouble.", "Head north through the snow town.", "Be careful out there..."];
    d.speaker = "Snowman";
    d.current_line = 0;
    d.active = true;
}