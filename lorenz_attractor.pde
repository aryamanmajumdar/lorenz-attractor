/*------------------------------------------------------
 * Aryaman Majumdar
 * 2020
 * Lorenz attractor
 ----------------------------------------------------*/

//Initialize x, y, z
float x = 0.01;
float y = 0;
float z = 0;

//Initialize constants
float a = 10;
float b = 28;
float c = 8.0/3.0;

//List to store points
ArrayList<PVector> points = new ArrayList<PVector>();

//Set up the screen and the color mode - HSB works better than RGB if you don't
//want wacky colors.
void setup(){
  size(800,600, P3D);
  colorMode(HSB);

}

void draw(){
  //black background
  background(0);
  
  //Set an appropriate time step
  float dt = 0.01;
  
  //Adjustment of x, y, z based on time step
  float dx = (a * (y-x)) * dt;
  float dy = (x * (b-z) - y)*dt;
  float dz = (x * y - c * z)*dt;
  
  x = x + dx;
  y = y + dy;
  z = z + dz;
  
  //Populate the list with points every time step
  points.add(new PVector(x,y,z));
  
  //Graphics setup - put the graph in the middle of the screen,
  //set an appropriate scale,
  translate(width/2, height/2);
  scale(5);
  stroke(255);
  noFill();
  
  //Draw the thing. 
  float hue = 0;
  beginShape();
  for(PVector v : points){
    stroke(hue,200,255);
    vertex(v.x,v.y,v.z);
    hue += 0.1;
    if(hue > 255){
      hue = 0;
    }
  }
  endShape();
  
}
