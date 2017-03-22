// Loosely based on an example adapted by Casey Reas and Ben Fry
// found at http://processingjs.org/learning/topic/tree/

int randSign1;
int randSign2;
float theta = 0;
float theta2 = 0;
float randAngle  = random(TWO_PI / random(40, 150));
float randAngle2  = random(TWO_PI / random(40, 150));
float h = 0;
float r = 0;
float g = 0;
float b = 0;
color bgColor = color(255, 255, 255);

void setup() {
	size(window.innerWidth, window.innerHeight);
	strokeWeight(1);
	strokeJoin(ROUND);
	strokeCap(ROUND);
	smooth();
	background(bgColor);
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
	
	// Increment the line color
	stroke(r, g, b, 100);
	if(r <= 255) r += 0.7;
	if(g <= 255) g += 0.7;
	if(b <= 255) b += 0.7;

	
	// Choose a starting position and size
	translate(0.58*width, height/2);
    scale(3);
	
	// Start the recursive branching
	branch(h);

	h += 0.5;
	theta += randAngle;
	theta2 += randAngle2;

    // Establish an exit condition
	if(r > 255 && g > 255 && b > 255) noLoop();
}



void branch(float h) {
	h *= 0.66f;

	// Exit when the branch is 2 pixels or less
	if (h > 2) {
		pushMatrix();
		rotate(theta*randSign1);
		line(0, h, 0, -h);
		translate(0, h);
		branch(h);
		popMatrix();     

		// Repeat on the left
		pushMatrix();
		rotate(theta2*randSign2);
		line(0, h, 0, -h);
		translate(h,0);
		branch(h);
		popMatrix();
		
		// Add some extra color
		if (h < 3)
			stroke(r, g, b, 200);
		else
		    stroke(0, 0, 0, 30);
		    
	}
}

// adjust tracers
void fadeOut() {
	fill(bgColor, 2);
	rect(0, 0, width, height);
}
