class Ball {
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  Ball(float a, float x, float y) {
    location = new PVector(x,y);
    velocity = new PVector(5, -5);
    acceleration = new PVector();
    
    velocity.rotate(a);
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
}
