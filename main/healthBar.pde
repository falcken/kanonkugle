class HealthBar {
  int health;
  int player;

  HealthBar(int p) {
    player = p;
  }

  void displayHealth(int h) {
    if (player == 1) {
      stroke(0);
      fill(255);
      rect(50, 50, 120, 20);
      switch(h) {
        case 2:
          fill(253, 248, 109); //"matgul"
          break;
        case 1:
          fill(255, 0, 0);
          break;
        default:
          fill(0, 255, 0);
      }
      rect(53, 53, 115/4*h, 14);
    }
    if (player == 2) {
      stroke(0);
      fill(255);
      rect(830, 50, 120, 20);
      switch(h) {
        case 2:
          fill(253, 248, 109); //"matgul"
          break;
        case 1:
          fill(255, 0, 0);
          break;
        default:
          fill(0, 255, 0);
      }
      rect(833, 53, 115/4*h, 14);
    }
  }
}
