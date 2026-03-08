
if (position_meeting(mouse_x, mouse_y, id)) {
    image_xscale = 1.1;
    image_yscale = 1.1;
    if (mouse_check_button_pressed(mb_left)) {
        room_goto(roomSingleplayer); 
    }
} else {
    image_xscale = 1.0;
    image_yscale = 1.0;
}