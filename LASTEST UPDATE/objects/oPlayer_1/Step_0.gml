
var _left = keyboard_check(vk_left);
var _right = keyboard_check(vk_right);
var _key_attack = keyboard_check_pressed(ord("E"));
var _key_jump = keyboard_check_pressed(vk_up);
var _horizontal_input = _right - _left;


if (_key_attack && state != "attack") {
    state = "attack";
    sprite_index = sPlayerAttack; 
    image_index = 0;
	if (place_meeting(x, y, oEnemy))

	{
		oEnemy.enemy_hp -= 1;
	}
}


if (state != "attack") {

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
    
    move_and_collide(_move_x, vertical_speed, owall);
    

    sprite_index = sPlayer;
    
} else {

    if (floor(image_index) == 2 && !already_hit) {
        var _hit_enemy = instance_place(x + (image_xscale * 20), y, oEnemy);
        if (_hit_enemy != noone) {
            _hit_enemy.enemy_hp -= 10;
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


if (hp <= 0) {
    room_restart();
}