Ball ball;
ArrayList<Brick> bricks;
Paddle paddle;
ArrayList<Confetti> stars;  //for falling stars when you win

void setup() {
  size(500, 500);
  setupGame();
}


void setupGame() {
  background(0);
  ball = new Ball(width/2, height/2, 30, color(#13F05E));
  bricks = new ArrayList<Brick>();
  paddle = new Paddle(width/2, height - 30, width/5, 20, color(#DCE022));

  int brickWidth = width/10; 
  int brickHeight = height/40; //divide screen by 4, then by 10 for 10 bricks

  //create the 10x10 grid of bricks
  for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
      //-2 in size is for space between bricks
      Brick b = new Brick(i*brickWidth, j*brickHeight + height/6, brickWidth-2, brickHeight-2, color(#982241));
      bricks.add(b);
    }
  }

  //create a list of confetti that will fall if the user wins 
  stars = new ArrayList<Confetti>();
  for (int i=0; i< 30; i++) {
    float innerRad = random(2, 6); //determine inner star radius before outer radius
    Confetti c = new Confetti(random(0, width), -10, innerRad, random(innerRad+3, innerRad+6), color(random(256), random(256), random(256)) );
    stars.add(c);
  }
}








void draw() {

  fill(0, 0, 0, 15);
  rect(0, 0, width, height);

  //display all remaining bricks
  for (int i=0; i<bricks.size(); i++) {  
    Brick b = bricks.get(i);
    b.display();
  }

  ball.display();
  ball.move();

  paddle.display();
  paddle.move();

  //if ball hits paddle
  if (ball.x + ball.size/2 > paddle.x   //ball is to the right of the left side of the paddle
    && ball.x - ball.size/2 < paddle.x + paddle.pwidth //ball is to the left of right side of paddle
    && ball.y + ball.size/2 > paddle.y) {  //ball has crossed the top of the paddle

    ball.setVelocity(ball.vx, -ball.vy);          //negate the Y velocity of the ball
  }

  //if brick hits ball
  for (int i = 0; i < bricks.size(); i++) {
    Brick b = bricks.get(i);
    //check when top of ball hits bottom of brick
    if ((ball.x+ball.size/2) > b.x  //right edge of ball to right of left edge of brick
      && (ball.x-ball.size/2) < b.x + b.bwidth //left edge of ball to left of right edge of brick
      && ball.y - ball.size/2 < (b.y+b.bheight) //top edge of ball to the top of bottom edge of brick
      && ball.y + ball.size/2 > (b.y+b.bheight)  ) { //bottom of ball is below bottom of brick
      ball.setVelocity(ball.vx, -ball.vy);
      bricks.remove(b);
    }
    //ADVANCED: check when bottom of ball hits top of brick
    else if ((ball.x+ball.size/2) > b.x  //right edge of ball to right of left edge of brick
      && (ball.x-ball.size/2) < b.x + b.bwidth //left edge of ball to left of right edge of brick
      && ball.y + ball.size/2 > b.y   //bottom edge of ball below top edge of brick
      && ball.y - ball.size/2 < b.y) { //top edge of ball above top edge of brick
      ball.setVelocity(ball.vx, -ball.vy);
      bricks.remove(b);
    }
  }

  //draw number bricks left on the screen
  fill(#DCE022);
  textSize(18);
  textAlign(LEFT);
  text("Bricks: " + bricks.size(), 10, 30);


  //check if you lost
  if (ball.y + ball.size/2 > height) { 
    background(0); //erase everything
    gameEndScreen("You lose!");
  }

  //check if you won
  if (bricks.size() == 0) {
    background(0); //erase everything
    gameEndScreen("You Win!");
    //make confetti fall
    for (int i=0; i < stars.size(); i++) {
      Confetti c = stars.get(i);
      c.display();
      c.move();
    }
  }
}

//same for both win and lose screen
void gameEndScreen(String text) {

  textSize(50);
  textAlign(CENTER, CENTER); //put (x,y) of text in middle of text
  text(text, width/2, height/3.5);
  ball.setVelocity(0, 0); //stop the ball so the game will stop

  //Play Again button
  fill(#1288B2);
  rect(width/6, height/2, width*2/3, height/5);
  fill(#DCE022);
  textSize(40);
  text("Play Again", width/2, height/2 + height/10);
}




void mousePressed() {
  //if Play Again button is pressed, then reset game
  if (ball.vx == 0 && ball.vy == 0 //speed should only be zero when game ended
    && mouseX > width/6 && mouseX < width/6 + width*2/3 //if in bounds of play again button
    && mouseY > height/2 && mouseY < height/2 + height/5 ) { 
    setupGame();
  }
}