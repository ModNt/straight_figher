class Fighting_display {
  Fighting_display() {
  }

  void draw() {
    fill(255);
    noStroke();
    rect(50, 50, 450, 100);  //frame
    rect(750, 50, 450, 100); //frame

    //informations
    textSize(36);
    fill(0);
    text("PLAYER", 60, 80);
    text("ENEMY", 760, 80);
    text("HP:", 60, 130);
    text("HP:", 760, 130);
    fill(255, 0, 0, transparent_HP_mine);
    rect(130, 100, rect_width_mine, 40);
    fill(255, 0, 0, transparent_HP_emy);
    rect(830, 100, rect_width_emy, 40);
    
    //protect gages
    //mine
    textSize(15);
    fill(255, 0, 0);
    text("Protect Bar", 200, 80);
    constrain(rect_width_mine_pro, 0, 190);
    fill(r_mine, g_mine, b_mine, transparent);
    rect(300, 75, rect_width_mine_pro, 5);
    //enemy
    fill(255, 0, 0);
    text("Protect Bar", 900, 80);
    constrain(rect_width_emy_pro, 0, 190);
    fill(r_emy, g_emy, b_emy, transparent_emy);
    rect(1000, 75, rect_width_emy_pro, 5);
    
    //special attack
    if(body_color_mine==#FAFF00){
      textSize(30);
      fill(255);
      text("Press Z !",100,300);
      text("you can use SPECIAL ATTACK!!",100,330);
    }

    //movements
    if (transparent_HP_mine==255&&transparent_HP_emy==255) { //HP bar exist
      turning[5][0]=false;
    }
    if (turning[5][0]==false) {
      chara.reaction();
    }
    chara.move();
    if (turning[5][0]==false) {
      enemy.AI();
    }
    enemy.move();

    //body color
    body_color_emy=#000000;
    if(rect_width_mine>=100||rect_width_mine<=0||turning[0][9]==true){
    body_color_mine=#000000;
    }else{
      body_color_mine=#FAFF00; //yellow
    }

    // set of dameges
    //enemy
    if(dist_ball_emy<=100&&turning[0][19]==true){
      turning[1][19]=true;
    }
    if(turning[1][19]==true){
      rect_width_emy-=100;
      turning[0][19]=false;
      turning[1][19]=false;
      
    }
    
    if (distance<=115&&turning[3][3]==true) {
      if (turning[2][17]==false) {
        rect_width_emy-=dmg_punch*multiple_mine;
        body_color_emy=#FC0303;
      }
    }
    if (distance<=165&&turning[3][4]==true) {
      if (turning[2][18]==false) {
        rect_width_emy-=dmg_kick*multiple_mine;
        body_color_emy=#FC0303;
      }
    }
    
    if (distance<=170&&turning[1][5]==true) {
      if (turning[2][16]==false) {
        rect_width_emy-=dmg_jpkck*multiple_mine;
        body_color_emy=#FC0303;
      }
    }
            rect_width_mine1=rect_width_mine;  //1.to prevent bugs
    //mine
    if (distance<=115&&turning[3][13]==true) {
      if (turning[2][7]==false) {
        rect_width_mine-=dmg_punch*multiple_emy;
        body_color_mine=#FC0303;
      }
    }
    if (distance<=165&&turning[3][14]==true) {
      if (turning[2][8]==false&&y_mine==550) {
        rect_width_mine-=dmg_kick*multiple_emy;
        body_color_mine=#FC0303;
      }
    }
    if (distance<=170&&turning[1][15]==true) {
      if (turning[2][6]==false) {
        rect_width_mine-=dmg_jpkck*multiple_emy;
        body_color_mine=#FC0303;
      }
    }

    //to prevent bugs
    rect_width_mine2=rect_width_mine;
    if (rect_width_mine2<rect_width_mine1) {
      turning[3][13]=false;
      turning[3][14]=false;
      turning[1][15]=false;
    }

    //process of HP<0
    if (rect_width_emy<=0) {
      transparent_HP_emy=0;
    }
    if (rect_width_mine<=0) {
      transparent_HP_mine=0;
    }

    //set for next actions
    turning[2][16]=false;
    turning[2][17]=false;
    turning[2][18]=false;
    turning[2][6]=false;
    turning[2][7]=false;
    turning[2][8]=false;
  } //void draw


  void ending() {
    
    //to stop display with blackly rect
    fill(0, 0, 0, 100);
    rect(0, 0, width, height); 
    
    //if my avatar lose
    if (transparent_HP_mine==0) {
      fill(255);
      textSize(100);
      text("YOU LOSE!", 400, height/2);
    } else {
      //if my avatar win
      fill(255, 0, 255);
      textSize(100);
      text("YOU WIN!", 400, height/2);
    }
    textSize(36);
    text("Push 'R' key to back to title", 500, 500);
  }
}
