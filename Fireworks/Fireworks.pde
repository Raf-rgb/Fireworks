ArrayList<Ball> balls;
color[] c;

void setup() {
  //size(500, 500);
  fullScreen();
  
  c = new color[] {
    color(#111d5e),
    color(#c70039),
    color(#f37121),
    color(#c0e218)
  };
  
  balls = new ArrayList<Ball>();
}

void draw() {
  fill(0, 20);
  rect(0, 0, width, height);
  
  PVector g = new PVector(0, 0.01);
  
  for(int i = 0; i < balls.size(); i++) {
    Ball b = balls.get(i);
    
    b.show();
    b.move();
    b.applyForce(g);
    
    if(b.vel.y > 0) b.boom();
    if(b.isDead()) balls.remove(i);
  }
}

void mousePressed() {
  //int aux = int(random(c.length));
  
  for(int i = 0; i < 100; i++) {
    balls.add(new Ball(mouseX, mouseY, 5, c[i%c.length]));
  }
}
