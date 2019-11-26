color green = #58CB7F;
color red = #FF0303;
color lred = #EA2626;
color black = #000000;
color lblack = #48413A;
color white = #FFFFFF;
color lwhite = #D7DED9;
color grey = #9DA29F;
int cx, cy;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;
float smallDiameter;
float chronometerRadius;
int x, y;
void setup() {
  size(640, 360);
  //size(1400, 800);
  stroke(255);

  int radius = min(width, height) / 2;
  secondsRadius = radius * 0.72;
  chronometerRadius = radius * 0.72;
  minutesRadius = radius * 0.60;
  hoursRadius = radius * 0.50;
  clockDiameter = radius * 1.8;
  smallDiameter = radius * 0.4;
  cx = width / 2;
  cy = height / 2;
}

void draw() {
  background(0);

  // Draw the clock background
  textAlign(CENTER);
  fill(80);
  noStroke();
  ellipse(cx, cy, clockDiameter, clockDiameter);

  pushMatrix();
  translate(x, y-90);
  background(0);
  //outside circle
  fill(255);
  ellipse(width/2, height/2-6, 17, 12);
  stroke(255);
  //inside circle
  fill(0);
  ellipse(width/2, height/2-4, 13, 8);
  //first one
  strokeWeight(1);  
  line(width/2-8, height/2-4, width/2-14, height/2-20);
  ellipse(width/2-14, height/2-20, 2, 2); 
  //second one
  strokeWeight(1);  
  line(width/2-5, height/2-10, width/2-8, height/2-25);
  ellipse(width/2-8, height/2-25, 2, 2); 
  //third one
  strokeWeight(1);  
  line(width/2, height/2-10, width/2, height/2-28);
  ellipse(width/2, height/2-28, 2, 2); 
  //forth one
  strokeWeight(1);  
  line(width/2+5, height/2-10, width/2+8, height/2-25);
  ellipse(width/2+8, height/2-25, 2, 2); 
  //fith one
  strokeWeight(1);  
  line(width/2+7, height/2-4, width/2+14, height/2-20);
  ellipse(width/2+14, height/2-20, 2, 2);
  popMatrix();

  // Angles for sin() and cos() start at 3 o'clock;
  // subtract HALF_PI to make them start at the top
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;


  //CHRONOMETERS
  //left
  fill(lwhite);
  ellipse(cx-70, cy-2, smallDiameter, smallDiameter);
  fill(black);
  ellipse(cx-70, cy-2, smallDiameter-20, smallDiameter-20);
  ////NUMBERS ON DIAL
  //fill(red);
  //textSize(12);
  //text("6", cx-70, cy+34);
  //text("12", cx-70, cy-28);
  //translate(cx-43, cy-2);
  //rotate(HALF_PI);
  //text("3", 0, 0);
  //translate(cx-100, cy+51);
  //rotate(PI);
  //text("9", cx-100, cy-2);
  // Draw the hands of the clock
  stroke(255);
  strokeWeight(1);
  line(cx-70, cy-2, cx-50 + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);

  //right
  fill(lwhite);
  ellipse(cx+70, cy-2, smallDiameter, smallDiameter);
  fill(black);
  ellipse(cx+70, cy-2, smallDiameter-20, smallDiameter-20);
  // pushMatrix();
  //fill(red);
  //textSize(12);
  //text("30", cx+70, cy-28);
  //translate(cx+100, cy+17);
  //rotate(HALF_PI-2.5);
  //text("10", 0, 0);
  ////text("20", -88, -27); 
  //text("20", -85, -25);  
  //popMatrix();


  //botton
  fill(lwhite);
  ellipse(cx, cy+50, smallDiameter, smallDiameter);
  fill(black);
  ellipse(cx, cy+50, smallDiameter-20, smallDiameter-20);
  // //NUMBERS ON DIAL BOTTOM
  //pushMatrix();
  //fill(red);
  //textSize(12);
  //text("60", cx, cy+25);
  //translate(cx+41, cy+18);
  //rotate(HALF_PI-0.5);
  //text("20", 0, 0);
  //text("40", +15, +85);  
  //popMatrix();

  // Draw the hands of the clock
  stroke(255);
  strokeWeight(1);
  line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
  strokeWeight(2);
  line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
  strokeWeight(4);
  line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);

  // Draw the minute ticks
  strokeWeight(1);
  beginShape(LINE);
  for (int i=1; i<=60; i++) {
    float angle = i * PI / 30.0;
    float x = (cx + cos(angle)*secondsRadius);
    float y =(cy + sin(angle)*secondsRadius);
    point(x, y);
  }
  endShape();


  fill(255);
  textSize(15);
  text("Rolex", width/2, height/2-75);
  textSize(10);
  text("OYSTER PERPETUAL", width/2, height/2-65); 
  textSize(8);
  text("SUPERLATIVE CHRONOMETER", width/2, height/2-55); 
  text("OFFICIALLY CERTIFIED", width/2, height/2-45); 
  text("CROSMOGRAPH", width/2, height/2-35); 
  fill(red);
  textSize(10);
  text("DAYTONA", width/2, height/2+13);

  //NUMBERS ON DIAL LEFT
  pushMatrix();
  fill(red);
  textSize(12);
  text("6", cx-70, cy+34);
  text("12", cx-70, cy-28);
  translate(cx-43, cy-2);
  rotate(HALF_PI);
  text("3", 0, 0);
  translate(cx-100, cy+51);
  rotate(PI);
  text("9", cx-100, cy-2);
  popMatrix();

  //NUMBERS ON DIAL RIGHT
  pushMatrix();
  fill(red);
  textSize(12);
  text("30", cx+70, cy-28);
  translate(cx+100, cy+17);
  rotate(HALF_PI-2.5);
  text("10", 0, 0);
  text("20", -85, -25);  
  popMatrix();

  //NUMBERS ON DIAL BOTTOM
  pushMatrix();
  fill(red);
  textSize(12);
  text("60", cx, cy+25);
  translate(cx+41, cy+18);
  rotate(HALF_PI-0.5);
  text("20", 0, 0);
  text("40", +15, +85);  
  popMatrix();
}
