class Face {
  PVector normal;
  color c;
  float len;
  
  Face(PVector normal_, color c_, float len_) {
    this.normal = normal_;
    this.c = c_;
    this.len=len_;
  }
  
void turnF(boolean prime) {
  int dir = prime ? -1 : 1;
  PVector newV = new PVector();
  newV.x = round(-normal.y * dir);
  newV.y = round(normal.x * dir);
  newV.z = round(normal.z);
  normal = newV;
}

void turnB(boolean prime) {
  int dir = prime ? -1 : 1;
  PVector newV = new PVector();
  newV.x = round(normal.y * dir);
  newV.y = round(-normal.x * dir);
  newV.z = round(normal.z);
  normal = newV;;
}

void turnU(boolean prime) {
  int dir = prime ? -1 : 1;
  PVector newV = new PVector();
  newV.x = round(-normal.z * dir);
  newV.y = round(normal.y);
  newV.z = round(normal.x * dir);
  normal = newV;
}

void turnD(boolean prime) {
  int dir = prime ? -1 : 1;
  PVector newV = new PVector();
  newV.x = round(normal.z * dir);
  newV.y = round(normal.y);
  newV.z = round(-normal.x * dir);
  normal = newV;
}

void turnR(boolean prime) {
  int dir = prime ? -1 : 1;
  PVector newV = new PVector();
  newV.x = round(normal.x);
  newV.y = round(-normal.z * dir);
  newV.z = round(normal.y * dir);
  normal = newV;
}

void turnL(boolean prime) {
  int dir = prime ? -1 : 1;
  PVector newV = new PVector();
  newV.x = round(normal.x);
  newV.y = round(normal.z * dir);
  newV.z = round(-normal.y* dir);
  normal = newV;
}
  

  
  void show() {
    pushMatrix();
    fill(c);
    rectMode(CENTER);
    
    translate(0.5 * len * normal.x, 0.5 * len * normal.y ,0.5 * len * normal.z);
    if(abs(normal.x) > 0) {
      rotateY(HALF_PI);
    } else if (abs(normal.y) > 0) {
      rotateX(HALF_PI);
    } else if (abs(normal.z) > 0) {
      
    }
    square(0, 0, len);
    popMatrix();
  }
}
