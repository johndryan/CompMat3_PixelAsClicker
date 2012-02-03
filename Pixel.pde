class Pixel {
  int x, y, newColor, oldColor, spriteFrame;
  Pixel(int x, int y, int spriteFrame) {
    this.x = x;
    this.y = y;
    this.newColor = int(random(255));
    this.oldColor = int(random(255));
    this.spriteFrame = spriteFrame;
  }

  void update() {
    spriteFrame++;
    if (spriteFrame >= (pixelSize + waitTime)) {
      spriteFrame = 0;
      oldColor = newColor;
      newColor = int(random(255));
    }
  }
  
  void display() {
    float brightFactor = spriteFrame % (pixelSize/2);
    brightFactor *= 127/(pixelSize/2);
    
    if (spriteFrame < (pixelSize/2)) {
      fill(oldColor, 255, 127);
      rect(x, y, pixelSize, pixelSize);
      fill(newColor, 255, 127);
      triangle(x, y, x + pixelSize, y, x + pixelSize, y + pixelSize);
      fill(oldColor, 255, brightFactor+127);
      //if (x == 0 && y == 0) println(spriteFrame + " [A] == " + brightFactor);
      triangle(x, y, x + pixelSize - spriteFrame, y + spriteFrame, x + pixelSize, y + pixelSize);
    } else if (spriteFrame < pixelSize) {
      fill(newColor, 255, 127);
      rect(x, y, pixelSize, pixelSize);
      fill(oldColor, 255, 127);
      triangle(x, y, x, y + pixelSize, x + pixelSize, y + pixelSize);
      fill(newColor, 255, brightFactor+12);
      //if (x == 0 && y == 0) println(spriteFrame + " [B] == " + brightFactor);
      triangle(x, y, x + pixelSize - spriteFrame, y + spriteFrame, x + pixelSize, y + pixelSize);
    } else {
      fill(newColor, 255, 127);
      rect(x, y, pixelSize, pixelSize);
    }
  }

}

