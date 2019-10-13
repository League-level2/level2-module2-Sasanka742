//*
// ***** SEGMENT CLASS *****
// This class will be used to represent each part of the moving snake.
//*

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
int foodX;
int foodY;
Segment head;

int x;
int y;

int direction = UP;
int eaten = 0;

//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {
  size(500,500);
  head = new Segment(x,y);
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
  fill(200,0,0);
  drawFood();
  fill(0,200,0);
  move();
  drawSnake();
  eat();

}

void drawFood() {
  //Draw the food
  rect(foodX,foodY,10,10);
}

void drawSnake() {
  //Draw the head of the snake followed by its tail
  checkBoundaries();
  rect(x,y,10,10);
  
 

}


//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail 

}

void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
  
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
  
}



//*
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*

void keyPressed() {
  //Set the direction of the snake according to the arrow keys pressed
  if(key == CODED){
    if(keyCode == UP){
    direction = UP;
    }else if(keyCode == DOWN){
    direction = DOWN;
    }else if(keyCode == LEFT){
    direction = LEFT;
    }else if(keyCode == RIGHT){
    direction = RIGHT;
    }
  }
}

void move() {
  //Change the location of the Snake head based on the direction it is moving.   
  switch(direction) {
  case UP:
  y = y-1;
    // move head up here 
    break;
  case DOWN:
  y = y+1;  
    // move head down here 
    break;
  case LEFT:
  x = x-1;
   // figure it out 
    break;
  case RIGHT:
  x = x+1;
    // mystery code goes here 
    break;
  }
  
}

void checkBoundaries() {
 //If the snake leaves the frame, make it reappear on the other side
 if(x<0){
   x = 500;
 }else if(x>500){
   x = 0; 
 }
 if(y<0){
   y=500;
 }else if(y>500){
   y=0;
 }
}




void eat() {
  //When the snake eats the food, its tail should grow and more food appear
  if(foodX==x&&foodY==y){
  eaten++;
  drawFood();
  }
}
