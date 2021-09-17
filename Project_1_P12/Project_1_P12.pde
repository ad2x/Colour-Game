//== Modes ==
int mode = 0;
final int title = 0;
final int home = 1;
final int game = 2;
final int options = 3;

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

void setup() {
  size(800, 800);
  
  //== Fonts ==
  fontlist = new PFont[6];
  for (int i = 0; i < 6; i++) {
    fontlist[i] = createFont("data/Fonts/" + i + ".ttf", 75);
  }
  
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
}
