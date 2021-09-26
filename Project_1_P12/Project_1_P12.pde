/*
Alexander Double
26-09-2021
Colour-Word Matching Game

P.S.

I only noticed after completing the project that you specifically asked for the game to keep track of the time passed since the game started
I'm not sure if my timerlength variable counts since it technically does so but just not directly

The "Play Again?" button resets to the game rather than intro mode because I felt playing the animation multiple times would be weird

Also in this project there is an overall timer that counts down rather than a resetting one, but I'm hoping that's fine since either requires a relatively similar amound of effort

FYI you press < or > to play

Lastly, the potential for negative scores was left in because I thought it was funny and to get a negative score you'd have to do worse than random chance
*/

import processing.javafx.*;

//== Colour Palette ==
color c0 = #E74C3C;
color c1 = #F1C40F;
color c2 = #F4D03F;
color c3 = #2ECC71;
color c4 = #3498DB;
color c5 = #4B0082;
color c6 = #884EA0;

int wordcc = 0;

//-- Word array --
String[] colourwords = {"Red", "Orange", "Yellow", "Green", "Blue", "Indigo", "Violet"};

int colourcw = 0;

//Cursor colours
color[] colourlist = {c0, c1, c2, c3, c4, c5, c6};
//Current colour
int cursorcc = 0;

//== Modes ==
int mode = 0;
final int title = 0;
final int game = 2;
final int options = 3;

//== Game Modes ==
int game_mode = 0;
final int start = 0;
final int playing = 1;
final int over = 2;

//== Custom Fonts ==
PFont[] fontlist;

//Used in game
int currentfontg = 0;

//== Gif Background ==
PImage[] gif;
int NoF;
int currentF = 0;

//== Title Screen ==
float cfont = 0;

//Circle Transition
boolean circletransit = false;
float circlesize = 0;

//== Game ==
//--Start screen--
//"Play"
int playh = 160;
float playr = 0;
//Makes the hue go up or down
boolean playhdir = true;
//Circle dist
float circledist = 50;
//Circle toggle
boolean circletog;
//--Countdown--
boolean cdt = false;
int time = 0;
//Circle behind words/the white ring around countdown
boolean cdring = false;
//Points
int pointsl = 0;
int pointsr = 0;
int pointst = 0;

int pointsh = -255;

//Timer length
float timerlength = 0;

void setup() {
  size(800, 800, FX2D);
  noCursor();
  
  //== Fonts ==
  fontlist = new PFont[7];
  for (int i = 0; i < 6; i++) {
    fontlist[i] = createFont("data/Fonts/" + i + ".ttf", 75);
  }
  fontlist[6] = createFont("data/Fonts/6.ttf", 20);
  
  //== Gif ==
  NoF = 70;
  gif = new PImage[NoF];
  for (int i = 0; i < 70; i++) {
    if (i < 10) {
      gif[i] = loadImage("data/Images/gif/frame_0" + i + "_delay-0.04s.gif");
    } else {
      gif[i] = loadImage("data/Images/gif/frame_" + i + "_delay-0.04s.gif");
    }
  }
}

void draw() {
  //== Mode Framework ==
  switch(mode) {
    case title:
      title();
      break;
    case game:
      game();
      break;
    case options:
      options();
      break;
  }
  
  //== Cursor ==
  pcursor();
}
