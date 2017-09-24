class Brick {
  
    float x; //x position
    float y;  //y position
    float bwidth;  //width of brick
    float bheight; //height of brick
    color brickColor;
 
  Brick(float startx, float starty, float startWidth, float startHeight, color c) {
    
    x = startx;
    y = starty;
    bwidth = startWidth;
    bheight = startHeight;
    brickColor = c;    
  }
  
  void display() {
    noStroke();
    fill(brickColor);
    rect(x,y,bwidth,bheight);    
  }
  
  void move() {
   //do nothing!!! bricks don't move!!! 
  }
  

  
}