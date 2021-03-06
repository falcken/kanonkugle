class Ball {
  PVector location;
  PVector velocity;
  PVector acceleration;
  boolean isDown, isUp;
  int player;

  float angle = 0;
  float startVelo;
  float initialHeading;

  Ball(float x, float y, float v, int p) {
    location = new PVector(x, y);
    velocity = new PVector(v, 0);
    acceleration = new PVector(0, 0);
    player = p;

    //velocity.rotate();
    startVelo = velocity.mag();
    isUp = false;
    isDown = false;
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
    if (true) {
      angle += 1;
      velocity.rotate(0.04);
      println("UP: "+degrees(-velocity.heading())+", PLAYER = "+player);
      startVelo = velocity.mag();
      /*if (false && degrees(-velocity.heading()) > 86 && player == 1|| degrees(-velocity.heading()) < -29 && player == 1 /*|| degrees(-velocity.heading()) < -150 && player == 2 || degrees(-velocity.heading()) > 95 && player == 2) {
       velocity.rotate(-0.04);
       }*/
    }
  }

  void angDown() {
    if (true) {
      angle -= 1;
      velocity.rotate(-0.04);
      println("DOWN: "+degrees(-velocity.heading())+", PLAYER = "+player);
      startVelo = velocity.mag();
      /*if (false && degrees(-velocity.heading()) > 86 && player == 1 || degrees(-velocity.heading()) < -29 && player == 1 || degrees(-velocity.heading()) > -150 && player == 2 && degrees(-velocity.heading()) < -150 && player == 2 || degrees(-velocity.heading()) < 95 && player == 2 && degrees(-velocity.heading()) > 180 && player == 2) {
       velocity.rotate(0.04);
       }*/
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
    if (isUp/* && degrees(-velocity.heading()) < 86 && degrees(-velocity.heading()) > -29*/) angUp();
    if (isDown/* && degrees(-velocity.heading()) < 86 && degrees(-velocity.heading()) > -2^*/) angDown();
    float gravity = 0.4;

    if (p == 1) {
      float cos = cos(-velocity.heading());
      //float sin = sin(radians(angle));

      for (int x = 0; x < width; x += 20) {
        float y = tan(-velocity.heading())*x-(gravity)/(2*sq(startVelo)*sq(cos))*sq(x);
        //println(y);
        fill(255, 0, 0);
        ellipse(x+tank1.location.x+60, 400-y, 10, 10);
      }
    } else {
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
