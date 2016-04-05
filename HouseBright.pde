import processing.video.*;
Movie housevid;

void setup() {
  fullScreen();
  frameRate(25);
  housevid = new Movie(this, "house.mp4");
  housevid.loop();
  housevid.loadPixels();
    loadPixels();}
  void movieEvent(Movie m) {
    m.read();
}

void draw() {
    for (int x = 0; x < housevid.width; x++) {
    for (int y = 0; y < housevid.height; y++ ) {
      int lock = x + y*housevid.width;
      
      float red,green,blue;
      
      red = red (housevid.pixels[lock]);
      green = green (housevid.pixels[lock]);
      blue = blue (housevid.pixels[lock]);
      
      float maxdist = 200; //edit this number for the size of the light
      
      float d = dist(x, y, mouseX, mouseY);
      float adjustbrightness = 255*(maxdist-d)/maxdist; //how dark the screen is
      
      red += adjustbrightness;
      green += adjustbrightness;
      blue += adjustbrightness;
      
      red = constrain(red, 0, 255);
      green = constrain(green, 0, 255);
      blue = constrain(blue, 0, 255);
      
      color c = color(red, green, blue);
      //color c = color(r);      
      //only use above if only use red values, black and white
      pixels[y*width + x] = c;
    }
  }
  updatePixels();
}
