int vidas = 3;
int pa = 0; /*variable que controla en que pantalla se esta
 actualmente, ya sea menu, opciones o juego.*/
int back = 1;

float x = 110.0; //posicion del personaje en x
float y = 0.0; //posicion personaje en y
float vel = 5.0; //velocidad de avance del personaje en cuadros por ciclo
float velact = 0; //variable control velocidad actual del ciclo, usada para mantener la velocidad que llevaba el personaje en el ciclo despues de que esta se haya reducido por un salto

int cont = 0;

int shine = 0; //variable control titileo
int jump = 0; //variable control salto
int post = 0; //variable control post-salto
int imp = 0; //variable control impacto

PImage fondo1, fondop11, fondop12, character1, carj1, menu;

long tiempo = 0, tiempo2 = 0, t_actualizado = 0, t_actualizado2 = 0, t_retardo = 2800, t_retardo2 = 1000; //variables control del tiempo

int maxImages = 8;
int imageIndex = 0;
PImage [] images = new PImage[maxImages];// variables que cargan los frames del titileo

//los atributos normalmente son (x, y, weidth, height)

void setup() {
  //frameRate(30);
  size(600, 700);
  background(100, 0, 50); //cuando hay muchos atrivutos esto se convierte en una especie de pantalla de carga
  menu = loadImage("Nuevomenu.jpg");
  fondop11 = loadImage("fondop11.png");
  fondo1 = loadImage("fondo1.png");
  fondop12 = loadImage("fondop12.png");
  character1 = loadImage("car1.png");
  carj1 = loadImage("carj1.png");

  for (int i=0; i< images.length; i++) {
    images[i] = loadImage("car1 - copia (" + i + ").png");
  }
}

