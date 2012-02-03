int pixelSize = 40;
int waitTime = 40;

int spriteFrame = 0;
int newColor, oldColor;

void setup() {
  size (800, 600);
  noStroke();
  smooth();
  colorMode(HSB, 255);

  newColor = int(random(255));
  oldColor = int(random(255));
}

void draw() {
  for (int currentRow = 0; currentRow < (height/pixelSize); currentRow++) {
    for (int currentCol = 0; currentCol < (width/pixelSize); currentCol++) {
      int currentSprite = spriteFrame + currentCol;
      if (currentSprite >= (pixelSize + waitTime)) currentSprite = pixelSize;
      drawPixel(currentCol*pixelSize, currentRow*pixelSize, currentSprite);
    }
  }
  
  spriteFrame++;
  if (spriteFrame >= (pixelSize + waitTime)) {
    spriteFrame = 0;
    oldColor = newColor;
    newColor = int(random(255));
  }
}

void drawPixel(int xVal, int yVal, int spriteFrame) {
  float brightFactor = spriteFrame % (pixelSize/2);
  brightFactor *= 127/(pixelSize/2);
  if (spriteFrame < (pixelSize/2)) {
    fill(oldColor, 255, 127);
    rect(xVal, yVal, pixelSize, pixelSize);
    fill(newColor, 255, 127);
    triangle(xVal, yVal, xVal + pixelSize, yVal, xVal + pixelSize, yVal + pixelSize);
    fill(oldColor, 255, brightFactor+127);
    if (xVal == 0 && yVal == 0) println(spriteFrame + " [A] == " + brightFactor);
    triangle(xVal, yVal, xVal + pixelSize - spriteFrame, yVal + spriteFrame, xVal + pixelSize, yVal + pixelSize);
  } else if (spriteFrame < pixelSize) {
    fill(newColor, 255, 127);
    rect(xVal, yVal, pixelSize, pixelSize);
    fill(oldColor, 255, 127);
    triangle(xVal, yVal, xVal, yVal + pixelSize, xVal + pixelSize, yVal + pixelSize);
    fill(newColor, 255, brightFactor+12);
    if (xVal == 0 && yVal == 0) println(spriteFrame + " [B] == " + brightFactor);
    triangle(xVal, yVal, xVal + pixelSize - spriteFrame, yVal + spriteFrame, xVal + pixelSize, yVal + pixelSize);
  } else {
    fill(newColor, 255, 127);
    rect(xVal, yVal, pixelSize, pixelSize);
  }
}
