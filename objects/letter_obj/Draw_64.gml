var sx = (x - camera_get_view_x(view_camera[0])) * 3;
var sy = (y - camera_get_view_y(view_camera[0])) * 3;

if state == "idle" {
    draw_sprite_ext(spr_letter, 0, sx, sy, scale, scale, 0, c_white, 1);
    
} else if state == "zooming" || state == "open" {
    var cw = sprite_get_width(spr_letter) * scale / 2;
    var ch = sprite_get_height(spr_letter) * scale / 2;
    draw_sprite_ext(spr_letter, 0, 432 - cw, 324 - ch, scale, scale, 0, c_white, 1);
    if state == "open" {
        draw_set_font(fnt_pixel);
        draw_set_color(c_white);
        draw_text(370, 500, "SPACE - read");
    }
}

show_debug_message("state: " + string(state));