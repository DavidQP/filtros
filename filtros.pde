import processing.video.*;
PShader edges;
PShader emboss;
PShader sharpen;
PShader blur;
PImage img;


Movie movie;
    
void setup() {
  size(640, 480, P2D); //<>//
  img = loadImage("pa.jpg");      
  edges = loadShader("edges.glsl");
  emboss = loadShader("emboss.glsl");
  sharpen = loadShader("sharpen.glsl");
  blur = loadShader("blur.glsl");
  edges.set("numVecinos", 1);
  emboss.set("numVecinos", 1);
  sharpen.set("numVecinos", 1);
  blur.set("numVecinos", 1);
  movie = new Movie(this, "tren_sabana.mp4");
  
}

void movieEvent(Movie m){
  m.read();
}
void draw() {

  //Imagen
  
  if(key == 'w'){
    shader(edges);  
    image(img, 0, 0);
  }
  else if(key == 'e'){
    shader(emboss);  
    image(img, 0, 0);
    }
  else if(key == 'r'){
    shader(sharpen);  
    image(img, 0, 0);
    }
  else {
    shader(blur);  
    image(img, 0, 0);
    }    
  
  //Video
  /*
  movie.play();
  if(key == 'a'){
    shader(edges);
    image(movie, 0,0);
  }
  else if(key == 's'){
    shader(emboss);
    image(movie, 0,0);
  }
  else if(key == 'd'){
    shader(sharpen);
    image(movie, 0,0);
  }
  else{
    shader(blur);  
    image(movie, 0, 0);
  }
  */
  
   //<>//
}