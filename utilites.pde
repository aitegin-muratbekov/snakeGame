int cellPixelSize = 25;
int centeringShiftX;
int centeringShiftY;

void recalcDrawingSizes() {
  centeringShiftX = (width - field.width * cellPixelSize) / 2;
  centeringShiftY = (height - field.height * cellPixelSize) / 2;
}
