import controlP5.*;
ControlP5 cp5;
Accordion accordion;
ColorPicker cp1, cp2;
Slider2D s;

void setupGUI() {


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
         .setMinX(20)
         .setMaxX(308)
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

void setInterfaceItemsToVars() {

  cp1.setColorValue(startColor);
  cp2.setColorValue(endColor);
  s.setArrayValue(new float[] {diameterX, 50});

}


void updateFromGUI() {
	startColor = cp1.getColorValue();
	endColor = cp2.getColorValue();
	diameterX = s.arrayValue()[0];
	circleOffset = int(diameterX*(s.arrayValue()[1]/100));
}
