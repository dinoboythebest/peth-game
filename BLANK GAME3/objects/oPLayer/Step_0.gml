var _left = keyboard_check(vk_left)
var _right = keyboard_check(vk_right)

var _up = keyboard_check(vk_up)
var _down = keyboard_check(vk_down)

var _key_attack = keyboard_check_pressed(vk_space);


    if (_key_attack) {
        state = "attack";
        image_index = 0;
        sprite_index = sPLayerAttack; 
    }

// attack
if (state == "attack") {
    hspeed = 0;

 
    if (floor(image_index) == 3 && already_hit == false) {
        var _hit_enemy = instance_place(x + (image_xscale * 20), y, oEnemy);
        
        if (_hit_enemy != noone) {
            _hit_enemy.enemy_hp -= 1
            
      
            already_hit = true; 
        }
    }
}

// enemy attack
if (already_hit) {
    var _enemy = instance_place(x, y, oEnemy);
    if (_enemy != noone) {
        hp -= 1;
        player_hit = false;
        alarm[0] = invicible_time; //cooldown
    }
}

// if dies 
if (hp <= 0) {
    room_restart();
}

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