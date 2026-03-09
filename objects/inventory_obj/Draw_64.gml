if !visible_inv exit;

// dark overlay
draw_set_color(c_black);
draw_set_alpha(0.9);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1);

// inventory background
var scale = 8;
var iw = 96 * scale;
var ih = 71 * scale;
var ix = (display_get_gui_width() - iw) / 2;
var iy = (display_get_gui_height() - ih) / 2;
draw_sprite_ext(inventory_spr, 0, ix, iy, scale, scale, 0, c_white, 1);

// title
draw_set_font(fnt_pixel_large);
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_text(ix + iw / 2, iy + 10, "INVENTORY");
draw_set_halign(fa_left);
draw_set_font(fnt_pixel);

// piggy on left panel
var piggy_spr = Pig_sprite;
draw_sprite_ext(piggy_spr, 0, ix + 150, iy + ih/2 - 20, 7, 7, 0, c_white, 1);

// rotation arrows
draw_sprite_ext(arrow_spr, 0, ix + 80, iy + ih - 140, 0.8, 0.8, 0, c_white, 1);
draw_sprite_ext(arrow_spr, 0, ix + 280, iy + ih - 140, -0.8, 0.8, 0, c_white, 1);

// right panel items
var start_x = ix + iw / 2 + 60;
var start_y = iy + 120;
var row_h = 25;
var cur_y = start_y;

for (var c = 0; c < 4; c++) {
    // dropdown arrow
    if categories_open[c] {
        draw_sprite_ext(dropdown_spr, 0, start_x, cur_y, 0.125, 0.125, 0, c_white, 1);
    } else {
        draw_sprite_ext(dropdown_spr, 0, start_x, cur_y, 0.125, 0.125, 90, c_white, 1);
    }
    
    // category name
    draw_set_font(fnt_pixel);
    if c == selected_category {
        draw_set_color(c_yellow);
    } else {
        draw_set_color(c_white);
    }
    draw_text(start_x + 20, cur_y, category_names[c]);
    cur_y += row_h;
    
    // items only if open
    if categories_open[c] {
        for (var i = 0; i < array_length(items[c]); i++) {
            draw_set_color(c_white);
            draw_text(start_x + 35, cur_y, items[c][i]);
            cur_y += row_h;
        }
    }
}