void keyPressed() {
  //Menu esc
  if (mode == home && keyCode == ESC) {
    key = 0;
  }
  
  if (keyCode == ESC && mode != title && mode != home) {
    key = 0;
    
    int lmode = pmode.get(pmode.size() - 1);
    pmode.remove(pmode.get(pmode.size() - 1));
    
    mode = lmode;    
  }
}

void keyReleased() {
  //Title screen press any key function
  if (mode == title) {
    pmode.append(mode);
        
    circletransit = true;
  }
}
