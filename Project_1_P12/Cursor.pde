//== Cursor == 
void pcursor() { 
  pushMatrix();
  translate(mouseX, mouseY);
  
  noFill();
  strokeWeight(5);
  
  stroke(cursorc[cursorcc]);
  
  ellipse(0, 0, 20, 20);
  
  popMatrix();
}

//== Mouse Functions ==
void mousePressed () {
  cursorcc++;
  if (cursorcc == 7) {
    cursorcc = 0;
  }
}

void mouseReleased() {
  //== Play Button ==
  if (mouseX >= 25 && mouseX < 775 && mouseY >= 25 && mouseY <= 387.5 && mode == home) {
    pmode.append(mode);
    
    mode = game;
  }
  
  //== Start Button ==
  if (dist(mouseX, mouseY, width/2, 3*height/4) <= 50) {
    circletog = true;
  }
}
