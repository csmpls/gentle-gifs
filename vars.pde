
int x;

color startColor, endColor;
float diameterX,minCircleCenter; 
int circleOffset;
int dir;

void initRandomVars() {

	println("initializing random vars");

	startColor = color(
		random(0,255),
		random(0,255),
		random(0,255)
		); 
	endColor = color(
		random(0,255),
		random(0,255),
		random(0,255)
		);

	diameterX = random(20,120);
	circleOffset = int(diameterX*(random(20,55)/100));
	minCircleCenter = -diameterX*2;

	dir = int(random(1,4));

}