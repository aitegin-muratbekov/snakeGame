class Apple {
  // State
  final int COLOR = 0xFF520202;
  int x, y;

  // Behaviour
  Apple() {
    do {
      x = (int) random(field.width);
      y = (int) random(field.height);
    } while (snake.isColliding(x, y));
  }

  boolean isColliding(int x, int y) {
    return this.x == x &&  this.y == y;
  }

  void draw() {
    stroke(0);
    fill(COLOR);
    
    int pixelX = centeringShiftX + x * cellPixelSize;
    int pixelY = centeringShiftY + y * cellPixelSize;
    image(appleImage, pixelX, pixelY, cellPixelSize, cellPixelSize);
  }
}
