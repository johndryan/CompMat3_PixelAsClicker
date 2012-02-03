int pixelSize = 40;
int waitTime = 60;

int spriteInc = 0;
int newColor, oldColor;

void setup() {
  size (1280,720);
  noStroke();
  smooth();
  colorMode(HSB, 255);

  newColor = int(random(255));
  oldColor = int(random(255));
}

void draw() {
  for (int currentRow = 0; currentRow < (height/pixelSize); currentRow++) {
    for (int currentCol = 0; currentCol < (width/pixelSize); currentCol++) {
      drawPixel(currentCol*pixelSize, currentRow*pixelSize, spriteInc);
    }
  }
  
  spriteInc++;
  if (spriteInc >= (pixelSize + waitTime)) {
    spriteInc = 0;
    newColor = int(random(255));
    oldColor = int(random(255));
  }
}

void drawPixel(int xVal, int yVal, int spriteInc) {
  float brightFactor = spriteInc % (pixelSize/2);
  brightFactor *= 127/(pixelSize/2);
  if (spriteInc < (pixelSize/2)) {
    fill(oldColor, 255, 127);
    rect(xVal, yVal, pixelSize, pixelSize);
    fill(newColor, 255, 127);
    triangle(xVal, yVal, xVal + pixelSize, yVal, xVal + pixelSize, yVal + pixelSize);
    fill(oldColor, 255, brightFactor+127);
    if (xVal == 0 && yVal == 0) println(spriteInc + " [A] == " + brightFactor);
    triangle(xVal, yVal, xVal + pixelSize - spriteInc, yVal + spriteInc, xVal + pixelSize, yVal + pixelSize);
  } else if (spriteInc < pixelSize) {
    fill(newColor, 255, 127);
    rect(xVal, yVal, pixelSize, pixelSize);
    fill(oldColor, 255, 127);
    triangle(xVal, yVal, xVal, yVal + pixelSize, xVal + pixelSize, yVal + pixelSize);
    fill(newColor, 255, brightFactor+12);
    if (xVal == 0 && yVal == 0) println(spriteInc + " [B] == " + brightFactor);
    triangle(xVal, yVal, xVal + pixelSize - spriteInc, yVal + spriteInc, xVal + pixelSize, yVal + pixelSize);
  } else {
    fill(newColor, 255, 127);
    rect(xVal, yVal, pixelSize, pixelSize);
  }
}
