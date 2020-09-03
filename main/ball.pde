class Ball {
  PVector location;
  PVector velocity;
  PVector acceleration;

  float angle = 0;
  float startVelo;
  float initialHeading;

  Ball(float x, float y, float v) {
    location = new PVector(x, y);
    velocity = new PVector(v, 0);
    acceleration = new PVector(0, 0);

    //velocity.rotate();
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
    velocity.rotate(0.05);
    println(degrees(-velocity.heading()));
    startVelo = velocity.mag();

    if (angle > 358) {
      angle = 0;
    }
  }

  void angDown() {
    angle -= 2;
    velocity.rotate(-0.05);
    println(degrees(-velocity.heading()));
    startVelo = velocity.mag();

    if (angle < 2) {
      angle = 360;
    }
  }

  /*void rotateToAngle() {
   velocity.rotate(radians(angle));
   println("rotating");
   initialHeading = velocity.heading();
   println(degrees(initialHeading));
   }*/

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

  void calcPath(PVector g, int p) {
    if (p == 1) {
      float gravity = 0.0982;
      float cos = cos(-velocity.heading());
      //float sin = sin(radians(angle));

      for (int x = 0; x < width; x += 20) {
        float y = tan(-velocity.heading())*x-(gravity)/(2*sq(startVelo)*sq(cos))*sq(x);
        //println(y);
        fill(255, 0, 0);
        ellipse(x+tank1.location.x+60, 400-y, 10, 10);
      }
    } else {
      float gravity = 0.0982;
      float cos = cos(velocity.heading());
      //float sin = sin(radians(angle));

      for (int x = 0; x < width; x += 20) {
        float y = tan(velocity.heading())*x-(gravity)/(2*sq(startVelo)*sq(cos))*sq(x);
        //println(y);
        fill(0, 0, 255);
        ellipse(tank2.location.x-x, 400-y, 10, 10);
      }
    }
  }
}
