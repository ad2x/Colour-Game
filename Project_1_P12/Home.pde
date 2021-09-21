void home() {
  background(0);
  
  playbutton(25, 25);
}

//== Play Button ==
void playbutton(float x, float y) {
  pushMatrix();
  translate(x, y);
  
  fill(#E74C3C);
  strokeWeight(20);
  stroke(#C0392B);
  
  if (mouseX >= 0 && mouseX < 750 && mouseY >= 0 && mouseY <= 362.5) {
    stroke(#A93226);
    if (mousePressed) {
      stroke(#922B21);
    }
  }
  
  rect(0, 0, 750, 362.5);
  
  fill(0);
  
  for (int i = 0; i < 6; i++) {
    if (floor(cfont) == i) {
      textFont(fontlist[i]);
    }
  }
  
  cfont = cfont + 0.033334;
  if (floor(cfont) == 5) {
    cfont = 0;
  }
  
  textSize(100);
  textAlign(CENTER, CENTER);
  text("Play", 375, 180);
  
  popMatrix();
}

//== Settings Button ==

//== Highscores ==
