class ParticleSystem
{
  Particle[] ps;
  int particle_num_1;  //粒子系统的粒子数
  PImage img;
  int alpha_1;  //粒子透明通道
  boolean if_reject_1;   //粒子是否排斥
  
  ParticleSystem(PImage i,int p,int a,boolean r)
  {
    img = i;
    particle_num_1 = p;
    alpha_1 = a;
    if_reject_1 = r;
    ps = new Particle[particle_num_1];
    
    for(int j=0;j<particle_num_1;j++)
    {
      ps[j] = new Particle(img,alpha_1);
    }
  }
  
  void run()
  {
    display();
  }
  
  void display()
  {
    for(int i=0;i<particle_num_1;i++)
    {
      for(int j=0;j<particle_num_1;j++)
      {
        if(i!=j)
        {
          PVector temp_v_1 = ps[i].attract(ps[j]);
          ps[i].applyForce(temp_v_1);
        }
      }
      if(if_reject_1)
      {
        for(int j=0;j<particle_num_1;j++)
        {
          if(i!=j)
          {
            PVector temp_v_2 = ps[i].reject(ps[j]);
            ps[i].applyForce(temp_v_2);
          }
        }
      }
      PVector temp_force = new PVector(random(-0.001,0.001),random(-0.001,0.001));
      ps[i].applyForce(temp_force);
      ps[i].checkEdges();
      ps[i].update();     
      //println((int)(particles[i].acceleration.x*100));           
      ps[i].display();
    }
  }
}
