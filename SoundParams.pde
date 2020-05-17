import ddf.minim.*;

Minim minim;
AudioPlayer appleSound;

void loadSounds() {
  minim = new Minim(this);
  appleSound = minim.loadFile("apple.mp3");
}
