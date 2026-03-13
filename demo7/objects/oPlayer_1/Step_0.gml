
var _left = keyboard_check(vk_left);
var _right = keyboard_check(vk_right);
var _key_jump = keyboard_check_pressed(vk_up);
var _horizontal_input = _right - _left;


function punc()
{
    if (state != "attack") {
        state = "attack";
        sprite_index = sPlayerAttack; 
        image_index = 0; 
        already_hit = false;
		
	
    }
}

function special()
{
    if (state != "attack") {
        state = "attack";
        sprite_index = sPlayerAttack; 
        image_index = 0;
        already_hit = false;
    }
}

function crash()
{
	state = "attack";
    crash_down = true;
}

function block()
{
	state = "block"
}

if(keyboard_check_pressed(ord("R"))) { special(); }
if(keyboard_check_pressed(ord("E"))) { punc(); }
if(keyboard_check_pressed(ord("T"))) { crash(); }
if(keyboard_check_pressed(ord("F"))) { block(); }



if (state != "attack") 
{
    
    var _speed = (keyboard_check(vk_shift)) ? 20 : 4;
    var _move_x = _horizontal_input * _speed;
    

    if (!place_meeting(x, y + 1, owall)) {
        vertical_speed += 0.3;
    } else {
        vertical_speed = 0;
        jump_count = 0;
    }
    

    if (_key_jump && jump_count < 4) {
        vertical_speed = -6;
        jump_count += 1;
    }
    

    if(crash_down == true) {
        vertical_speed += 3;
        if (place_meeting(x, y + 1, owall)) {
            vertical_speed = 0;
            crash_down = false;
			
        }

        var _crash_enemy = instance_place(x, y, oEnemy);
        if (_crash_enemy != noone) {
            _crash_enemy.enemy_hp -= 1;
            
            _crash_enemy.vsp = -5; 
        }
    }
    
    //stop removing the comments becuase if u do then i know u use ai
	
    vertical_speed = clamp(vertical_speed, -10, 12);
    move_and_collide(_move_x, vertical_speed, owall);

    sprite_index = sPlayer;
    if (_horizontal_input != 0) image_xscale = _horizontal_input;

} 
else 
{
    if (floor(image_index) == 2 && !already_hit) {
        var _hit_enemy = instance_place(x + (image_xscale * 20), y, oEnemy);
        if (_hit_enemy != noone) {
            _hit_enemy.enemy_hp -= 10;
            
          
            _hit_enemy.hsp = image_xscale * 8; 
            
            already_hit = true;
        }
    }


    if (image_index >= image_number - 1) {
        state = "idle";
        already_hit = false;
    }
}


if (!is_invincible) {
    var _enemy = instance_place(x, y, oEnemy);
    if (_enemy != noone) {
        hp -= 1;
        is_invincible = true;
        alarm[0] = invincible_timer; 
    }
	
}
if( state = "block")
 {
			 
		  is_invincible = true;
          alarm[0] = invincible_timer; 
 }

if (hp <= 0) {
    room_restart();
}