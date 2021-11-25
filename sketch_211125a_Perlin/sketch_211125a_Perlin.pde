import controlP5.*;

int num = 500;
PVector[] particles = new PVector[num];
float noiseScale = 0.01/2;
PGraphics canvas;

ControlP5 cp5;

int transparency = 10;
float direction = TWO_PI;

void keyPressed() {
  if (keyCode == 10) {
    num = parseInt(cp5.get(Textfield.class,"NUMBER").getText());
    particles = new PVector[num];
    initParticles();
  }
}

void initParticles() {
  for(int i = 0; i < num; i ++) {
    particles[i] = new PVector(random(width), random(height));
  }
}

void setup() {
  size(1600, 1600, P2D);
  canvas = createGraphics(1600, 1600);
  initParticles();
  
  PFont font = createFont("arial",20);
  
  cp5 = new ControlP5(this);
  cp5.addTextfield("NUMBER")
     .setPosition(20,150)
     .setSize(200,40)
     .setFont(font)
     .setFocus(true)
     .setColor(color(255));
     
  cp5.addSlider("transparency")
     .setPosition(20,50)
     .setSize(200,40)
     .setFont(font)
     .setRange(0,30);
     
          
  cp5.addSlider("direction")
     .setPosition(20,100)
     .setSize(200,40)
     .setFont(font)
     .setRange(0,TWO_PI);
}

void draw() {
  
  canvas.beginDraw();
  canvas.stroke(255);
  canvas.strokeWeight(3);
  canvas.background(0, transparency);
  for(int i = 0; i < num; i ++) {
    PVector p = particles[i];
    canvas.point(p.x, p.y);
    float n = noise(p.x * noiseScale, p.y * noiseScale);
    float a = direction * n;
    p.x += cos(a);
    p.y += sin(a);
    
    if(!onScreen(p)) {
      p.x = random(width);
      p.y = random(height);
    }
  }
  canvas.endDraw();
  
  image(canvas, 0, 0, 1600, 1600);
  
}

void mouseReleased() {
  noiseSeed(millis());
}

boolean onScreen(PVector v) {
  return v.x >= 0 && v.x <= width && v.y >= 0 && v.y <= height;
}
