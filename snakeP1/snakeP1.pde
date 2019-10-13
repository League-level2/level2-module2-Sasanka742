

int foodX;
int foodY;



void setup(){
  size(500,500);
  frameRate(20);
  dropFood();
}

void dropFood(){
  foodX = ((int)random(50)*10);
  foodY = ((int)random(50)*10);
}

void draw(){
  background(0,0,0);
  drawFood();
  drawSnake();

}

void drawFood(){
  rect(foodX,foodY,10,10);
}

void drawSnake(){
  
  rect(0,0,10,10);
  
}
