class Paddle {

  
    float x; //x position 
    float y;  //y position
    //no vx - paddle's speed follows the mouse
    //no vy - paddle does not go up or down
    float pwidth;  //paddle width
    float pheight; //paddle height
    color pColor;
 
  Paddle(float startx, float starty, float startWidth, float startHeight, color c) {
    
    x = startx;
    y = starty;
    pwidth = startWidth;
    pheight = startHeight;
    pColor = c;    

  }
  
  void display() {
    noStroke();
    fill(pColor);
    rect(x,y,pwidth,pheight);    
  }
  
  void move() {
   //move only along x direction
     x = mouseX; 
     //keep paddle from going off the right edge of the screen
     if (x > width - pwidth) {
       x = width - pwidth;       
     }
  }
  
  
  
  
  
  
}
  
  
  
  
  
  
  
  
  