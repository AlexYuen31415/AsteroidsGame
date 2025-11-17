class Star {
  private int myX, myY;
  private double size, phase;
  
  public Star() {
    myX = (int)(Math.random()*400);
    myY = (int)(Math.random()*400);
    size = Math.random();
    phase = Math.random()*TWO_PI;
  }
  
  public void show() {
    fill(255);
    noStroke();
    ellipse(myX, myY, (float)size, (float)size);
    phase += TWO_PI/180;
  }
  
  public void blink() {
    size = 2 + 2 * sin((float)phase);
  }
}
