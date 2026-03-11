if (place_meeting(x, y, oPlayer_1) && oPlayer_1.state == "attack")
{
    draw_set_colour(c_white);
	draw_self();
}
else
{
    draw_set_colour(c_red);
	draw_self();
}

draw_self();

var hit = place_meeting(x, y, oPlayer_1);
draw_text(x, y - 48, "hit: " + string(hit));

// reset to default AFTER everything
draw_set_colour(c_white);



