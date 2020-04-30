// Base class for all complex sets
abstract class AbstractSet{

  ComplexPlane complexPlane;
  
  double[] z;
  double[] c;
  
  int iterations;
  int maxIterations;
  
  AbstractSet(ComplexPlane complexPlane, int maxIterations){
    this.complexPlane = complexPlane;
    this.maxIterations = maxIterations;
    z = new double[2];
    c = new double[2];
    iterations = 0;
  }
  
  // Evaluate the point (x, y) and determine the color
  abstract color evaluatePoint(int x, int y);

}
