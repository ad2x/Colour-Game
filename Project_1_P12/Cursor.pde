//== Cursor == 
void pcursor() { 
  pushMatrix();
  translate(mouseX, mouseY);
  
  noFill();
  strokeWeight(10);
  
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
