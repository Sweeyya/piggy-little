draw_set_font(fnt_pixel);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(make_color_rgb(50, 100, 200));
draw_set_alpha(alpha);
draw_text_transformed(x, y, "z", 0.5, 0.5, 0);
draw_set_alpha(1);;