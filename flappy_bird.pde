import processing.sound.*;
Bird bird;
SoundFile jump;
SoundFile gameover;
SoundFile score1;
Obstacle[] obstacles = new Obstacle[2];
Score score;
PImage bg;
PImage logo;
PImage startGame;
PImage stepSecond;
PImage stepThird;
boolean gameStarted = false;
boolean checkUser;
int START_STATE =0;
int PLAY_STATE = 1;
int GAMEOVER_STATE =2;
int INSTRUCTION_STATE = 3;
int INTRO_STATE = 4;
int STORY_STATE = 5;
int INSTRUCTION_STATE_2 = 6;
int NAME_STATE = 7;
int LEADERBOARD_STATE = 8;
int START1_STATE = 9;
int state;
float storyY;
float storyZ;
Leaderboard lea= new Leaderboard();


int size = 0;



//Array to store key 
char[] key_l={' '};
// Variable for name and score
String typed=new String(key_l);





void setup() {
  state = START_STATE;
  size(1024, 512);
  bird = new Bird(width/2, 0);
  obstacles[0] = new Obstacle(width, random(100, height-100));
  obstacles[1] = new Obstacle(width*1.5+25, random(100, height-100));
  score = new Score();
  bg = loadImage("background.jpg");
  logo = loadImage("logo.png");
  startGame = loadImage("stage1.jpg");
  stepSecond = loadImage("stage2.png");
  stepThird = loadImage ("stage3.png");
  jump = new SoundFile(this, "jump.mp3");
  gameover = new SoundFile(this, "gameover.wav");
  score1= new SoundFile(this, "score.wav");
}

void draw() {
  background(bg);

  if (state == INTRO_STATE) {
    textAlign(CENTER, CENTER);
    imageMode(CENTER);
    image(logo, width/2, height/3, 700, 400);
    fill(255);
    textSize(40);
    text("Angela Busheska", width/2, height/1.97);
    text("Laxman Poudel", width/2, height/1.7);
    text("Shuran Wang", width/2, height/1.5);
    text("Kieran Ameras", width/2, height/1.34);

    text("CS-104 Final Project Spring 2022", width/2, height/1.1);
  } else if (state == STORY_STATE) {

    String story="Among the red mountains, a very old treasure was found.";
    String story1="You can't run across the mountains, since the space there is too tight.";
    String story2 = "However, your bird can do it for you!";


    // Aligning text in center
    textAlign(CENTER);
    // Displaying text
    textSize (20);
    text(story, 2*width/4, height/1.97);
    text(story1, 2*width/4, height/1.7);
    text(story2, 2*width/4, height/1.5);

    // Decrementing y and z values, so that text goes upward and farther away
    storyY=storyY-0.5;
    storyZ=storyZ-0.5;
  } else if (state == INSTRUCTION_STATE) {
    fill(255);
    imageMode(CENTER);
    // image(paper, width/2, height/2, width, height);
    fill(255);
    textSize(50);
    textAlign(CENTER, CENTER);
    text("How to play the game?", width/2, height/12.5);
    textSize(28);
    text("This game will test how you can navigate the bird among the obstacles.", width/2, height/2.5, 680, 300);

    // button
    rectMode(CENTER);
    fill(255);
    rect(width/2, height/1.3, 250, 90);
    fill(211, 157, 19);
    textSize(28);
    textAlign(CENTER, CENTER);
    text("Show additional instructions", width/2, height/1.3, 250, 100);
    if (mousePressed && mouseX>width/2-125 && mouseX<width/2+125 && mouseY>height/1.3-45 && mouseY<height/1.3+45) {
      state =6;
    }
  } else if (state == NAME_STATE) {
    //lea.set();
    // since we use variables we can change the size of the window and still be able to play (we are just constrained by the text size)
    //background(50);
    textAlign(CENTER);
    rectMode(CENTER);
    frameRate(15);
    lea.drawLeader();
  } else if (state == START1_STATE) {
    rectMode(CENTER);
    textSize(32);
    textAlign(CENTER, CENTER);
    fill(200);
    text("Press S to start", 
      width/2, height/2, 
      width, 100);
  }
 else if (state == INSTRUCTION_STATE_2) {
  background(225);
  String step1 = "1) Start the game.";
  String step2 = "2) Balance the bird.";
  String step3 = "3) Pass through the obstacles";
  //Button width and height
  int w = 210;
  int h = 70;


  //images
  imageMode(CENTER);

  //images of game


  fill(0);
  textSize(24);
  text(step1, width/1.5+10, height/9, 530, 300);
  image(startGame, width/1.5+10, (height/9)+100, 150, 170);

  text(step2, width/4+50, height/2.2-70, 550, 300);
  image(stepSecond, width/4+50, height/2.2-70+140, 300, 150);

  text(step3, width/1.5+10, height/1.7-35, 550, 300);
  image(stepThird, width/1.5+10, height/1.7-35+100, 300, 150);


  rectMode(CENTER);
  fill(255);
  rectMode(CENTER);
  fill(255);
  rect(width/2, height/0.9, 250, 90);
  fill(211, 157, 19);
  textSize(28);
  textAlign(CENTER, CENTER);

  rectMode(CENTER);
  fill(255);
  rect(width/2, height/1.1, 100, 50);
  fill(211, 157, 19);
  textSize(20);
  textAlign(CENTER, CENTER);


  text("Username", width/2, height/1.1, 100, 60);
  if (mousePressed && mouseX>width/2-125 && mouseX<width/2+125 && mouseY>height/1.1-45 && mouseY<height/1.1+45) {
    state =7;
  }
} else if (state == START_STATE) {
  background(50, 50, 100);
  rectMode(CENTER);
  fill(255, 200, 255);
  rect(width/2, height/2, size, size);

  if (size<=width/2) {
    size=size+8;
  }



  if (size>width/2) {
    fill(0);
    textSize(50);
    text("_-_-_-_-_-_", width/2-140, height/2-50);
    text("|KASL GAMES|", width/2-160, height/2);
    text("-_-_-_-_-_-", width/2-140, height/2+30);
    textSize(20);
    text("Press any button to start", width/2-130, height/2+130);
  }
} else if (state == PLAY_STATE) {
  bird.draw();
      frameRate(90);

  for (Obstacle o : obstacles) { 
    o.draw();
  }
  score.draw();
  detectCollision();
} else if (state==LEADERBOARD_STATE) {
  textAlign(NORMAL);
  lea.showLeader();
} else if (state== GAMEOVER_STATE) {
  lea.inventory.set(lea.typed, score.getScore());

  rectMode(CENTER);
  textSize(32);
  textAlign(CENTER, CENTER);
  fill(200);
  text("Game over!", 
    width/2, height/2, 
    width, 100);
  text("Press R to restart.", width/2, height/2+30, 
    width, 90);
  text("Click to see Leaderboard", width/2, height-70 );
  lea.typed="  ";
  lea.key_l=new char[1];
  lea.key_l[0]=' ';
}
}

