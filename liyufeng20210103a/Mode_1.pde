class Mode_1
{
  PImage img;
  int img_num;
  int img_shape;  //碎片形状,(1代表正方形、2代表圆、3代表三角形)
  int size;  //碎片尺寸（正方形为边长、圆为直径、三角形为边长）(1-30)(1)
  boolean if_brightness;  //碎片是否灰度显示
  int alpha;  //碎片不透明度(0-250)(10)
  boolean if_stroke; //碎片是否有边框
  float random_size;  //随机尺寸
  
  Mode_1()
  {
    img_num = 0;
    img = loadImage("mode_1_"+img_num+".jpg");
    img_shape = 1;
    size = 10;
    if_brightness = false;
    alpha = 200;
    if_stroke = false;
    random_size = 0;
  }
  
  void run()
  {
    mouse_check();
    update();
    display();
  }
  
  void parameter_run()
  {  
    textFont(myFont);
    textAlign(CENTER,CENTER);  //文本全部以中心进行绘制
    fill(0);
    textSize(16);
    
    text("当前为第"+img_num+"张",210,176);
    text(size,490,175);  //粒子尺寸
    text(alpha,490,255);  //粒子不透明度
  }
  
  void display()
  {
    
    for(int i=0;i<500;i++)
    {
      int xx = (int)random(img.width);
      int yy = (int)random(img.height);
      
      color fc = img.get(xx, yy);
      xx = xx + 620;
      yy = yy +60;
      float point_b = brightness(fc)/255;  //计算每个像素点的颜色的亮度，并控制在0-1之间
      if(if_brightness)
      {
        if(point_b<0.8)
        {
          fill(0,map(point_b, 0, 1, 100, 0));
        }
      }
      else
      {
        fill(fc,alpha);
      }
      
      if(img_shape==1)
      {
        pushMatrix();
        translate(xx,yy);
        rotate(random(TWO_PI));
        rectMode(CENTER);
        rect(0,0,random(size-random_size,size+random_size),random(size-random_size,size+random_size));
        popMatrix();
      }
      else if(img_shape==2)
      {
        float temp_size = random(size-random_size,size+random_size);
        ellipse(xx,yy,temp_size,temp_size);
      }
      else
      {
        float temp_size_1 = random_size/2;
        pushMatrix();
        translate(xx,yy);
        rotate(random(TWO_PI));
        triangle(random(-temp_size_1,temp_size_1),random(size/2-temp_size_1,size/2+temp_size_1),random(-size/2-temp_size_1,-size/2+temp_size_1),random(-size/2-temp_size_1,-size/2+temp_size_1),random(size/2-temp_size_1,size/2+temp_size_1),random(-size/2-temp_size_1,-size/2+temp_size_1)); 
        popMatrix();
      }
    }
  }
  
  void update()
  {
    img = loadImage("mode_1_"+img_num+".jpg");
    //img.resize(1300,1020);
    //img.loadPixels();
    if(if_stroke)
    {
      stroke(0,100);
      strokeWeight(0.5);
    }
    else
    {
      noStroke();
    }
    random_size = size/2;
  }
  
  void clear()
  {
    fill(255);
    noStroke();
    rect(620,60,1300,1020);
  }
  
  void mouse_check()
  {
    if(mousePressed && mouseX>262&&mouseX<(262+35)&&mouseY>160&&mouseY<(160+35))//判断图片数量递增
    {
      img_num++;
      if(img_num>=10)
      {
        img_num = 0;
      }
      clear();
    }
    if(mousePressed && mouseX>124&&mouseX<(124+35)&&mouseY>160&&mouseY<(160+35))//判断图片数量递减
    {
      img_num = img_num - 1;
      if(img_num<0)
      {
        img_num = 9;
      }
      clear();
    }
    if(mousePressed && mouseX>124&&mouseX<(124+120)&&mouseY>240&&mouseY<(240+35))//判断碎片形状为正方形
    {
      img_shape=1;
      clear();
    }
    if(mousePressed && mouseX>252&&mouseX<(252+55)&&mouseY>240&&mouseY<(240+35))//判断碎片形状为圆形
    {
      img_shape=2;
      clear();
    }
    if(mousePressed && mouseX>315&&mouseX<(315+70)&&mouseY>240&&mouseY<(240+35))//判断碎片形状为三角形
    {
      img_shape=3;
      clear();
    }
    if(mousePressed && mouseX>510&&mouseX<(510+35)&&mouseY>160&&mouseY<(160+35))//判断碎片尺寸增加
    {
      if(size<30)
      {
        size = size +1;
      }
      clear();
    }
    if(mousePressed && mouseX>436&&mouseX<(436+35)&&mouseY>160&&mouseY<(160+35))//判断碎片尺寸减少
    {
      if(size>1)
      {
        size = size -1;
      }
      clear();
    }
    if(mousePressed && mouseX>124&&mouseX<(124+90)&&mouseY>320&&mouseY<(320+35))//判断不会灰度显示
    {
      if_brightness = false;
      clear();
    }
    if(mousePressed &&  mouseX>222&&mouseX<(222+50)&&mouseY>320&&mouseY<(320+35))//判断会灰度显示
    {
      if_brightness = true;
      clear();
    }
    if(mousePressed && mouseX>510&&mouseX<(510+35)&&mouseY>240&&mouseY<(240+35))//判断碎片不透明度增加
    {
      if(alpha<250)
      {
        alpha = alpha+10;
      }
      clear();
    }
    if(mousePressed && mouseX>436&&mouseX<(436+35)&&mouseY>240&&mouseY<(240+35))//判断碎片不透明度减少
    {
      if(alpha>0)
      {
        alpha = alpha-10;
      }
      clear();
    }
    if(mousePressed && mouseX>436&&mouseX<(436+90)&&mouseY>320&&mouseY<(320+35))//判断没有边框
    {
      if_stroke = false;
      clear();
    }
    if(mousePressed && mouseX>534&&mouseX<(534+50)&&mouseY>320&&mouseY<(320+35))//判断有边框
    {
      if_stroke = true;
      clear();
    }
  }
}
