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
    rect(xpos, ypos+ymove, 20, 100);
    rect(xpos, 350, 20, 300);
  }

  void collision(Ball b, int player) {
    println(b.location.x);
    if (b.location.x < xpos + 40 && b.location.x > xpos && b.location.y > ypos+ymove && b.location.y < ypos+ymove+100 && player == 2) {
      println("JATAK");
      pows.add(new Pow(b.location.x-20, b.location.y-20, pows.size()+1));
      handleReset(2);
      b.reset(2);
    }
    if (b.location.x > xpos - 20 && b.location.x <  xpos+40 && b.location.y > ypos+ymove && b.location.y < ypos+ymove+100 && player == 1) {
      println("JATAK2");
      pows.add(new Pow(b.location.x-20, b.location.y-20, pows.size()+1));
      handleReset(1);
      b.reset(1);
    }
    if (b.location.x < xpos + 40 && b.location.x > xpos && b.location.y > 350 && b.location.y < 650 && player == 2) {
      pows.add(new Pow(b.location.x-20, b.location.y-20, pows.size()+1));
      handleReset(2);
      b.reset(2);
    }
    if (b.location.x > xpos - 20 && b.location.x <  xpos+40 && b.location.y > 350 && b.location.y < 650 && player == 1) {
      pows.add(new Pow(b.location.x-20, b.location.y-20, pows.size()+1));
      handleReset(1);
      b.reset(1);
    }
  }
}
