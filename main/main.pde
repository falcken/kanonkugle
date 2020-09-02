ArrayList<Ball> balls = new ArrayList<Ball>();
PVector gravity = new PVector(0, 0.0982);

int ang1;
int ang2;

boolean firing1 = false;
boolean firing2 = false;

void setup () {
  size(1000, 600);
  balls.add(new Ball(270, 100, 400));
  balls.add(new Ball(270, 600, 400));
}

void draw() {
  background(255);
  for (int i = 0; i < balls.size(); i++) {
    if (firing1) {
      balls.get(0).applyForce(gravity);
      balls.get(0).update();
    }
    balls.get(0).display();
  }

  for (int i = 0; i < balls.size(); i++) {
    if (firing2) {
      balls.get(1).applyForce(gravity);
      balls.get(1).update();
    }
    balls.get(1).display();
  }
}

void keyPressed() {
  if (key == 'e' && !firing1) {
    firing1 = true;
  } else if (key == 'e' && firing1) {
    firing1 = false;
  }

  if (key == 's') {
    ang2 += 2;
  }
}
