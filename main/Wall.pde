class Wall {
  float period;
  float amplitude;
  float xpos, ypos, ymove;
  int player;

  Wall(float p, float a, float x, float y) {
    amplitude = a;
    period = p;
    xpos = x;
    ypos = y;
  }
  void display() {
    ymove = amplitude * cos(TWO_PI * frameCount/period);
    stroke(0);
    rect(xpos, ypos+ymove, 20, 180);
  }

  void collision(Ball b, int player) {
    println(b.location.x);
    if (b.location.x < xpos + 40 && b.location.y > ypos+ymove && b.location.y < ypos+ymove+180 && player == 2) {
      println("JATAK");
      handleReset(2);
      b.reset(2);
    }
    if (b.location.x > xpos - 20 && b.location.y > ypos+ymove && b.location.y < ypos+ymove+180 && player == 1) {
      println("JATAK2");
      handleReset(1);
      b.reset(1);
    }
  }
}
