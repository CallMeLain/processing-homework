float[] pointX_start = new float[5];
float[] pointX = new float[5];
float[] pointY = new float[5];
float[] pointY_1 = new float[5];
float colorNum;

void setup()
{
  size(1280,960);
  background(255);
  strokeWeight(10);
  rect(0,0,width,height);
}

void draw()
{
  background(255);
  fill(255);
  for(int i=0;i<5;i++)
  {
    
    pointX_start[i] = random(0,width);
    pointY[i] = random(0,height);
    if(pointY[i]<height/2)
    {
      pointY_1[i] = random(height/2,height);
    }
    else
    {
      pointY_1[i] = random(0,height/2);
    }
  }
  pointX = sort(pointX_start);
  
  for(int i=0;i<5;i++)
  {
    if(i==0)
    {
      functionColor();
      rect(0,0,pointX[i],pointY[i]);
      functionColor();
      rect(0,pointY[i],pointX[i],height-pointY[i]);
    }
    if(i==4)
    {
      functionColor();
      rect(pointX[i],0,width-pointX[i],pointY[i]);
      functionColor();
      rect(pointX[i],height,width-pointX[i],height-pointY[i]);
    }
    
    if(i<4)
    {
      functionColor();
      rect(pointX[i],min(pointY[i+1],pointY[i]),abs(pointX[i+1]-pointX[i]),abs(pointY[i+1]-pointY[i]));
      functionColor();
      rect(pointX[i],pointY_1[i],pointX[i+1]-pointX[i],abs(height/2-pointY_1[i]));
    }
  }
  delay(1000);
}

void mousePressed()
{
  noLoop();
}

void mouseReleased()
{
  loop();
}

void functionColor()
{
  colorNum = random(0,5);
      if(0<=colorNum && colorNum<1)
      {
        fill(255,0,0);
      }
      else if(1<=colorNum && colorNum<2)
      {
        fill(255,255,0);
      }
      else if(2<=colorNum && colorNum<3)
      {
        fill(0,0,255);
      }
      else if(3<=colorNum && colorNum<4)
      {
        fill(0,0,0);
      }
      else if(4<=colorNum && colorNum<5)
      {
        fill(255,255,255);
      }
}
