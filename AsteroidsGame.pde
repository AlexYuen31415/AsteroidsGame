Spaceship ship;
Star[] stars = new Star[200];
ArrayList<Asteroid> asteroids = new ArrayList();
ArrayList<Bullet> bullets = new ArrayList();
ArrayList<Opps> opps = new ArrayList();
int lastshot;
int newshot;
int points = 0;
int numshapes = 100;
int finalscore;
boolean alive = true;

public void setup() {
  size(400, 400);
  background(0);
  ship = new Spaceship();
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  for (int i = 0; i < numshapes; i++) {
    asteroids.add(new Asteroid());
  }
}

public void draw() {
  background(0);
  for (int i = 0; i < stars.length; i++) {
    stars[i].blink();
    stars[i].show();
  }
  
  for (int i = asteroids.size()-1; i >= 0; i--) {
    asteroids.get(i).move();
    asteroids.get(i).show(asteroids.get(i).shapetype);
    if (collide(ship.myCenterX, ship.myCenterY, asteroids.get(i).myCenterX, asteroids.get(i).myCenterY) == true) {
      asteroids.remove(i);
      if (millis() >= 7000) {ship.shipHp--;}
    }
  }
  
  for (int i = 0; i < bullets.size(); i++) {
    bullets.get(i).move();
    bullets.get(i).show();
    for (int j = 0; j < asteroids.size(); j++) {
      if (collide(bullets.get(i).myCenterX, bullets.get(i).myCenterY, asteroids.get(j).myCenterX, asteroids.get(j).myCenterY) == true) {
         if (asteroids.get(j).green >= 0.99) {points += Math.pow(asteroids.get(j).shapetype, 7);}
         else {points += Math.pow(asteroids.get(j).shapetype, 6);}
         bullets.remove(i);
         asteroids.remove(j);
         break;
      }
    }
  }
  
  for (int i = opps.size()-1; i >= 0; i--) {
    opps.get(i).move(ship.myCenterX, ship.myCenterY);
    opps.get(i).show();
    if (collide(ship.myCenterX, ship.myCenterY, opps.get(i).myCenterX, opps.get(i).myCenterY) == true) {
      opps.remove(i);
      if (millis() >= 7000) {ship.shipHp--;}
    }
  }
  
  ship.turn();
  ship.show();
  ship.move();
  
  if (millis() % 15 == 0 && ship.ammo < 5) {ship.ammo++;}
  if (millis() % 100 == 0) {opps.add(new Opps());}
  if (millis()%(3*(int)(asteroids.size()/10)+1) == 0 && asteroids.size() <= 200) {asteroids.add(new Asteroid());}
  
  fill(255);
  stroke(255);
  strokeWeight(3);
  text("Points: " + points, 20, 30);
  text("Hp: " + ship.shipHp, 20, 45);
  text("Ammo: " + ship.ammo, 20, 60);
  if (millis() < 7000) {text("Invincibility Remaining: " + ((float)7000 - millis())/1000 + "s", 20, 75);}
  
  if (ship.shipHp <= 0) {
    if (alive == true) {finalscore = points; alive = false;}
  background(0);
  strokeWeight(5);
  stroke(255, 67, 67);
  fill(255, 67, 67);
  text("You Died", 100, 150, 300, 250); 
  if (0 < millis()%1000 && millis()%1000 < 100) {background(0);}
  if (150 < millis()%1000 && millis()%1000 < 250) {background(0);}
  text("Score: " + finalscore, 100, 200);
  }
}

public boolean collide(double x1, double y1, double x2, double y2) {
  if (dist((float)x1, (float)y1, (float)x2, (float)y2) <= 10) {
    return true;
  }
  return false;
}

public void keyPressed() {
  if((key == 'h') || (key == 'H')) {
    ship.hyperspace();
  }
  
  if((key == 'w') || (key == 'W')) {
    ship.accelerate(1.1);
  }
  
  if((key == 's') || (key == 'S')) {
    ship.deAccelerate(0.8);
  }
  if((key == ' ')) {
    newshot = millis();
    if (newshot - lastshot >= 100 && ship.ammo > 0 && bullets.size() <= 15) {
      lastshot = millis();
      bullets.add(new Bullet(ship.myCenterX, ship.myCenterY, ship.myPointDirection, ship.myXspeed, ship.myYspeed));
      bullets.add(new Bullet(ship.myCenterX, ship.myCenterY, ship.myPointDirection+146.31, ship.myXspeed/4, ship.myYspeed/4));
      bullets.add(new Bullet(ship.myCenterX, ship.myCenterY, ship.myPointDirection-146.31, ship.myXspeed/4, ship.myYspeed/4));
      ship.ammo--;
    }
  }
}
