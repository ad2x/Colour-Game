void title() {
  background(255);
  
  gifbg();
  name(width/2, height/2);
  
  pakbutton(width/2, 3*height/4);
  
  expcircle(width/2, height/2);
}

//== Name ==
void name(float x, float y) {
  pushMatrix();
  translate(x, y);
  
  fill(0);
  textSize(60);
  textAlign(CENTER, CENTER);
  
  for (int i = 0; i < 6; i++) {
    if (floor(cfont) == i) {
      textFont(fontlist[i]);
    }
  }
  
  cfont = cfont + 0.033334;
  if (floor(cfont) == 5) {
    cfont = 0;
  }
    
  text("Colour Cracker", 0, 0);
  
  popMatrix();
}

//== Gif ==
void gifbg() {
  image(gif[currentF], 0, 0, width, height);
  
  currentF++;
  
  if (currentF == NoF) {
    currentF = 0;
  }
}

//== Press Any Key ==
void pakbutton (float x, float y){
  pushMatrix();
  translate(x, y);
  
  fill(0);
  textAlign(CENTER, CENTER);
  
  textFont(fontlist[6]);
  
  textSize(20);
  
  if (keyPressed) {
    textSize(15);
  }
  
  text("PRESS ANY KEY", 0, -25);
  text("TO CONTINUE", 0, 10);
  
  popMatrix();
}

//== Circle Transition ==
void expcircle(float x, float y) {
  pushMatrix();
  translate(x, y);
  
  fill(0);
  noStroke();
  
  ellipse(0, 0, circlesize, circlesize);
  
  if (circletransit == true) {
    circlesize = 1.2*circlesize + 2;
  }
    
  if (circlesize > 2000) {
    mode = home;
    circletransit = false;
  }
  
  popMatrix();
}
