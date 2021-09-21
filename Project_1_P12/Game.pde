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
  stroke(playh-60, 360, 360);
  if (dist(mouseX, mouseY, width/2, 3*height/4) <= 50) {
    stroke(playh, 180, 360);
  }
  if (circletog == true) {
    stroke(playh, 0, 360);
  }
  strokeWeight(5);
  colorMode(RGB, 255, 255, 255);
  
  pushMatrix();
  rotate(playr);
  ellipse(circledist, 0, 25, 25);
  
  ellipse(-circledist, 0, 25, 25);
  
  ellipse(0, -circledist, 25, 25);
  
  ellipse(0, circledist, 25, 25);
  popMatrix();
  
  pushMatrix();
  rotate(playr);
  rotate(HALF_PI/2);
  ellipse(circledist, 0, 25, 25);
  
  ellipse(-circledist, 0, 25, 25);
  
  ellipse(0, -circledist, 25, 25);
  
  ellipse(0, circledist, 25, 25);
  popMatrix();
  
  if (circletog == true) {
    circledist -= 1;
  
    if (circledist <= 0) {
      circledist -= 5;
      if (circledist >= -10000) {
        line(0, 0, 0, -circledist);
        line(0, 0, 0, circledist);
      }
    }
  }

  popMatrix();
}

//== Gameplay ==
void game_playing() {
  
}

//== Game Over ==
void game_over() {
  
}
