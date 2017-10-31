PFont font; // font object
// settings
int peaks=9;
int maximumPeaks=899; // excluding the max peak
int columns=30;
int rows=30;
int minPeakValue=1; // min and max values for peak to be created
int maxPeakValue=8;
String currentAlg="random";
int delay=10; // delay time in running alg
int timeDelay=0;
// agent
int stepsDone=0;
int agentX;
int agentY;
boolean algRunning=false;
boolean searchClear=false;
boolean repeatFields=false;
boolean algFinished=false;
void updateAgent(int x, int y) {
  agentY=y;
  agentX=x;
}
boolean[][] checkedFields= new boolean[columns][rows]; // array to store fields agent went through
// arrays for controlling the state
int[][] fields= new int[columns][rows]; // array to store height of the fields
boolean[][] setPeaks= new boolean[columns][rows]; // array for marking taken fields
// tests
int testNumber=100;


void setup() {
  size(900, 600);
  font = createFont("Arial", 16, true);
  clearState();
}


void draw() { //-//
  // background
  fill(0);
  rect(0, 0, width, height);
  gui();
  drawFields();
  algorithm();
}//-//



void drawFields() {
  // draw fields, 20 px each rectangle side, 30 in a row and 30 in a column
  for (int x=0; x<columns; x++) {
    for (int y=0; y<rows; y++) {
      // draw rectangle / if field was checked, mark red
      if (fields[x][y]==9) {
        if (checkedFields[x][y]==true) {
          fill(255, 0, 0);
        } else {
          fill(255);
        }
      } else {
        if (checkedFields[x][y]==true) {
          fill(255-7*fields[x][y]+50, 15*fields[x][y]+50, 15*fields[x][y]+50);
        } else {
          fill(15*fields[x][y]+50);
        }
      }
      // paint the current field blue 
      if (x==agentX&&y==agentY&&checkedFields[x][y]==true) {
        fill(50, 50, 255);
      }
      rect(20*x, 20*y, 20, 20);
      // draw value of the field
      fill(0);
      textFont(font, 15);
      text(fields[x][y], 20*x+7, 20*y+16);
    }
  }
}