class Pixel {
  int x, y, newColor, oldColor, spriteFrame;
  boolean running;
  Pixel(int x, int y, int newColor, int spriteFrame) {
    this.x = x;
    this.y = y;
    this.newColor = newColor;
    this.oldColor = 0;
    this.spriteFrame = 0;
    this.running = true;
  }

  void update() {
    if (running) {
      spriteFrame++;
      if (spriteFrame >= (pixelSize + waitTime)) {
        running = false;
        numCompleted++;
      }
    }
  }
  
  void display() {
    float brightFactor = spriteFrame % (pixelSize/2);
    brightFactor *= 127/(pixelSize/2);
    
    if (spriteFrame < 0) {
      fill(oldColor, 255, 127);
      rect(x, y, pixelSize, pixelSize);
    } else if (spriteFrame < (pixelSize/2)) {
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

  void reset(int newSpriteFrame) {
    //println("RESETTING " + x + "," + y);
    spriteFrame = newSpriteFrame;
    float xoff = increment * (x/pixelSize);
    float yoff = increment * (y/pixelSize);
    oldColor = newColor;
    newColor = int(noise(xoff, yoff, zoff)*255);
    running = true;
  }
}

