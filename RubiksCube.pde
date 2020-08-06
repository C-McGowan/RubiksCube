import peasy.*;
PeasyCam cam;

// TOP, BOTTOM, FRONT, RIGHT, BACK, LEFT
final int UPP = 0;
final int DWN = 1;
final int FRT = 2;
final int RGT = 3;
final int BCK = 4;
final int LFT = 5;

// WHITE, YELLOW, GREEN, RED, BLUE, ORANGE
color[] colors = {
  #FFFFFF, #FFFF00, 
  #00FF00, #FF0000,
  #0000FF, #FFA500
};
int dim = 3;
float len = 50;
float offset = (dim - 1) * len * 0.5;

Cubie[] cube = new Cubie[dim*dim*dim];

void setup() {
  size(480, 480, P3D);
  cam = new PeasyCam(this, 400);
  int index = 0;
  for (int i = 0; i < dim; i++) {
    for (int j = 0; j < dim; j++) {
      for (int k = 0; k < dim; k++) {
        float x = len * i - offset;
        float y = len * j - offset;
        float z = len * k - offset;

        PMatrix3D matrix = new PMatrix3D();
        matrix.translate(x, y, z);
        cube[index] = new Cubie(matrix, len, x, y, z);
        index++;
      }
    }
  }
}

void turnF(boolean prime) {
  //prime = true is anticlockwise, prime = false is clockwise
  float rotation = prime ? -HALF_PI : HALF_PI;
  for (int i  = 0; i < cube.length; i++) {
    Cubie qb = cube[i];
    if (qb.z == offset) {
      PMatrix2D fFace = new PMatrix2D();
      fFace.rotate(rotation);
      fFace.translate(qb.x, qb.y);
      qb.update(round(fFace.m02), round(fFace.m12), round(qb.z));
      qb.turnF(prime);
    }
  }
}

void turnB(boolean prime) {
  float rotation = prime ? HALF_PI : -HALF_PI;
  for (int i  = 0; i < cube.length; i++) {
    Cubie qb = cube[i];
    
    if (qb.z == -offset) {
      PMatrix2D bFace = new PMatrix2D();
      bFace.rotate(rotation);
      bFace.translate(qb.x, qb.y);
      qb.update(round(bFace.m02), round(bFace.m12), round(qb.z));
      qb.turnB(prime);
    }
  }
}

void turnU(boolean prime) {
  float rotation = prime ? -HALF_PI : HALF_PI;
  for (int i  = 0; i < cube.length; i++) {
    Cubie qb = cube[i];
    if (qb.y == -offset) {
      PMatrix2D uFace = new PMatrix2D();
      uFace.rotate(rotation);
      uFace.translate(qb.x, qb.z);
      qb.update(round(uFace.m02), round(qb.y), round(uFace.m12));
      qb.turnU(prime);
    }
  }
}

void turnD(boolean prime) {
  float rotation = prime ? HALF_PI : -HALF_PI;
  for (int i  = 0; i < cube.length; i++) {
    Cubie qb = cube[i];
    if (qb.y == offset) {
      PMatrix2D dFace = new PMatrix2D();
      dFace.rotate(rotation);
      dFace.translate(qb.x, qb.z);
      qb.update(round(dFace.m02), round(qb.y), round(dFace.m12));
      qb.turnD(prime);
    }
  }
}

void turnR(boolean prime) {
  float rotation = prime ? -HALF_PI : HALF_PI;
  for (int i  = 0; i < cube.length; i++) {
    Cubie qb = cube[i];
    if (qb.x == offset) {
      PMatrix2D rFace = new PMatrix2D();
      rFace.rotate(rotation);
      rFace.translate(qb.y, qb.z);
      qb.update(round(qb.x), round(rFace.m02),  round(rFace.m12));
      qb.turnR(prime);
    }
  }
}

void turnL(boolean prime) {
  float rotation = prime ? HALF_PI : -HALF_PI;
  for (int i  = 0; i < cube.length; i++) {
    Cubie qb = cube[i];
    if (qb.x == -offset) {
      PMatrix2D rFace = new PMatrix2D();
      rFace.rotate(rotation);
      rFace.translate(qb.y, qb.z);
      qb.update(round(qb.x), round(rFace.m02),  round(rFace.m12));
      qb.turnL(prime);
    }
  }
}


void keyPressed(){
  switch(key) {
    case '1': 
      turnU(false);
      break;
    case '!':
      turnU(true);
      break;
    case '2': 
      turnR(false);
      break;
    case '"':
      turnR(true);
      break;
    case '3': 
      turnL(false);
      break;
    case '£':
      turnL(true);
      break;
    case '4': 
      turnF(false);
      break;
    case '$':
      turnF(true);
      break;
    case '5':
      turnD(false);
      break;
    case '%':
      turnD(true);
      break;
    case '6':
      turnB(false);
      break;
    case '^':
      turnB(true);
      break;
    default:
      break;
  }
}

void draw() {
  background(50);
  for (int i = 0; i < cube.length; i++) {
    cube[i].show();
  }

   
}
