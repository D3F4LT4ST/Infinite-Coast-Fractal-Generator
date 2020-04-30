static class ComplexPlaneOperations{
  
  // Add two complex numbers
  public static void add(double[] c1, double[] c2){
    c1[0] += c2[0];
    c1[1] += c2[1];
  }
  
  // Subtract two complex numbers
  public static void substract(double[] c1, double[] c2){
    c1[0] -= c2[0];
    c1[1] -= c2[1]; 
  }
  
  // Multiply two complex numbers
  public static void multiply(double[] c1, double[] c2){
    double[] temp = new double[2];
    
    temp[0] = c1[0] * c2[0] - c1[1] * c2[1];
    temp[1] = c1[0] * c2[1] + c1[1] * c2[0];
    
    c1[0] = temp[0];
    c1[1] = temp[1];
  }
  
  // Euler's formula
  public static void eulerExp(double[] result, double x){
    result[0] = (double)Math.cos(x);
    result[1] = (double)Math.sin(x);
  }  
  
  // Compute magnitude of a complex number
  public static double magnitude(double[] c){
    return Math.sqrt(Math.pow(c[0], 2) + Math.pow(c[1], 2));
  }

}
