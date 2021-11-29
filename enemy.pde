class Enemy {

  float x, y;
  char action;

  Enemy(float x_emy, float y_emy, char reaction_emy) {
    x=x_emy;
    y=y_emy;
    action=reaction_emy;
  }

  void setup() {
    x=1050; //first X position
    y=550;
    action='0';
  }

  void AI() { //AI actions
    distance=dist(x_mine, y_mine, x_emy, y_emy);
    g=AI/framerate;

    if (keyPressed) { //if my avatar attaks
      if(key=='j'||key=='k'||key=='l'){
       AI_uG_random = random(20, 30);
       AI_mG_random = random(30, 40);
       AI_lG_random = random(40, 50);
      }
    }

    if (g%1==0) {  //attack at per seconds
      AI_punch_random =random(0, 10);
      AI_kick_random = random(10, 20);
    } else {
      AI_punch_random=0;
      AI_kick_random=0;
    }
    
    //attacks
    if (turning[1][12]==false) {
      if (distance<=115) {
        if (AI_punch_random>=AI_punch) {
          act[13]=0;
          q=1;
          action='3';
        } else if (distance<=175) {
          if (AI_kick_random>=AI_kick) {
            act[14]=0;
            q=1;
            action='4';
          }
        }
      }
    }

    //guards
    turning[1][16]=false;
    if (turning[0][16]==false) {
      if (distance<=170&&AI_uG_random>=AI_uG&&turning[3][5]==true&&y_mine!=550) {   // upper G[][16]
        action='6';
        turning[1][16]=true;
        turning[2][16]=true;
      } else if (distance<=115&&AI_mG_random>=AI_mG&&turning[2][3]==true) {  // middle G[][17]
        action='7';
        turning[1][16]=true;
        turning[2][17]=true;
      } else if (distance<=165&&AI_lG_random>=AI_lG&&turning[2][4]==true) {   // lower G[][18]
        action='8';
        turning[1][16]=true;
        turning[2][18]=true;
      }
    }

    //X movements
    if (distance>random(115, 400)) {
      if (x>200) {
        x-= 5;
      }
    }
    if (transparent_emy!=255) {
      if (x<width-50) {
        x+=5;
      }
    }

    //enemy protect gage
    if (rect_width_emy_pro<190&&turning[1][16]==false) {
      rect_width_emy_pro++;
    }
    if (rect_width_emy_pro>50&&turning[0][16]==true) {
      turning[0][16]=false;
      transparent_emy=255;
    }
  } //end of AI function


  void move() {
    switch (action) {

    case '0': //base
      fill(body_color_emy);
      stroke(body_color_emy);
      pushMatrix();
      scale(0.8);
      ellipse(x, y-25, 50, 50);
      strokeWeight(3);
      noFill();
      beginShape();
      vertex(x, y);
      vertex(x+25, y+100);
      vertex(x+5, y+25);
      vertex(x+5, y+75);
      vertex(x-35, y+55);
      vertex(x+5, y+75);
      vertex(x+5, y+25);
      vertex(x-25, y+40);
      vertex(x-60, y+20);
      endShape();
      beginShape();
      vertex(x+50, y+200);
      vertex(x+30, y+150);
      vertex(x+25, y+100);
      vertex(x-15, y+150);
      vertex(x-15, y+200);
      endShape();
      popMatrix();
      break;

    case '3'://punch
      turning[1][12]=true; //other action off
      act[13]+=q;

      if (act[13]==1) {
        fill(body_color_emy);
        stroke(body_color_emy);
        pushMatrix();
        scale(0.8);
        ellipse(x, y-25, 50, 50);
        strokeWeight(3);
        noFill();
        beginShape();
        vertex(x, y);
        vertex(x+25, y+100);
        vertex(x+5, y+25);
        vertex(x+5, y+75);
        vertex(x-35, y+55);
        vertex(x+5, y+75);
        vertex(x+5, y+25);
        vertex(x-25, y+40);
        vertex(x-60, y+20);
        endShape();
        beginShape();
        vertex(x+50, y+200);
        vertex(x+30, y+150);
        vertex(x+25, y+100);
        vertex(x-15, y+150);
        vertex(x-15, y+200);
        endShape();
        popMatrix();
        if (turning[1][13]==true) {
          q=0;
          action='0'; //go to base
          turning[1][13]=false;
          turning[1][12]=false;
         }
       }
      
      if (act[13]==2) {
        fill(body_color_emy);
        stroke(body_color_emy);
        pushMatrix();
        scale(0.8);
        ellipse(x, y-25, 50, 50);
        strokeWeight(3);
        noFill();
        beginShape();
        vertex(x, y); 
        vertex(x+2.5, y+25); 
        vertex(x+12.5, y+65); 
        vertex(x-25, y+50);
        vertex(x+12.5, y+65); 
        vertex(x+2.5, y+25);
        vertex(x-25, y+32.5); 
        vertex(x-80, y+22.5);
        vertex(x-25, y+32.5); 
        vertex(x+2.5, y+25);
        vertex(x+12.5, y+100); 
        vertex(x+20, y+150);
        vertex(x+45, y+200); 
        vertex(x+20, y+150);
        vertex(x+12.5, y+100);
        vertex(x-27.5, y+150); 
        vertex(x-27.5, y+200);
        endShape();
        popMatrix();
      }
      
      if (act[13]==3) {
        fill(body_color_emy);
        stroke(body_color_emy);
        pushMatrix();
        scale(0.8);
        ellipse(x, y-25, 50, 50);
        strokeWeight(3);
        noFill();
        beginShape();
        vertex(x, y); 
        vertex(x, y+25);
        vertex(x+20, y+55);  
        vertex(x-15, y+45);
        vertex(x+20, y+55);
        vertex(x, y+25);
        vertex(x-100, y+25);
        vertex(x, y+25);
        vertex(x, y+100);
        vertex(x+10, y+150);
        vertex(x+40, y+200);
        vertex(x+10, y+150);
        vertex(x, y+100);
        vertex(x-50, y+150);
        vertex(x-50, y+200);
        endShape();
        popMatrix();
        turning[3][13]=false;
      }

      if (act[13]==4) {
        fill(body_color_emy);
        stroke(body_color_emy);
        pushMatrix();
        scale(0.8);
        ellipse(x, y-25, 50, 50);
        strokeWeight(3);
        noFill();
        beginShape();
        vertex(x, y); 
        vertex(x, y+25);
        vertex(x+20, y+55);  
        vertex(x-15, y+45);
        vertex(x+20, y+55);
        vertex(x, y+25);
        vertex(x-100, y+25);
        vertex(x, y+25);
        vertex(x, y+100);
        vertex(x+10, y+150);
        vertex(x+40, y+200);
        vertex(x+10, y+150);
        vertex(x, y+100);
        vertex(x-50, y+150);
        vertex(x-50, y+200);
        endShape();
        popMatrix();
        turning[1][13]=true;
        turning[3][13]=true;
        q=-q;
      }
      break;

    case '4':  //kick
      turning[1][12]=true; // off other actions
      act[14]+=q;

      if (act[14]==1) {
        fill(body_color_emy);
        stroke(body_color_emy);
        pushMatrix();
        scale(0.8);
        ellipse(x, y-25, 50, 50);
        strokeWeight(3);
        noFill();
        beginShape();
        vertex(x, y);
        vertex(x+25, y+100);
        vertex(x+5, y+25);
        vertex(x+5, y+75);
        vertex(x-35, y+55);
        vertex(x+5, y+75);
        vertex(x+5, y+25);
        vertex(x-25, y+40);
        vertex(x-60, y+20);
        endShape();
        beginShape();
        vertex(x+50, y+200);
        vertex(x+30, y+150);
        vertex(x+25, y+100);
        vertex(x-15, y+150);
        vertex(x-15, y+200);
        endShape();
        popMatrix();
         if (turning[1][14]==true) {
          q=0;
          action='0';
          turning[1][14]=false;
          turning[1][12]=false;
         }
         
      }

      if (act[14]==2) {
        fill(body_color_emy);
        stroke(body_color_emy);
        pushMatrix();
        scale(0.8);
        ellipse(x, y-25, 50, 50);
        strokeWeight(3);
        noFill();
        beginShape();
        vertex(x, y); 
        vertex(x+2.5, y+25); 
        vertex(x-25, y+40);
        vertex(x-60, y+20); 
        vertex(x-25, y+40); 
        vertex(x+2.5, y+25); 
        vertex(x+12.5, y+65);
        vertex(x-25, y+50);
        vertex(x+12.5, y+65);
        vertex(x+2.5, y+25);
        vertex(x+12.5, y+100);
        vertex(x+15, y+150);
        vertex(x+37.5, y+200);
        vertex(x+15, y+150);
        vertex(x+12.5, y+100);
        vertex(x-40, y+125);
        vertex(x-60, y+162.5);
        endShape();
        popMatrix();
      }
      
      if (act[14]==3) {
        fill(body_color_emy);
        stroke(body_color_emy);
        pushMatrix();
        scale(0.8);
        ellipse(x, y-25, 50, 50);
        strokeWeight(3);
        noFill();
        beginShape();
        vertex(x, y); 
        vertex(x, y+25);
        vertex(x-25, y+40); 
        vertex(x-60, y+20); 
        vertex(x-25, y+40); 
        vertex(x, y+25); 
        vertex(x+20, y+55);
        vertex(x-15, y+45);
        vertex(x+20, y+55);
        vertex(x, y+25);
        vertex(x, y+100);
        vertex(x-65, y+100);
        vertex(x-115, y+125);
        vertex(x-65, y+100);
        vertex(x, y+100);
        vertex(x+10, y+150);
        vertex(x+40, y+200);
        endShape();
        popMatrix();
        turning[3][14]=false;
      }
      
      if (act[14]==4) {
        fill(body_color_emy);
        stroke(body_color_emy);
        pushMatrix();
        scale(0.8);
        ellipse(x, y-25, 50, 50);
        strokeWeight(3);
        noFill();
        beginShape();
        vertex(x, y); 
        vertex(x, y+25);
        vertex(x-25, y+40); 
        vertex(x-60, y+20); 
        vertex(x-25, y+40); 
        vertex(x, y+25); 
        vertex(x+20, y+55);
        vertex(x-15, y+45);
        vertex(x+20, y+55);
        vertex(x, y+25);
        vertex(x, y+100);
        vertex(x-65, y+100);
        vertex(x-115, y+125);
        vertex(x-65, y+100);
        vertex(x, y+100);
        vertex(x+10, y+150);
        vertex(x+40, y+200);
        endShape();
        popMatrix();
        turning[1][14]=true;
        turning[3][14]=true;
        q=-q;
      }
      break;

    case '6': //upper Guard
      fill(body_color_emy);
      stroke(body_color_emy);
      pushMatrix();
      scale(0.8);
      ellipse(x, y-25, 50, 50);
      strokeWeight(3);
      noFill();
      beginShape();
      vertex(x, y);
      vertex(x+25, y+100);
      vertex(x+5, y+25);
      vertex(x-25, y+10);
      vertex(x-50, y-35);
      vertex(x-25, y+10);
      vertex(x+5, y+25);
      vertex(x-40, y+10);
      vertex(x-35, y-35);
      endShape();
      beginShape();
      vertex(x+50, y+200);
      vertex(x+30, y+150);
      vertex(x+25, y+100);
      vertex(x-15, y+150);
      vertex(x-15, y+200);
      endShape();
      popMatrix();
      turning[1][12]=false; //other action off
      action='0';

      //set of decrease of protect gage
      if (rect_width_emy_pro>0) {
        rect_width_emy_pro-=2;
      }
      if (rect_width_emy_pro<=2) {
        turning[0][16]=true;
        transparent_emy=50;
      }
      break;

    case '7':  //middle G
      fill(body_color_emy);
      stroke(body_color_emy);
      pushMatrix();
      scale(0.8);
      ellipse(x, y-25, 50, 50);
      strokeWeight(3);
      noFill();
      beginShape();
      vertex(x, y);
      vertex(x+25, y+100);
      vertex(x+5, y+25);
      vertex(x-5, y+55);
      vertex(x-30, y+15);
      vertex(x-5, y+55);
      vertex(x+5, y+25);
      vertex(x-10, y+55);
      vertex(x-20, y+15);
      endShape();
      beginShape();
      vertex(x+50, y+200);
      vertex(x+30, y+150);
      vertex(x+25, y+100);
      vertex(x-15, y+150);
      vertex(x-15, y+200);
      endShape();
      popMatrix();
      action='0';
      turning[1][12]=false; //other actions off

      //set of decrease of protect gage
      if (rect_width_emy_pro>0) {
        rect_width_emy_pro-=2;
      }
      if (rect_width_emy_pro<=2) {
        turning[0][16]=true;
        transparent_emy=50;
      }
      break;     

    case '8':  //lower G
      fill(body_color_emy);
      stroke(body_color_emy);
      pushMatrix();
      scale(0.8);
      ellipse(x, y-25, 50, 50);
      strokeWeight(3);
      noFill();
      beginShape();
      vertex(x, y);
      vertex(x+25, y+100);
      vertex(x+5, y+25);
      vertex(x-15, y+70);
      vertex(x-15, y+130);
      vertex(x-15, y+70);
      vertex(x+5, y+25);
      vertex(x-5, y+130);
      endShape();
      beginShape();
      vertex(x+50, y+200);
      vertex(x+30, y+150);
      vertex(x+25, y+100);
      vertex(x-15, y+150);
      vertex(x-15, y+200);
      endShape();
      popMatrix();
      turning[1][12]=false;  // other actions off
      action='0';

      //set of protect gages
      if (rect_width_emy_pro>0) {
        rect_width_emy_pro-=2*(multiple_mine+0.2);
      }
      if (rect_width_emy_pro<=2) {
        turning[0][16]=true;
        transparent_emy=50;
      }
      break;
    }// end of switch

    x_emy=x;
    y_emy=y;
  }//void move
}
