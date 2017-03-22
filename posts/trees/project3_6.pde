// Based on an example adapted by Casey Reas and Ben Fry
// found at http://processingjs.org/learning/topic/tree/

float theta  = 0;
float theta2 = 0;
float theta3 = 0;
float theta4 = 0;
float randAngle  = random(TWO_PI / random(40,150));
float randAngle2 = random(TWO_PI / random(40,150));
float randAngle3 = random(TWO_PI / random(40,150));
float randAngle4 = random(TWO_PI / random(40,150));
float randWidth;
float randHeight;
float h = 0;
//float branchLength = random(0.6, 0.7);
color c1 = color(0,random(80,255));
color bgColor = color(255, 255, 255);

void setup() {
  size(window.innerWidth, window.innerHeight);
  stroke(c1);
  strokeWeight(random(1, 6));
  strokeJoin(ROUND);
  strokeCap(ROUND);
  smooth();
  rectMode(CENTER);
  background(bgColor);
  randWidth = random(width/3);
	randHeight = random(height/3);
}

void draw() {
	//background(bgColor);
  fadeOut();

  // Start the tree from the bottom of the screen
  translate(0.58*width,height);
 // line(0,0,0,-h);

  // Move to the end of that line
  translate(0,-h);

  // Start the recursive branching
  branch(h);

  h+=5;
  theta  += randAngle;
  theta2 += randAngle2;
  theta3 += randAngle3;
  theta4 += randAngle4;

  if(h > height / 1.5)
    noLoop();
}



void branch(float h) {

  h *= 0.66f;
  
  // Exit when the branch is 2 pixels or less
  if (h > 2) {
      pushMatrix();
      rotate(theta);   // Rotate by theta
      line(0,0,0,-h);  // Draw the branch
     // translate(0,-h); // Move to the end of the branch
      rotate(-theta3);
      translate(0,-randHeight);
      branch(h);
      popMatrix();     

      // Repeat on the left
      pushMatrix();
      rotate(-theta2);
      line(0,0,0,-h);
      //translate(0,-h);
      rotate(-theta4);
      translate(0,-randHeight);
      branch(h);
      popMatrix();

	  // Add some leaves
	  if(h < 3)
  	 	stroke(255,215,0,80);
	  else if(h < 6)
  	 	stroke(255,28,174,120);
      else
  		stroke(c1);
  }
}

 // adjust tracers
void fadeOut() {
	fill(bgColor, 0.5);
	rect(width/2, height/2, width, height);
}
