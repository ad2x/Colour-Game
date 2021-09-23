void keyPressed() {
  if (game_mode == playing && cdt == false && (keyCode == LEFT || keyCode == RIGHT)) {
    guess();
  }
}

void keyReleased() {
  //Title screen press any key function
  if (mode == title) {        
    circletransit = true;
  }
}
