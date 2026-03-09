if state != "hidden" {
    var cw = sprite_get_width(spr_paper) * scale / 2;
    var ch = sprite_get_height(spr_paper) * scale / 2;
    var px = 432 - cw;
    var py = 324 - ch;
    draw_sprite_ext(spr_paper, 0, px, py, scale, scale, 0, c_white, 1);
    
    if state == "open" {
        draw_set_halign(fa_left);
		draw_set_font(fnt_pixel);
		draw_set_color(c_black);
		draw_text_ext(260, py + 90, "gurt:yo\n-bruv#1", -1, cw * 2 - 40);
		draw_set_halign(fa_left);
    }
	
	
}

if state == "open" && keyboard_check_pressed(vk_space) {
    state = "hidden";
    scale = 0;
    instance_destroy();
}