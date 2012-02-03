size (800, 600);
noStroke();
smooth();
colorMode(HSB, 255);

int newColor = int(random(255));
int oldColor = int(random(255));

int pixelSize = 20;

for (int i = 0; i < pixelSize; i++) {
  int xVal = (i*25)+25;
  int yVal = 20;
  float brightFactor = i % (pixelSize/2);
  brightFactor *= 127/(pixelSize/2);
  //if (brightVal < 0) brightVal+=255;
  if (i < (pixelSize/2)) {
    fill(oldColor, 255, 127);
    rect(xVal, yVal, pixelSize, pixelSize);
    fill(newColor, 255, 127);
    triangle(xVal, yVal, xVal + pixelSize, yVal, xVal + pixelSize, yVal + pixelSize);
    fill(oldColor, 255, brightFactor+127);
    println(brightFactor+127);
    triangle(xVal, yVal, xVal + pixelSize - i, yVal + i, xVal + pixelSize, yVal + pixelSize);
  } else {
    fill(newColor, 255, 127);
    rect(xVal, yVal, pixelSize, pixelSize);
    fill(oldColor, 255, 127);
    triangle(xVal, yVal, xVal, yVal + pixelSize, xVal + pixelSize, yVal + pixelSize);
    fill(newColor, 255, brightFactor);
    println(brightFactor);
    triangle(xVal, yVal, xVal + pixelSize - i, yVal + i, xVal + pixelSize, yVal + pixelSize);
  }
}

