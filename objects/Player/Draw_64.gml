// frame PNG
draw_sprite_ext(spr_frame, 0, 10, 10, 2, 2, 0, c_white, 1);

// background bar
draw_set_color(c_dkgray);
draw_rectangle(14, 10, 250, 43, false);

// hp bar
var hp_width = (hp / hp_max) * 237;
draw_set_color(make_color_rgb(180, 40, 40));
draw_rectangle(14, 10, 13 + hp_width, 43, false);

// frame on top
draw_sprite_ext(spr_frame, 0, 10, 10, 2, 2, 0, c_white, 1);

//hp
draw_set_font(fnt_pixel);
draw_set_color(c_white);
var hp_text = string(hp) + "/" + string(hp_max);
draw_text(150, 14, hp_text);

// reset color
draw_set_color(c_white);