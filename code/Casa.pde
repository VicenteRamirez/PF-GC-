class Casa {

  PShape brick1;
  float x_;
  float y_;
  float z_;
  float scale_;
  float r_;
  float g_;
  float b_;
  float rotY_;
  float rotX_;
  float rot_;

  Casa(float x, float y, float z, float scale, float r, float g, float b, float rotY, float rotX, float rot) {
    brick1 = loadShape("igloo.obj");//Circulo
    x_ = x;
    y_ = y;
    z_ = z;
    r_ = r;
    g_ = g;
    b_ = b;
    rotY_ = rotY;
    rotX_ = rotX;
    rot_ = rot;
    scale_ = scale;
  }

  void Dibujar() {
    pushMatrix();
    translate(x_, y_, z_);
    rotateY(radians(-90));
    rotateX(radians(90));
    //rotateX(radians(180));
    //rotateY(radians(180));
    rotateY(rotY_);
    rotateX(rotX_);
    rotate(rot_);
    scale(scale_);
    brick1.setFill(color(r_, g_, b_));
    shape(brick1); 
    popMatrix();
  }
}
