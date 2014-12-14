
void drawConcentricCircles(float offset) {
	for (float d = width*1.6; d>diameterX; d-=circleOffset) {
		setFillColor(int(d), diameterX, width*1.6, offset);
		ellipse(width/2,height/2,d+offset,d+offset);
	}
}

void drawCircles(float offset) {

	if (dir == 1) {

		for (int x = width; x>minCircleCenter; x-=circleOffset) {
			setFillColor(x, minCircleCenter, width, offset);
			ellipse(x+offset, height/2, diameterX, height*1.2);
		}
	} else if (dir == 2) {
		for (int y = int(minCircleCenter); y < height+circleOffset; y+=circleOffset) {
			setFillColor(y, minCircleCenter, height, offset);
			ellipse(width/2, y+offset, width*1.2, diameterX);
		}
	} else if (dir == 3) {
		for (int x = int(minCircleCenter); x<width+circleOffset; x+=circleOffset) {
			setFillColor(x, width, minCircleCenter, offset);
			ellipse(x+offset, height/2, diameterX, height*1.2);
		}
	} else {
		for (int y = height; y > int(minCircleCenter); y-=circleOffset) {
			setFillColor(y, height, minCircleCenter, offset);
			ellipse(width/2, y+offset, width*1.2, diameterX);
		}
	}

}

void setFillColor(int x, float origin, float target, float offset) {
	float gradientPos = map(x,origin-offset,target-offset,0,1);
	float r = map(gradientPos,0,1,red(startColor), red(endColor));
	float g = map(gradientPos,0,1,green(startColor), green(endColor));
	float b = map(gradientPos,0,1,blue(startColor), blue(endColor));
	fill(color(r,g,b));
}
