class GoldApple {
  // State
  final int COLOR = 0xFFF9FA47;
  int x, y;
  float time = 0;

  // Behaviour
  GoldApple () {    
    x = (int) random(2, field.width);
    y = (int) random(2, field.height);
  }

  boolean isColliding(int x, int y) {
    return this.x == x &&  this.y == y;
  }

  void drawA() {
    if (snake.appleCount >= 4 && time < 400) {
      time += 20;
      stroke(255);
      fill(0);
      rect(50, 500, 403, 50);
      
      noStroke();
      fill(255, 0, 0);
      rect(52, 502, time, 48);
      
      stroke(0);
      fill(COLOR);
      int pixelX = centeringShiftX + x * cellPixelSize;
      int pixelY = centeringShiftY + y * cellPixelSize;
      image(gApple, pixelX, pixelY, cellPixelSize, cellPixelSize);
    } else if (time >= 70) {
      snake.appleCount = 0;
      time = 0;      
    }
  }
}
