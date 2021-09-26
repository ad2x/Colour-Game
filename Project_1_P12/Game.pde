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
    stroke(playh, 360, 180);
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
      line(0, 0, 0, -circledist);
      line(0, 0, 0, circledist);
      if (circledist <= -height) {
        time =  minute()*60 + second();
        game_mode = playing;
        cdt = true;
      }
    }
  }

  popMatrix();
}

//== Gameplay ==
void game_playing() {
  //Divider line
  stroke(#FFFCFC);
  line (width/2, -20, width/2, height + 20);
  
  timer(width/2, height/2);
  
  if (cdt == true) {
    countdowntimer(width/2, height/2);
  }
  
  //Background Circle
  if (cdring == true) {
    fill(0);
    noStroke();
    ellipse(width/2, height/2, 300, 300);
  }
  
  //Words
  if (game_mode == playing && cdt == false)
  colourword(width/2, height/2);
  
  //Points
  pointsd();
  pointerl(width/5, height/5);
  pointerr(4*width/5, height/5);
  
  //End
  if (timerlength >= height/2) {
    game_mode = over;
  }
}

//Countdown timer
void countdowntimer(float x, float y) {
  pushMatrix();
  translate(x, y);
  
  fill(0);
  stroke(255);
  strokeWeight(7);
  ellipse(0, 0, 300, 300);
  
  fill(255);
  textFont(fontlist[6]);
  textSize(200);
  textAlign(CENTER, CENTER);
  
  int ctime = minute()*60 + second() - time - 3;
  
  text(-ctime, 10, -20);
    
  if (ctime == 0) {
    cdt = false;
    cdring = true;
    
    reroll();
  }
  
  popMatrix();
}

//-- Word functions --
void reroll() {
  if (game_mode == playing && cdt == false) {
    wordcc = (int)random(0, 7);
    
    int coinflip = (int)random(0, 2);
    
    if (coinflip == 0){
      colourcw = wordcc;
    } else {
      colourcw = (int)random(0, 7);
      
      while(colourcw == wordcc) {
        colourcw = (int)random(0, 7);
      }
    }
  }
  
  currentfontg = (int)random(0, 6);
}

void guess() {
  if (keyCode == RIGHT) {
    if (colourcw == wordcc) {
      pointsr++;
    } else {
      pointsr--;
    }
  } else if (keyCode == LEFT) {
    if (colourcw == wordcc) {
      pointsl--;
    } else {
      pointsl++;
    }
  }
  
  reroll();
}

void colourword(float x, float y) {
  pushMatrix();
  translate(x, y);
  
  fill(colourlist[wordcc]);
  
  textFont(fontlist[currentfontg]);
  textAlign(CENTER, CENTER);
  textSize(150);
  
  text(colourwords[colourcw], 0, 0);
  
  popMatrix();
}

//-- Points --
void pointsd() {  
  fill(255);
  textFont(fontlist[6]);
  textSize(150);
  
  text(pointsl, width/3, 3*height/4);
  text(pointsr, 2*width/3, 3*height/4);
}

//-- Pointers --
void pointerl(float x, float y) {
  pushMatrix();
  translate(x, y);
  
  stroke(colourlist[0]);
  strokeWeight(15);
  
  line(-75, -75, 75, 75);
  line(-75, 75, 75, -75);
  
  popMatrix();
}
void pointerr(float x, float y) {
  pushMatrix();
  translate(x, y);
  
  stroke(colourlist[3]);
  strokeWeight(15);
  noFill();
  
  ellipse(0, 0, 150, 150);
  
  popMatrix();
}

//-- Timer -- 
void timer(float x, float y) {
  pushMatrix();
  translate(x, y);
  
  stroke(0);
  strokeWeight(20);
  
  line(0, -timerlength, 0, timerlength);
  
  if (game_mode == playing && cdt == false) {
    timerlength++;
  }
  
  popMatrix();
}

//== Game Over ==
void game_over() {
  fscore(width/2, height/4);
  
  youlost(width/2, height/2);
  
  pabutton(width/2, 3*height/4);
}

//Final score
void fscore(float x, float y) {
  pushMatrix();
  translate(x, y);
  
  pointst = pointsl + pointsr;
  
  if (pointst > pointsh) {
    pointsh = pointst;
  }
  
  fill(255);
  textFont(fontlist[6]);
  textSize(90);
  textAlign(CENTER, CENTER);
  
  text("Score: " + pointst, 0, 0);
  if (pointsh == pointst) {
    fill(colourlist[2]);
    textSize(30);
    text("New Highscore!", 0, -100);
  } else {
    fill(colourlist[2]);
    textSize(30);
    text("Highscore: " + pointsh, 0, -100);
  }
  
  popMatrix();
}

//You lost
void youlost(float x, float y) {
  pushMatrix();
  translate(x, y);
  
  fill(255);
  textFont(fontlist[6]);
  textSize(115);
  textAlign(CENTER, CENTER);
  
  text("Game Over", 0, 0);
  
  popMatrix();
}

//-- Play again --
//This is actually the exact moment at which I realized I could've just made the buttons objects
void pabutton(float x, float y) {
  pushMatrix();
  translate(x, y);
  
  fill(0);
  stroke(255);
  strokeWeight(15);
  println(mouseX, mouseY);
  if (mouseX >= -300 + x && mouseX <= 300 + x && mouseY >= -60 + y && mouseY <= 60 + y) {
    stroke(180);
    if (mousePressed) {
      stroke(110);
    }
  } 
  rect(-300, -60, 600, 120);
  
  fill(255);
  textFont(fontlist[6]);
  textSize(80);
  textAlign(CENTER, CENTER);
  
  text("Play Again?", 0, 0);
  
  popMatrix();
}
