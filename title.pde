class Title {
  String display;
  int x=255;
  Title() {
  }

  void setup() {
    display="start";
  }

  void draw() {
    
    switch (display) {
    case "start": //the title
      background(0);
      fill(255);
      textSize(78);
      text("STRAIGHT FIGHTER", 230, 200);
      fill(255, x);
      textSize(40);
      text("Press SPACE to Start", 400, 500);
      if (x<0) {
        x=255;
      } else {
        x-=40;
      }

      //to change display
      if (keyPressed) {
        if (key==' ') {
          display="mode_select";
        }
      }
      break;

    case "mode_select": //mode select
      background(0);
      fill(255);
      textSize(78);
      text("Select Mode!", 370, 150);
      textSize(30);
      text("Explanation of control: ENTER", 700, 650);
      text("Easy...e", 550, 250);
      text("Normal...n", 550, 350);
      text("Hard...h", 550, 450);

      if (keyPressed) {  //to change display
        if (key=='e') {
          //display="e";
          display_main='2';
          turning[2][0]=true;
        } else if (key=='n') {
          //display="n";
          display_main='2';
          turning[3][0]=true;
        } else if (key=='h') {
          //display="h";
          display_main='2';
          turning[4][0]=true;
        } else if (key==ENTER) {
          display="explanation";
        }
      }
      break;

    case "explanation": //explaination of control
      background(0);
      fill(255);
      textSize(50);
      text("MOVEMENT EXPLANATION", 300, 100);
      textSize(40);
      text("A", 189, 315);
      text("Q", 189, 265);
      text("W", 239, 265);
      text("E", 289, 265);
      text("D", 289, 315);
      text("J ... punch", 189, 400);
      text("K ... kick", 189, 450);
      text("L ... Jamping kick", 189, 500);
      text("Protect Gage", 170, 600);

      textSize(20);
      text("return to press SPACE", 20, 20);
      text("The gage gets shorter while you do Guard command.", 170+20, 630);
      text("If the gage is empty,you cannot Guard until the gage's color turns yellow.", 170+20, 650);
      text("to protect enemy's jamping kick", 820, 250);
      text("to protect enemy's punch", 840, 300);
      text("to protect enemy's kick", 820, 350);

      textSize(30);
      text("Move", 210, 220);
      text("Y ... upper Guard", 550, 250);
      text("H ... middle Guard", 550, 300);
      text("N ... lower Guard", 550, 350);

      noFill();
      stroke(255);
      for (int xx=200; xx<=300; xx+=50) {
        for (int yy=250; yy<=300; yy+=50) {
          rect(xx-25, yy-25, 50, 50);
        }
      }

      if (keyPressed) {  //back to mode select diaplay
        if (key==' ') {
          display="mode_select";
        }
      }
    }// end of switch
    
  } //void draw
}
