ArrayList<Circle> circles;
PImage image;

void setup(){
  size(1280, 853);
  circles = new ArrayList<Circle>();
  image = loadImage("background.jpg");
  image.loadPixels();
}

void draw(){
   background(0); 
   
   int total = 10;
   int count = 0;
   int attempts = 0;
   final int ATTEMPTS_THRESHOLD = 1000;
   
   while(count < total){
     Circle newCircle = newCircle(); 
     if(newCircle != null){
        circles.add(newCircle);
        count++;
     }
     attempts++;
     if(attempts > ATTEMPTS_THRESHOLD){
        noLoop();
        println("FINISHED");
     }
   }
   
   for(Circle circle: circles){
     if(circle.growing){
       if(circle.edges()){
          circle.growing = false; 
       } else {
          for(Circle other : circles){
              if(circle != other){
                float distance = dist(circle.x, circle.y, other.x, other.y);
                if(distance < circle.radius + other.radius){
                  circle.growing = false;
                }
              }
          }
       }
     }
     circle.show();
     circle.grow();
   }
}

Circle newCircle(){
  float x = random(width);
  float y = random(height);
  
  int index = int(x) + int(y) * image.width;
  color c = image.pixels[index];
  
  boolean valid = true;
  
  for(Circle circle: circles){
     float distance = dist(x, y, circle.x, circle.y);
     if(distance < circle.radius){
       valid = false;
       break;
     }
   }
  
  if(valid){
    return new Circle(x, y, c);
  }
  
  return null;
}