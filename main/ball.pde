class Ball {
  PVector location;
  PVector velocity;
  PVector acceleration;

  float angle = 270;
  float startVelo;

  Ball(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(5, 0);
    acceleration = new PVector();

    velocity.rotate(angle);
    startVelo = velocity.mag();
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
    if (location.x+20 > width-20) {
      return true;
    } else if (location.x < 0+20) {
      return true;
    }
    if (location.y > height-20) {
      return true;
    } else if (location.y < 0+20) {
      return true;
    }
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

  void calcPath(PVector g) {
    float gravity = 0.0982;
    float cos = cos(radians(angle));
    //float sin = sin(radians(angle));
    
    for (int x = 0; x < width; x += 10) {
      float y = tan(radians(angle))*x-(gravity)/(2*sq(startVelo)*sq(cos))*sq(x);
      //println(y);
      fill(255, 0, 0);
      ellipse(x, 400-y, 20, 20);
    }
  }
}
