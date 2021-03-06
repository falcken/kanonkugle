class Tank {
  PVector location;
  int score = 0;
  int player;
  color fill = color(0, 0, 0);
  boolean isRight, isLeft;
  int health;

  Tank(float x, float y, int p) {
    player = p;
    health = 4;
    location = new PVector(x, y);
    isRight = false;
    isLeft = false;
  }

  void display() {
    fill(0);
    stroke(0);
    rect(location.x, location.y, 60, 30);
    if (isLeft) moveLeft();
    if (isRight) moveRight();
  }

  void moveLeft() {
    if (location.x >= 50 && player == 1 || player == 2 && location.x >= 550) { 
      location.add(-8, 0);
      if (player == 1) {
        if (!firing1) balls1.get(0).location.x = location.x+55;
      } else {
        if (!firing2) balls2.get(0).location.x = location.x-5;
      }
    }
  }

  void moveRight() {
    if (player == 1 && location.x <= 400 || player == 2 && location.x >= 450 && location.x <= 890) {
      location.add(8, 0);
      if (player == 1) {
        if (!firing1) balls1.get(0).location.x = location.x+55;
      } else {
        if (!firing2) balls2.get(0).location.x = location.x-5;
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
  
  int checkHealth() {
    return health;
  }

  void Collision(Ball b) {
    if (player == 2) {
      if (b.location.x > location.x && b.location.x <= location.x+60 && b.location.y > location.y && b.location.y < location.y+30) {
        println("Hurra1");
        health--;
        pows.add(new Pow(b.location.x-20, b.location.y-20, pows.size()+1));
        handleReset(1);
        b.reset(1);
      }
    } else {
      if (b.location.x < location.x+60 && b.location.x > location.x && b.location.y > location.y && b.location.y < location.y+30) {
        health--;
        println("Hurra2");
        pows.add(new Pow(b.location.x-20, b.location.y-20, pows.size()+1));
        handleReset(2);
        b.reset(2);
      }
    }
  }
}
