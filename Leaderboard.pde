class Leaderboard {
  //Array to store names
  IntDict inventory = new IntDict();
  //String[] ListNames= {" "};
  //Array to store score
  int[] ListScore={0};

  //Array to store key 
  char[] key_l={' '};
  // Variable for name and score
  String typed=new String(key_l);

  String[] keepn=new String[5];
  int[] keeps=new int[5];


  //variables to control game
  //boolean w_names=true;
  //boolean w_score=false;
  //boolean w_Leader=false;

  Leaderboard() {
  }
  /*void set() {
   size(1024, 512);    // since we use variables we can change the size of the window and still be able to play (we are just constrained by the text size)
   //background(50);
   textAlign(CENTER);
   rectMode(CENTER);
   frameRate(10);
   }*/

  void drawLeader() {
    background(10, 100, 200);
    //This will show the page to input na/*me
    //if (w_names) {
    //This are the instructions
    textSize(25);

    text("Type your Name", width/2, height/2-50 );
    noFill();
    stroke(255);
    //Bottoms to select paddle size
    textSize(15);
    text("Click any key to continue", width/2, height-70 );
    //This is to make show the name
    if (keyPressed) {
      key_l = (char[]) append(key_l, key);
      typed=new String(key_l);
    }
    text(typed, width/2, height/2 );
    //println(typed);

    //Logic for moving to the next stage and saving named

    if (mousePressed) {
      typed="  ";
      key_l=new char[1];
      key_l[0]=' ';
    }
  }
  void showLeader() {
    //This will show the page to input score
    //if (w_score) {
    //This are the instructions
    textSize(25);
    //text("Type your Score", width/2, height/2-50 );
    noFill();
    stroke(255);
    //Bottoms to select paddle size
    textSize(15);
    //text("Click the mouse to see Leaderboard", width/2, height-70 );
    //This is to make show the name
    text(typed, width/2, height/2 );
    //print(typed);

    //Logic for moving to the next stage and saving named

    /*if (ListScore[0]!=0) {
     ListScore=append(ListScore, s.getScore());
     inventory.set(typed, s.getScore());
     } else {
     ListScore[0]=s.getScore();
     inventory.set(typed, s.getScore());
     }*/
    //w_score=false;
    //w_names=true;
    typed="  ";
    key_l=new char[1];
    key_l[0]=' ';

    inventory.sortValuesReverse();
    ListScore=reverse(ListScore);
    String[] keepn=inventory.keyArray();
    int[] keeps=inventory.valueArray();

    if (keepn.length>=1) {
      text("1. " + keepn[0] + " Score:" +keeps[0], width/4, height/4);
    } else {
      text("1. " + " " + " Score: 0", width/4, height/4);
    }
    if (keepn.length>=2) {
      text("2. " + keepn[1] + " Score:" +keeps[1], width/4, height/4+20);
    } else {
      text("2. " + " " + " Score: 0", width/4, height/4+20);
    }
    if (keepn.length>=3) {
      text("3. " + keepn[2] + " Score:" +keeps[2], width/4, height/4+40);
    } else {
      text("3. " + " " + " Score: 0", width/4, height/4+40);
    }
    if (keepn.length>=4) {
      text("4. " + keepn[3] + " Score:" +keeps[3], width/4, height/4+60);
    } else {
      text("4. " + " " + " Score: 0", width/4, height/4+60);
    }
    if (keepn.length>=5) {
      text("5. " + keepn[4] + " Score:" +keeps[4], width/4, height/4+80);
    } else {
      text("5. " + " " + " Score: 0", width/4, height/4+80);
    }

    //text("5. " + keepn[4] + "Score:" +keeps[4], width/4, height/4+80);
  }




  //This is to add the new charaters to the name array
  void keyReleased() {
    key_l = (char[]) append(key_l, key);
    typed=new String(key_l);
  }
}
