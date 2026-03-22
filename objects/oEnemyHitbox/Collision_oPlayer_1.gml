with (other) { 
    if (!is_invincible) { 
        hp -= 1; 
        is_invincible = true;
        alarm[0] = 60; 
    }
}
instance_destroy(); 