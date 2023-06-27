ArrayList<Particula> particulas;
int tamanioParticula =50;
void setup() {
  size(1280, 720);

  // Create an empty ArrayList (will store Ball objects)
  particulas = new ArrayList<Particula>();
}

void draw() {
  background(0);
  if (pmouseX != mouseX || pmouseY != mouseY) {
   particulas.add(new Particula (mouseX, mouseY, tamanioParticula));

  }


   for (int i = particulas.size()-1; i >= 0; i--) {
      // An ArrayList doesn't know what it is storing so we have to cast the object coming out
      Particula miParticula = particulas.get(i);
      miParticula.ejecutar();
      if (miParticula.murio()) {
        // Items can be deleted with remove()
        particulas.remove(i);
      }
    }


////
}
