int count, numCross, j = 0;
void setup() {
  size(700, 700);
  background(255);
  strokeWeight(5.0);
  fill(183, 242, 179);
  rect(50, 50, 600, 600);
  strokeWeight(3.5);
  for (int i = 0; i < 6; i++) {
    stroke(61, 244, 88);
    j = i*100+100;
    line(53, j, 647, j);
  }
}
void draw() {
  strokeWeight(2.0);
  if (count < 10000) drawLine();
  noStroke();
  fill(255);
  rect(0, 653, 340, 50);
  rect(0, 653, 700, 20);
  textSize(30);
  fill(0);
  text("Buffon's Needles              by Rocky Zhang", 50, 37);
  textSize(15);
  text("Needles Dropped: " + count, 50, 667);
  text("Needles that Crossed a Line: " + numCross, 50, 687);
  text("Approximation of Pi (Dropped/Crossed): ", 350, 667);
  if (frameCount % 30 == 0) {
    fill(255);
    rect(340, 675, 350, 50);
    fill(0); 
    text(count*1.0/numCross, 600, 687);
  }
}

void drawLine() {
  float x, y, a, b;
  x = random(100, 650);
  y = random(100, 600);
  b = y + random(-50, 50);
  a = x - pow(2500-pow(y-b, 2), 0.5);
  stroke(104, 221, 192);  
  if (cross(y, b)) {
    stroke(255, 98, 50);
    numCross++;
  }
  line(x, y, a, b);
  count++;
}

boolean cross(float y, float b) {
  boolean crossed = false;
  for (int i = 0; i < 6; i++) {
    j = i*100+100;
    crossed = crossed || y>j && b<j || y<j && b>j || y<j+3.3 && y>j-3.4 || b<j+3.4 && b>j-3.4;
  }
  return crossed;
}