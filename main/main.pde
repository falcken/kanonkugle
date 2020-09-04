ArrayList<Ball> balls1 = new ArrayList<Ball>();
ArrayList<Ball> balls2 = new ArrayList<Ball>();
Tank tank1 = new Tank(50, 400, 1);
Tank tank2 = new Tank(890, 400, 2);
HealthBar hb1 = new HealthBar(1);
HealthBar hb2 = new HealthBar(2);

PVector gravity = new PVector(0, 0.0982);

int ang1;
int ang2;

boolean firing1 = false;
boolean firing2 = false;

void setup () {
  size(1000, 600);
  pixelDensity(2);
  smooth();
  balls1.add(new Ball(100, 400, 8));
  balls2.add(new Ball(900, 400, -8));
}

void draw() {
  background(255);

  tank1.display();
  tank2.display();

  for (int i = 0; i < balls1.size(); i++) {
    Ball b = balls1.get(i);
    if (!firing1) b.calcPath(gravity, 1);

    if (firing1) {
      b.applyForce(gravity);
      b.update();
      b.display();
      tank2.Collision(b);
      //println(b.velocity.x);
      if (b.isDone()) {
        handleReset(1);
        b.reset(1);
      }
    }
  }

  for (int i = 0; i < balls2.size(); i++) {
    Ball b = balls2.get(i);
    if (!firing2) b.calcPath(gravity, 2);

    if (firing2) {
      b.applyForce(gravity);
      b.update();
      b.display();
      tank1.Collision(b);
      if (b.isDone()) {
        handleReset(2);
        b.reset(2);
      }
    }
  }
  
  for (int i = 0; i < 2; i++) {
    int th1 = tank1.checkHealth();
    int th2 = tank2.checkHealth();
    
    hb1.displayHealth(th1);
    hb2.displayHealth(th2);
    
    if (th1 == 0) {
      
    }
    
    if (th1 == 0) {
      
    }
  }
}

void handleReset(int p) {
  if (p == 1) {
    balls1.get(0).reset(1);
    balls1.add(new Ball(tank1.location.x+55, 400, 8));
    firing1 = false;
  }

  if (p == 2) {
    balls2.get(0).reset(2);
    balls2.add(new Ball(tank2.location.x-5, 400, -8));
    firing2 = false;
  }
}

void keyPressed() {
  handlePress(keyCode, true);
}

void keyReleased() {
  handlePress(keyCode, false);
}

void handlePress(int k, boolean b) {
  switch (k) {
  case +'W':
    balls1.get(0).isDown = b;
    break;
  case +'S':
    balls1.get(0).isUp = b;
    break;
  case +'A':
    tank1.isLeft = b;
    break;
  case +'D':
    tank1.isRight = b;
    break;
  case +'K':
    balls2.get(0).isDown = b;
    break;
  case +'I':
    balls2.get(0).isUp = b;
    break;
  case +'J':
    tank2.isLeft = b;
    break;
  case +'L':
    tank2.isRight = b;
    break;
  case +'E':
    firing1 = true;
    break;
  case +'O':
    firing2 = true;
    break;
  }
}

/*  void keyPressed() {
  if (key == 'e' && !firing1) {
    //balls1.get(0).rotateToAngle();
    firing1 = true;
  }

  if (key == 'o' && !firing2) {
    firing2 = true;
  }

  if (key == 's') {
    if (!firing1) {
      balls1.get(0).angUp();
    }
  }

  if (key == 'w') {
    if (!firing1) {
      balls1.get(0).angDown();
    }
  }

  if (key == 'a') {
    if (!firing1) {
      tank1.moveLeft();
    }
  }

  if (key == 'd') {
    if (!firing1) {
      tank1.moveRight();
    }
  }

  if (key == 'j') {
    if (!firing1) {
      tank2.moveLeft();
    }
  }

  if (key == 'l') {
    if (!firing1) {
      tank2.moveRight();
    }
  }

  if (key == 'k') {
    if (!firing1) {
      balls2.get(0).angDown();
    }
  }

  if (key == 'i') {
    if (!firing1) {
      balls2.get(0).angUp();
    }
  }
}*/
