// Loosely based on an example adapted by Casey Reas and Ben Fry
// found at http://processingjs.org/learning/topic/tree/

float theta  = 0;
float theta2 = 0;
float randAngle  = random(TWO_PI / random(40, 150));
float randAngle2 = random(TWO_PI / random(40, 150));
float randHeight;
float h = 0;
color c1 = color(51, 0, 51, 100);
color bgColor = color(255, 255, 255);

void setup() {
	size(window.innerWidth, window.innerHeight);
	stroke(c1);
	strokeWeight(random(1, 2));
	strokeJoin(ROUND);
	strokeCap(ROUND);
	smooth();
	rectMode(CENTER);
	background(bgColor);
	randHeight = random(height/2);
	frameRate(100);
}

void draw() {

	fadeOut();

	// Choose a starting position
	translate(0.58*width, height/2);

	// Move to the end of that line
	translate(random(-5, 5), random(-5, 5));

	// Start the recursive branching
	branch(h);

	h += 2;
	theta  += randAngle;
	theta2 += randAngle2;

	if(h > 1000)
		noLoop();
}



void branch(float h) {
	h *= 0.66f;

	// Exit when the branch is 2 pixels or less
	if (h > 2) {
		pushMatrix();
		rotate(theta);
		line(0, 0, 0, -h);
		translate(0, -randHeight);
		branch(h);
		popMatrix();     

		// Repeat on the left
		pushMatrix();
		rotate(-theta2);
		line(0, 0, 0, -h);
		translate(0, -randHeight);
		branch(h);
		popMatrix();
	}
}

// adjust tracers
void fadeOut() {
	fill(bgColor, 0.5);
	rect(width/2, height/2, width, height);
}
