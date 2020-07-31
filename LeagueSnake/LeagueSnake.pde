//*
// ***** SEGMENT CLASS *****
// This class will be used to represent each part of the moving snake.
//*

class Segment {
int x;
int y;
//Add x and y member variables. They will hold the corner location of each segment of the snake.


// Add a constructor with parameters to initialize each variable.
Segment(int x, int y){
  this.x = x;
  this.y = y;
}


}


//*
// ***** GAME VARIABLES *****
// All the game variables that will be shared by the game methods are here
//*
 
Segment head;
int foodX;
int foodY;
  int direction= 0;
int foodeaten= 0;
ArrayList <Segment> tail = new ArrayList<Segment>();

//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {
size(500,500);

head = new Segment(250,250);
frameRate(20);
dropFood();
}

void dropFood() {
  foodX = ((int)random(50)*10);
  foodY = ((int)random(50)*10);

  //Set the food in a new random location
    
}



//*
// ***** DRAW METHODS *****
// These methods are used to draw the snake and its food 
//*

void draw() {
  background(0,225,255);
  drawFood();
  move();
  drawSnake();
  
  
  eat();
}

void drawFood() {
  //Draw the food
  fill(255,40,40);
  square(foodX,foodY,10);
  
}

void drawSnake() {
  //Draw the head of the snake followed by its tail
  fill(0,255,155);
  square(head.x,head.y,10);
 manageTail();
}


//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail 
    for(int i = 0; i<tail.size();i++){
    //tail.add(new Segment(head.x,head.y));
    square(tail.get(i).x,tail.get(i).y,10);
}
}
void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
 checkTailCollision();
  drawTail();
  if(tail.size()>0){
      tail.add(new Segment(head.x,head.y));

  tail.remove(0);
  }
       
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
  
  for(int i = 0; i<tail.size();i++){
   if(tail.get(i).x == head.x&&tail.get(i).y == head.y){
   foodeaten =1;
   tail.clear();
   square(head.x,head.y,10);
   
   }
}
  
}



//*
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*

void keyPressed() {
  //Set the direction of the snake according to the arrow keys pressed
    if (key == CODED){
    if (keyCode == UP){
    direction = UP;
    }
      if (keyCode == DOWN){
    direction = DOWN;
    }
     if (keyCode == LEFT){
    direction = LEFT;
    }
     if (keyCode == RIGHT){
    direction = RIGHT;
    }
    }
}

void move() {
  //Change the location of the Snake head based on the direction it is moving.

    
  switch(direction) {
  case UP:
  head.y-=10;
    // move head up here 
    
    break;
  case DOWN:
    // move head down here 
   head.y+=10;
    break;
  case LEFT:
   // figure it out 
      head.x-=10;
    break;
  case RIGHT:
    // mystery code goes here 
     head.x+=10;
    break;
  }
  checkBoundaries();
}

void checkBoundaries() {
 //If the snake leaves the frame, make it reappear on the other side
 if(head.y == -10){
   head.y = 500;
 }
  if(head.y == 510){
   head.y = 0;
 }
 if(head.x == -10){
   head.x = 500;
 }
 if(head.x == 510){
   head.x = 0;
 }
}



void eat() {
  //When the snake eats the food, its tail should grow and more food appear
if(head.x==foodX&& head.y ==foodY ){
  foodX = ((int)random(50)*10);
  foodY = ((int)random(50)*10);
  foodeaten++;
 // for(int i =0; i<1000;i++){
  tail.add(new Segment(head.x,head.y));
 
  //}
}
}
