class MandelbrotSet extends AbstractSet{
  
  MandelbrotSet(ComplexPlane complexPlane, int maxIterations){
    super(complexPlane, maxIterations);
  }

  // Evaluate the canvas point (x, y) and determine the color
  color evaluatePoint(int x, int y){
    
    iterations = 0;
    
    // z = 0.0 + 0.0i
    z = new double[]{0.0, 0.0};
    
    // Transform (x, y) into complex point, c 
    complexPlane.screenToComplexPlane(c, x, y, true);

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
