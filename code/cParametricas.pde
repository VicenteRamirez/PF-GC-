class cParametricas{

  float Ax_; //AMPLITUD
  float Ay_;
  float r_;
  float g_;
  float b_;
  float x_;
  float y_;
  
  cParametricas(float Ax, float Ay,float r, float g, float b, float x, float y){
    Ax_ = Ax;//300;
    Ay_ = Ay;//120;
    r_ = r;
    g_ = g;
    b_ = b;
    x_ = x;
    y_ = y;
  
  }
  
  void Dibujar(){
    float delta_theta = radians(1);
    beginShape();
    fill(r_,g_,b_);
    stroke(r_,g_,b_);
    for(float theta = 0.0f; theta < 2*PI; theta += delta_theta){
      float x = Ax_ * cos(theta);
      float y = Ay_ * sin(theta);
      //circle(x,y,10);
      vertex(x,y+y_);
    }
    endShape();
   }
}
