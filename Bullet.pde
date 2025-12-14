class Bullet extends Floater {
  
  public Bullet(double x, double y, double direction, double xspeed, double yspeed) {
    myCenterX = x;
    myCenterY = y;
    myPointDirection = direction;
    myXspeed = xspeed + 3*Math.cos(direction*PI/180);
    myYspeed = yspeed + 3*Math.sin(direction*PI/180);
  }
  
  public void show ()
  {
    translate((float)myCenterX, (float)myCenterY);
    
    noStroke();
    fill(0, 134, 165);
    ellipse(0, 0, 5, 5);
    fill(3, 177, 223);
    ellipse(0, 0, 4.5, 4.5);

    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }   
}
