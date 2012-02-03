Pixel[][] allPixels;
Pixel p;

int pixelSize = 30;
int waitTime = 0;
int numCompleted = 0;

float increment = 0.01;
float zoff = 0.0;
float zincrement = 0.01; 

int currentframe = 0;
int spriteFrame = 0;
float numOfRows, numOfCols;

void setup() {
  size (780, 600);
  frameRate(30);
  noStroke();
  smooth();
  colorMode(HSB, 255);
  
  noiseDetail(8,0.65f);
  
  allPixels = new Pixel[int(width/pixelSize)+1][int(height/pixelSize)+1];

  float xoff = 0.0; // Start xoff at 0

  for (int currentRow = 0; currentRow < (height/pixelSize); currentRow++) {
    xoff += increment;
    float yoff = 0.0;
    for (int currentCol = 0; currentCol < (width/pixelSize); currentCol++) {
      yoff += increment;
      //int currentSprite = currentCol;
      //println("New sprite set to " + int(noise(xoff, yoff, zoff)*pixelSize*-2));
      p = new Pixel(currentCol*pixelSize, currentRow*pixelSize, int(noise(xoff, yoff, zoff)*255), -int(noise(xoff, yoff, zoff)*pixelSize*2));
      allPixels[currentCol][currentRow] = p;
    }
  }
}

void draw() {
  //background(163, 120, 196);
  //background(0);

  if (numCompleted >= (height/pixelSize)*(width/pixelSize)) {
    println("RESET");
    for (int currentRow = 0; currentRow < (height/pixelSize); currentRow++) {
      for (int currentCol = 0; currentCol < (width/pixelSize); currentCol++) {
        Pixel p = allPixels[currentCol][currentRow];
        float xoff = increment * currentCol;
        float yoff = increment * currentRow;
        p.reset(-int(noise(xoff, yoff, zoff)*pixelSize*2));
      }
    }
    numCompleted = 0;
  }

  for (int currentRow = 0; currentRow < (height/pixelSize); currentRow++) {
    for (int currentCol = 0; currentCol < (width/pixelSize); currentCol++) {
      Pixel p = allPixels[currentCol][currentRow];
      p.update();
      p.display();
    }
  }
  
  zoff += zincrement;
}
