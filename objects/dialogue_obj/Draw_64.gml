if active {
    // box at bottom of screen
    var sw = display_get_gui_width();
    var sh = display_get_gui_height();
    
    draw_set_color(c_black);
    draw_rectangle(10, sh - 80, sw - 10, sh - 10, false);
    draw_set_color(c_white);
    draw_rectangle(10, sh - 80, sw - 10, sh - 10, true);
    
    // speaker name
    draw_set_font(fnt_pixel);
    draw_set_color(c_yellow);
    draw_text(20, sh - 75, speaker);
    
    // dialogue text
    draw_set_color(c_white);
    draw_text_ext(20, sh - 58, lines[current_line], -1, sw - 40);
}