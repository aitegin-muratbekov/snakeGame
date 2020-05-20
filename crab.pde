class Crab {
  // State
  int x;
  int y;
  int dx, dy = 1;
  int i = 0;
  int speed;
  // Behaviour
  Crab() {
    x = (int) random(4, field.width);
    y = (int) random(4, field.height);
    speed = (int) random(1, 3);
    
  }
  
  boolean isColliding(int x, int y) {
    return this.x == x &&  this.y == y;
  }
  
  void move() {
    if (speed == 1) {
      x = x + dx;
    } else if (speed == 2) {
      y = y + dy;
    }
    if (x == field.width - 1 || y == field.height - 1 || x == 0 || y == 0) { 
      dx *= -1;
      dy *= -1;
    } else if (dx != -1) {
      dx = 1;
      dy = 1;
    }
   
  }
  
  void draw() {
    int pixelX = centeringShiftX + x * cellPixelSize;
    int pixelY = centeringShiftY + y * cellPixelSize;
    crabSprite.draw(pixelX, pixelY, cellPixelSize, cellPixelSize);
  }

}
