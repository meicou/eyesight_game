Img img;
ESign eSign1;
ESign eSign2;
ESign eSign3;
ESign eSign4;
ESign eSign5;
ESign eSign6;
ESign eSign7;

int childrenX = 20;
int childrenY = 435;
int eSignX = 240;
int eSignY = 100;
int eSign;
int eSignUp;
int eSignDown;
int eSignRight;
int eSignLeft;
int direction;
int i = 0;
int childrenXsize=250;
int childrenYsize=250;
int life ;
int score =0;
 import ddf.minim.*;
Minim minim;
AudioPlayer song;
AudioPlayer alarm;

  

//Game state
int status ;
final int GAME_INITIAL    = 1;
final int Level1_start    = 2;
final int Level1_play     = 3;
final int Level2_start    = 4;
final int Level2_play     = 5;
final int Level3_start    = 6;
final int Level3_play     = 7;
final int GAME_LOSE       = 8;
final int GAME_WIN        = 9;
final int Level1_pause    = 10;
final int Level2_pause    = 11;
final int Level3_pause    = 12;


void setup(){
  size (600,640);
  life = 3 ; 
  img = new Img();
  eSign1 = new ESign(eSignX,eSignY,2,4,2,110);
  eSign2 = new ESign(eSignX,eSignY,2,5,2,95);
  eSign3 = new ESign(eSignX,eSignY,2,6,2,70);
  eSign4 = new ESign(eSignX,eSignY,2,6,2,55);
  eSign5 = new ESign(eSignX,eSignY,2,7,2,40);
  eSign6 = new ESign(eSignX,eSignY,2,7,2,25);
  eSign7 = new ESign(eSignX,eSignY,2,8,2,10);
  status = 1;
  reset();
}

void draw(){
  noStroke();


  switch(status){
    
   case GAME_INITIAL:
   img.startshow();  
   break;
   
   case Level1_start:
   img.change();
  //img.level1_startpic1_show();
   break;
      
   case Level1_play:
   img.show();
//   changeSize1();
   eSign1.show(img);
   eSign1.move(); 
//   checkLose();  
   displaylife();
   drawScore();
   change();
//   println(score);
   break;
   
   case Level2_start:
   img.change();
  //img.level1_startpic1_show();
   break;
   
   case Level2_play:
   img.show();
//   changeSize2();
   eSign4.show(img);
   eSign4.move(); 
   //checkLose();
   displaylife();
   drawScore();
   change();
   println(score);
   break;
   
   case Level3_start:
   img.change();
  //img.level1_startpic1_show();
   break;
   
   case Level3_play:
   img.show();
//   changeSize3();
   eSign7.show(img);
   eSign7.move(); 
   //checkLose();
   displaylife();
   drawScore();
   change();
   println(score);
   break;
   
   case GAME_LOSE :
   img.endshow();
   finalScore(); 
   break;
  
  }
}

void changeSize1(){
  if(i<4){
      eSign1.show(img);
       eSign1.move(); 
  }
  if(i>=4&&i<8){
      eSign2.show(img);
      eSign2.move(); 
    }
 
 if(i>=8 && i<12){
      eSign3.show(img);
      eSign3.move(); 
      
    }    
 
 if(i>=12 && i<16){
      eSign4.show(img);
      eSign4.move(); 
    }
  
}

void changeSize2(){
  if(i>=16 && i<20){
      eSign2.show(img);
       eSign2.move(); 
  }
  if(i>=20 && i<24){
      eSign3.show(img);
       eSign3.move(); 
  }
 
  if(i>=24 && i<28){
      eSign4.show(img);
       eSign4.move(); 
  }
  if(i>=28 && i<32){
      eSign5.show(img);
       eSign5.move(); 
  }
  if(i>=32 && i<36){
      eSign6.show(img);
      eSign6.move();     
  }
}

void changeSize3(){
  if(i>=36 && i<40){
      eSign3.show(img);
      eSign3.move(); 
  }
  if(i>=40 && i<44){
      eSign4.show(img);
      eSign4.move(); 
  }
 
  if(i>=44 && i<48){
      eSign5.show(img);
      eSign5.move(); 
  }
  if(i>=48 && i<52){
      eSign6.show(img);
      eSign6.move(); 
  }
  if(i>=52 && i<56){
      eSign7.show(img);
      eSign7.move(); 
  }
}

void displaylife(){
   int []lifeArr = new int[3];
   for (int n = 0; n < life ; n++ ) {  
   image(img.heart,400+50*n,60);
   lifeArr[n] = n;   
   }
}

void change() {
  if(status == Level1_play && score == 160) {
    status = Level2_start;
  }
  if(status == Level2_play && score == 200) {
    status = Level3_start; 
  }
  if(status == Level3_play && score == 200) {
    status = GAME_WIN;
  }
}
/*
void checkLose() {  
  if(status == Level1_play||status == Level2_play||status == Level3_play){
   if(key != UP && eSign == eSignUp) {
     life--;
   }
   if(key != DOWN && eSign == eSignDown) {
     life--;
   }
   if(key != RIGHT && eSign == eSignRight) {
     life--;
   }
   if(key != LEFT && eSign == eSignRight) {
     life--;
   }
   if (life==0){
       status = GAME_LOSE;
   }
}
}
*/


void drawScore() {
  noStroke();
  fill(104,37,138);
  textAlign(CENTER, CENTER);
  textSize(23);
  text("SCORE:"+score, 100, 70);
}
void finalScore(){
  noStroke();
  fill(255,241,0);
  textAlign(CENTER,CENTER);
  textSize(50);
  text(score,310,160);
}

void reset(){
   displaylife();
   life=3;
   score = 0;
   drawScore(); 
   eSign1.speed = 4;
   eSign1.y=100;
   //status = GAME_INITIAL ;
} 

void keyPressed() {
  if (status == Level1_play||status == Level2_play||status == Level3_play) {
    if(eSign1.y > 640-childrenYsize) {
         if (key == CODED ) {
            switch(keyCode){
              case UP:
                    direction = 0;
                    
      //              if(eSign == eSignUp){
      //                 score+=10;
      //               }
                     break;
              case DOWN:
                    direction = 1;
      //              if(eSign == eSignDown){
      //                 score+=10;
      //               } 
                     break;
              case LEFT:
                    direction = 2;
      //               if(eSign == eSignLeft){
      //                 score+=10;
      //               } 
                     break;
              case RIGHT:
                    direction = 3;
      //               if(eSign == eSignRight){
      //                 score+=10;
      //               }
                     break;
          }
          if (direction == eSign1.type){
            score += 10;
            eSign1.y = eSignY;
            eSign1.canChange = true;
          }
     }
   }
}
   if (key == ENTER) {
    switch(status) {

    case GAME_INITIAL:
      status = Level1_start;
     break;
    
    case Level1_start:
     status = Level1_play;
     break;
   
    case Level1_play:
     status = Level1_pause  ;
     break;
   
     case Level1_pause:
     status = Level1_play;
     break;
     
     case Level2_start:
     status = Level2_play;
     reset();
     break;
   
    case Level2_play:
     status = Level2_pause  ;
     break;
   
     case Level2_pause:
     status = Level2_play;
     break;
     
     case Level3_start:
     status = Level3_play;
     reset();
     break;
   
    case Level3_play:
     status = Level3_pause  ;
     break;
   
     case Level3_pause:
     status = Level3_play;
     break;
  
 
    case GAME_WIN:
      status = GAME_INITIAL;
      reset();
      break;

    case GAME_LOSE:
      status = GAME_INITIAL;
      reset();
      break;
    }
  }
}
