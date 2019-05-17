PVector sprite, player,hole;
float count = 1;
float playerSize1 = 20;
float playerSize2 = 30;
float speed = .5;
float speed2 = 1;
float dia1=20;
float points=0;
float x;


void setup() {
size(displayWidth,displayHeight);
noCursor();
//start location
sprite = new PVector(width/2-25,height/2);
player = new PVector(0,0);
hole = new PVector(width/2-25,height/2);
}


void draw() {
  background(0);
  noStroke();
  color holeColor1= color(100,random(50,70),255);
  color playerColor1 = color(255);
  player.x = mouseX;
  player.y = mouseY;
  fill(playerColor1);
  ellipse(player.x,player.y,playerSize1,playerSize1);
  fill(holeColor1);
  ellipse(hole.x,hole.y,dia1,dia1);
  
  PVector dir = PVector.sub(player,sprite);
  dir.normalize();
  dir.mult(speed);
  sprite.add(dir);
  
  
  float spriteSize= 10 * count;
  //fill(200);
  noFill();
  stroke(random(150,200));
  strokeWeight(random(2,4));
  ellipse(sprite.x,sprite.y,spriteSize,spriteSize);
  noStroke();
  float feed=1; 
  float distBetween1 = player.dist(sprite, hole);
  if ( dia1 > spriteSize && distBetween1<10  ) {
      points=0;
      
      
      
    }
  else if ( dia1 < spriteSize && distBetween1<10 ) {
    
    
      float c1= random(0,200);
      dia1=random(15,200);
      spriteSize=10;
      points= points+1;
      println("points =", points);
      count=1;
      hole.x=hole.x + random(-200,200);
      hole.y=hole.y + random(-200,200);
  }
      
  if (mousePressed == true )  {
    fill(150,random(50,70),255);
    ellipse(player.x,player.y,playerSize2,playerSize2);
    float distBetween = player.dist(player, sprite);
    
    
    if (distBetween<100 ) {
      dir = PVector.sub(player, sprite);
      dir.normalize(); 
      dir.mult(speed2);
      sprite.add(dir);
      
      if (distBetween<20 ) {
       
     
        count=count+.05;
        //}
        //else if (spriteSize > dia1) {
        //   count=count-.05;
        //}
      }
      else if (keyPressed == false){
         fill(playerColor1);
         
         ellipse(player.x,player.y,playerSize1,playerSize1);  
      }
    
    }
    
  }
    
    println("game begun");
    fill(255);
    x=points;
    rect(20,20,20,x);
}
