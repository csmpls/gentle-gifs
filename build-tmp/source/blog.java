import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import controlP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class blog extends PApplet {


public void setup() {
	initRandomVars();
	size(1360,768);
	noStroke();
	smooth();
	// setupGUI();
}

int x = 0;
public void draw() {
	background(0);
	// updateFromGUI();
	float off = x%circleOffset;
	drawCircles(off);

	if (dir<3) {
		x++;
	} else{
		x--;
	}

}

public void keyPressed() {
	initRandomVars();
}

public void drawCircles(float offset) {

	if (dir == 1) {

		for (int x = width; x>minCircleCenter; x-=circleOffset) {
			setFillColor(x, minCircleCenter, width, offset);
			ellipse(x+offset, height/2, diameterX, height*1.2f);
		}
	} else if (dir == 2) {
		for (int y = PApplet.parseInt(minCircleCenter); y < height+circleOffset; y+=circleOffset) {
			setFillColor(y, minCircleCenter, height, offset);
			ellipse(width/2, y+offset, width*1.2f, diameterX);
		}
	} else if (dir == 3) {
		for (int x = PApplet.parseInt(minCircleCenter); x<width+circleOffset; x+=circleOffset) {
			setFillColor(x, width, minCircleCenter, offset);
			ellipse(x+offset, height/2, diameterX, height*1.2f);
		}
	} else {
		for (int y = height; y > PApplet.parseInt(minCircleCenter); y-=circleOffset) {
			setFillColor(y, height, minCircleCenter, offset);
			ellipse(width/2, y+offset, width*1.2f, diameterX);
		}
	}

}

public void setFillColor(int x, float origin, float target, float offset) {
	float gradientPos = map(x,origin-offset,target-offset,0,1);
	float r = map(gradientPos,0,1,red(startColor), red(endColor));
	float g = map(gradientPos,0,1,green(startColor), green(endColor));
	float b = map(gradientPos,0,1,blue(startColor), blue(endColor));
	fill(color(r,g,b));
}

// void draw() {

// }

ControlP5 cp5;
Accordion accordion;
ColorPicker cp1, cp2;
Slider2D s;

public void setupGUI() {


  cp5 = new ControlP5(this);
  
  // colors group
  Group g1 = cp5.addGroup("colors")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(100)
                ;

  cp1 = cp5.addColorPicker("startColor")
          .setPosition(0, 0)
          .moveTo(g1)
          .setColorValue(startColor);
          ;
  cp2 = cp5.addColorPicker("endColor")
          .setPosition(0, 50)
          .moveTo(g1)
          .setColorValue(endColor);
          ;

  // forms group
  Group g2 = cp5.addGroup("forms")
	            .setBackgroundColor(color(0, 64))
	            .setBackgroundHeight(100)
	            ;
 
   s = cp5.addSlider2D("circle diameter (X) vs spacing (Y)")
         .setPosition(0,0)
         .setSize(275,275)
         .setMinX(150)
         .setMaxX(408)
         .setMinY(20)
         .setMaxY(55)
         .setArrayValue(new float[] {diameterX, 50})
         .moveTo(g2)
         //.disableCrosshair()
         ;
          
   accordion = cp5.addAccordion("acc")
         .setPosition(40,40)
         .setWidth(275)
         .addItem(g1)
         .addItem(g2)
         ;
}

public void updateFromGUI() {
	startColor = cp1.getColorValue();
	endColor = cp2.getColorValue();
	diameterX = s.arrayValue()[0];
	circleOffset = diameterX*(s.arrayValue()[1]/100);
}

int startColor, endColor;
float diameterX, circleOffset,minCircleCenter;
int dir;

public void initRandomVars() {

	randomSeed(millis());

	startColor = color(
		random(0,255),
		random(0,255),
		random(0,255)
		); //color(255,33,86);
	endColor = color(
		random(0,255),
		random(0,255),
		random(0,255)
		);

	diameterX = random(150,480);
	circleOffset = diameterX*(random(20,55)/100);
	minCircleCenter = -diameterX*2;

	dir = PApplet.parseInt(random(1,4));
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "blog" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
