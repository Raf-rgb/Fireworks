class Ball {
  PVector pos, acel, vel;
  boolean aux;
  float s, a;
  color c;
  
  Ball(float x, float y, float s_, color c_) {
    pos = new PVector(x, y);
    acel = new PVector(0, -1);
    vel = new PVector(0, -1);
    s = s_;
    c = c_;
    aux = true;
    a = 255;
  }
  
  void show() {
    noStroke();
    fill(c, a);
    ellipse(pos.x, pos.y, s, s);
    
    if(!aux) a-=random(1, 2);
  }
  
  void move() {
    vel.add(acel);
    vel.limit(5);
    pos.add(vel);
    acel.mult(0);
  }
  
  void applyForce(PVector f) {
    acel.add(f);
  }
  
  void boom() {
    if(aux) {
      acel = PVector.random2D();
      acel.normalize();
      acel.mult(random(1));
      aux = false;
    }
  }
  
  boolean isDead() {
    if(a < 10) return true;
    else return false;
  }
}
