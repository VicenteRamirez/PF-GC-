/*Vicente Ramírez González
  vicente_rg@outlook.com
  Universidad de Guanajuato
*/

import ddf.minim.*;
Minim minim;
AudioPlayer player;

PImage img;

boolean flag;

Casa c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11;

Antena a1, a2, a3, a5, a6, a8, a9, a10;

Pescado p;

Detonador d;

cParametricas cp, cp2;

void setup() {
  size(832, 912, P3D);
  img = loadImage("tlf.png");
  minim = new Minim(this);
  player = minim.loadFile("astral.mp3");

  //CASAS
  /* Reciben 10 parámetros, los cuales son por orden
   posición en x, y, z, un valor de escala,
   valores para un r, g, b,
   rot en Y, rot en X y rot.
   */
  c1 = new Casa(26, -10, 0, 4.3, 137, 134, 99, radians(25), radians(0), radians(20));
  c2 = new Casa(-55.5, 2, 0, 4.3, 137, 134, 99, radians(35), radians(-20), radians(-25));
  c3 = new Casa(-72, -56, 0, 1.8, 137, 134, 99, radians(35), radians(-20), radians(-25));
  c4 = new Casa(-76, -24, 0, 1.8, 137, 134, 99, radians(35), radians(-20), radians(-25));
  c5 = new Casa(-16, -20, 0, 4.3, 137, 134, 99, radians(25), radians(0), radians(-5));
  c6 = new Casa(-43, -46, 0, 1.8, 137, 134, 99, radians(35), radians(-20), radians(-25));
  c7 = new Casa(10, -45, 0, 1.8, 137, 134, 99, radians(25), radians(0), radians(-5));
  c8 = new Casa(-15.5, -62, 0, 1.8, 137, 134, 99, radians(25), radians(0), radians(-5));
  c9 = new Casa(29, -67, 0, 1.8, 137, 134, 99, radians(25), radians(0), radians(-5));
  c10 = new Casa(46.8, -45, 0, 2.2, 137, 134, 99, radians(25), radians(11), radians(20));
  c11 = new Casa(69, -12, 0, 2.4, 137, 134, 99, radians(25), radians(38), radians(20));

  //ANTENAS
  /* Reciben 10 parámetros, los cuales son por orden
   posición en x, y, z, un valor de escala,
   valores para un r, g, b,
   rot en Y, rot en X y rot.
   */
  a1 = new Antena(33, -35, 5, 3, 92, 75, 49, radians(0), radians(0), radians(0));
  a2 = new Antena(-55.5, -20, 5, 3, 92, 75, 49, radians(50), radians(-15), radians(0));
  a3 = new Antena(-72, -65, 5, 2, 92, 75, 49, radians(50), radians(-15), radians(0));
  a5 = new Antena(-7.5, -43, 5, 3, 92, 75, 49, radians(0), radians(0), radians(0));
  a6 = new Antena(-43, -54, 5, 3, 92, 75, 49, radians(70), radians(-20), radians(0));
  a8 = new Antena(-15.5, -70, 5, 1.5, 92, 75, 49, radians(0), radians(0), radians(0));
  a9 = new Antena(31, -75, 5, 1.5, 92, 75, 49, radians(0), radians(0), radians(0));
  a10 = new Antena(49, -55, 5, 1.5, 92, 75, 49, radians(50), radians(20), radians(0));


  //PESCADO
  /* Reciben 10 parámetros, los cuales son por orden
   posición en x, y, z, un valor de escala,
   valores para un r, g, b,
   rot en Y, rot en X y rot.
   */
  p = new Pescado(0, 40, 5, 13, 212, 209, 194, radians(0), radians(0), radians(0));
  noStroke();

  //DETONADOR
  /* Reciben 10 parámetros, los cuales son por orden
   posición en x, y, z, un valor de escala,
   valores para un r, g, b,
   rot en Y, rot en X y rot.
   */
  d = new Detonador(-24.5, -2.5, 0, 2, 103, 99, 89, radians(0), radians(0), radians(0));

  //Curvas
  cp = new cParametricas(75, 50, 151, 140, 108, 0, 45);
  cp2 = new cParametricas(50, 25, 0, 0, 0, 0, 45);
}

