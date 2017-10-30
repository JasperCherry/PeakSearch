void mouseReleased() {

  // start / stop button
  if (
    mouseX>620&&mouseX<740
    &&mouseY>520&&mouseY<570
    ) {
    if (!algFinished) {
      algRunning=!algRunning;
    }
    //System.out.print("Start/Stop button pressed");
  }

  // restart button
  if (
    mouseX>760&&mouseX<880
    &&mouseY>520&&mouseY<570
    ) {
    clearState();
    //System.out.print("Restart button pressed");
  }

  // change algorithm
  if (
    mouseX>620&&mouseX<870
    &&mouseY>260&&mouseY<300
    ) {
    if (currentAlg=="random") {
      currentAlg="snake";
    } else if (currentAlg=="snake") {
      currentAlg="up the hill";
    } else if (currentAlg=="up the hill") {
      currentAlg="random";
    }
    //System.out.print("Change button pressed");
  }

  // peaks value control
  if (
    mouseX>620&&mouseX<660
    &&mouseY>160&&mouseY<200
    ) {
    if (minPeakValue>1) {
      minPeakValue--;
    }  
    //System.out.print("Peaks value-- button pressed");
  }
  if (
    mouseX>830&&mouseX<870
    &&mouseY>160&&mouseY<200
    ) {
    if (minPeakValue<8) {
      minPeakValue++;
    }  
    //System.out.print("Peaks value++ button pressed");
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