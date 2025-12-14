class Asteroid extends Floater {
  
  public Asteroid() {
    myCenterX = (int)(Math.random()*400);
    myCenterY = (int)(Math.random()*400);
    myPointDirection = (int)(Math.random()*360);
    myXspeed = 0.5*sin((float)myPointDirection*PI/180);
    myYspeed = 0.5*cos((float)myPointDirection*PI/180);
  }
  
  double green = Math.random();
  public int shapetype = (int)(Math.random()*3)+3;
  
  public void move ()   //move the floater in the current direction of travel
  {       
    myCenterX += myXspeed;    
    myCenterY += myYspeed;     
    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    } 
    
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
    
    myPointDirection += 5;
  }   
  
  public void show (int sides)
  { 
    float r = sides*2;
    
    translate((float)myCenterX, (float)myCenterY);
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    rotate(dRadians);
    
    beginShape();
    for (int i = 0; i < sides; i++) {
      if (sides == 3) {fill(189, 88, 89);}
      if (sides == 4) {fill(192, 175, 81);}
      if (sides == 5) {fill(89, 107, 190);}
      if (green >= 0.99) {fill(104, 192, 80);}
      float angle = TWO_PI * i/sides;
      float x = r * cos(angle);
      float y = r * sin(angle);
      vertex(x, y);
    }
    endShape();
    
    beginShape();
    for (int i = 0; i < sides; i++) {
      if (sides == 3) {fill(252, 118, 119);}
      if (sides == 4) {fill(255, 232, 106);}
      if (sides == 5) {fill(118, 142, 252);}
      if (green >= 0.99) {fill(137, 255, 105);}
      float angle = TWO_PI * i/sides;
      float x = (0.9*r) * cos(angle);
      float y = (0.9*r) * sin(angle);
      vertex(x, y);
    }
    endShape();
    
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }   
}
