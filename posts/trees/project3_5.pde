// Based on an example written by Casey Reas and Ben Fry
// found at http://processingjs.org/learning/topic/tree/

float theta = random(1) * TWO_PI;
float theta2 = random(1) * TWO_PI;
float theta3 = random(1) * TWO_PI;
float theta4 = random(1) * TWO_PI;
float h = 0;
color c1 = color(0,130);
color bgColor = color(255, 255, 255);

void setup() {
  size(window.innerWidth, window.innerHeight);
  stroke(c1);
  strokeWeight(random(1, 3));
  strokeJoin(ROUND);
  strokeCap(ROUND);
  smooth();
  rectMode(CENTER);
  background(bgColor);
}

void draw() {
  fadeOut();

  scale(1.1);
  // Start the tree from the bottom of the screen
  translate(0.58*width,.83*height);
 // line(0,0,0,-h);

  // Move to the end of that line
  translate(0,-h);
	
  rotate(h*PI/1500);
  // Start the recursive branching
  branch(h);

  h += 1;

  if(h > height / 2.5)
    noLoop();
}



void branch(float h) {

  h *= 0.66f;
  
  // Exit when the branch is 2 pixels or less
  if (h > 3) {
      pushMatrix();
      rotate(theta);   // Rotate by theta
      line(0,0,0,-h);  // Draw the branch
      translate(0,-h); // Move to the end of the branch
      rotate(-theta3);
      branch(h);
      popMatrix();     

      // Repeat on the left
      pushMatrix();
      rotate(-theta2);
      line(0,0,0,-h);
      translate(0,-h);
      rotate(theta4);
      branch(h);
      popMatrix();

	  // Add some leaves
	  if(h < 4)
  	 	stroke(255,215,0,50);
	  else if(h < 5)
  	 	stroke(255,153,18,50);
      else
  		stroke(c1);
  }
}

 // adjust tracers
void fadeOut() {
	fill(bgColor, 0.5);
	rect(width/2, height/2, width, height);
}
