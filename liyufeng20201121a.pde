float[] A= new float[4];
float[] B= new float[3];
float[] P= new float[3];
float[] Q= new float[2];
float[] R= new float[5];
int x=0;
int y=0;
int n=0;
int total_x=0;
int total_y=0;

void setup()
{
  size(1000,560);
  background(255);
  noStroke();
  
  A[0] = 106;
  A[1] = 324;
  A[2] = 600;
  A[3] = 777;
  
  B[0] = 124;
  B[1] = 217;
  B[2] = 310;
  
}

void draw()
{
  background(255);
  
  for(int i=0;i<4;i++)
  {
    if(i==3)
    {
      total_x=0;
      while(total_x<217)
      {
        fill(random(255));
        random_x();
        rect(A[i],total_x,30,x);
        total_x=total_x+x;
      }
      total_x=0;
      while(total_x<height)
      {
        fill(random(255));
        random_x();
        rect(A[i],total_x+310,30,x);
        total_x=total_x+x;
      }
    }
    else
    {
      total_x=0;
      while(total_x<height)
      {
        fill(random(255));
        random_x();
        rect(A[i],total_x,30,x);
        total_x=total_x+x;
      }
    }
  }
  
  for(int i=0;i<3;i++)
  {
    if(i==0)
    {
      total_x=0;
      while(total_x<777)
      {
        fill(random(255));
        random_x();
        rect(total_x,B[i],x,30);
        total_x=total_x+x;
      }
    }
    if(i==2)
    {
      total_x=0;
      while(total_x<width)
      {
        fill(random(255));
        random_x();
        rect(total_x,B[i],x,30);
        total_x=total_x+x;
      }
    }
    if(i==1)
    {
      total_x=0;
      while(total_x<106)
      {
        fill(random(255));
        random_x();
        rect(total_x,B[i],x,30);
        total_x=total_x+x;
      }
      total_x=0;
      while(total_x+324<777)
      {
        fill(random(255));
        random_x();
        rect(total_x+324,B[i],x,30);
        total_x=total_x+x;
      }
    }
  }
  
  for(int i=0;i<3;i++)
  {
    if(i==0)
    {
      P[i]=random(136,294);
    }
    else if(i==1)
    {
      P[i]=random(630,747);
    }
    else if(i==2)
    {
      P[i]=random(807,970);
    }
  }
  
  for(int i=0;i<2;i++)
  {
    if(i==0)
    {
      Q[i]=random(247,280);
    }
    else if(i==1)
    {
      Q[i]=random(340,530);
    }
  }
  
  for(int i=0;i<5;i++)
  {
    if(i==0)
    {
      R[i]=random(354,500);
    }
    else if(i==1)
    {
      R[i]=random(0,117);
    }
    else if(i==2)
    {
      R[i]=random(340,410);
    }
    else if(i==3)
    {
      R[i]=random(354,450);
    }
    else if(i==4)
    {
      R[i]=random(340,460);
    }
  }
  
  for(int i=0;i<3;i++)
  {
    total_y=0;
    while(total_y<height)
    {
      fill(random(255));
      random_y();
      rect(P[i],total_y,15,y);
      total_y = total_y + y;
    }
  }
  
  for(int i=0;i<2;i++)
  {
    total_y=0;
    while(total_y<width)
    {
      fill(random(255));
      random_y();
      rect(total_y,Q[i],y,15);
      total_y = total_y + y;
    }
  }
  
  for(int i=0;i<5;i++)
  {
    if(i==0)
    {
      fill(random(255));
      rect(R[i],0,100,124);
    }
    else if(i==1)
    {
      fill(random(255));
      rect(807,R[i],193,100);
    }
    else if(i==2)
    {
      fill(random(255));
      rect(630,R[i],147,150);
    }
    else if(i==3)
    {
      fill(random(255));
      rect(R[i],247,150,63);
    }
    else if(i==4)
    {
      fill(random(255));
      rect(0,R[i],106,100);
    }
  }
  
  
  delay(200);
}

void random_x()
{
  int i = int(random(3));
  if(i==0||i==1)
  {
    x=30;
  }
  if(i==2)
  {
    x=60;
  }
}

void random_y()
{
  int i = int(random(3));
  if(i==0||i==1)
  {
    y=15;
  }
  if(i==2)
  {
    y=30;
  }
}
