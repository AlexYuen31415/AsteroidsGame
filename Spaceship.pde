class Spaceship extends Floater {
  public Spaceship() {
    corners = 12;
    
    double a = (-6.0/13.0)*(52.0/3.0+6.5*Math.sqrt(5.0/9.0));
    double b = 3.25*Math.sqrt(5.0/9.0);
    double a1 = 13.0/9.0;
    double b1 = (-4.0/3.0)*b;
    double c1 = Math.pow(b, 2)-36;
    double x1 = (- b1 - Math.sqrt(Math.pow(b1, 2) - 4 * (a1 * c1)))/(2 * a1);
    double x2 = (b1 - Math.sqrt(Math.pow(b1, 2) - 4 * (a1 * c1)))/(2 * a1);
    double y1 = (-2.0/3.0)*x1+b;
    double y2 = (-2.0/3.0)*-8+b;
    double y3 = (-2.0/3.0)*a-b;
    double y4 = (-2.0/3.0)*x2-b;
    double y5 = -Math.sqrt(36 - Math.pow(5.5, 2));
    
    xCorners = new double[]{5.5, 12, 12, 5.5, x1, -8, a, x2, x2, a, -8, x1};
    yCorners = new double[]{y5, y5, -y5, -y5, y1, y2, y3, y4, -y4, -y3, -y2, -y1};
  
    myColor = color(153);
    myCenterX = width/2;
    myCenterY = height/2;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
  }
  
  public void setXspeed(double x) {
    myXspeed = x;
  }
  
  public void hyperspace() {
    myXspeed = 0;
    myYspeed = 0;
    myCenterX = Math.random() * 400;
    myCenterY = Math.random() * 400;
    myPointDirection = Math.random() * 360;
  }
  
  public void turn ()   
  {     
    double dx = mouseX - myCenterX;
    double dy = mouseY - myCenterY;
    myPointDirection = (180/PI)*((float)atan2((float)dy, (float)dx));
  }   
  
  public void show ()  //Draws the floater at the current position  
  {
    fill(153);  
    strokeWeight(1);
    stroke(115);
    
    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    
    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);
    
    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex((float)xCorners[nI], (float)yCorners[nI]);
    }
    endShape(CLOSE);
    
    fill(0, 179, 225);
    stroke(0, 133, 170);
    ellipse(0, 0, 12.25, 12.25);
    
    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }   
}
