void game() {
  background(0);
  
  switch(game_mode) {
    case start:
      game_start();
      break;
    case playing:
      game_playing();
      break;
    case over:
      game_over();
      break;
  }
}

//== Game Start Screen ==
void game_start() {
  game_start_playbutton(width/2, 3*height/4);
}

//Start button
void game_start_playbutton(float x, float y) {
  pushMatrix();
  translate(x, y);
  
  if (playhdir == true) {
    playh++;
  } else {
    playh--;
  }
  
  if (playh >= 170 || playh <= 140) {
    playhdir = !playhdir;
  }
  
  colorMode(HSB);
  noFill();
  stroke(playh, 360, 360);
  strokeWeight(5);
  colorMode(RGB, 255, 255, 255);
  
  pushMatrix();
  rotate(playr);
  ellipse(50, 0, 25, 25);
  
  ellipse(-50, 0, 25, 25);
  
  ellipse(0, -50, 25, 25);
  
  ellipse(0, 50, 25, 25);
  popMatrix();
  
  pushMatrix();
  rotate(playr);
  rotate(HALF_PI/2);
  ellipse(50, 0, 25, 25);
  
  ellipse(-50, 0, 25, 25);
  
  ellipse(0, -50, 25, 25);
  
  ellipse(0, 50, 25, 25);
  popMatrix();
  
  playr += 0.05;
  
  popMatrix();
}

//== Gameplay ==
void game_playing() {
  
}

//== Game Over ==
void game_over() {
  
}
