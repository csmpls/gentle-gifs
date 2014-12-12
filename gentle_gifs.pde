
import gifAnimation.*;
//import controlP5.*

void setup() {
	initRandomVars();
	size(540,540);
	noStroke();
	smooth();

	if (dir<3) {
		x = 1;
	} else {
		x = -1;
	}
	// setupGUI();
	setupGifExport();
}

void draw() {
	// updateFromGUI();
	int off = x%circleOffset;
	drawCircles(off);
	addToGif();

	if (dir<3) {
		x++;
	} else{
		x--;
	}

	println(off);
	if (off == 0) {
		println("repeat?");
 	gifExport.finish();
	 	exit();
	}

}

void keyPressed() {
	// initRandomVars();
}