void mousePressed()

{
  //if()action();
  if (state==NAME_STATE) {

    state=START1_STATE;
  } else if (state==GAMEOVER_STATE) {

    state=LEADERBOARD_STATE;
  } else if (state==LEADERBOARD_STATE) {

    state=GAMEOVER_STATE;
  }
}

void keyPressed() {

  if (state==START_STATE && keyPressed ) 
  {
    state = INTRO_STATE;
  } else if (state==INTRO_STATE && keyPressed ) 
  {
    state = STORY_STATE;
  } else if (state == STORY_STATE && keyPressed) {
    state = INSTRUCTION_STATE;
  }

if (state==START1_STATE && key == 'S' || key == 's' ) 
  {
    state = PLAY_STATE;
  } else if (state == PLAY_STATE) {
    action();
  } else if (state==GAMEOVER_STATE  && key == 'R' || key == 'r')
  { 
    state= PLAY_STATE;
    setup();
  }


}
void action() {
  if (state==GAMEOVER_STATE) {
    bird.reset();
    for (Obstacle o : obstacles) { 
      o.reset();
    }
    score.reset();
  } else if (!gameStarted) {
    gameStarted = true;
  } else if (state==PLAY_STATE) {
    bird.jump();
  }
}




void detectCollision() {
  if (bird.y > height || bird.y < 0) {
    gameover.play();
    state = GAMEOVER_STATE;
  }

  for (Obstacle obstacle : obstacles) {
    if (bird.x - bird.size/2.0 > obstacle.topX + obstacle.w) {
      score.increase();
    }

    if (obstacle.topX + obstacle.w < 0) {
      obstacle.reposition();
      score.allowScoreIncrease();
    }

    if (obstacle.detectCollision(bird)) {
      gameover.play();
      state= GAMEOVER_STATE;
    }
  }
}
void keyReleased(Leaderboard lea) {
  lea.key_l = (char[]) append(lea.key_l, key);
  lea.typed=new String(lea.key_l);
}
