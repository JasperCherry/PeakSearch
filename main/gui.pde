void gui() {

  // controls for number of peaks
  fill(150);
  rect(620, 10, 250, 40);
  rect(620, 60, 40, 40);
  rect(725, 60, 40, 40);
  rect(830, 60, 40, 40);
  fill(0);
  textFont(font, 20);
  text("NUMBER OF PEAKS:", 620+12, 10+28);
  textFont(font, 30);
  text("-", 620+15, 60+29);
  text(peaks+1, 725+4, 60+32); // peaks + maximum
  text("+", 830+12, 60+32);

  // controls for minimum peak value
  fill(150);
  rect(620, 110, 250, 40);
  rect(620, 160, 40, 40);
  rect(725, 160, 40, 40);
  rect(830, 160, 40, 40);
  fill(0);
  textFont(font, 20);
  text("MINIMUM PEAK VALUE:", 620+12, 110+28);
  textFont(font, 30);
  text("-", 620+15, 160+29);
  text(minPeakValue, 725+12, 160+32);
  text("+", 830+12, 160+32);

  // controls for type of algorithm
  fill(150);
  rect(620, 210, 250, 40);
  rect(620, 260, 250, 40);
  fill(0);
  textFont(font, 20);
  text("ALGORITHM:", 620+12, 210+28);
  text(currentAlg, 620+12, 260+28);

  // repeating fields
  fill(150);
  rect(620, 310, 250, 40);
  fill(0);
  textFont(font, 20);
  text("repeat fields: "+repeatFields, 620+12, 310+28);

  // controls for speed
  fill(150);
  rect(620, 360, 250, 40);
  rect(620, 410, 40, 40);
  rect(725, 410, 40, 40);
  rect(830, 410, 40, 40);
  fill(0);
  textFont(font, 20);
  text("Delay time:", 620+12, 360+28);
  textFont(font, 30);
  text("-", 620+15, 410+29);
  text(delay, 725+4, 410+32);
  text("+", 830+12, 410+32);

  // controls for tests
  fill(150);
  rect(620, 460, 250, 40);
  rect(620, 510, 40, 20);
  rect(725, 510, 40, 20);
  rect(830, 510, 40, 20);
  fill(0);
  textFont(font, 20);
  text("Test", 620+12, 460+28);
  textFont(font, 13);
  text("-", 620+18, 510+15);
  text(testNumber, 725+2, 510+15);
  text("+", 830+16, 510+15);

  // start/stop algorithm
  fill(150);
  rect(620, 540, 120, 50);
  fill(0);
  textFont(font, 26);
  if (!algRunning) {
    text("START", 620+20, 540+35);
  } else {
    text("STOP", 620+20, 540+35);
  }

  // restart algorithm
  fill(150);
  rect(760, 540, 120, 50);
  fill(0);
  textFont(font, 26);
  text("RESTART", 760+1, 540+35);
}