void draw() {
  lights();
  background(121, 104, 74);
  player.play();
  /*if(mouseButton  == LEFT){
   rotateY(map(mouseX, 0, width, -PI/2, PI/2));
   background(121,104,74);
   }*/
   
  camera(
    width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), 
    width/2.0, height/2.0, 0, 
    0, 1, 0); 
    
  translate(width / 2, height / 2);
  ambientLight(121, 104, 74);

  if (flag) {
    float fov = PI/2.0;
    float cameraZ = (height/2.0) / tan(fov/2.0);
    perspective(fov, float(width)/float(height), 
      cameraZ/10.0, cameraZ*10.0);
  } else {
    ortho(-width/2, width/2, -height/2, height/2); // Same as ortho()
  }
  
  if (mousePressed == true && mouseX > 274 && mouseY > 435 && mouseX < 297 && mouseY < 459 || mousePressed == true && mouseX > 333 && mouseY > 443 && mouseX < 346 && mouseY < 456) {
        fill(125);
        colorMode(HSB, 255, 255, 255);
        noStroke();
        ellipseMode(RADIUS);
        drawGradient(0,0);
    }else{
     colorMode(RGB, 255, 255, 255);
    }



  /*Si la tecla ENTER es presionada aparece la obra original*/
  if (keyPressed) {
    if (key == ENTER) {
      beginShape();
      scale(5);
      texture(img);
      vertex(-100, -100, 0, 0, 0);
      vertex(100, -100, 0, img.width, 0);
      vertex(100, 100, 0, img.width, img.height);
      vertex(-100, 100, 0, 0, img.height);
      endShape();
    }
  } else {

    scale(5);
    //texture(img); /*QUITARLO CUANDO HAYAS TERMINADO*/

    //CASAS
    c1.Dibujar();  // En medio derecha
    c2.Dibujar();
    c3.Dibujar();  // Esquina superior izquierda
    c4.Dibujar();
    c5.Dibujar();  // En medio
    c6.Dibujar();  // En medio arriba izquierda
    c7.Dibujar();  // En medio, arriba derecha.
    c8.Dibujar();  // En medio arriba.
    c9.Dibujar();  // Esquina superior derecha
    c10.Dibujar(); // En medio, arriba, derecha, derecha.
    c11.Dibujar(); // En medio, derecha, derecha.

    //ANTENAS
    a1.Dibujar();  //En medio derecha
    a2.Dibujar();
    a3.Dibujar();
    a5.Dibujar();
    a6.Dibujar();
    a8.Dibujar();
    a9.Dibujar();  // Esquina superior derecha
    a10.Dibujar(); // En medio, arriba, derecha, derecha

    //PESCADO
    p.Dibujar();

    //DETONADOR
    d.Dibujar();

    //3detonador
    strokeWeight(.5);
    line(-27, -3.5, 5, -24, -3.5, 5);
    line(-24, -3.5, 5, -26, -2, 5);
    line(-26, -2, 5, -24, -2, 5);
    line(-24, -2, 5, -24, 0, 5);
    line(-24, 0, 5, -27, 0, 5);
    stroke(0);

    cp.Dibujar();
    cp2.Dibujar();
  }
}

void keyPressed() {
  if (key == BACKSPACE) {
    flag  = !flag;
  }
  if(key == ESC){
    save("line.tif");
  }
}

void mouseClicked(){
  
  println("On mouse cliecked" + millis() + " " + mouseX + " " + mouseY);
 
}


void drawGradient(float x, float y) {
  int radius = 1200;
  float h = random(0, 360);
  float g = random(0, 255);
  for (int r = radius; r > 0; --r) {
    fill(h, g, 90,255);
    ellipse(x, y, r, r);
    h = (h + 1) % 360;
  }
}
