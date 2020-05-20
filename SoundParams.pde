import ddf.minim.*;

Minim minim;
AudioPlayer appleSound;
AudioPlayer loseSound;

void loadSounds() {
  minim = new Minim(this);
  appleSound = minim.loadFile("apple.mp3");
  loseSound = minim.loadFile("lose.wav");
}
