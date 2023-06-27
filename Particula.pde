class Particula {

  float vida;
  float tamanio=0;
  float posX;
  float posY;
  float tamanioMaximo;
  float vidaMaxima;
  boolean murio=false;

  Particula(float posX_, float posY_, int tamanioParticula) {
    vida=100+ random (0, 150);

    vidaMaxima = vida;


    tamanioMaximo=tamanioParticula + random (0, 100);
    this.posX = posX_+random(-5, 5);
    this.posY = posY_+random(-5, 5);
  }



  void ejecutar() {

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

    if (vida >= vidaMaxima- (vidaMaxima/10) ) {
      if (tamanio <=tamanioMaximo) {
        tamanio+=10;
      }
    }

    if (vida <= vidaMaxima- (vidaMaxima/10)) {
      tamanio=vida;
    }

    float miTamanio = map(tamanio, 0, vidaMaxima, 0, tamanioMaximo);

    fill(255, opacidad);
    noStroke();
    ellipse(posX, posY, miTamanio, miTamanio);
  }

  boolean murio () {
    return murio;
  }
}
