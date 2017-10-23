PFont font; // font object
// settings
int peaks=15;
int maximumPeaks=899; // excluding the max peak
int columns=30;
int rows=30;
int minPeakValue=1; // min and max values for peak to be created // delete
int maxPeakValue=8; // delete
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
void updateAgent(int x, int y) {
  agentY=y;
  agentX=x;
}
boolean[][] checkedFields= new boolean[columns][rows]; // array to store fields agent went through
// arrays for controlling the state
int[][] fields= new int[columns][rows]; // array to store height of the fields
boolean[][] setPeaks= new boolean[columns][rows]; // array for marking taken fields



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
      rect(20*x, 20*y, 20, 20);
      // draw value of the field
      fill(0);
      textFont(font, 15);
      text(fields[x][y], 20*x+7, 20*y+16);
    }
  }
}

void algorithm() {

  if (algRunning) {
    timeDelay++;
    if (timeDelay>=delay) {
      timeDelay=0;
      stepsDone++;

      if (currentAlg=="random") {
        // pick up new random points to check
        agentX=round(random(29));
        agentY=round(random(29));
        // check if fields where checked before
        if (!repeatFields) {
          while (checkedFields[agentX][agentY]==true) {
            agentX=round(random(29));
            agentY=round(random(29));
          }
        }
        // if peak was found stop the algorithm
        checkedFields[agentX][agentY]=true;
        if (fields[agentX][agentY]==9) {
          algRunning=false;
          System.out.println("Number of steps:"+stepsDone+" for 900 fields to check");
        }
      }
    }
  }
}


void mouseReleased() {

  // start / stop button
  if (
    mouseX>620&&mouseX<740
    &&mouseY>520&&mouseY<570
    ) {
    algRunning=!algRunning;
    System.out.print("Start/Stop button pressed");
  }

  // restart button
  if (
    mouseX>720&&mouseX<880
    &&mouseY>520&&mouseY<570
    ) {
    clearState();
    System.out.print("Restart button pressed");
  }

  // update button
  if (
    mouseX>620&&mouseX<870
    &&mouseY>470&&mouseY<510
    ) {
    System.out.print("Update button pressed");
  }

  // change algorithm
  if (
    mouseX>620&&mouseX<870
    &&mouseY>260&&mouseY<300
    ) {
    System.out.print("Change button pressed");
  }

  // peaks value control
  if (
    mouseX>620&&mouseX<660
    &&mouseY>160&&mouseY<200
    ) {
    System.out.print("Peaks value-- button pressed");
  }
  if (
    mouseX>830&&mouseX<870
    &&mouseY>160&&mouseY<200
    ) {
    System.out.print("Peaks value++ button pressed");
  }

  // peaks number control
  if (
    mouseX>620&&mouseX<660
    &&mouseY>60&&mouseY<100
    ) {
    if (peaks>0) {
      peaks--;
    }
    //System.out.print("Peaks number-- button pressed");
  }
  if (
    mouseX>830&&mouseX<870
    &&mouseY>60&&mouseY<100
    ) {
    if (peaks<99) {
      peaks++;
    }
    //System.out.print("Peaks number++ button pressed");
  }

  // fields repetition
  if (
    mouseX>620&&mouseX<870
    &&mouseY>310&&mouseY<350
    ) {
    repeatFields=!repeatFields;
    //System.out.print("Repeat fields button pressed");
  }

  //speed control
  if (
    mouseX>620&&mouseX<660
    &&mouseY>410&&mouseY<450
    ) {
    if (delay>1) {
      delay--;
    }
    //System.out.print("Speed-- button pressed");
  }
  if (
    mouseX>830&&mouseX<870
    &&mouseY>410&&mouseY<450
    ) {
    if (delay<100) {
      delay++;
    }
    //System.out.print("Speed-- button pressed");
  }
}


void clearState() {

  // assign initian value to mark all fields empty and not visited
  for (int x=0; x<columns; x++) {
    for (int y=0; y<rows; y++) {
      setPeaks[x][y]=false;
      checkedFields[x][y]=false;
    }
  }

  // assign initian value to all fields
  for (int x=0; x<columns; x++) {
    for (int y=0; y<rows; y++) {
      fields[x][y]=0;
    }
  }

  // set up target peak
  int maxX=round(random(29));
  int maxY=round(random(29));
  fields[maxX][maxY]=9;
  setPeaks[maxX][maxY]=true;

  // set number of random peaks of values 1-8
  for (int x=0; x<peaks; x++) {
    int posX, posY, value;
    do {
      posX=round(random(29));
      posY=round(random(29));
      value=round(random(minPeakValue, maxPeakValue));
    } while (setPeaks[posX][posY]==true);
    fields[posX][posY]=value;
    setPeaks[posX][posY]=true;
  }


  // assign values other fields then peaks
  for (int x=0; x<columns; x++) {
    for (int y=0; y<rows; y++) {
      // if any value other then 0 was found
      if (fields[x][y]!=0) {
        if (x>0&&fields[x-1][y]<fields[x][y]-1) {
          fields[x-1][y]=fields[x][y]-1;
        }
        if (x<29&&fields[x+1][y]<fields[x][y]-1) {
          fields[x+1][y]=fields[x][y]-1;
        }
        if (y>0&&fields[x][y-1]<fields[x][y]-1) {
          fields[x][y-1]=fields[x][y]-1;
        }
        if (y<29&&fields[x][y+1]<fields[x][y]-1) {
          fields[x][y+1]=fields[x][y]-1;
        }
      }
    }
  }
  for (int x=columns-1; x>-1; x--) {
    for (int y=rows-1; y>-1; y--) {
      // if any value other then 0 was found
      if (fields[x][y]!=0) {
        if (x>0&&fields[x-1][y]<fields[x][y]-1) {
          fields[x-1][y]=fields[x][y]-1;
        }
        if (x<29&&fields[x+1][y]<fields[x][y]-1) {
          fields[x+1][y]=fields[x][y]-1;
        }
        if (y>0&&fields[x][y-1]<fields[x][y]-1) {
          fields[x][y-1]=fields[x][y]-1;
        }
        if (y<29&&fields[x][y+1]<fields[x][y]-1) {
          fields[x][y+1]=fields[x][y]-1;
        }
      }
    }
  }
}