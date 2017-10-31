void mouseReleased() {

  // start / stop button
  if (
    mouseX>620&&mouseX<740
    &&mouseY>540&&mouseY<590
    ) {
    if (!algFinished) {
      algRunning=!algRunning;
    }
    //System.out.print("Start/Stop button pressed");
  }

  // restart button
  if (
    mouseX>760&&mouseX<880
    &&mouseY>540&&mouseY<590
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
    if (peaks<98) {
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

  // tests control
  if (
    mouseX>620&&mouseX<660
    &&mouseY>510&&mouseY<530
    ) {
    if (testNumber>1000) {
      testNumber-=1000;
    } else if (testNumber>100) {
      testNumber-=100;
    } else if (testNumber>10) {
      testNumber-=10;
    } else if (testNumber>1) {
      testNumber-=1;
    }
  }
  //System.out.print("Tests-- button pressed");
  if (
    mouseX>830&&mouseX<870
    &&mouseY>510&&mouseY<530
    ) {
    if (testNumber<10) {
      testNumber+=1;
    } else if (testNumber<100) {
      testNumber+=10;
    } else if (testNumber<1000) {
      testNumber+=100;
    } else if (testNumber<10000) {
      testNumber+=1000;
    }
    //System.out.print("Tests++ button pressed");
  }
  // test button
  if (
    mouseX>620&&mouseX<870
    &&mouseY>460&&mouseY<500
    ) {
    test();
  }
}