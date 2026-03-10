
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
            instance_create_layer(x, y, "Instances", oEnemyHitbox);
            enemy_can_attack = false;
            alarm[0] = enemy_attack_cooldown; 
        }
        break;
}
move_and_collide(_move_x, enemy_vertical_speed, owall);
if (enemy_hp <= 0) {
    var _new_enemy = instance_create_layer(281, 547, "Instances", object_index);
    
    with (_new_enemy) {
        enemy_hp = other.enemy_hp + 10;
        enemy_move_speed = other.enemy_move_speed * 1.5;
        enemy_jump_speed = other.enemy_jump_speed * 1.2;
        enemy_level = other.enemy_level + 1;
    }
    
    instance_destroy();
}