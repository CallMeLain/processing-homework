class Leaf
{
  PVector location;
  PVector speed;
  PVector acceleration = new PVector(0,0);
  float mass;
  float lifespan;
  PVector leaf_gravity;
  PVector leaf_wind;
  
  Leaf(PVector l)
  {
    location = l.get();
    acceleration = new PVector(0,0);
    speed = new PVector(0,0);
    mass = random(0.2,0.5);
    lifespan = 400.0;
    leaf_gravity= new PVector(0,0.00005);
    leaf_wind= new PVector(random(-0.00005,0.00005),0.0,0);
  }
  
  void run()
  {
    applyForce(leaf_gravity);
    applyForce(leaf_wind);
    update();
    display();
  }
  
  void update()
  {
    
    speed.add(acceleration);
    location.add(speed);
    acceleration.mult(0);
    lifespan -= 0.2;
  }
  
  void display()
  {
    noStroke();
    fill(#fc5185,lifespan);
    ellipse(location.x,location.y,random(5,20),random(5,20));

  }   
  
  void applyForce(PVector force)
  {
    PVector f = force.get();
    f.div(mass/10);
    acceleration.add(f);
  }
}
