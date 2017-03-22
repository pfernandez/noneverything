// Based on an example written by Casey Reas and Ben Fry
// found at http://processingjs.org/learning/topic/tree/

float theta  = 0;
float theta2 = 0;
float theta3 = 0;
float theta4 = 0;
float randAngle  = random(TWO_PI / random(40,150));
float randAngle2 = random(TWO_PI / random(40,150));
float randAngle3 = random(TWO_PI / random(40,150));
float randAngle4 = random(TWO_PI / random(40,150));
float h = 0;
color c1 = color(0,175);

void setup() {
  size(window.innerWidth, window.innerHeight);
  stroke(c1);
  strokeWeight(random(2,4));
  strokeJoin(ROUND);
  strokeCap(ROUND);
  smooth();
}

void draw() {
  background(255);

  // Start the tree from the bottom of the screen
  translate(0.58*width,height);
  line(0,0,0,-h);

  // Move to the end of that line
  translate(0,-h);

  // Start the recursive branching!
  branch(h);

  h += 2;  // controls growth speed
  theta  += randAngle;
  theta2 += randAngle2;
  theta3 += randAngle3;
  theta4 += randAngle4;

  if(h > height / 2)  // controls max size
    noLoop();
}



void branch(float h) {
  // Each branch will be 2/3rds the size of the previous one
  h *= 0.66f;
  
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 3) {
      pushMatrix();    // Save the current state of transformation (i.e. where are we now)
      rotate(theta);   // Rotate by theta
      line(0,0,0,-h);  // Draw the branch
      translate(0,-h); // Move to the end of the branch
      rotate(-theta3);
      branch(h);       // Ok, now call myself to draw two new branches!!
      popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state

      // Repeat the same thing, only branch off to the "left" this time!
      pushMatrix();
      rotate(-theta2);
      line(0,0,0,-h);
      translate(0,-h);
      rotate(theta4);
      branch(h);
      popMatrix();

	  // How about some leaves?
	  if(h < 5)
	    stroke(200,180);
	  else if(h < 7)
  	 	stroke(80,180);
      else
  		stroke(c1);
  }
}
