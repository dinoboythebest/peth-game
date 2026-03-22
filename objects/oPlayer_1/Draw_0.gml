//for testing purpose

draw_text(x, y - 32, string(oPlayer_1.state));
draw_text(x, y - 50, string($"health: {oPlayer_1.hp}"));
if(state == "block" && place_meeting(x, y, oEnemy))
{
	draw_set_colour(c_blue)
	
}
else
{
	draw_set_colour(c_white)
}
draw_self();