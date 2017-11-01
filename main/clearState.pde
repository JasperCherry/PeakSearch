void clearState() {

  stepsDone=0;
  algFinished=false;
  agentX=floor(random(30));
  agentY=floor(random(30));

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
  int maxX=floor(random(30));
  int maxY=floor(random(30));
  fields[maxX][maxY]=9;
  setPeaks[maxX][maxY]=true;

  // set number of random peaks of values 1-8
  for (int x=0; x<peaks; x++) {
    int posX, posY, value;
    do {
      posX=floor(random(30));
      posY=floor(random(30));
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