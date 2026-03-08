// background bar
draw_set_color(c_dkgray);
draw_rectangle(10, 10, 110, 22, false);

// hp bar
var hp_width = (hp / hp_max) * 100;
draw_set_color(c_red);
draw_rectangle(10, 10, 10 + hp_width, 22, false);

// outline
draw_set_color(c_black);
draw_rectangle(10, 10, 110, 22, true);

// reset color
draw_set_color(c_white);