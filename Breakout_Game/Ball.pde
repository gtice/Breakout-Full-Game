//A class that represents a bouncing ball
class Ball {

  float x; //x position of ball
  float y;  //y position of ball
  float vx; //how much x changes when ball moves
  float vy; //how much y changes when ball moves
  float size;  //width and height of ball
  color ballColor;

  Ball(float nx, float ny, float nsize, color c) {
    x = nx;
    y = ny;
    size = nsize;
    ballColor = c;

    vx = 2;//random(-5,5); //negative means left, positive means right
    vy = 2; //random(-7,7);
  }

  void move() {
    x = x + vx;
    y = y + vy;

    if (x + size/2 > width || x - size/2 < 0) { //if the ball goes out of bounds
      vx = -vx; //go in the opposite direction
    }

    if (y + size/2 > height || y - size/2 < 0) { //if the ball goes out of bounds
      vy = -vy;  //go in the opposite direction
    }
  }

  void display() {
    noStroke();
    fill(ballColor);
    ellipse(x, y, size, size);
  }

  void setVelocity(float newvx, float newvy) {
    vx = newvx;
    vy = newvy;
  }
}