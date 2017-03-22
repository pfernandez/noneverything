// Loosely based on an example adapted by Casey Reas and Ben Fry
// found at http://processingjs.org/learning/topic/tree/

int randSign1;
int randSign2;
float theta  = 0;
float randAngle  = random(TWO_PI / random(40, 150));
float randHeight;
float h = 0;
float r = 200;
float g = 235;
float b = 235;
color bgColor = color(255, 255, 255);

void setup() {
	size(window.innerWidth, window.innerHeight);
	strokeWeight(random(1, 2));
	strokeJoin(ROUND);
	strokeCap(ROUND);
	smooth();
	background(bgColor);
	randHeight = random(-height/2, height/2);
	frameRate(60);
	
	// Generate random multipliers of -1 or 1
	if(random(100) >= 50)
		randSign1 = 1;
    else
		randSign1 = -1;
    if(random(100) >= 50)
		randSign2 = 1;
    else
		randSign2 = -1;
}

void draw() {
	fadeOut();
	
	// Increment the line color
	stroke(r, g, b, 100);
	if(r < 255) r *= .97;
	if(g < 255) g *= .97;
	if(b < 255) b *= .97;

	// Choose a starting position
	translate(0.58*width, height/2);

	// Start the recursive branching
	branch(h);

	h += 5;
	theta += randAngle;

    // Establish an exit condition
	if(r < 1 && g < 1 && b  < 1) noLoop();
}



void branch(float h) {
	h *= 0.66f;

	// Exit when the branch is 2 pixels or less
	if (h > 2) {
		pushMatrix();
		rotate(theta);
		line(0, h, 0, -h);
		translate(0, h*randSign1);
		branch(h);
		popMatrix();     

		// Repeat on the left
		pushMatrix();
		rotate(-theta);
		line(0, h, 0, -h);
		translate(0, h*randSign2);
		branch(h);
		popMatrix();
	}
}

// adjust tracers
void fadeOut() {
	fill(bgColor, 2);
	rect(0, 0, width, height);
}
