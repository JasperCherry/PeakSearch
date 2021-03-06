void algorithm() {
  if (algRunning) {
    timeDelay++;
    if (timeDelay>=delay) {
      timeDelay=0;
      stepsDone++;
      // random try algorithm
      if (currentAlg=="random") {
        // pick up new random points to check
        agentX=floor(random(30));
        agentY=floor(random(30));
        // check if fields where checked before
        if (!repeatFields) {
          while (checkedFields[agentX][agentY]==true) {
            agentX=floor(random(30));
            agentY=floor(random(30));
          }
        }
        // if peak was found stop the algorithm
        checkedFields[agentX][agentY]=true;
        if (fields[agentX][agentY]==9) {
          algRunning=false;
          algFinished=true;
          System.out.println("Success!");
          System.out.println("Number of steps:"+stepsDone+" for 900 fields to check");
        }
      } //--
      // snake algorithm
      if (currentAlg=="snake") {
        // pick up random move direction
        int move=floor(random(4));
        // check if fields where checked before
        if (!repeatFields) {
          // check if its in the bounds of the map
          boolean inBounds=false;
          boolean newField=false;
          do {
            // check if snake got stuck
            boolean cannotGo=false;
            // check middle map positions
            if (agentX!=0&&agentX!=29&&agentY!=0&&agentY!=29&&
              checkedFields[agentX][agentY+1]&&checkedFields[agentX][agentY-1]&&checkedFields[agentX+1][agentY]&&checkedFields[agentX-1][agentY]) {
              cannotGo=true;
            }
            // check corner positions
            if (
              (agentX==0&&agentY==0&&checkedFields[agentX][agentY+1]&&checkedFields[agentX+1][agentY])
              ||
              (agentX==0&&agentY==29&&checkedFields[agentX][agentY-1]&&checkedFields[agentX+1][agentY])
              ||
              (agentX==29&&agentY==0&&checkedFields[agentX][agentY+1]&&checkedFields[agentX-1][agentY])
              ||
              (agentX==29&&agentY==29&&checkedFields[agentX][agentY-1]&&checkedFields[agentX-1][agentY])
              ) {
              cannotGo=true;
            }
            // check edge positions
            if (
              (agentX==0&&agentY!=0&&agentY!=29&&checkedFields[agentX+1][agentY]&&checkedFields[agentX][agentY+1]&&checkedFields[agentX][agentY-1])
              ||
              (agentX==29&&agentY!=0&&agentY!=29&&checkedFields[agentX-1][agentY]&&checkedFields[agentX][agentY+1]&&checkedFields[agentX][agentY-1])
              ||
              (agentY==0&&agentX!=0&&agentX!=29&&checkedFields[agentX][agentY+1]&&checkedFields[agentX+1][agentY]&&checkedFields[agentX-1][agentY])
              ||
              (agentY==29&&agentX!=0&&agentX!=29&&checkedFields[agentX][agentY-1]&&checkedFields[agentX+1][agentY]&&checkedFields[agentX-1][agentY])
              ) {
              cannotGo=true;
            }
            if (cannotGo) {
              // if there is no possible move
              algRunning=false;
              algFinished=true;
              System.out.println("Snake got stuck");
              System.out.println("Number of steps:"+stepsDone+" for 900 fields to check");
              break;
            }
            if (move==0&&agentX<1
              ||
              move==1&&agentX>28
              ||
              move==2&&agentY<1
              ||
              move==3&&agentY>28) {
              inBounds=false;
              move=floor(random(4));
            } else {
              inBounds=true;
            }
            if (agentX>1&&move==0&&checkedFields[agentX-1][agentY]
              ||
              agentX<29&&move==1&&checkedFields[agentX+1][agentY]
              ||
              agentY>1&&move==2&&checkedFields[agentX][agentY-1]
              ||
              agentY<29&&move==3&&checkedFields[agentX][agentY+1]) {
              newField=false;
              move=floor(random(4));
            } else {
              newField=true;
            }
          } while (!inBounds||!newField);
        } else {
          // check if next move its in the bounds of the map
          boolean inBounds=false;
          do {
            if (move==0&&agentX<1
              ||
              move==1&&agentX>28
              ||
              move==2&&agentY<1
              ||
              move==3&&agentY>28) {
              inBounds=false;
              move=floor(random(4));
            } else {
              inBounds=true;
            }
          } while (!inBounds);
        }
        if (algRunning) {
          if (move==0) {
            agentX--; // left
          }
          if (move==1) {
            agentX++; // right
          }
          if (move==2) {
            agentY--; // up
          }
          if (move==3) {
            agentY++; // down
          }
        }
        // mark checked field
        checkedFields[agentX][agentY]=true;
        // if peak was found stop the algorithm
        if (fields[agentX][agentY]==9) {
          algRunning=false;
          algFinished=true;
          System.out.println("Success!");
          System.out.println("Number of steps:"+stepsDone+" for 900 fields to check");
        }
      }//--
      // up the hill algorithm
      if (currentAlg=="up the hill") {
        // pick up random move direction
        int move=floor(random(4));
        boolean peak=false;
        boolean noWay=false;
        if (repeatFields) {
          // check if you are in the local peak
          if (
            // middle of the map
            (agentX!=29&&agentX!=0&&agentY!=0&&agentY!=29&&fields[agentX][agentY]>fields[agentX+1][agentY]&&
            fields[agentX][agentY]>fields[agentX-1][agentY]&&fields[agentX][agentY]>fields[agentX][agentY+1]&&
            fields[agentX][agentY]>fields[agentX][agentY-1])
            ||
            // corners
            agentX==29&&agentY==29&&fields[agentX][agentY]>fields[agentX-1][agentY]&&fields[agentX][agentY]>fields[agentX][agentY-1]
            ||
            agentX==0&&agentY==29&&fields[agentX][agentY]>fields[agentX+1][agentY]&&fields[agentX][agentY]>fields[agentX][agentY-1]
            ||
            agentX==0&&agentY==0&&fields[agentX][agentY]>fields[agentX+1][agentY]&&fields[agentX][agentY]>fields[agentX][agentY+1]
            ||
            agentX==29&&agentY==0&&fields[agentX][agentY]>fields[agentX-1][agentY]&&fields[agentX][agentY]>fields[agentX][agentY+1]
            ||
            // edges
            agentX==29&&agentY!=0&&agentY!=29&&fields[agentX][agentY]>fields[agentX-1][agentY]&&fields[agentX][agentY]>fields[agentX][agentY+1]&&fields[agentX][agentY]>fields[agentX][agentY-1]
            ||
            agentX==0&&agentY!=0&&agentY!=29&&fields[agentX][agentY]>fields[agentX+1][agentY]&&fields[agentX][agentY]>fields[agentX][agentY+1]&&fields[agentX][agentY]>fields[agentX][agentY-1]
            ||
            agentY==29&&agentX!=0&&agentX!=29&&fields[agentX][agentY]>fields[agentX+1][agentY]&&fields[agentX][agentY]>fields[agentX-1][agentY]&&fields[agentX][agentY]>fields[agentX][agentY-1]
            ||
            agentY==0&&agentX!=0&&agentX!=29&&fields[agentX][agentY]>fields[agentX+1][agentY]&&fields[agentX][agentY]>fields[agentX-1][agentY]&&fields[agentX][agentY]>fields[agentX][agentY+1]
            ) {
            // reset the position on the map
            agentX=floor(random(30));
            agentY=floor(random(30));
            peak=true;
            // check if you can go higher
          } else if (
            agentX!=29&&fields[agentX][agentY]<fields[agentX+1][agentY]
            ||
            agentX!=0&&fields[agentX][agentY]<fields[agentX-1][agentY]
            ||
            agentY!=29&&fields[agentX][agentY]<fields[agentX][agentY+1]
            ||
            agentY!=0&&fields[agentX][agentY]<fields[agentX][agentY-1]
            ) {
            // check for middle
            if (agentX!=0&&fields[agentX][agentY]<fields[agentX-1][agentY]) {
              move=0;
            } else if (agentX!=29&&fields[agentX][agentY]<fields[agentX+1][agentY]) {
              move=1;
            } else if (agentY!=0&&fields[agentX][agentY]<fields[agentX][agentY-1]) {
              move=2;
            } else if (agentY!=29&&fields[agentX][agentY]<fields[agentX][agentY+1]) {
              move=3;
            }
            // if other two options fail, just go random
          } else {
            // check if next move is in the bounds of the map
            boolean inBounds=false;
            do {
              if (move==0&&agentX<1
                ||
                move==1&&agentX>28
                ||
                move==2&&agentY<1
                ||
                move==3&&agentY>28) {
                inBounds=false;
                move=floor(random(4));
              } else {
                inBounds=true;
              }
            } while (!inBounds);
          }
        } else {
          // check if you are in the local peak
          if (
            // middle of the map
            (agentX!=29&&agentX!=0&&agentY!=0&&agentY!=29&&fields[agentX][agentY]>fields[agentX+1][agentY]&&
            fields[agentX][agentY]>fields[agentX-1][agentY]&&fields[agentX][agentY]>fields[agentX][agentY+1]&&
            fields[agentX][agentY]>fields[agentX][agentY-1])
            ||
            // corners
            agentX==29&&agentY==29&&fields[agentX][agentY]>fields[agentX-1][agentY]&&fields[agentX][agentY]>fields[agentX][agentY-1]
            ||
            agentX==0&&agentY==29&&fields[agentX][agentY]>fields[agentX+1][agentY]&&fields[agentX][agentY]>fields[agentX][agentY-1]
            ||
            agentX==0&&agentY==0&&fields[agentX][agentY]>fields[agentX+1][agentY]&&fields[agentX][agentY]>fields[agentX][agentY+1]
            ||
            agentX==29&&agentY==0&&fields[agentX][agentY]>fields[agentX-1][agentY]&&fields[agentX][agentY]>fields[agentX][agentY+1]
            ||
            // edges
            agentX==29&&agentY!=0&&agentY!=29&&fields[agentX][agentY]>fields[agentX-1][agentY]&&fields[agentX][agentY]>fields[agentX][agentY+1]&&fields[agentX][agentY]>fields[agentX][agentY-1]
            ||
            agentX==0&&agentY!=0&&agentY!=29&&fields[agentX][agentY]>fields[agentX+1][agentY]&&fields[agentX][agentY]>fields[agentX][agentY+1]&&fields[agentX][agentY]>fields[agentX][agentY-1]
            ||
            agentY==29&&agentX!=0&&agentX!=29&&fields[agentX][agentY]>fields[agentX+1][agentY]&&fields[agentX][agentY]>fields[agentX-1][agentY]&&fields[agentX][agentY]>fields[agentX][agentY-1]
            ||
            agentY==0&&agentX!=0&&agentX!=29&&fields[agentX][agentY]>fields[agentX+1][agentY]&&fields[agentX][agentY]>fields[agentX-1][agentY]&&fields[agentX][agentY]>fields[agentX][agentY+1]
            ) {
            // reset the position on the map
            agentX=floor(random(30));
            agentY=floor(random(30));
            peak=true;
            // check if you have any unchecked place to go
          } else if (
            (agentX==29||checkedFields[agentX+1][agentY])
            &&
            (agentX==0||checkedFields[agentX-1][agentY])
            &&
            (agentY==29||checkedFields[agentX][agentY+1])
            &&
            (agentY==0||checkedFields[agentX][agentY-1])
            ) {
            agentX=floor(random(30));
            agentY=floor(random(30));
            noWay=true;
            // check if you can go higher and that field wasnt visited
          } else if (
            agentX!=29&&fields[agentX][agentY]<fields[agentX+1][agentY]&&!checkedFields[agentX+1][agentY]
            ||
            agentX!=0&&fields[agentX][agentY]<fields[agentX-1][agentY]&&!checkedFields[agentX-1][agentY]
            ||
            agentY!=29&&fields[agentX][agentY]<fields[agentX][agentY+1]&&!checkedFields[agentX][agentY+1]
            ||
            agentY!=0&&fields[agentX][agentY]<fields[agentX][agentY-1]&&!checkedFields[agentX][agentY-1]
            ) {
            // check for middle
            if (agentX!=0&&fields[agentX][agentY]<fields[agentX-1][agentY]) {
              move=0;
            } else if (agentX!=29&&fields[agentX][agentY]<fields[agentX+1][agentY]) {
              move=1;
            } else if (agentY!=0&&fields[agentX][agentY]<fields[agentX][agentY-1]) {
              move=2;
            } else if (agentY!=29&&fields[agentX][agentY]<fields[agentX][agentY+1]) {
              move=3;
            }
            // if higher place has been visited allready
          } else if (
            agentX!=29&&fields[agentX][agentY]<fields[agentX+1][agentY]&&checkedFields[agentX+1][agentY]
            ||
            agentX!=0&&fields[agentX][agentY]<fields[agentX-1][agentY]&&checkedFields[agentX-1][agentY]
            ||
            agentY!=29&&fields[agentX][agentY]<fields[agentX][agentY+1]&&checkedFields[agentX][agentY+1]
            ||
            agentY!=0&&fields[agentX][agentY]<fields[agentX][agentY-1]&&checkedFields[agentX][agentY-1]
            ) {
            agentX=floor(random(30));
            agentY=floor(random(30));
            peak=true;
            // if other two options fail, just go random
          } else {
            // check if next move is in the bounds of the map and if it was visited before, if it was pick again
            boolean inBounds=false;
            boolean newField=false;
            do {
              move=floor(random(4));
              if (move==0&&agentX<1
                ||
                move==1&&agentX>28
                ||
                move==2&&agentY<1
                ||
                move==3&&agentY>28) {
                inBounds=false;
              } else {
                inBounds=true;
                if (move==0&&checkedFields[agentX-1][agentY]) {
                  newField=false;
                } else if (move==1&&checkedFields[agentX+1][agentY]) {
                  newField=false;
                } else if (move==2&&checkedFields[agentX][agentY-1]) {
                  newField=false;
                } else if (move==3&&checkedFields[agentX][agentY+1]) {
                  newField=false;
                } else {
                  newField=true;
                }
              }
            } while (!inBounds||!newField);
          }
        }
        // make a move
        if (algRunning&&!peak&&!noWay) {
          if (move==0) {
            agentX--; // left
          }
          if (move==1) {
            agentX++; // right
          }
          if (move==2) {
            agentY--; // up
          }
          if (move==3) {
            agentY++; // down
          }
        }
        // mark checked field
        checkedFields[agentX][agentY]=true;
        // if peak was found stop the algorithm
        if (fields[agentX][agentY]==9) {
          algRunning=false;
          algFinished=true;
          System.out.println("Success!");
          System.out.println("Number of steps:"+stepsDone+" for 900 fields to check");
        }
      }//--
    }
  }
}