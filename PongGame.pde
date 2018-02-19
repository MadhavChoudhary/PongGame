import java.util.*;
import java.lang.Math.*;

//global variables
int ballX=0;
int ballY=0;
int padX=0;
int padY=400-20;
int ballw=20;
int ballh=20;
int padw=100;
int padh=20;
int count=1;
int game=0;
int dX = 1;
int dY = 1;
int score =0 ;


void setup()
{
  smooth();
  size(400,400);
}

void draw()
{
   background(255);
   fill(0);
    
  if(game==1)
  {
    ellipse(ballX,ballY,ballw,ballh);
    rect(padX,padY,padw,padh);

    ballX+=dX;
    ballY+=dY;

    checkGame();

  }

  else
  {
    fill(0);
    textSize(15);
    text("Press ENTER to start the game",width/2-width/4,height/2);
    text("Score: ",width/2-width/16,height/2+height/16);
    text(score,width/2+width/16,height/2+height/16);
  }
}

void keyPressed()
{
  if(game==0)
  {
    if(key == ENTER)
    {
      game=1;
      Random rand = new Random();

      padX = rand.nextInt(width);
      ballY = rand.nextInt(height);
      ballY = rand.nextInt(width);
      dX=1;
      dY=1;
      score =0;

    }
  }

  else
  {
    if(keyCode == LEFT && padX>0)
      padX-=abs(dX)*5;
    else if(keyCode == RIGHT && padX<width)
      padX+=abs(dX)*5;
    else if(key == ENTER)
      game=0;
  }
}

void checkGame()
{
  if(ballX>width || ballX<0)
    dX=-dX;

  if(ballY<0 || (ballY>height-padh && ballX>padX && ballX<padX+padw))
  {
    count++;
    dY=-dY; 
    if(count%5==0)
    {
      dX*=2;
      dY*=2;
    }
    score+=count;
  }
  
  else if(ballY>height)
    game=0;
    

}