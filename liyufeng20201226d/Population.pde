class Population
{
  float mutationRate;          //变异率
  Bird[] population;         //种群中个体数量
  ArrayList<Bird> matingPool;    //交配池
  int generations;             //记录代数

   Population()
   {
      mutationRate = 0.01;
      population = new Bird[60];
      matingPool = new ArrayList<Bird>(); //创建一个空的交配池
      generations = 0;
      for(int i = 0; i < population.length; i++)
      {
        PVector location = new PVector(0,random(height));
        population[i] = new Bird(location, new DNA());
      }
    }

  void live()
  {
    for(int i=0; i < population.length; i++)
    {
      population[i].run();
    }
  }

  void selection() //模拟自然选择
  {
    for(int i=0;i < population.length; i++)
    {
      population[i].fitness();
    }
    
    matingPool.clear();  //每代都会有最优品种，所以要把上一代清空

    float maxFitness = getMaxFitness();  //获取最大的适应值，并用于映射

    for (int i=0; i<population.length; i++)
    {
      float fitnessNormal = map(population[i].fitness,0,maxFitness,0,1); //选出适应率中的最大值，然后把所有适应率都限制到0-1之间
      int n = (int) (fitnessNormal * 1000);  // 两两配对的优秀后代被选中的概率更大，确保每一代抽样的品质要优于上一代的抽样
      for (int j = 0; j < n; j++) 
      {
        matingPool.add(population[i]);
      }
    }
  }

  void reproduction()
  {
    for (int i=0;i < population.length;i++) 
    {
      int m = int(random(matingPool.size()));
      int d = int(random(matingPool.size()));
      Bird mom = matingPool.get(m); //作为母亲的对象
      Bird dad = matingPool.get(d); //作为父亲的对象
      DNA mom_genes = mom.dna;
      DNA dad_genes = dad.dna;
      DNA child = mom_genes.crossover(dad_genes); //把父母的基因组合在一起
      child.mutate(mutationRate);  //组合好之后会产生变异
      
      PVector location = new PVector(0,random(height));
      population[i] = new Bird(location, child);
    }
    generations++;
  }

  float getMaxFitness()
  {
    float temp_fitness = 0;
    for (int i = 0; i < population.length; i++)
    {
       if(population[i].fitness > temp_fitness)
       {
         temp_fitness = population[i].fitness;
       }
    }
    return temp_fitness;
  }

}
