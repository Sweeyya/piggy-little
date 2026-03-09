if is_open && array_length(item_instances) > 0 {
    // dark background bar
    draw_set_color(make_color_rgb(0, 0, 0));
    draw_set_alpha(0.7);
    draw_rectangle(0, 620, 864, 648, false);
    draw_set_alpha(1);
    
    // instruction text
    draw_set_font(fnt_pixel);
    draw_set_color(c_white);
    draw_text(250, 628, "← → browse     SPACE open     ESC close");
}