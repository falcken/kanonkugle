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
            
    if (firing1) {
      b.applyForce(gravity);
      b.update();
      if (b.isDone()) {
        b.reset(1);
      }
    }
    b.display();
  }

  for (int i = 0; i < balls2.size(); i++) {
    Ball b = balls2.get(i);
    
    if (firing2) {
      b.applyForce(gravity);
      b.update();
      if (b.isDone()) {
        b.reset(2);
      }
    }
    b.display();
  }
}

void keyPressed() {
  if (key == 'e' && !firing1) {
    firing1 = true;
  } else if (key == 'e' && firing1) {
    firing1 = false;
  }

  if (key == 's') {
    balls1.get(balls1.size()).angDown();
  }
  
  if (key == 'w') {
    balls2.get(balls2.size()).angUp();
  }
}
