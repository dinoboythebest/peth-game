if (!instance_exists(oPlayer_1)) {
    enemy_state = ENEMY_STATE.IDLE;
} else {
    var _dist = point_distance(x, y, oPlayer_1.x, oPlayer_1.y);
    var _on_ground = place_meeting(x, y + 1, owall);

    if (_dist <= enemy_detection_range) enemy_has_seen_player = true;

    if (enemy_has_seen_player) {
        if (_dist <= enemy_attack_range) {
            enemy_state = ENEMY_STATE.ATTACK;
        } else if (oPlayer_1.y < y - 50 && _on_ground) {
            enemy_state = ENEMY_STATE.JUMP;
        } else {
            enemy_state = ENEMY_STATE.CHASE;
        }
    } else {
        enemy_state = ENEMY_STATE.IDLE;
    }
}


if (!place_meeting(x, y + 1, owall)) {
    enemy_vertical_speed += enemy_gravity;
} else {
    enemy_vertical_speed = 0;
}

hsp = lerp(hsp, 0, 0.1); 

var _move_x = 0;
switch (enemy_state) {
    case ENEMY_STATE.CHASE:
        if (oPlayer_1.x < x) _move_x = -enemy_move_speed;
        else if (oPlayer_1.x > x) _move_x = enemy_move_speed;
        break;
        
    case ENEMY_STATE.JUMP:
        enemy_vertical_speed = enemy_jump_speed;
        enemy_state = ENEMY_STATE.CHASE; 
        break;

    case ENEMY_STATE.ATTACK:
        if (enemy_can_attack && !instance_exists(oEnemyHitbox)) {
            var _hb = instance_create_layer(x, y, "Instances", oEnemyHitbox);
            _hb.owner = id; 
            enemy_can_attack = false;
            alarm[0] = enemy_attack_cooldown; 
        }
        break;
}


move_and_collide(_move_x + hsp, enemy_vertical_speed, owall);



if (enemy_hp <= 0) {
    var _is_last_one = (instance_number(object_index) <= 1);

    if (room == roomEndlessWaves) {
        if (_is_last_one) {
            var _next_level = min(enemy_level + 1, 5);
            repeat(4) { 
                var _rx = 281 + irandom_range(-100, 100);
                var _ry = 547;
                var _new = instance_create_layer(_rx, _ry, "Instances", object_index);
                with (_new) {
                    enemy_level = _next_level;
                    enemy_hp = 10 + (enemy_level * 10);
                    enemy_move_speed = 4 + (enemy_level * 0.8);
                    enemy_jump_speed = -6 - (enemy_level * 0.5);
                    enemy_has_seen_player = false;
                    hsp = 0; 
                }
            }
        }
    } 
    else if (room == roomEndlessRespawn) {
        var _new = instance_create_layer(281, 547, "Instances", object_index);
        with (_new) {
            enemy_level = other.enemy_level + 1;
            enemy_hp = 10 + (enemy_level * 10);
            enemy_move_speed = other.enemy_move_speed * 1.1; 
            enemy_jump_speed = other.enemy_jump_speed * 1.05;
            enemy_has_seen_player = false;
            hsp = 0; 
        }
    }
    instance_destroy(id); 
}