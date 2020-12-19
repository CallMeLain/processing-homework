class ParticleSystem
{
  ArrayList<Particle> particles;
  //PVector origin;    //所有粒子共同的起点
  
  //ParticleSystem(PVector location)
  //{
  //  origin = location.get();
  //  particles = new ArrayList<Particle>();
  //}
  ParticleSystem()
  {
    particles = new ArrayList<Particle>();
  }
  
  void addParticle()
  {
    //particles.add(new Particle(origin));
    particles.add(new Particle(new PVector(random(0,width),0)));
  }

  void run()
  {
    
    Iterator<Particle> it = particles.iterator();
    while(it.hasNext())
    {
      Particle p = it.next();
      p.run();
      if(p.isDead())
      {
        it.remove();
      }
    }
  }
  
  void applyForce(PVector f)
  {
    for(Particle p:particles)
    {
      p.applyForce(f);
    }
  }
}
