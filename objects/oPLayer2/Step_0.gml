var _left  = keyboard_check(ord("A"));
var _right = keyboard_check(ord("D"));





var _key_attack = keyboard_check(ord("M"));


    if (_key_attack) {
        state = "attack";
        image_index = 0;
		sprite_index = sPlayerAttack;
 
    }
	else
	{
		
		sprite_index = idk;
	}


// attack
if (state == "attack") {
    hspeed = 0;

 
    if (floor(image_index) == 0 && already_hit == false) {
		 
		
        var _hit_enemy = instance_place(x + (image_xscale * 20), y, oEnemy);
        
        if (_hit_enemy != noone) 
		{
            _hit_enemy.enemy_hp -= 1
            alarm[0] = 60;
      
            already_hit = true; 
			
        }
    }
	
}

// enemy attack
if (already_hit)
{
    var _enemy = instance_place(x, y, oEnemy);
    if (_enemy != noone)
	{
        hp -= 1;
        already_hit = false;
        alarm[0] = invicible_time; //cooldown
		image_index = 1;
    }
	
	
}

// if dies 
if (hp <= 0) {
    room_restart();
}

//calculation



var horizontal_input = _right - _left;


if(keyboard_check(vk_shift))
{
  var_dash = true;
  move_speed = 20;
  alarm[0] = 60;

}
else
{
  if(!keyboard_check(vk_rshift))
  {
	  move_speed = 4;
  }
}

if (keyboard_check(ord("w")))
{
    vertical_speed = -6;
}


if(!place_meeting(x, y + 1, owall))
{
	vetical_speed += 0.3;
}

move_and_collide(horizontal_input * move_speed, vetical_speed, owall)