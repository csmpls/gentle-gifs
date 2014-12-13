
import gifAnimation.*;
import controlP5.*;

boolean save_gif = false;
boolean saving = false;

void setup() {
  initRandomVars();
  size(1340,768);
  noStroke();
  smooth();

  if (dir<3) {
    x = 1;
  } else {
    x = -1;
  }
  setupGUI();
//  setupGifExport();
}

void draw() {
  updateFromGUI();
  int off = x%circleOffset;
  drawCircles(off);
  
        if (saving) {
    addToGif();
        }

  if (dir<3) {
    x++;
  } else{
    x--;
  }

      /// on repeat
  if (off == 0) {
              if (save_gif && saving) {
                  save_gif = false;
                  saving = false;
                  gifExport.finish();
                  cp5.show();
                  println("done saving");
                }
                if (save_gif && !saving) {
                  cp5.hide();
                  print("saving........");
                  saving = true;
                  setupGifExport();
                }
                
  }

}

void keyPressed() {

        if (key == 's') {
          save_gif = true;

        } else {
            initRandomVars();
        }
}
