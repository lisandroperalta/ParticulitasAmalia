class Particula {

  float vida;
  int tamanio;
  int posX;
  int posY;
  float tamanioMaximo;
  float vidaMaxima;
  boolean murio=false;
  Particula(int posX_, int posY_, int tamanioParticula) {
    tamanioMaximo=tamanioParticula + random (0, 20);
    vida=100+ random (0, 50);
    vidaMaxima = vida;
    tamanio=100;
    this.posX = posX_;
    this.posY = posY_;
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
    tamanio --;
  }


  void dibujar() {
    float opacidad = map(vida, 0, vidaMaxima, 0, 50);
    float miTamanio = map(tamanio, 0, 100, 0, tamanioMaximo);

    fill(255, opacidad);
    noStroke();
    ellipse(posX, posY, miTamanio, miTamanio);
  }

  boolean murio () {
    return murio;
  }
}
