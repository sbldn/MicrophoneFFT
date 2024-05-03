import processing.sound.*;

FFT fft;
AudioIn in;
int bands = 512;
float[] spectrum = new float[bands];

float counter;

void setup() {
  size(512, 512);
  background(#202020);
  fft = new FFT(this, bands);
  in = new AudioIn(this, 1);
  in.start();
  fft.input(in);
  counter=0;
}

void draw() { 
  background(0);
  noStroke();
  fill(0);
  rect(0, 0, width, height);
  stroke(255);
    
  fill(255);
  stroke(255);
  translate(width/2, height/2); // Centrar el origen en el centro de la pantalla
  
  fft.analyze(spectrum);
  
  for(int i = 0; i < bands; i=i+3){
    float angle = map(i, 0, bands, 0, TWO_PI); // Mapear el índice del espectro a un ángulo entre 0 y 2*PI
    float radius = map(spectrum[i], 0, 0.1, 0, 256); // Mapear la amplitud del espectro al radio del punto
    
    
    
    //angle=angle+counter;
    if(angle>360){
      angle=angle-360;
    }

    //cartesiano a polares
    float x = radius * cos(angle); 
    float y = radius * sin(angle);
    
    // Dibujar el punto
    stroke(255);
    strokeWeight(2);
    // float[] cp=car2pol(radius,angle);
    //line(0,0,cp[0], cp[1]);
    drawPizza(radius,angle,1.5*PI/180);


    



    // //Circunferencia
    stroke(255);
    float rad2=200+sin(counter/3)*random(1,2);
    
    float x2 = rad2 * cos(angle); // Convertir de coordenadas polares a cartesianas
    float y2 = rad2 * sin(angle); 
    //line(0,0,x2+x, y2+y);
    point(x2+x,y2+y);
    counter++;
     
  } 
  
  // for(int i = 0; i < 360; i++){

  //   float radius = 100;
  //   float x = radius * cos(i); // Convertir de coordenadas polares a cartesianas
  //   float y = radius * sin(i);
  //   // Dibujar el punto
   
  //   point(x,y);
  // } 

 
}


float[] car2pol(float radius,float angle){
    float[] car=new float[2];
    car[0]=radius * cos(angle); 
    car[1]=radius * sin(angle);
    return car;
}

void drawPizza(float radius, float angle, float distance){
    // float[] line1=car2pol(radius,angle-(distance));
    // line(0,0,line1[0], line1[1]);
    // float[] line2=car2pol(radius,angle+(distance));
    // line(0,0,line2[0], line2[1]);

    //arc(0,0,radius*2,radius*2, angle-2*(distance), angle+(distance), PIE);
    noStroke();
    
    for (int r = int(radius); r > 0; --r) {


    fill(255-r,50);

    arc(0,0,r*2,r*2, angle-2*(distance), angle+(distance), PIE);

    
}


    
}