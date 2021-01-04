class Mode_3
{
  PImage img;
  int img_num;
  int particle_num;  //粒子数量，可变
  int alpha;  //粒子透明通道
  boolean if_reject;   //粒子是否排斥
  int road_alpha;
  ParticleSystem particles;
  
  Mode_3()
  {
    img_num = 0;
    img = loadImage("mode_3_"+img_num+".jpg");
    particle_num = 2000;
    if_reject = false;
    alpha = 255;
    road_alpha = 0;
    
    particles = new ParticleSystem(img,particle_num,alpha,if_reject);
  }
  
  void run()
  {
    mouse_check();
    particles.run();
  }
  
  int road_alpha_check()
  {
    return road_alpha;
  }
  
  void parameter_run()
  {
    textFont(myFont);
    textAlign(CENTER,CENTER);  //文本全部以中心进行绘制
    fill(0);
    textSize(16);
    
    text("当前为第"+img_num+"张",210,806);
    text(particle_num,186,885);  //粒子数量
    text(road_alpha,490,805);  //粒子透明通道
  }

  void mouse_check()
  {
    if(mousePressed && mouseX>124&&mouseX<(124+35)&&mouseY>790&&mouseY<(790+35))//判断图片数量减少
    {
      img_num = img_num -1;
      if(img_num<=0)
      {
        img_num = 9;
      }
      img = loadImage("mode_3_"+img_num+".jpg");
      particles = new ParticleSystem(img,particle_num,alpha,if_reject);
      clear();
    }
    if(mousePressed && mouseX>262&&mouseX<(262+35)&&mouseY>790&&mouseY<(790+35))//判断图片数量增加
    {
      img_num = img_num +1;
      if(img_num>=10)
      {
        img_num = 0;
      }
      img = loadImage("mode_3_"+img_num+".jpg");
      particles = new ParticleSystem(img,particle_num,alpha,if_reject);
        clear();
      }
    if(mousePressed && mouseX>218&&mouseX<(218+35)&&mouseY>870&&mouseY<(870+35))//判断粒子数量增加
    {
      if(particle_num<10000)
      {
        particle_num+=100;
      }
      particles = new ParticleSystem(img,particle_num,alpha,if_reject);
      clear();
    }
    if(mousePressed && mouseX>124&&mouseX<(124+35)&&mouseY>870&&mouseY<(870+35))//判断粒子数量减少
    {
      if(particle_num>100)
      {
        particle_num-=100;
      }
      particles = new ParticleSystem(img,particle_num,alpha,if_reject);
      clear();
    }
    if(mousePressed && mouseX>510&&mouseX<(510+35)&&mouseY>790&&mouseY<(790+35))//判断轨迹透明通道增加
    {
      if(road_alpha<250)
      {
        road_alpha = road_alpha+5;
      }
      clear();
    }
    if(mousePressed && mouseX>436&&mouseX<(436+35)&&mouseY>790&&mouseY<(790+35))//判断轨迹透明通道减少
    {
      if(road_alpha>0)
      {
        road_alpha = road_alpha-5;
      }
      clear();
    }
    if(mousePressed && mouseX>534&&mouseX<(534+50)&&mouseY>870&&mouseY<(870+35))//判断粒子间有排斥力
    {
      if_reject = true;
      particles = new ParticleSystem(img,particle_num,alpha,if_reject);
      clear();
    }
    if(mousePressed && mouseX>436&&mouseX<(436+90)&&mouseY>870&&mouseY<(870+35))//判断粒子间没有排斥力
    {
      if_reject = false;
      particles = new ParticleSystem(img,particle_num,alpha,if_reject);
      clear();
    }
  }
  
  
  void clear()
  {
    fill(255);
    noStroke();
    rect(620,60,1300,1020);
  }
}
