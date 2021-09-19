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
  
  popMatrix();
}

//== Settings Button ==

//== Highscores ==
