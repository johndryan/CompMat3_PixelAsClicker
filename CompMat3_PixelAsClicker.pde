ArrayList<Pixel> allPixels;
Pixel p;

int pixelSize = 40;
int waitTime = 40;

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
  
  allPixels = new ArrayList<Pixel>();

  for (int currentRow = 0; currentRow < (height/pixelSize); currentRow++) {
    for (int currentCol = 0; currentCol < (width/pixelSize); currentCol++) {
      int currentSprite = currentCol;
      //int currentSprite = currentCol - currentRow;
      if (currentSprite >= (pixelSize + waitTime)) currentSprite = currentSprite % (pixelSize + waitTime);
      p = new Pixel(currentCol*pixelSize, currentRow*pixelSize, currentSprite);
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
  
  /*noiseDetail(8,0.65f);
  float xoff = 0.0; // Start xoff at 0
  for (int currentRow = 0; currentRow < numOfRows; currentRow++) {
    xoff += increment;
    float yoff = 0.0;
    for (int currentCol = 0; currentCol < numOfCols; currentCol++) {
      yoff += increment;
      // Calculate noise and scale by pixelSize
      int spriteFrame = int(noise(xoff, yoff, zoff)*127);
      if (spriteFrame >= pixelSize) spriteFrame = pixelSize-1;
      int xPos = (currentCol*pixelWidth)-(pixelWidth/2);
      int yPos = (currentRow*(pixelHeight-5))-(pixelHeight/2);
      image(images[spriteFrame], xPos, yPos);
      //println(currentRow + "," + currentCol + "  =  " + spriteFrame);
    }
  }
  zoff += zincrement;*/
}
