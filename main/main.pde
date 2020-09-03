ArrayList<Ball> balls1 = new ArrayList<Ball>();
ArrayList<Ball> balls2 = new ArrayList<Ball>();
Tank tank1 = new Tank(50, 400, 1);
Tank tank2 = new Tank(890, 400, 2);


PVector gravity = new PVector(0, 0.0982);

int ang1;
int ang2;

boolean firing1 = false;
boolean firing2 = false;

void setup () {
  size(1000, 600);
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
      if (b.isDone()) {
        handleReset(2);
        b.reset(2);
      }
    }
  }
}

void handleReset(int p) {
  if (p == 1) {
    balls1.add(new Ball(100, 400, 8));
    firing1 = false;
  }

  if (p == 2) {
    balls2.add(new Ball(900, 400, -8));
    firing2 = false;
  }
}

/*void keyPressed() {
  switch (keyCode) {
  case +'W':
    balls1.get(0).angDown();
  case +'S':
    balls1.get(0).angUp();
  case +'A':
    tank1.moveLeft();
  case +'D':
    tank1.moveRight();

    break;
  }
}
*/

  void keyPressed() {
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
}
