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
for (int x = 0; x < movie.width; x++) {
for (int y = 0; y < movie.height; y++ ) {
      int loc = x + y*movie.width;
      // Get the R,G,B values from image
      float r,g,b;
      r = red (movie.pixels[loc]);
      g = green (movie.pixels[loc]);
      b = blue (movie.pixels[loc]);
      // Calculate an amount to change brightness based on proximity to the mouse
      float maxdist = 100;//dist(0,0,width,height);
      float d = dist(x, y, mouseX, mouseY);
      float adjustbrightness = 255*(maxdist-d)/maxdist;
      r += adjustbrightness;
      g += adjustbrightness;
      b += adjustbrightness;
      // Constrain RGB to make sure they are within 0-255 color range
      r = constrain(r, 0, 255);
      g = constrain(g, 0, 255);
      b = constrain(b, 0, 255);
      // Make a new color and set pixel in the window
      color c = color(r, g, b);
      //color c = color(r);
      pixels[y*width + x] = c;
    }
  }
  updatePixels();
}
