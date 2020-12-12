PVector location;
PVector speed;
ArrayList movers;
int num = 2000;
int count = 1;
//PVector wind = new PVector(0.1,0);

void setup()
{
  size(1080,920);
  background(255);
  movers = new ArrayList(100);
  for(int i=0;i<num;i++)
  {
    PVector new_x = new PVector(random(0,width),random(0,height));
    Mover start_mover = new Mover(new_x);
    movers.add(start_mover);
  }
  
  frameRate(144);
}

void draw()
{
  
  fill(255,20);
  rect(0,0,width,height);
  for(int i=0;i<movers.size();i++)
  {
    Mover temp_mover = (Mover)movers.get(i); //此处为映射，从可变数组中取出元素！！！
    
    for(int j=0;j<movers.size();j++)
    {
      if(i!=j)
      {
        Mover temp_mover_j = (Mover)movers.get(j);
        PVector particle_force = temp_mover_j.attract(temp_mover);
        temp_mover.applyForce(particle_force);
      }
    }
    
    for(int j=0;j<movers.size();j++)
    {
      if(i!=j)
      {
        Mover temp_mover_j = (Mover)movers.get(j);
        PVector particle_force = temp_mover_j.reject(temp_mover);
        temp_mover.applyForce(particle_force);
      }
    }
    
    PVector mouseforce =temp_mover.mouseCheck();
    
    PVector area_force = temp_mover.areaCheck();
    
    temp_mover.applyForce(mouseforce);
    temp_mover.applyForce(area_force);
    temp_mover.checkEdges();
    temp_mover.update();
    
    color temp_color = temp_mover.particle_color();
    temp_mover.display(temp_color);
  }
}

void mousePressed()
{
  PVector mouse_x = new PVector(mouseX,mouseY);
  Mover mouse_mover = new Mover(mouse_x);
  movers.add(mouse_mover);
}

void keyPressed()
{
    if(key == 'a')
    {
      save("work" + count + ".png");
      count++;
    }
    if(key == 'z')
    {
      
    }
}
