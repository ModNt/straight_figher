class My_avatar {
  float x;
  float y;
  char action;
  My_avatar(float x_mine, float y_mine, char reaction) {
    x=x_mine;
    y=y_mine;
    action=reaction;
  }

  void setup() {
    x=400;
    y=550;
    action='0';
  }

  void reaction() {
    //limitation of X movement
    if (x_mine<x_emy-170) {
      turning[5][2]=true;
    } else {
      turning[5][2]=false;
    }

    //set of actions
    if (keyPressed&&turning[1][2]==false&&turning[4][3]==false) {
      if (key=='w') {  // jump
        act[2]=0;
        p=1;
        action='2';
      } else if (key=='q') { //back jump
        turning[3][2]=true;
        act[2]=0;
        p=1;
        action='2';
      } else if (key=='e') {  //front jump
        if (turning[5][2]==true) {
          turning[4][2]=true;
        }
        act[2]=0;
        p=1;
        action='2';
      } else if (key=='j') {  // punch
        turning[4][3]=true;
        act[3]=0;
        p=1;
        action='3';
      } else if (key=='k') {  //kick
        turning[4][3]=true;
        act[4]=0;
        p=1;
        action='4';
      } else if (key=='z'&&body_color_mine==#FAFF00) {
        ball_x=x_mine;
        turning[0][9]=true;
        turning[0][19]=true;
      }
    }

    if (keyPressed==false) {  //to prevent from sustaining key pressing
      turning[4][3]=false;
    }

    turning[1][6]=false;

    if (keyPressed&&turning[0][6]==false) {
      if (key=='y') {   // upper Guard
        action='6';
        turning[1][6]=true;
        turning[2][6]=true;
      } else if (key=='h') {  // middle Guard
        action='7';
        turning[1][6]=true;
        turning[2][7]=true;
      } else if (key=='n') {   // lower Guard
        action='8';
        turning[1][6]=true;
        turning[2][8]=true;
      }
    }

    if (keyPressed) {
      if (key=='l'&&turning[1][2]==true) {  //jump kick
        turning[0][5]=true;
        turning[3][5]=true;
      }
      if (key=='a') {  //X movement -
        if (x>50) {
          x-= 5;
        }
      }
      if (key=='d') { //X movement +
        if (x<x_emy-100) {
          x+=5;
        }
      }
    }

    //protect gages 
    if (rect_width_mine_pro<190&&turning[1][6]==false) {
      rect_width_mine_pro++;
    }
    if (rect_width_mine_pro>50&&turning[0][6]==true) {
      turning[0][6]=false;
      transparent=255;
    }
  }//void reactions


  void move() {
    
    dist_ball_emy=dist(ball_x,0,x_emy,0);
    if(turning[0][9]==true){
      fill(#FAFF00);
      ball_x+=ball_speed;
      ellipse(ball_x,500,200,200);
    }

    switch (action) {
    case '0': //base
      fill(body_color_mine);
      stroke(body_color_mine);
      pushMatrix();
      scale(0.8);
      ellipse(x, y-25, 50, 50);
      strokeWeight(3);
      noFill();
      beginShape();
      vertex(x, y);
      vertex(x-25, y+100);
      vertex(x-5, y+25);
      vertex(x-5, y+75);
      vertex(x+35, y+55);
      vertex(x-5, y+75);
      vertex(x-5, y+25);
      vertex(x+25, y+40);
      vertex(x+60, y+20);
      endShape();
      beginShape();
      vertex(x-50, y+200);
      vertex(x-30, y+150);
      vertex(x-25, y+100);
      vertex(x+15, y+150);
      vertex(x+15, y+200);
      endShape();
      popMatrix();
      break;

    case '2': //jump
      turning[1][2]=true;
      act[2]+=p;
      if (turning[3][2]==true) {
        x-=5;
      } else if (turning[4][2]==true) {
        x+=5;
      }

      if (0<act[2]&&act[2]<4) { //shagami
        fill(body_color_mine);
        stroke(body_color_mine);
        pushMatrix();
        scale(0.8);
        ellipse(x, y, 50, 50);
        strokeWeight(3);
        noFill();
        beginShape();
        vertex(x, y+25);
        vertex(x-5, y+50);
        vertex(x-5, y+100);
        vertex(x+35, y+80);
        vertex(x-5, y+100);
        vertex(x-5, y+50);
        vertex(x+25, y+65);
        vertex(x+60, y+45);
        vertex(x+25, y+65);
        vertex(x-5, y+50);
        vertex(x-25, y+125);
        vertex(x-25, y+160);
        vertex(x-50, y+200);
        vertex(x-25, y+160);
        vertex(x-25, y+125);
        vertex(x+15, y+160);
        vertex(x+15, y+200);
        endShape();
        popMatrix();
        if (turning[2][2]==true) {
          y=550;
          p=0;
          action='0';
          turning[1][2]=false;
          turning[2][2]=false;
          turning[0][5]=false;
          turning[3][2]=false;
          turning[4][2]=false;
        }
      } else if (3<act[2]&&act[2]<7) { //base
        fill(body_color_mine);
        stroke(body_color_mine);
        pushMatrix();
        scale(0.8);
        ellipse(x, y-25, 50, 50);
        strokeWeight(3);
        noFill();
        beginShape();
        vertex(x, y);
        vertex(x-25, y+100);
        vertex(x-5, y+25);
        vertex(x-5, y+75);
        vertex(x+35, y+55);
        vertex(x-5, y+75);
        vertex(x-5, y+25);
        vertex(x+25, y+40);
        vertex(x+60, y+20);
        endShape();
        beginShape();
        vertex(x-50, y+200);
        vertex(x-30, y+150);
        vertex(x-25, y+100);
        vertex(x+15, y+150);
        vertex(x+15, y+200);
        endShape();
        popMatrix();
      } else if (6<act[2]&&act[2]<10) {  //totyuu
        y=525;
        fill(body_color_mine);
        stroke(body_color_mine);
        pushMatrix();
        scale(0.8);
        ellipse(x, y-25, 50, 50);
        strokeWeight(3);
        noFill();
        beginShape();
        vertex(x, y);
        vertex(x-10, y+15);
        vertex(x-20, y+40);
        vertex(x+10, y+55);
        vertex(x-20, y+40);
        vertex(x-10, y+15);
        vertex(x+20, y+35);
        vertex(x+50, y+20);
        vertex(x+20, y+35);
        vertex(x-10, y+15);
        vertex(x-12, y+87);
        vertex(x-25, y+125);        
        vertex(x-35, y+165);
        vertex(x-25, y+125);
        vertex(x-12, y+87);
        vertex(x+20, y+105);
        vertex(x+20, y+150);
        endShape();
        popMatrix();
        if (p<0) {
          turning[3][5]=false;
        }
      } else if (9<act[2]&&act[2]<12) {  //top
        y=500;
        fill(body_color_mine);
        stroke(body_color_mine);
        pushMatrix();
        scale(0.8);
        ellipse(x, y-25, 50, 50);
        strokeWeight(3);
        noFill();
        beginShape();
        vertex(x, y);
        vertex(x-10, y+15);
        vertex(x-25, y+25);
        vertex(x-5, y+40);
        vertex(x-25, y+25);
        vertex(x-10, y+15);
        vertex(x+15, y+25);
        vertex(x+35, y+10);
        vertex(x+15, y+25);
        vertex(x-10, y+15);
        vertex(x-15, y+50);
        vertex(x, y+75);
        vertex(x-25, y+100);
        vertex(x-25, y+130);
        vertex(x-25, y+100);
        vertex(x, y+75);
        vertex(x+35, y+60);
        vertex(x+35, y+100);
        endShape();
        popMatrix();
      } else if (11<act[2]&&act[2]<19&&turning[0][5]==false) { //keep top
        y=475;
        fill(body_color_mine);
        stroke(body_color_mine);
        pushMatrix();
        scale(0.8);
        ellipse(x, y-25, 50, 50);
        strokeWeight(3);
        noFill();
        beginShape();
        vertex(x, y);
        vertex(x-10, y+15);
        vertex(x-25, y+25);
        vertex(x-5, y+40);
        vertex(x-25, y+25);
        vertex(x-10, y+15);
        vertex(x+15, y+25);
        vertex(x+35, y+10);
        vertex(x+15, y+25);
        vertex(x-10, y+15);
        vertex(x-15, y+50);
        vertex(x, y+75);
        vertex(x-25, y+100);
        vertex(x-25, y+130);
        vertex(x-25, y+100);
        vertex(x, y+75);
        vertex(x+35, y+60);
        vertex(x+35, y+100);
        endShape();
        popMatrix();
        if (act[2]==18) {
          turning[2][2]=true;
          p=-p;
        }
      } else if (11<act[2]&&act[2]<19&&turning[0][5]==true) {  //jamp kick
        y=475;
        fill(body_color_mine);
        stroke(body_color_mine);
        pushMatrix();
        scale(0.8);
        ellipse(x, y-25, 50, 50);
        strokeWeight(3);
        noFill();
        beginShape();
        vertex(x, y);
        vertex(x+10, y+15);
        vertex(x, y+40);
        vertex(x+10, y+25);
        vertex(x, y+40);
        vertex(x+10, y+15);
        vertex(x+35, y+20);
        vertex(x+60, y+10);
        vertex(x+35, y+20);
        vertex(x+10, y+15);
        vertex(x+25, y+50);
        vertex(x-10, y+75);
        vertex(x+25, y+75);
        vertex(x-10, y+75);
        vertex(x+25, y+50);
        vertex(x+150, y+50);
        endShape();
        popMatrix();
        if (act[2]==18) {
          turning[3][5]=true;
          turning[1][5]=true;//dmg
          turning[2][2]=true;
          p=-p;
        } else if (act[2]==17) {
          turning[1][5]=false;//dmg
        }
      }
      break;

    case '3'://punch
      turning[1][2]=true;
      act[3]+=p;

      if (act[3]==1) {
        fill(body_color_mine);
        stroke(body_color_mine);
        pushMatrix();
        scale(0.8);
        ellipse(x, y-25, 50, 50);
        strokeWeight(3);
        noFill();
        beginShape();
        vertex(x, y);
        vertex(x-25, y+100);
        vertex(x-5, y+25);
        vertex(x-5, y+75);
        vertex(x+35, y+55);
        vertex(x-5, y+75);
        vertex(x-5, y+25);
        vertex(x+25, y+40);
        vertex(x+60, y+20);
        endShape();
        beginShape();
        vertex(x-50, y+200);
        vertex(x-30, y+150);
        vertex(x-25, y+100);
        vertex(x+15, y+150);
        vertex(x+15, y+200);
        endShape();
        popMatrix();
        turning[2][3]=false;
        if (turning[1][3]==true) {
          p=0;
          action='0';
          turning[1][3]=false;
          turning[1][2]=false;
        }
      }

      if (act[3]==2) {
        fill(body_color_mine);
        stroke(body_color_mine);
        pushMatrix();
        scale(0.8);
        ellipse(x, y-25, 50, 50);
        strokeWeight(3);
        noFill();
        beginShape();
        vertex(x, y); 
        vertex(x-2.5, y+25); 
        vertex(x-12.5, y+65); 
        vertex(x+25, y+50);
        vertex(x-12.5, y+65); 
        vertex(x-2.5, y+25);
        vertex(x+25, y+32.5); 
        vertex(x+80, y+22.5);
        vertex(x+25, y+32.5); 
        vertex(x-2.5, y+25);
        vertex(x-12.5, y+100); 
        vertex(x-20, y+150);
        vertex(x-45, y+200); 
        vertex(x-20, y+150);
        vertex(x-12.5, y+100);
        vertex(x+27.5, y+150); 
        vertex(x+27.5, y+200);
        endShape();
        popMatrix();
        turning[2][3]=true;
      }

      if (act[3]==3) {
        fill(body_color_mine);
        stroke(body_color_mine);
        pushMatrix();
        scale(0.8);
        ellipse(x, y-25, 50, 50);
        strokeWeight(3);
        noFill();
        beginShape();
        vertex(x, y); 
        vertex(x, y+25);
        vertex(x-20, y+55);  
        vertex(x+15, y+45);
        vertex(x-20, y+55);
        vertex(x, y+25);
        vertex(x+100, y+25);
        vertex(x, y+25);
        vertex(x, y+100);
        vertex(x-10, y+150);
        vertex(x-40, y+200);
        vertex(x-10, y+150);
        vertex(x, y+100);
        vertex(x+50, y+150);
        vertex(x+50, y+200);
        endShape();
        popMatrix();
        turning[3][3]=false;
      }

      if (act[3]==4) {
        fill(body_color_mine);
        stroke(body_color_mine);
        pushMatrix();
        scale(0.8);
        ellipse(x, y-25, 50, 50);
        strokeWeight(3);
        noFill();
        beginShape();
        vertex(x, y); 
        vertex(x, y+25);
        vertex(x-20, y+55);  
        vertex(x+15, y+45);
        vertex(x-20, y+55);
        vertex(x, y+25);
        vertex(x+100, y+25);
        vertex(x, y+25);
        vertex(x, y+100);
        vertex(x-10, y+150);
        vertex(x-40, y+200);
        vertex(x-10, y+150);
        vertex(x, y+100);
        vertex(x+50, y+150);
        vertex(x+50, y+200);
        endShape();
        popMatrix();
        turning[1][3]=true;
        turning[3][3]=true;
        p=-p;
      }
      break;

    case '4':  //kick
      turning[1][2]=true;
      act[4]+=p;

      if (act[4]==1) {
        fill(body_color_mine);
        stroke(body_color_mine);
        pushMatrix();
        scale(0.8);
        ellipse(x, y-25, 50, 50);
        strokeWeight(3);
        noFill();
        beginShape();
        vertex(x, y);
        vertex(x-25, y+100);
        vertex(x-5, y+25);
        vertex(x-5, y+75);
        vertex(x+35, y+55);
        vertex(x-5, y+75);
        vertex(x-5, y+25);
        vertex(x+25, y+40);
        vertex(x+60, y+20);
        endShape();
        beginShape();
        vertex(x-50, y+200);
        vertex(x-30, y+150);
        vertex(x-25, y+100);
        vertex(x+15, y+150);
        vertex(x+15, y+200);
        endShape();
        popMatrix();
        turning[2][4]=false;
        if (turning[1][4]==true) {
          p=0;
          action='0';
          turning[1][4]=false;
          turning[1][2]=false;
        }
      }

      if (act[4]==2) {
        fill(body_color_mine);
        stroke(body_color_mine);
        pushMatrix();
        scale(0.8);
        ellipse(x, y-25, 50, 50);
        strokeWeight(3);
        noFill();
        beginShape();
        vertex(x, y); 
        vertex(x-2.5, y+25); 
        vertex(x+25, y+40);
        vertex(x+60, y+20); 
        vertex(x+25, y+40); 
        vertex(x-2.5, y+25); 
        vertex(x-12.5, y+65);
        vertex(x+25, y+50);
        vertex(x-12.5, y+65);
        vertex(x-2.5, y+25);
        vertex(x-12.5, y+100);
        vertex(x-15, y+150);
        vertex(x-37.5, y+200);
        vertex(x-15, y+150);
        vertex(x-12.5, y+100);
        vertex(x+40, y+125);
        vertex(x+60, y+162.5);
        endShape();
        popMatrix();
        turning[2][4]=true;
      }

      if (act[4]==3) {
        fill(body_color_mine);
        stroke(body_color_mine);
        pushMatrix();
        scale(0.8);
        ellipse(x, y-25, 50, 50);
        strokeWeight(3);
        noFill();
        beginShape();
        vertex(x, y); 
        vertex(x, y+25);
        vertex(x+25, y+40); 
        vertex(x+60, y+20); 
        vertex(x+25, y+40); 
        vertex(x, y+25); 
        vertex(x-20, y+55);
        vertex(x+15, y+45);
        vertex(x-20, y+55);
        vertex(x, y+25);
        vertex(x, y+100);
        vertex(x+65, y+100);
        vertex(x+115, y+125);
        vertex(x+65, y+100);
        vertex(x, y+100);
        vertex(x-10, y+150);
        vertex(x-40, y+200);
        endShape();
        popMatrix();
        turning[3][4]=false;
      }

      if (act[4]==4) {
        fill(body_color_mine);
        stroke(body_color_mine);
        pushMatrix();
        scale(0.8);
        ellipse(x, y-25, 50, 50);
        strokeWeight(3);
        noFill();
        beginShape();
        vertex(x, y); 
        vertex(x, y+25);
        vertex(x+25, y+40); 
        vertex(x+60, y+20); 
        vertex(x+25, y+40); 
        vertex(x, y+25); 
        vertex(x-20, y+55);
        vertex(x+15, y+45);
        vertex(x-20, y+55);
        vertex(x, y+25);
        vertex(x, y+100);
        vertex(x+65, y+100);
        vertex(x+115, y+125);
        vertex(x+65, y+100);
        vertex(x, y+100);
        vertex(x-10, y+150);
        vertex(x-40, y+200);
        endShape();
        popMatrix();
        turning[1][4]=true;
        turning[3][4]=true;
        p=-p;
      }
      break;

    case '6': //upper Guard
      fill(body_color_mine);
      stroke(body_color_mine);
      pushMatrix();
      scale(0.8);
      ellipse(x, y-25, 50, 50);
      strokeWeight(3);
      noFill();
      beginShape();
      vertex(x, y);
      vertex(x-25, y+100);
      vertex(x-5, y+25);
      vertex(x+25, y+10);
      vertex(x+50, y-35);
      vertex(x+25, y+10);
      vertex(x-5, y+25);
      vertex(x+40, y+10);
      vertex(x+35, y-35);
      endShape();
      beginShape();
      vertex(x-50, y+200);
      vertex(x-30, y+150);
      vertex(x-25, y+100);
      vertex(x+15, y+150);
      vertex(x+15, y+200);
      endShape();
      popMatrix();
      action='0';

      //protect gages
      if (rect_width_mine_pro>0) {
        rect_width_mine_pro-=2;
      }
      if (rect_width_mine_pro<=2) {
        turning[0][6]=true;
        transparent=50;
      }

      break;
    case '7':  //middle Guard
      fill(body_color_mine);
      stroke(body_color_mine);
      pushMatrix();
      scale(0.8);
      ellipse(x, y-25, 50, 50);
      strokeWeight(3);
      noFill();
      beginShape();
      vertex(x, y);
      vertex(x-25, y+100);
      vertex(x-5, y+25);
      vertex(x+5, y+55);
      vertex(x+30, y+15);
      vertex(x+5, y+55);
      vertex(x-5, y+25);
      vertex(x+10, y+55);
      vertex(x+20, y+15);
      endShape();
      beginShape();
      vertex(x-50, y+200);
      vertex(x-30, y+150);
      vertex(x-25, y+100);
      vertex(x+15, y+150);
      vertex(x+15, y+200);
      endShape();
      popMatrix();
      action='0';

      //protect gages
      if (rect_width_mine_pro>0) {
        rect_width_mine_pro-=2;
      }
      if (rect_width_mine_pro<=2) {
        turning[0][6]=true;
        transparent=50;
      }
      break;     

    case '8':  //lower Guard
      fill(body_color_mine);
      stroke(body_color_mine);
      pushMatrix();
      scale(0.8);
      ellipse(x, y-25, 50, 50);
      strokeWeight(3);
      noFill();
      beginShape();
      vertex(x, y);
      vertex(x-25, y+100);
      vertex(x-5, y+25);
      vertex(x+15, y+70);
      vertex(x+15, y+130);
      vertex(x+15, y+70);
      vertex(x-5, y+25);
      vertex(x+5, y+130);
      endShape();
      beginShape();
      vertex(x-50, y+200);
      vertex(x-30, y+150);
      vertex(x-25, y+100);
      vertex(x+15, y+150);
      vertex(x+15, y+200);
      endShape();
      popMatrix();
      action='0';

      //protect gages
      if (rect_width_mine_pro>0) {
        rect_width_mine_pro-=2*multiple_emy;
      }
      if (rect_width_mine_pro<=2) {
        turning[0][6]=true;
        transparent=50;
      }
      break;
    } //switch

    x_mine=x;
    y_mine=y;
  }
}
