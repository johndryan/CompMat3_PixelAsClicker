ArrayList<Pixel> allPixels;
Pixel p;

int pixelSize = 40;
int waitTime = 10;

float increment = 0.01;
float zoff = 0.0;
float zincrement = 0.01; 

int currentframe = 0;
int spriteFrame = 0;
float numOfRows, numOfCols;

void setup() {
  size (800, 600);
  //frameRate(30);
  noStroke();
  smooth();
  colorMode(HSB, 255);
  
  noiseDetail(8,0.65f);
  
  allPixels = new ArrayList<Pixel>();

  float xoff = 0.0; // Start xoff at 0

  for (int currentRow = 0; currentRow < (height/pixelSize); currentRow++) {
    xoff += increment;
    float yoff = 0.0;
    for (int currentCol = 0; currentCol < (width/pixelSize); currentCol++) {
      yoff += increment;
      int currentSprite = currentCol;
      //int currentSprite = currentCol - currentRow;
      if (currentSprite >= (pixelSize + waitTime)) currentSprite = currentSprite % (pixelSize + waitTime);
      p = new Pixel(currentCol*pixelSize, currentRow*pixelSize, currentSprite, int(noise(xoff, yoff, zoff)*255));
      allPixels.add(p);
    }
  }
}

void draw() {
  //background(163, 120, 196);
  background(0);
  
  for (int i=0; i<allPixels.size(); i++) {
    Pixel p = allPixels.get(i);
    p.update();
    p.display();
  }
  
  zoff += zincrement;
}
