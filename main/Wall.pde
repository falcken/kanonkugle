class Wall{
  float period;
  float amplitude;
  float xpos, ypos;
  
  Wall(float p, float a, float x, float y){
    amplitude = a;
    period = p;
    xpos = x;
    ypos = y;
    
  }
  void display(){
    float ymove = amplitude * cos(TWO_PI * frameCount/period);
    stroke(0);
    rect(xpos, ypos+ymove, 20, 180);
  }
  
  void collision(){
    
  }
}
