Field field= new Field(30, 30);
Snake snake = new Snake(field, 0, 0, 1, 0);
Apple apple = new Apple();
GoldApple goldApple = new GoldApple();

final int MENU_STATE =  1;
final int GAME_STATE =  2;
final int PAUSE_STATE = 3;
final int DEATH_STATE = 4;

int state = MENU_STATE;

int colour = 0xFFEFFF15;
int colour2 = 255;

void setup() {
  fullScreen();

  recalcDrawingSizes();
  loadImages();
  loadSounds();  
}

void draw() {
  switch(state) {
    case MENU_STATE:
      drawMenu();
      break;
    case GAME_STATE:
      drawGame();
      break;
  }
}

void drawMenu() {
  background(0);
  textAlign(CENTER, CENTER);
  textSize(300);
  if (colour == 0xFF15D2FF) {
    colour = 0xFFFF1538;
  } else if(colour == 0xFFFF1538) {
    colour = 0xFFEFFF15;
  } else {
    colour = 0xFF15D2FF;
  }
  fill(colour);
  text("SNAKE", width / 2, height / 2);
  
  textSize(50);
  fill(colour2);
  text("press ENTER to play", width / 2, height / 2 + 150);
  if(colour2 == 255) {
    colour2 = 0;
  } else if (colour2 == 0){
    colour = 255;
  }
  
  delay(500);
}

void drawGame() { 
  background(0);
  
  field.draw();
  apple.draw();
  goldApple.drawA();
  snake.draw();
  snake.drawPoints();
  snake.move();
  
  delay(200);
}

void keyPressed() {
  switch(state) {
    case MENU_STATE:
      keyPressedInMenu();
      break;
    case GAME_STATE:
      keyPressedInGame();
      break;
  }  
}

void keyPressedInMenu() {
  if (keyCode == ENTER) {
    state = GAME_STATE;
  }
}

void keyPressedInGame() {  
  switch(keyCode) {
    case UP:
      snake.turnUp();
      break;
    case DOWN:
      snake.turnDown();
      break;
    case LEFT:
      snake.turnLeft();
      break;
    case RIGHT:
      snake.turnRight();
      break;
    }
}
