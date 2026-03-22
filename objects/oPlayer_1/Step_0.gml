
	var _left = keyboard_check(vk_left);
	var _right = keyboard_check(vk_right);
	var _key_jump = keyboard_check_pressed(vk_up);
	var _horizontal_input = _right - _left;
	if 


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
	    if (state != "special") {
	        state = "special";
      
	        already_hit = false;
		
	
	    }
	}



	function crash()
	{
		state = "attack";
	    crash_down = true;
	}


	//waht happned to special
	//i added a kick anmation amke that the special
	//make the special have  a longer cooldown

	if(keyboard_check_pressed(ord("E"))) { punc(); }
	if(keyboard_check_pressed(ord("T"))) { crash(); }
	if(keyboard_check_pressed(ord("F"))) { state = "block"}
	if(keyboard_check_pressed(ord("R"))) {special();}
	if (state!= "special")
	{//idk what to do but smthing like this i thin
		 if (place_meeting(x,y,oEnemy)) {
	        Enemy_hp =-1
		is_invincible=true
		already_hit=false
	
		if (!keyboard_check(ord("R")) || hit_count >= 4) 
	    {
	        state = "idle";
	        hit_count = 0;
	        is_invincible = false;
	        sprite_index = sPlayer;
	    }
	
	    }
	}
     



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
			if(_crash_enemy != noone && state == "flip")
			{
				_crash_enemy.enemy_hp -= 3;
            
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
	
	//block is performed giving player invincibility
	if(state == "block")
	{
		is_invincible = true;
		sprite_index = sPlayerBlock;
		image_alpha = 1;
	}

    //however the more the enemy attacks you the more the hit_count increases
	var hit = instance_place(x, y, oEnemy);
	if(hit != noone)
	{
		hit_count++;
		already_hit = true;
        alarm[1] = 10;
	}
	//punishment, players 
	if(!keyboard_check(ord("F") || hit_count >= 4))
	{
	  state = "idle";
	  is_invincible = false;	
	  hit_count = 0;
	
	}
	
	 
	

		  
       

		

	 

	if (hp <= 0) {
	    room_restart();
	}