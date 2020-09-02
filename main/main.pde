ArrayList<Ball> balls1 = new ArrayList<Ball>();
ArrayList<Ball> balls2 = new ArrayList<Ball>();

PVector gravity = new PVector(0, 0.0982);

int ang1;
int ang2;

boolean firing1 = false;
boolean firing2 = false;

void setup () {
  size(1000, 600);
  balls1.add(new Ball(100, 400));
  balls2.add(new Ball(600, 400));
}

void draw() {
  background(255);
  for (int i = 0; i < balls1.size(); i++) {
    Ball b = balls1.get(i);
    b.calcPath(gravity);

    if (firing1) {
      b.applyForce(gravity);
      b.update();
      b.display();
      if (b.isDone()) {
        handleReset(1);
        b.reset(1);
      }
    }
  }

  for (int i = 0; i < balls2.size(); i++) {
    Ball b = balls2.get(i);

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
    balls1.add(new Ball(100, 400));
    firing1 = false;
  }
  
  if (p == 2) {
    balls2.add(new Ball(100, 400));
    firing2 = false;
  }
}

void keyPressed() {
  if (key == 'e' && !firing1) {
    firing1 = true;
  }
  
  if (key == 'o' && !firing2) {
    firing2 = true;
  }

  if (key == 's') {
    if (!firing1) {
      balls1.get(0).angDown();
    }
  }

  if (key == 'w') {
    if (!firing1) {
      balls1.get(0).angUp();
    }
  }
  
  
}
