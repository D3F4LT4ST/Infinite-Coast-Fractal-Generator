// Complex plane class
class ComplexPlane{
  
  double scale;
  
  int screenWidth;
  int screenHeight;
  
  int[] screenCenter;
  
  double[] panStart = {0.0, 0.0};
  double[] panOffset = {0.0, 0.0};
  
  ComplexPlane(double scale, int screenWidth, int screenHeight){
    this.scale = scale;
    this.screenWidth = screenWidth;
    this.screenHeight = screenHeight;
    this.screenCenter = new int[]{screenWidth / 2, screenHeight / 2};
  }
  
  // Start panning
  void startPan(double mousePosX, double mousePosY){
    screenToComplexPlane(this.panStart, mousePosX, mousePosY, true);
  }
  
  // Pan camera on drag
  void pan(double mousePosX, double mousePosY){
    screenToComplexPlane(this.panOffset, mousePosX, mousePosY, false);
    ComplexPlaneOperations.substract(this.panOffset, this.panStart);
  }
  
  // Zoom camera
  void zoom(double magnification){
    this.scale *= magnification;
    this.scale = Math.max(1, this.scale);
  }
  
  // Transform canvas coordinates into complex plane coordinates
  void screenToComplexPlane(double[] complexPoint, double canvasPointX, double canvasPointY, boolean offset){
    
    complexPoint[0] = (canvasPointX - screenCenter[0]) / (100 * scale);
    complexPoint[1] = (screenCenter[1] - canvasPointY) / (100 * scale);
    
    if(offset){
      ComplexPlaneOperations.substract(complexPoint, panOffset);
    }
  }
}
