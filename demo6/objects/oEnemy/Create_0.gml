
enum ENEMY_STATE {
    IDLE,
    CHASE,
    ATTACK,
    JUMP
}
enemy_move_speed = 2;
enemy_vertical_speed = 0;
enemy_gravity = 0.3;
enemy_jump_speed = -7;
enemy_detection_range = 250;
enemy_attack_range = 40;
enemy_hp = 1; 
enemy_has_seen_player = false; 
enemy_can_attack = true;
enemy_attack_cooldown = 60; 
enemy_state = ENEMY_STATE.IDLE;
enemy_level = 1;
hsp=0