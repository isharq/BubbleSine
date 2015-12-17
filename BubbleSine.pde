void setup()
{
  noStroke();
  size(displayWidth, displayHeight);
//  frameRate(20);
}

int size     = 0;
int location = 0;
float opacity = 0;
float thisloop = 0;
float ellipsesize = 0;
float transparency = 0; 

int numloop = 10;

float counter = 0; 

  float[] lastvalue = new float[1000];
  float[] spaceplace = new float[1000];
  int[] lastsmaller = new int[1000];

  float minvalue = 1000;

  float hue = 0;

void draw()
{
  int ystart = displayHeight/6;
  int xstart = 10;
  background(0);
  
  
  counter = counter + 0.01;
  
    numloop = (width-mouseX)/10;
    
    colorMode(HSB,360,50,80);
    
  hue = hue + 0.1;
  if (hue > 360) {hue = 0;}
    
for (int i = 0; i < numloop; i = i+1) {
  thisloop = displayHeight/3+sin(i*counter)*displayHeight/3;
  
  if (thisloop < minvalue) {minvalue = thisloop;}

  if (spaceplace[i] == 0) { spaceplace[i] = 1; } // initiate the spaceplace
  if (thisloop < lastvalue[i]) {lastsmaller[i] = 1; } // if this loop is bigger than the last one, set lastsmaller to 1
     
  lastvalue[i] = thisloop; // set lastvalue; 
  
  
  transparency = (150 + cos(i*counter) * 105 * spaceplace[i]);
  
  fill(round(hue),100,100,transparency);
  
//  fill(255+sin(i*counter)*255,0,0,transparency);
  
  ellipsesize = 20 + (width/numloop) + cos(i*counter) * 0.5 * (width/numloop) * spaceplace[i]; 
  ellipse(xstart+i*(width/numloop)*1.5,ystart+thisloop,ellipsesize,ellipsesize);


  if (lastsmaller[i] == 1) // if the previous loop was smaller than the last one..
    {
      if (thisloop > lastvalue[i] ) // and if this loop is bigger than the last one..
        {
          spaceplace[i] = spaceplace[i]*(-1); // flip the bit
          lastsmaller[i] = 0; 
        }
    }

} 
}