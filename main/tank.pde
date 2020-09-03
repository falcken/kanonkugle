class Tank {
  PVector location;
  int score = 0;
  int player;
  color fill = color(0,0,0);

  Tank(float x, float y, int p) {
    player = p;
    location = new PVector(x, y);
  }

  void display() {
    fill(0);
    stroke(0);
    rect(location.x, location.y, 60, 30);
  }

  void moveLeft() {
    if (location.x >= 50 && player == 1 || player == 2 && location.x >= 500) { 
      location.add(-8, 0);
      if (player == 1) {
        balls1.get(0).location.x = location.x+55;
      } else {
        balls2.get(0).location.x = location.x-5;
      }
    }
  }

  void moveRight() {
    if (player == 1 && location.x <= 400 || player == 2 && location.x >= 450 && location.x <= 890) {
      location.add(8, 0);
      if (player == 1) {
        balls1.get(0).location.x = location.x+55;
      } else {
        balls2.get(0).location.x = location.x-5;
      }
    }
  }
  
  void moveDown() {
    if (location.y <= 300) { 
      location.add(0, 8);
    }
  }

  void moveUp() {
    if (location.y > 75) {
      location.add(0, -8);
    }
  }
}
