// Loosely based on an example adapted by Casey Reas and Ben Fry
// found at http://processingjs.org/learning/topic/tree/

int randSign1;
int randSign2;
float theta = 0;
float theta2 = 0;
float randAngle = random(TWO_PI / random(150, 200));
float randAngle2 = random(TWO_PI / random(150, 200));
float randHeight;
float h = 0;
float r = 10;
float g = 0;
float b = 10;
color bgColor = color(255, 255, 255);

void setup() {
	size(window.innerWidth, window.innerHeight);
	strokeWeight(1);
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
	//fadeOut();
	
    // Establish an exit condition
	if(r > 255 && g > 255 && b > 255) noLoop();
	
	// Increment the line color
	stroke(r, g, b, 100);
	if(r <= 255) r += 0.5;
	if(g <= 255) g += 0.5;
	if(b <= 255) b += 0.5;

	
	// Choose a starting position and size
	translate(0.58*width, height/2);
    scale(5);
	
	// Start the recursive branching
	branch(h);

	h += .5;
	theta += randAngle;
	theta2 += randAngle2;
}



void branch(float h) {
	h *= 0.66f;

	// Exit when the branch is 2 pixels or less
	if (h > 2) {
		pushMatrix();
		rotate(theta);
		line(0, -.5*h, 0, .5*h);
		translate(h, 0);
		branch(h);
		popMatrix();     

		// Repeat on the left
		pushMatrix();
		rotate(theta* randSign1);
		line(0, -.5*h, 0, .5*h);
		translate(h, 0);
		branch(h);
		popMatrix();
		
		if (h < 3)
			stroke(r, g, b, 150);
		else
		    stroke(0, 0, 0, 35);
		    
	}
}

// adjust tracers
void fadeOut() {
	fill(bgColor, 2);
	rect(0, 0, width, height);
}
