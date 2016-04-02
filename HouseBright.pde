import processing.video.*;
Movie movie;

void setup() {
  fullScreen();
  frameRate(30);
  movie = new Movie(this, "house.mp4");
  movie.loop();
  movie.loadPixels();
  // Only need to load the pixels[] array once, because we're only
  // manipulating pixels[] inside draw(), not drawing shapes.
    loadPixels();}
  void movieEvent(Movie m) {
    m.read();
}

void draw() {
  brightdraw();
}