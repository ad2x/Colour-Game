//== Colour Palette ==
color c0 = #E74C3C;
color c1 = #F1C40F;
color c2 = #F4D03F;
color c3 = #2ECC71;
color c4 = #3498DB;
color c5 = #7D3C98;
color c6 = #884EA0;

//Cursor colours
color[] cursorc = {c0, c1, c2, c3, c4, c5, c6};
//Current colour
int cursorcc = 0;

//== Modes ==
int mode = 0;
final int title = 0;
final int home = 1;
final int game = 2;
final int options = 3;

//For escing out of modes - same code for this as my breakout project
IntList pmode;

//== Game Modes ==
int game_mode = 0;
final int start = 1;
final int playing = 2;
final int paused = 3; 
final int over = 4;

//== Custom Fonts ==
PFont[] fontlist;

//== Gif Background ==
PImage[] gif;
int NoF;
int currentF = 0;

//== Title Screen ==
float cfont = 0;

//Circle Transition
boolean circletransit = false;
float circlesize = 0;

void setup() {
  size(800, 800);
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
  
  //==== PMode ====
  pmode = new IntList();
}

void draw() {
  println(pmode);
  //== Mode Framework ==
  switch(mode) {
    case title:
      title();
      break;
    case home:
      home();
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
