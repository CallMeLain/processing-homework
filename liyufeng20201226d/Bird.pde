class Bird
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float radius;

  float fitness;  //该个体的适应率大小，不是适应度
  DNA dna;    //该个体的DNA值
  int geneCounter = 0;   

  boolean hitTarget = false;   //判断是否碰到了目标，默认为否
  boolean hitWall = false;  //判断是否撞到了墙上
  
  int castCounter = 0;
  color tintColor;
  
  Bird(PVector l, DNA d)
  {
    acceleration = new PVector();
    velocity = new PVector();
    location = l.get();
    dna = d;
    radius = 10;
  }

  void fitness()
  {
    if((location.x<320)&&(location.x>=0))
    {
      fitness = pow(2,3);
    }
    else if((location.x<640)&&(location.x>=320))
    {
      fitness = pow(2,4);
    }
    else if((location.x<960)&&(location.x>=640))
    {
      fitness = pow(2,5);
    }
    else if((location.x<1280)&&(location.x>=960))
    {
      fitness = pow(2,7);
    }
    else if(location.x>=1280)
    {
      fitness = pow(2,5);
    }
    else
    {
      fitness = pow(2,0);
    }
    //float d = dist(location.x, location.y, target.x, target.y); //计算鸟和目标之间的距离
    //fitness = pow(1/d, 2); //距离越近，适应率越大，并确保适应率是在0-1之间的一个数字
  }

  void run()
  {
    checkWall();
    checkTarget(); //判断是否碰到了目标上
    if ((!hitTarget)&&(!hitWall)) //如果没有
    {
      applyForce(dna.genes[geneCounter]); //将dna当前对应的力的值传递给当前对象
      if(geneCounter<dna.genes.length)
      {
        geneCounter++;
      }
      else
      {
        geneCounter=0;
      }
      update();
      display();
    }
    if(hitTarget)
    {
      display();
    }
  }


  void checkTarget() //判断是否碰到了目标上
  {
    float d = dist(location.x, location.y, target.x, target.y);
    if (d<=target_radius+radius)
    {
      hitTarget = true;
    } 
  }
  
  void checkWall() //判断是否碰到了墙上
  {
    float d_1 = abs(320-location.x);
    float d_2 = abs(640-location.x);
    float d_3 = abs(960-location.x);
    if (((location.x<320)&&(d_1<=radius)&&((location.y<100+m_1)||(location.y>700+m_1))) || ((location.x<640)&&(d_2<=radius)&&((location.y<200+m_2)||(location.y>600+m_2))) || ((location.x<960)&&(d_3<=radius)&&((location.y<300+m_3)||(location.y>500+m_3))))
    {
      hitWall = true;
    } 
  }

  void applyForce(PVector f)
  {
    //PVector ff = new PVector(0,0);
    //ff.y = f.y;
    acceleration.add(f);
  }

  void update()
  {
    //PVector fff = new PVector(0.01,0);
    //acceleration.add(fff);
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display()
  {
    //fill(200, 100);
    //stroke(0);
    //ellipse(location.x,location.y,radius*2,radius*2);
    color_check();
    tint(tintColor);
    image(dover[castCounter%6], location.x, location.y, 75, 108);
    castCounter++;
  }
  
  void color_check()
  {
    if(location.x<320)
    {
      tintColor = color(#f67280,160);
    }
    else if((location.x<640)&&(location.x>=320))
    {
      tintColor = color(#3490de,160);
    }
    else if((location.x<960)&&(location.x>=640))
    {
      tintColor = color(#ff9a00,160);
    }
    else
    {
      tintColor = color(#e23e57,160);
    }
  }
}
