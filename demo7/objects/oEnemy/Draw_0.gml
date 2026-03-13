

if (place_meeting(x, y, oPlayer_1) && oPlayer_1.state == "attack")
{
	draw_set_color(c_blue);
    var offset = 20;
	layer = 1;
    draw_rectangle(x, y - 20, x + 32, y + 42 - 20, false);
	draw_self();

       

}

else if(place_meeting(x, y, oPlayer_1) && oPlayer_1.crash_down == true)
{
 draw_set_color(c_blue);


 draw_rectangle(x, y - 20, x + 32, y + 42 - 20, false);
 draw_self();
}

else
{
    draw_set_color(c_red);
    var offset = 20;
    draw_rectangle(x, y - 20, x + 32, y + 42 - 20, false);
	draw_self();
 
	
}


draw_self();








