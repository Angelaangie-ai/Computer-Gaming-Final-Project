class Score {
  private int score = 0;
  private boolean scoreIncreased = false;

  void increase() {
    if (!scoreIncreased) {
      score += 1;
      score1.play();
      scoreIncreased = true;
    }
  }

  void reset() {
    score = 0;
    scoreIncreased = false;
  }

  void allowScoreIncrease() {
    scoreIncreased = false;
  }

  void draw() {
    pushStyle();

    rectMode(CORNER);
    textAlign(LEFT);
    fill(255);
    textSize(25);
    text("Score: " + score, 10, 10, width, 40);
    if(score>=1)
    {
      frameRate(100);
    }
    if(score>=3)
    {
      frameRate(110);
    }
    
    if(score>=5)
    {
      frameRate(120);
    }
    
     if(score>=7)
    {
      frameRate(130);
    }
    
     if(score>=9)
    {
      frameRate(140);
    }
    
    popStyle();
  }
  int getScore() {
    return score;
  }
}
