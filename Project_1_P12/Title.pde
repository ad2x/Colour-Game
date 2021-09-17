void title() {
  background(255);
  
  gifbg();
  name(width/2, height/2);
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
