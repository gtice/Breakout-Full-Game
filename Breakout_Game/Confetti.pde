class Confetti {
  
    float x; //x position 
    float y;  //y position 
    float rad1;  //inner radius of star
    float rad2; //outer radius of star (for outer points of star)
    color cColor;
    float vy;
 
  Confetti(float startx, float starty, float startRad1, float startRad2, color c) {
    
    x = startx;
    y = starty;
    rad1 = startRad1;
    rad2 = startRad2;
    cColor = c;    
    vy = random(1,10);
  }
  
  void display() {
    noStroke();
    fill(cColor);    
    star(x, y, rad1, rad2, 5); 
  }
  
  
  //code copied from here: https://processing.org/examples/star.html
  void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
  
  
  
  
  
  void move() {
    y = y + vy;
    
    //when star gets to bottom of screen, let it fall from top again
    if (y > height) {
      y = -10;
    }
    
  }
  
  
  
  
  
  
}