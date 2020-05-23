class Antena {

  PShape dish;
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
  int flipTime;
  float rotation;


  Antena(float x, float y, float z, float scale, float r, float g, float b, float rotY, float rotX, float rot) {
    dish = loadShape("dish.obj");//Circulo
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
    rotation = 0.0;
  }

  void Dibujar() {
    pushMatrix();
      translate(x_, y_, z_);
      rotateX(radians(180));
      
      rotation += 0.01;
      rotateY(rotY_);
      rotateX(rotX_);
      rotate(rot_);
      rotateY(rotation);

      scale(scale_);
      dish.setFill(color(r_, g_, b_));
      shape(dish); 
    popMatrix();
  }
}
