PFont mainFont;

PImage appleImage;
PImage gApple;
PImage grass;
Sprite crabSprite;

void loadImages() {
  appleImage = loadImage("apple.png");
  gApple = loadImage("gApple.png");
  grass = loadImage("grass.png");
  crabSprite = new Sprite("crab/crab_", 4, ".png"); 
}

class Sprite {
  PImage[] images;
  int frame;
  
  int skip, _skip;
  int time = -1;
  
  Sprite(String imagePrefix, int count, String extension) {
    this(imagePrefix, count, extension, 3);
  }
  
  Sprite(String imagePrefix, int count, String extension, int skip) {
    images = new PImage[count];

    for (int i = 0; i < count; i++) {
      String fileName = imagePrefix + i + extension;
      images[i] = loadImage(fileName);
    }
    
    this.skip = skip;
    _skip = skip;
  }

  void draw(float x, float y, float width, float height) {
    if (time < 0 || time > 0) {
      _skip--;
      if (_skip < 0) {
        _skip = skip;
        frame = (frame + 1) % images.length;
      }
      if (time > 0) {
        --time;
      }
      
      image(images[frame], x, y, width, height);
    } else {
      image(images[0], x, y, width, height);
    }
  }
}
