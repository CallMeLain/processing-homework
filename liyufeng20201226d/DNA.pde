//确定每个个体（对应一个DNA）的基因数量
class DNA 
{
  PVector[] genes; //每个个体对应一个DNA，每个DNA里有特定数量的基因
  float maxforce = 0.4;
  //float maxforce_y = 0.1; //最大推力
  //float maxforce_x = 0.05; //最大推力
  //float temp_x=0;
  //float temp_y=0;

  DNA()
  {
    genes = new PVector[lifetime];  //相当于每个鸟有lifetime个基因，但每个基因控制某个时间段的力
    for (int i = 0; i < genes.length; i++)
    {
      //temp_x = 0;
      //temp_y = 0;
      float angle = random(TWO_PI);
      genes[i] = new PVector(cos(angle), sin(angle));
      genes[i].mult(random(0, maxforce));
      //temp_y = genes[i].y * random(0, maxforce_y);
     // genes[i].y = temp_y;
      //temp_x = abs(genes[i].x * random(0, maxforce_x));
      //genes[i].x = temp_x;
      //{
      //  genes[i].mult(-1);
      //}
      
    }
  }

  DNA crossover(DNA partner)
  {
    DNA child = new DNA(); //先随机产生一个子代，再用父亲和母亲的基因覆盖随机生成的基因
    int midpoint = int(random(genes.length));  //随机确定一个基因分隔的中点
    for(int i=0;i<genes.length;i++)
    {
      if(i>midpoint)
      {
        child.genes[i] = partner.genes[i];
      }
      else
      {
        child.genes[i] = genes[i];
      }
    }
    return child;  
  }

  void mutate(float mutationrate) //基因的变异，m为已经定义好的变异率
  {
    for (int i=0;i<genes.length;i++)
    {
      if (random(1)<mutationrate)   //依次遍历每个基因，每一个基因都会进行一次判断，有m的概率基因会变成随机值，m设置为很小
      {
        float angle = random(TWO_PI);
        genes[i] = new PVector(cos(angle), sin(angle));
        genes[i].mult(random(0, maxforce));
        //temp_x = 0;
        //temp_y = 0;
        //genes[i] = PVector.random2D();
        //temp_y = genes[i].y * random(0, maxforce_y);
        //genes[i].y = temp_y;
        //temp_x = abs(genes[i].x * random(0, maxforce_x));
        //genes[i].x = temp_x;
      }
    }
  }
}
