//*
// ***** SEGMENT CLASS *****
// This class will be used to represent each part of the moving snake.
//*
import java.lang.Math;
class Segment {

//Add x and y member variables. They will hold the corner location of each segment of the snake.
 int x;
 int y;

// Add a constructor with parameters to initialize each variable.
public Segment(int xsnake, int ysnake){
 x = xsnake;
 y = ysnake;
}
}

//*
// ***** GAME VARIABLES *****
// All the game variables that will be shared by the game methods are here
//*
Segment head;

int foodX;
int foodY;
int width = 10;
int length = 10;
ArrayList<Segment> tail = new ArrayList<Segment>();

int direction = UP;
int eaten = 0;

//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {
  size(500,500);
  head = new Segment(100,100);
  frameRate(20);
  dropFood();
}

void dropFood() {
  //Set the food in a new random location
  foodX = ((int)random(50)*10);
  foodY = ((int)random(50)*10); 
}



//*
// ***** DRAW METHODS *****
// These methods are used to draw the snake and its food 
//*

void draw() {
  background(0,0,0);
  drawFood();
  fill(0,200,0);
  move();
  drawSnake();
  eat();

}

void drawFood() {
  //Draw the food
  fill(200,0,0);
  rect(foodX,foodY,10,10);

}

void drawSnake() {
  //Draw the head of the snake followed by its tail
  rect(head.x,head.y,width,length);
    
  manageTail();
 
}


//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail 
  
  for(Segment s : tail){  
  fill(0,200,0);
  rect(s.x,s.y,width,length);
  }
}

void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
  checkTailCollision();
  drawTail();
  tail.add(new Segment(head.x,head.y));
  tail.remove(0);  
  
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
   for(Segment s : tail){
    if(head.x==s.x&&head.y==s.y){
      eaten=1;
      tail = new ArrayList<Segment>();
      //tail.add(new Segment(head.x,head.y));
    }
  }
}



//*
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*

void keyPressed() {
  //Set the direction of the snake according to the arrow keys pressed
  if(key == CODED){
    if(keyCode == UP && direction!=DOWN){
    direction = UP;
    
    }else if(keyCode == DOWN && direction!=UP){
    direction = DOWN;
    }else if(keyCode == LEFT && direction!=RIGHT){
    direction = LEFT;
    }else if(keyCode == RIGHT && direction!=LEFT){
    direction = RIGHT;
    }
  }
}

void move() {
  //Change the location of the Snake head based on the direction it is moving.   
   int speed = 3;
  switch(direction) {
   
  case UP:
    // move head up here 
    for(int i=0;i<tail.size();i++){  
      tail.get(i).y = tail.get(i).y+8;
    }
    head.y = head.y-speed;
    break;
  case DOWN:  
  for(int i=0;i<tail.size();i++){  
      tail.get(i).y = tail.get(i).y-8;
      
    }
   head.y = head.y+speed;
    // move head down here 
    break;
  case LEFT:
   for(int i=0;i<tail.size();i++){  
      tail.get(i).x = tail.get(i).x+8;
    }
    head.x = head.x-speed;
   // figure it out 
    break;
  case RIGHT:
  
   for(int i=0;i<tail.size();i++){  
      tail.get(i).x = tail.get(i).x-8;
    }
    head.x = head.x+speed;
    // mystery code goes here 
    break;
  }
  checkBoundaries();
  
}

void checkBoundaries() {
 //If the snake leaves the frame, make it reappear on the other side
 if(head.x<0){
   head.x = 500;
 }else if(head.x>500){
   head.x = 0; 
 }
 if(head.y<0){
   head.y=500;
 }else if(head.y>500){
   head.y=0;
 }
}




void eat() {
  //When the snake eats the food, its tail should grow and more food appear
  if(abs(foodX-head.x)<10&&abs(foodY-head.y)<10){
    eaten++;
    dropFood();
    drawFood();
    for(int i=0;i<5;i++){
    tail.add(new Segment(head.x,head.y));
    }
    System.out.println(eaten);
    System.out.println(tail.size());
    
     System.out.println("//////");
     for(int i=0;i<tail.size();i++){
    System.out.println(tail.get(i).x + "," + tail.get(i).y);
    }

  }
}
