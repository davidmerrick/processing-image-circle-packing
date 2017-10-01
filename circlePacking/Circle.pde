class Circle {
 float x;
 float y;
 float radius;
 color c;
 
 boolean growing = true;
 
 Circle(float x, float y, color c){
    this.x = x;
    this.y = y;
    this.radius = 1;
    this.c = c;
 }
 
 void grow(){
   if(growing){
     radius += .5;
   }
 }
 
 boolean edges(){
    return (x + radius > width || x - radius < 0 || y + radius > height || y - radius < 0);
 }
 
 void show(){
   noStroke();
   fill(c);
   ellipse(x, y, radius * 2, radius *2); 
 }
  
}