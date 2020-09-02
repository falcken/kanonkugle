ArrayList<Ball> balls = new ArrayList<Ball>();
PVector gravity = new PVector(0, 0.0982);

void setup () {
  size(1000, 600);
  balls.add(new Ball(270, 100, 400));
}

void draw() {
  for (int i = 0; i < balls.size(); i++) {
    balls.get(i).applyForce(gravity);
    balls.get(i).update();
    balls.get(i).display();
  }
}
