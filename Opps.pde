class Opps extends Floater {
  
  public Opps() {
    myCenterX = (int)(Math.random()*400);
    myCenterY = (int)(Math.random()*400);
  }
  
  public void move (double shipx, double shipy)   
  {         
    myPointDirection = atan2((float)(shipy - myCenterY), (float)(shipx - myCenterX));
    myXspeed = 2*cos((float)myPointDirection);
    myYspeed = 2*sin((float)myPointDirection);
    
    myCenterX += myXspeed;    
    myCenterY += myYspeed;     
  }
  
  public void show ()
  { 
    float r = 5;
    
    translate((float)myCenterX, (float)myCenterY);
    rotate((float)myPointDirection);
    
    beginShape();
    for (int i = 0; i < 3; i++) {
      fill(170, 89, 167);
      float angle = TWO_PI * i/3;
      float x = r * cos(angle);
      float y = r * sin(angle);
      vertex(x, y);
    }
    endShape();
    
    beginShape();
    for (int i = 0; i < 3; i++) {
      fill(242, 120, 222);
      float angle = TWO_PI * i/3;
      float x = (0.9*r) * cos(angle);
      float y = (0.9*r) * sin(angle);
      vertex(x, y);
    }
    endShape();
    
    rotate(-1*(float)myPointDirection);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }   
}