void draw() {

  switch(pa) {
  case 0:

    image(menu, -200, 0, 1000, height);

    if (mouseButton==LEFT && mouseX>=95 && mouseX<=272 && mouseY>=391 && mouseY<=479) {
      pa = 2; //boton de inicio
    } else {
      if (mouseButton==LEFT && mouseX>=327 && mouseX<=497 && mouseY>=396 && mouseY<=481) {
        pa = 1; //boton de Creditos
      }
    }

    break;

  case 1: //aqui se programan las opciones
  
    background(100);

    break;
    
  case 2: //aqui se programa el juego

    image(fondo1, 0, 0, width, height);
    //y = y + vel;

    if (keyPressed==true && key=='a') {
      x = x - 5;
    }

    if (keyPressed==true && key=='d') {
      x = x + 5;
    }

    if (y > height+40/2) {
      y = 0.0;
      back = back*-1;
      vel = vel+0.5;
      velact = vel;
    }

    if (x < 0) {
      x = 1;
    }

    if (x+40 >300) {
      x = 298-40;
    }

    if (back == 1) { //primer fondo

      image(fondop11, 0, 0, width/2, height);


      tiempo = millis();

      if ( tiempo > t_actualizado + t_retardo && imp == 1)
      {
        shine = 0;
        vel = 5;
        //Se actualiza el tiempo que ha de transcurrir para el próximo delay.
        t_actualizado = tiempo;
      }

      if (((90 > x || 90 > x+30) && (x > 29 || x+30 > 29) && (114 > y || 114 > y+40) && (y > 90 || y+40 > 90)) && jump==0) {
        y = 90-50;// esta linea es para que el muñeco se devuelva unos pasos hacia atras y que no se bugee el retroseso

        vel = vel*-0.15;
        shine = 1;
        imp = 1;
      }

      if (((155 > x || 155 > x+30) && (x > 92 || x+30 > 92) && (275 > y || 275 > y+60) && (y > 250 || y+40 > 250)) && jump==0) {
        y = 243-50;// esta linea es para que el muñeco se devuelva unos pasos hacia atras y que no se bugee el retroseso

        vel = vel*-0.15;
        shine = 1;
        imp = 1;
      }

      if (((220 > x || 220 > x+30) && (x > 157 || x+30 > 157) && (458 > y || 458 > y+60) && (y > 435 || y+40 > 435)) && jump==0) {
        y = 426-50;// esta linea es para que el muñeco se devuelva unos pasos hacia atras y que no se bugee el retroseso

        vel = vel*-0.15;
        shine = 1;
        imp = 1;
      }

      if (((155 > x || 155 > x+30) && (x > 92 || x+30 > 92) && (632 > y || 632 > y+60) && (y > 610 || y+40 > 610)) && jump==0) {
        y = 599-50;// esta linea es para que el muñeco se devuelva unos pasos hacia atras y que no se bugee el retroseso

        vel = vel*-0.15;
        shine = 1;
        imp = 1;
      }
    } else {
      if (back==-1) { //segundo fondo


        tiempo = millis();

        if ( tiempo > t_actualizado + t_retardo && imp == 1)
        {
          shine = 0;
          vel = 5;
          imp = 0;
          //Se actualiza el tiempo que ha de transcurrir para el próximo delay.
          t_actualizado = tiempo;
        }

        image(fondop12, 0, 0, width/2-1, height);
        if (((157 > x || 157 > x+30) && (x > 93 || x+30 > 93) && (113 > y || 113 > y+40) && (y > 90 || y+40 > 90)) && jump==0) {
          y = 90-50;// esta linea es para que el muñeco se devuelva unos pasos hacia atras y que no se bugee el retroseso
          imp = 1;
          shine = 1;
          vel = vel*-0.15;
        }

        if (((156 > x || 156 > x+30) && (x > 93 || x+30 > 93) && (274 > y || 274 > y+40) && (y > 252 || y+40 > 252)) && jump==0) {
          y = 243-50;// esta linea es para que el muñeco se devuelva unos pasos hacia atras y que no se bugee el retroseso
          shine = 1;
          imp = 1;
          vel = vel*-0.15;
        }

        if (((92 > x || 92 > x+30) && (x > 28 || x+30 > 28) && (447 > y || 447 > y+40) && (y > 423 || y+40 > 423)) && jump==0) {
          y = 426-50;// esta linea es para que el muñeco se devuelva unos pasos hacia atras y que no se bugee el retroseso
          shine = 1;
          imp = 1;
          vel = vel*-0.15;
        }

        if (((221 > x || 221 > x+30) && (x > 157 || x+30 > 157) && (608 > y || 608 > y+40) && (y > 585 || y+40 > 585)) && jump==0) {
          y = 580-50;// esta linea es para que el muñeco se devuelva unos pasos hacia atras y que no se bugee el retroseso
          shine = 1;
          imp = 1;
          vel = vel*-0.15;
        }
      }
    }

    if (shine == 1) {
      image(images[imageIndex], x, y, 40, 60);
      imageIndex = (imageIndex+1) % images.length;
    }

    if (jump == 0) {
      image(character1, x, y, 40, 60);
    } else {
      image(carj1, x, y, 40, 60);
    }

    if (keyPressed == true && (key == 'w' || (key == 'a' && key == 'w') || (key == 'w' && key == 'd'))) {
      jump = 1;
      vel = 3;
      post = 1;
    } else {
      jump = 0;
    }

    tiempo2=millis();

    if (post==1 && tiempo2 > t_actualizado2 + t_retardo2) {
      vel = velact;
      post = 0;
      t_actualizado2 = tiempo;
    }
    
    y = y + vel;

    break;
  }

  /*cont = cont + 1;
   print(cont);*/


  println(vel);
}

void mousePressed() {
  if (mouseButton==LEFT) {
    loop();
  }

  if (mouseButton==RIGHT) {
    println("posicion en x mouse: "+mouseX);
    println("posicion en y mouse: "+mouseY);
    println("posicion en x figura: "+ x);
    println("posicion en y figura: "+ y);
    noLoop();
  }
}
