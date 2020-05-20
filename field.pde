class Field {
  // State
  final int COLOR = 0xFF4AC426;

  int width;
  int height;

  // Behaviour
  Field(int width, int height) {        
    this.width = width;
    this.height = height;
  } 

  boolean areCoordsInside(int x, int y) {
    return x >= 0 && x < width &&
      y >= 0 && y < height;
  }

  void draw() {
    noStroke();
    fill(COLOR);
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {        
        int pixelX = centeringShiftX + x * cellPixelSize;
        int pixelY = centeringShiftY + y * cellPixelSize;     
        rect(pixelX, pixelY, cellPixelSize, cellPixelSize);
        image(grass, pixelX, pixelY, cellPixelSize, cellPixelSize);
      }
    }
  }
}  
