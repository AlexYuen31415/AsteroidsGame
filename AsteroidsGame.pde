Spaceship ship;
Star[] stars = new Star[200];

public void setup() {
  size(400, 400);
  background(0);
  ship = new Spaceship();
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
}

public void draw() {
  background(0);
  for (int i = 0; i < stars.length; i++) {
    stars[i].blink();
    stars[i].show();
  }
  ship.turn();
  ship.show();
  ship.move();
}

public void keyPressed() {
  if((key == 'h') || (key == 'H')) {
    ship.hyperspace();
  }
  
  if((key == 'w') || (key == 'W')) {
    ship.accelerate(2);
  }
}
