//== Cursor == 
void pcursor() { 
  pushMatrix();
  translate(mouseX, mouseY);
  
  noFill();
  strokeWeight(5);
  
  stroke(colourlist[cursorcc]);
  
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
  //== Start Button ==
  if (dist(mouseX, mouseY, width/2, 3*height/4) <= 50) {
    circletog = true;
  }
  
  //Play again 
  if (mouseX >= 100 && mouseX <= 700 && mouseY >= 420 && mouseY <= 540) {
    pointsr = 0;
    pointsl = 0;
    cdt = true;
    cdring = false;
    timerlength = 0;
    game_mode = start;
  }
}
