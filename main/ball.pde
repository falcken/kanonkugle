class Ball {
  PVector location;
  PVector velocity;
  PVector acceleration;

  float angle = 270;

  Ball(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(5, -5);
    acceleration = new PVector();

    velocity.rotate(angle);
  }

  void applyForce(PVector f) {
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    fill(0);
    ellipse(location.x, location.y, 40, 40);
  }

  void angUp() {
    angle += 2;
    println(angle);
    velocity.rotate(angle);
  }

  void angDown() {
    angle -= 2;
    println(angle);
    velocity.rotate(angle);
  }

  boolean isDone() {
    return false;
  }

  void reset(int p) {
    if (p == 1) {
      for (int i = 0; i < balls1.size(); i++) {
        balls1.remove(i);
      }
    }

    if (p == 2) {
      for (int i = 0; i < balls2.size(); i++) {
        balls2.remove(i);
      }
    }
  }
}
