class Snake {
  // State
  final int COLOUR = 0xFFC3C610;
  final int DEAD_COLOUR = 0xFFED1F1F;
  final int SCORE_COLOUR = 255;
  final int POINTS_SIZE = 30;
  final int MARGIN_TOP = POINTS_SIZE / 2;

  Field field;
  int[] y;
  int[] x;
  int dx;
  int dy;
  int head;
  int length;
  boolean alive;
  int colour;
  int points;
  int appleCount;

  // Behaviour
  Snake(Field field, int x, int y, int dx, int dy) {
    this.field = field;

    this.dx = dx;
    this.dy = dy;

    length = 3;
    alive = true;

    this.x = new int[length];
    this.y = new int[length];
    for (int i = 0; i < length; i++) {
      this.x[i] = x;
      this.y[i] = y;
    } 
    colour = COLOUR;

    points = 0;
  }


  boolean isColliding(int x, int y) {
    for (int i = 0; i < length; i++) {
      if (this.x[i] == x &&  this.y[i] == y) {
        return true;
      }
    }

    return false;
  }

  void turnUp () {
    if (dy != 1) {
      dx = 0;
      dy = -1;
    }
  }

  void turnDown() {
    if (dy != -1) {
      dx = 0;
      dy = 1;
    }
  }

  void turnLeft () {
    if (dx != 1) {
      dx = -1;
      dy = 0;
    }
  }

  void turnRight() {
    if (dx != -1) {
      dx = 1;
      dy = 0;
    }
  }

  void move() {
    if (!alive) return;

    int nextX = x[head] + dx;
    int nextY = y[head] + dy;
    if (field.areCoordsInside(nextX, nextY) && !isColliding(nextX, nextY)) {
      if (apple.isColliding(nextX, nextY)) {
        appleSound.play();
        appleSound.rewind();
        apple = new Apple();

        head = (head + 1) % length;
        int[] newX = new int[length + 1];
        int[] newY = new int[length + 1];
        for (int i = 0; i < head; i++) {
          newX[i] = x[i];
          newY[i] = y[i];
        }
        newX[head] = nextX;
        newY[head] = nextY;

        for (int i = head; i < length; i++) {
          newX[i + 1] = x[i];
          newY[i + 1] = y[i];
        }
        x = newX;
        y = newY;

        ++length;
        ++points;
        snake.appleCount++;
      } else if (goldApple.isColliding(nextX, nextY)) {
        if (appleCount >= 4) {
          points *= 2;
          appleSound.play();
          appleSound.rewind();
        }
        goldApple = new GoldApple();
        snake.appleCount = 0;
      } else {      
        head = (head + 1) % length;
        x[head] = nextX;
        y[head] = nextY;
    }
  } else {
    alive = false;
    colour = DEAD_COLOUR;
  }
}


void draw() {
  noStroke();
  fill(colour);
  
  for (int i = 0; i < length; i++) {
    int pixelX = centeringShiftX + x[i] * cellPixelSize;
    int pixelY = centeringShiftY + y[i] * cellPixelSize;
    if (i != head) {
      rect(pixelX, pixelY, cellPixelSize, cellPixelSize);
    } else {
      rect(pixelX, pixelY, cellPixelSize, cellPixelSize);      
    }
  } 
} 

void drawPoints() {
  fill(SCORE_COLOUR);
  textAlign(CENTER, CENTER);
  textSize(POINTS_SIZE);
  text("Points: " + points, width / 2, MARGIN_TOP);
}
}  
