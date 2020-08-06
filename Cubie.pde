class Cubie{
  PMatrix3D matrix;
  float len;
  float x;
  float y;
  float z;
  Face[] faces = new Face[6];
  
  Cubie(PMatrix3D m, float len_, float x_, float y_, float z_) {
    this.matrix = m;
    this.len = len_;
    this.x = x_;
    this.y = y_;
    this.z = z_;
    
       
   faces[0] = new Face(new PVector(0, 0, 1), color(0, 255, 0), len);
   faces[1] = new Face(new PVector(0, 0, -1), color(0, 0, 255), len);
   faces[2] = new Face(new PVector(1, 0, 0), color(255, 0, 0), len);
   faces[3] = new Face(new PVector(-1, 0, 0), #FFA500, len);
   faces[4] = new Face(new PVector(0, 1, 0), color(255, 255, 0), len);
   faces[5] = new Face(new PVector(0, -1, 0), color(255), len);
  }
  
  void update(int x, int y, int z){
   matrix.reset();
   matrix.translate(x, y, z);
   this.x = x;
   this.y = y;
   this.z = z;

  }
  
  void turnU(boolean prime) {
    for(Face f: faces) {
      f.turnU(prime);
    }
  }
  
  void turnD(boolean prime) {
    for(Face f: faces) {
      f.turnD(prime);
    }
  }
  
  void turnF(boolean prime) {
    for(Face f: faces) {
      f.turnF(prime);
    }
  }
  
  void turnB(boolean prime) {
    for(Face f: faces) {
      f.turnB(prime);
    }
  }
  
  void turnR(boolean prime) {
    for(Face f: faces) {
      f.turnR(prime);
    }
  }
  
  void turnL(boolean prime) {
    for(Face f: faces) {
      f.turnL(prime);
    }
  }
  
  
  
  void show() {
    stroke(0);
    strokeWeight(2);
    pushMatrix();
    
    applyMatrix(matrix);
    noFill();
    box(len);
    for (Face face : faces) {
      face.show();
    }
    
    
    popMatrix();
  }
}
