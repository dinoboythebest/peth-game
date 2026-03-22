var collision = place_meeting(x, y, oPlayer_1)
var attacked = false;

if(collision)
{
	if(oPlayer_1.state = "attack" || oPlayer_1.crash_down = true || oPlayer_1.state = "special")
	{
		attacked = true;
	}
}
//super compacted veersion of a condition
draw_set_color(attacked ? c_blue : c_red);
draw_rectangle(x, y - 50, x + 32, y + 50, false);


draw_self();








