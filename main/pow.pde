class Pow {
  float startTime, xpos, ypos;
  int index;

  Pow(float x, float y, int i) {
    startTime = millis();
    index = i;
    xpos = x;
    ypos = y;
  }

  void displayPow() {
    if (startTime+1000 > millis()) {
      image(pow, xpos, ypos);
    }
  }
}
