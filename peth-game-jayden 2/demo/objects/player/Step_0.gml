var _left = keyboard_check(vk_left)
var _right = keyboard_check(vk_right)

var _up = keyboard_check(vk_up)
var _down = keyboard_check(vk_down)



//calculation



var horizontal_input = _right - _left;
var vertical_input = 0;

if(keyboard_check(vk_shift))
{
  var_dash = true;
  move_speed = 20;
  alarm[0] = 60;

}
else
{
  if(!keyboard_check(vk_shift))
  {
	  move_speed = 4;
  }
}


move_and_collide(horizontal_input * move_speed, vertical_input * move_speed, owall)
