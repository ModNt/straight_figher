Title title;
My_avatar chara;
Fighting_display fight;
Enemy enemy;

boolean [][] turning =new boolean[10][20];  //bamennkirikae
int [] act =new int [20];  //actions of charactar
PImage imgE, imgN, imgH;  //backgrounds
char reaction, reaction_emy, display_main='1'; //for switch method
int r_mine=200, g_mine=200, b_mine=0, transparent=255;  //protect bar mine
int r_emy=200, g_emy=200, b_emy=0, transparent_emy=255; //protect bar enemy
int transparent_HP_mine=255, transparent_HP_emy=255;
int body_color_mine, body_color_emy;
int k=1, p=1, q=1; //to cope 
int AI; //to cope
int ball_speed=20;
float ball_x;
float dist_ball_emy;
float multiple_emy, multiple_mine; //set for each mode
float framerate=40;

//position
float x_mine, y_mine;
float x_emy, y_emy;
//HP,HPGuarge
float rect_width_mine=360;
float rect_width_mine1, rect_width_mine2;
float rect_width_emy=360;
//protect bar
float rect_width_mine_pro=190, rect_width_emy_pro=190;
float distance;  //distance of avatars for collision
float g=AI/framerate; //for AI
float AI_punch, AI_punch_random;  //easy 6 normal 3   hard 1
float AI_kick, AI_kick_random;  //easy 16  normal 13  hard 11
//Guard probability
float AI_uG, AI_uG_random;
float AI_mG, AI_mG_random;
float AI_lG, AI_lG_random;
//damage
float dmg_punch=10; //base
float dmg_kick=20;  //base
float dmg_jpkck=50;  //base

void setup() {
  size(1250, 700);
  frameRate(framerate);
  /*画像は以下のURLから引用（フリー素材)
  https://pixabay.com/ja/photos/コロッセオ-ローマ-古代の-1123400/
  https://free-materials.com/tag/空/
  https://www.beiz.jp/download_M/mountain/00004.html
  */
  imgE=loadImage("sky.jpg");
  imgN=loadImage("mountain_00004.jpeg");
  imgH=loadImage("rome-1123400_1280.jpeg");

  //set first figures
  for (int i =0; i<20; i++) {
    for (int j =0; j<10; j++) {
      turning[j][i]=false;
    }
  }
  for (int i =0; i<10; i++) {
    act[i]=0;
  }

  /* turning
   [][0] ... display change
   [1][] ...to fight display
   [2][] ... easy mode
   [3][] ...normal mode
   [4][] ...hard mode
   [][1] ...base status   
   [][2] ...jump
   [][3] ...punch
   [][4] ...kick
   [][5] ...jumping kick
   [][6] ...guard upper
   [][7] ...guard middle
   [][8] ...guard lower
   [][9] ...special attack
   etc...
   
        my turnings are [][1 digit]   (Ex.[][1]
   enemy's turnings are [][2 digits]  (Ex.[][11]
   */

  //declearation of classes
  title = new Title();
  title.setup();
  chara = new My_avatar (x_mine, y_mine, reaction);
  chara.setup();
  fight = new Fighting_display();
  enemy = new Enemy(x_emy, y_emy, reaction_emy);
  enemy.setup();
}

void draw() {

  switch(display_main) {
  case '1': //title display
    title.draw();
    break;

  case '2':  //now loading display
    k+=60/framerate;
    if (k<200) {
      background(0);
      stroke(255, 255-k*2);
      fill(255, 255-k*2);
      textSize(20);
      text("Now Loading", width/2, height/2);
      pushMatrix();
      translate(width/2-30, height/2);
      rotate(PI/12*k);
      rect(0, 0, 30, 30);
      popMatrix();
    } else {
      display_main='3';
    }
    break;

  case '3': //fight display
    if (turning[2][0]==true) {  //easy
      //backgrounds
      image(imgE, 0, 0);
      textSize(50);
      fill(0, 255, 0);
      text("EASY", 560, 120);
      multiple_emy=1;
      multiple_mine=1;
      AI_punch=8;
      AI_kick=17;
      AI_uG=27;
      AI_mG=37;
      AI_lG=47;
      
      for (int i=0; i<width; i+=50) {
        for (int j=600; j<height; j+=50) {
          if ((j==600&&i%100==0)||(j==650&&i%100!=0)) {
            fill(0, 0, 255);
          } else {
            noFill();
          }
          stroke(0);
          rect(i, j, 50, 50);
        }
      }// end of for
      
    } else if (turning[3][0]==true) {   //Normal
      image(imgN, 0, 0);
      noStroke();
      fill(255,100);
      rect(0,0,width,height);
      strokeWeight(1);
      textSize(50);
      fill(0, 255, 0);
      text("NORMAL", 520, 120);
      multiple_emy=1.7;
      multiple_mine=1/1.7;
      AI_punch=6;
      AI_kick=15;
      AI_uG=25; 
      AI_mG=35;
      AI_lG=45;
      
      for (int i=0; i<width; i+=50) {
        for (int j=625; j<height+50; j+=50) {
          stroke(0);
          ellipse(i, j, 50, 50);
        }
      }
      
    } else if (turning[4][0]==true) {   //hard
      image(imgH, 0, 0);
      noStroke();
      fill(255,100);
      rect(0,0,width,height);
      strokeWeight(1);
      textSize(50);
      fill(0, 255, 0);
      text("HARD", 550, 120);
      multiple_emy=2;
      multiple_mine=0.3;
      AI_punch=5;
      AI_kick=12;
      AI_uG=25;
      AI_mG=32;
      AI_lG=42;
      
      for (int i=0; i<width; i+=25) {
        for (int j=600; j<height+50; j+=25) {
          stroke(0);
          triangle(i+25, j, i, j+25, i+50, j+25);
        }
      }
      
    } //end of mode set

    fight.draw();
    AI++;
    if (transparent_HP_mine==0||transparent_HP_emy==0) {
      display_main='4';
    }
    break;

  case '4':  //finish of fight
    fight.draw();
    fight.ending();
    
    //to reset ,set first figures
    if (keyPressed) {
      if (key=='r') {
        for (int i =0; i<20; i++) {
          for (int j =0; j<10; j++) {
            turning[j][i]=false;
          }
        }

        for (int i =0; i<10; i++) {
          act[i]=0;
        }
        rect_width_mine=360;
        rect_width_emy=360;
        rect_width_mine_pro=190;
        rect_width_emy_pro=190;
        p=1;
        q=1;
        k=1;
        r_mine=200; 
        g_mine=200; 
        b_mine=0; 
        transparent=255;
        r_emy=200;
        g_emy=200; 
        b_emy=0; 
        transparent_emy=255;
        transparent_HP_mine=255; 
        transparent_HP_emy=255;
        display_main='1';
        title.setup();
        chara.setup();
        enemy.setup();
      }
    }
    
    turning[5][0]=true;
    
  }// end of switch method
}
