class Particle
{
  PVector location;
  PVector speed;
  PVector acceleration;
  float lifespan;
  float mass;
  
  Particle(PVector l)
  {
    location = l.get(); ///使用get方法
    acceleration = new PVector(0,0);
    speed = new PVector(0,0);
    lifespan = 600.0;
    mass = random(0.5,1);
  }
  
  void run()
  {
    update();
    display();
  }
  
  void update()
  {
    speed.add(acceleration);
    location.add(speed);
    acceleration.mult(0);
    lifespan -= 2.5;
  }
 
  void display()
  {
    noStroke();
    fill(255,lifespan);
    ellipse(location.x,location.y,mass*20,mass*20);
  } 
  
  boolean isDead()
  {
    if(lifespan<0.0)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
  void applyForce(PVector force)
  {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }
}
