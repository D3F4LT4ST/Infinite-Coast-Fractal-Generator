class JuliaSet extends AbstractSet{
  
  JuliaSet(ComplexPlane complexPlane, int maxIterations, double[] c){
    super(complexPlane, maxIterations);
    this.c = c;
  }

  // Evaluate the canvas point (x, y) and determine the color
  color evaluatePoint(int x, int y){
    
    iterations = 0;
    
    // Transform (x, y) into complex point, z 
    complexPlane.screenToComplexPlane(z, x, y, true);

    while(iterations < maxIterations){
      
      // f(z) = z^2 + c
      ComplexPlaneOperations.multiply(z, z);
      ComplexPlaneOperations.add(z, c);
      
      if(ComplexPlaneOperations.magnitude(z) > 2){
        // |z| > 2 -> f(z) diverges
        break;
      }
      
      iterations++;
    }
    
    // Determine the color
    if(iterations == maxIterations){
      return color(0,0,0);
    }else{
      return color(255-map(iterations, 0, maxIterations, 0, 255),255,255);
    } 
  }
}
