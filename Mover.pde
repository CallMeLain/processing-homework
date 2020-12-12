class Mover
{
  PVector location = new PVector(0,0);
  PVector speed;
  PVector acceleration = new PVector(0,0);  //加速度
  float topspeed;  //限制最高的速度，可以改为达到某一速度后减速
  float mass;  //模拟质量，可转化为图形的大小
  PVector g;
  float G;
  float G_1;
  color n;
  
  Mover(PVector x) 
  {
    location = x;
    speed = new PVector(0,0);
    //acceleration = new PVector(-0.01,0.1);
    g = new PVector(0,0);
    topspeed = 5;
    mass = random(0.1,1);
    G = 0.4;
    G_1 = 10;
    n = color(0);
  }
  
  void update()
  {
    speed.add(acceleration);
    speed.limit(topspeed);   //限制某个向量的最大值，即先归位再乘以最大值
    location.add(speed);
    
    acceleration.mult(0);
  }
  void display(color m)
  {
    //stroke(m);
    //strokeWeight(3);
    //point(constrain(location.x,mass,width-mass),constrain(location.y,mass,height-mass));
    noStroke();
    fill(m);
    ellipse(constrain(location.x,mass,width-mass),constrain(location.y,mass,height-mass),mass*10,mass*10);
  }
  void checkEdges()
  {

    if((location.x+mass)>width||(location.x-mass)<0)
    {
      speed.x = speed.x * (-1);
    }
    if((location.y+mass)>height||(location.y-mass)<0)
    {
      speed.y = speed.y * (-1);
    }
  }
  void applyForce(PVector force)
  {
    PVector f = force.div(mass); //牛顿第二定律
    f.add(g);
    acceleration.add(f);
  }
  PVector mouseCheck()
  {
    PVector dir = new PVector(0,0);
    if(mousePressed)
    {
      PVector mouse = new PVector(mouseX,mouseY);  //使小球加速/减速向鼠标移动
      dir = PVector.sub(mouse,location);
      dir.div(500);
      return dir;
    }
    else
    {
      dir.mult(0);
      return dir;
    }
    
  }
  PVector areaCheck()
  {
    float temp_1 = dist(location.x,location.y,width/2,height/2);
    PVector dir = new PVector(0,0);
    if((temp_1>=100&&temp_1<200)||(temp_1>=300&&temp_1<400)||(temp_1>=600&&temp_1<700)||(temp_1>=900&&temp_1<1000))
    {
      dir.x = speed.x*(-0.05);
      dir.y = speed.y*(-0.05);
      return dir;
    }
    else
    {
      return dir;
    }
  }
  
  PVector attract(Mover m)
  {
    PVector force = PVector.sub(location,m.location);
    float distance = force.mag();

    distance = constrain(distance,5.0,25.0);
 
    force.normalize();
    float strength = (G * mass * m.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }
  
  PVector reject(Mover m)
  {
    PVector force = new PVector(0,0);
    float x_1 = dist(location.x,location.y,m.location.x,m.location.y);
    if(x_1<(mass+m.mass+random(300)))
    {
      force = PVector.sub(location,m.location);
      float distance = force.mag();

    distance = constrain(distance,5.0,25.0);
 
    force.normalize();
    float strength = (G_1 * mass * m.mass) / (distance * distance);
    force.mult(strength);
    force.mult(-1);
    return force;
    }
    else
    {
      return force;
    }
  }
  
  color particle_color()
  {
    float temp_1 = dist(location.x,location.y,width/2,height/2);
    if(temp_1<100)
    {
      n=#f9ed69;
    }
    else if((temp_1>=100&&temp_1<200))
    {
      n = #f08a5d;
    }
    else if((temp_1>=200&&temp_1<300))
    {
      n = #b83b5e;
    }
    else if((temp_1>=300&&temp_1<400))
    {
      n = #6a2c70;
    }
    else if((temp_1>=400&&temp_1<500))
    {
      n = #f38181;
    }
    else if((temp_1>=500&&temp_1<600))
    {
      n = #fce38a;
    }
    else if((temp_1>=600&&temp_1<800))
    {
      n = #eaffd0;
    }
    else if((temp_1>=800&&temp_1<1100))
    {
      n = #95e1d3;
    }
    else
    {
      n = 0;
    }
    return n;
  }

}
