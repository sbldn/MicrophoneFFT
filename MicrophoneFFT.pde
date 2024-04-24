import processing.sound.*;

FFT fft;
AudioIn in;
int bands = 512;
float[] spectrum = new float[bands];
float maxmic = 0;
float offsetX = 1;
float offsetY = 1;


void setup() {
  size(512, 512);
  background(#202020);
  fft = new FFT(this, bands);
  in = new AudioIn(this, 1);
  in.start();
  fft.input(in);
  maxmic = 0;
}

void draw() { 
  background(#202020, 5);
  noStroke();
  fill(#202020, 5);
  rect(0, 0, width, height);
  stroke(255);
    
  fill(255);
  stroke(255);
  translate(width/2, height/2); // Centrar el origen en el centro de la pantalla
  
  fft.analyze(spectrum);
  
  for(int i = 0; i < bands; i++){
    float angle = map(i, 0, bands, 0, TWO_PI); // Mapear el índice del espectro a un ángulo entre 0 y 2*PI
    float radius = map(spectrum[i], 0, 0.1, 0, 256); // Mapear la amplitud del espectro al radio del punto
    
    float oR = map(noise(offsetX), 0, 1, -1, 1);
    float oA = map(noise(offsetY), 0, 1, -1, 1);
    

    //cartesiano a polares
    float x = radius+oR * cos(angle+oA); 
    float y = radius+oR * sin(angle+oA);
    
    // Dibujar el punto
    stroke(255);
    strokeWeight(3);
    line(0,0,x, y);
   
    // //Circunferencia
    float rad2=100;
    
    float x2 = rad2 * cos(angle); // Convertir de coordenadas polares a cartesianas
    float y2 = rad2 * sin(angle); 
    // line(0,0,x2+x, y2+y);
     point(x2+x,y2+y);
  } 

  // for(int i = 0; i < 360; i++){

  //   float radius = 100;
  //   float x = radius * cos(i); // Convertir de coordenadas polares a cartesianas
  //   float y = radius * sin(i);
  //   // Dibujar el punto
   
  //   point(x,y);
  // } 

 
}


