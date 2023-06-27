class Particula {

  float vida;
  float tamanio=0;
  float posX;
  float posY;
  float tamanioMaximo;
  float vidaMaxima;

  float tamanioSuavizado=0;
  float tamanioSuavizadoPrevio =0;
  
  boolean murio=false;

  //cosas de movimiento

  float dir;
  float vel;

  Particula(float posX_, float posY_, int tamanioParticula) {
    vida=100+ random (0, 150);
    vidaMaxima = vida;
    tamanio=vida;
    tamanioMaximo=tamanioParticula + random (0, 50);
    this.posX = posX_;
    this.posY = posY_;

    vel = 0.5;
    dir = radians( random( 360 ) );
  }



  void ejecutar() {
    mover();
    dibujar();
    calcularVida();
  }

  void calcularVida() {
    vida--;
    if (vida <= 0) {
      murio=true;
    }
  }


  void dibujar() {
    float opacidad = map(vida, 0, vidaMaxima, 0, 50);
    if (tamanio >=0) {
      tamanio--;
    }
    tamanioSuavizado= lerp(tamanioSuavizado, tamanio, 0.05);
    tamanioSuavizadoPrevio= tamanioSuavizado;

    fill(255, opacidad);
    noStroke();
    ellipse(posX, posY, tamanioSuavizado, tamanioSuavizado);
  }

  boolean murio () {
    return murio;
  }


  void mover() {

    float variacionAngular = radians( random(-15, 15)  );

    dir += variacionAngular; // dir = dir + variacionAngular;

    //pasar la velocidad y dirección a Coord. Cartesianas
    float dx = vel * cos( dir );
    float dy = vel * sin( dir );
    //le sumo el movimiento a la posiciónm
    posX = posX + dx; //nx
    posY = posY + dy; //ny
    /*
    //aplicar un espacio toroidal
     //  ( condicion ? asiganción_si : asignación_NO );
     x = ( x>width ? x-width : x );
     x = ( x<0 ? x+width : x );
     y = ( y>height ? y-height : y );
     y = ( y<0 ? y+height : y );
     */
  }
  ////////////////
}
