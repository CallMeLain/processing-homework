class Particle
{
  PVector location;
  PVector speed;
  PVector acceleration;  //加速度
  float mass;  //模拟质量，可转化为图形的大小
  float G;
  float G_1;
  color n;
  PImage img;
  int start_alpha;
  PVector temp_acceleration;
  
  Particle(PImage i,int a) 
  {
    location = new PVector(1300/2,1020/2);
    acceleration = new PVector(random(-0.001,0.001),random(-0.001,0.001));
    speed = new PVector(0,0);
    mass = random(0.1,5);
    G = 0.0008;
    G_1 = 0.01;
    n = color(255);
    img = i;
    start_alpha = a;
  }
  
  
  void update()
  {
    
    speed.add(acceleration);
    location.add(speed);
    acceleration.mult(0);
  }
  
  void applyForce(PVector force)
  {
    PVector f = force.div(mass); //牛顿第二定律
    acceleration.add(f);
  }
  
  void display()
  {
    n = img.get((int)location.x,(int)location.y);
    fill(n,start_alpha);
    noStroke();
    ellipse(constrain(location.x+620,mass+620,1920-mass),constrain(location.y+60,mass+60,1080-mass),mass*2,mass*2);
  }
    
  void checkEdges()
  {
    if((location.x+mass)>1300||(location.x-mass)<0)
    {
      speed.x = speed.x * (-1);
    }
    if((location.y+mass)>1020||(location.y-mass)<0)
    {
      speed.y = speed.y * (-1);
    }
  }
  
  
  PVector attract(Particle m)
  {
    PVector force = PVector.sub(location,m.location);
    float distance = force.mag();

    distance = constrain(distance,5.0,25.0);
 
    force.normalize();
    float strength = (G * mass * m.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }
  
  PVector reject(Particle m)
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

}
