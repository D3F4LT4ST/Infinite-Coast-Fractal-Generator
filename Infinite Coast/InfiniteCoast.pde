/********************************/
/* INFINITE COAST EARLY VERSION */
/*          Andrew ST           */
/********************************/


// Initialize complex plane
ComplexPlane complexPlane = new ComplexPlane(1.0f, 1280, 720);
 
/* CHANGE PARAMETERS (ITER MAX / C) HERE */
MandelbrotSet mandelbrotSet = new MandelbrotSet(complexPlane, 100);
JuliaSet juliaSet = new JuliaSet(complexPlane, 100, new double[]{0.285, 0.0});

// values for dynamic Julia visualization
double k = 0.7885;
double x = 0.0f;

void setup(){
  size(1280, 720);
}

void draw(){
  /* CHANGE FRACTAL TO RENDER HERE */
  visualizeMandelbrot();
  drawScreenCenter();
}

// visualize Mandelbrot Set
void visualizeMandelbrot(){visualizeSet(mandelbrotSet);}

// visualize Julia Set
void visualizeJulia(){visualizeSet(juliaSet);}

// Dynamic Julia Set visualization for c = 0.7885*e^(ix), where x є [0, 2PI]
void visualizeJuliaDynamic(){
  visualizeSet(juliaSet);
  
  ComplexPlaneOperations.eulerExp(juliaSet.c, x * (double)Math.PI);
  
  juliaSet.c[0] *= k;
  juliaSet.c[1] *= k;
  
  x += 0.01;
  x = x >= 2.0f ? 0.0f : x;
}

// Main visualization function
void visualizeSet(AbstractSet set){
  
  loadPixels();
  for(int x = 0; x < width; x++){
    for(int y = 0; y < height; y++){
        colorMode(HSB);
        pixels[x+y*width] = set.evaluatePoint(x, y);
        colorMode(RGB);
        drawPlaneAxes(x, y);
    } 
  }    
  updatePixels();
}

// Handle mouse press event
void mousePressed(MouseEvent mouseEvent){
  complexPlane.startPan(mouseEvent.getX(), mouseEvent.getY());
}

// Handle mouse drag event
void mouseDragged(MouseEvent mouseEvent){
  complexPlane.pan(mouseEvent.getX(), mouseEvent.getY());
}

// Handle mouse wheel drag event
void mouseWheel(MouseEvent mouseEvent){
  
  if(mouseEvent.getCount() > 0){
    complexPlane.zoom(1.1);
  }else{
    complexPlane.zoom(0.9);
  }
}

// Draw screen center cross
void drawScreenCenter(){
  translate(width / 2, height / 2);
  
  stroke(255,255,255);
  line(-10,0,10,0);
  line(0,-10,0,10);
}

// Draw complex plane axes
void drawPlaneAxes(int x, int y){
  
  double[] point = new double[2];
  complexPlane.screenToComplexPlane(point, x, y, true);
          
  if(Math.abs(point[0]) <= (0.01 / complexPlane.scale) || Math.abs(point[1]) <= (0.01 / complexPlane.scale)){
    pixels[x+y*width] = color(0,0,0);
  }
}
