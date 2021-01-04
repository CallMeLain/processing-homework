class Mode_2
{
  PImage img;
  int img_num;
  int line_length;  //线条长度（0-200）（10）
  float line_brightness; //亮度阙值、可以调节！（0.1-1）（0.1）
  int line_num;  //线条数量、可以调节（1-10）（1）
  float stroke_weight;  //线条粗细（0-2）（0.1）
  
  Mode_2()
  {
    img_num = 0;
    line_length = 60;
    line_brightness = 0.6;
    line_num = 3;
    stroke_weight = 0.8;
    
    img = loadImage("mode_2_"+img_num+".jpg");
  }
  
  void run()
  {
    mouse_check();
    update();
    display();
  }
  
  void display()
  {
    noStroke();
    fill(255);
    rect(620,60,1300,1020);
    for (int p = 0; p < 50000; p += 1)
    {
      float x = random(img.width);
      float y = random(img.height);
      for (int k = 0; k < line_num; k ++)  //每一个点相当于对应3条线
      {
        //point(x, y);
        float x1 = x +620;  //用于确定图像的位置
        float y1 = y +60;
        float x2 = x1 + line_length*(noise(x/100, y/100)-0.5);  //控制x2的距离来控制线的长度，noise函数可以生成更加平滑的数值，在0-1之间
        float y2 = y1 + line_length*(noise(y/100, x/100)-0.5);       
        color c = img.get(int(x), int(y));
        float point_b = brightness(c)/255;  //计算每个像素点的颜色的亮度，并控制在0-1之间
        if (point_b<line_brightness)
        {
          strokeWeight(map(point_b, 0, line_brightness, 2, 0.1));
          stroke(0, 0, 0, map(point_b, 0, 1, 100, 0));
          //stroke(c);
          //stroke(0);
          strokeWeight(stroke_weight);
          line(x1, y1, x2, y2);
        }
        x = x2;
        y = y2;
      }
    }
  //noLoop();
  }
  
  void mouse_check()
  {
    if(mousePressed && mouseX>262&&mouseX<(262+35)&&mouseY>475&&mouseY<(475+35))//判断图片数量递增
    {
      img_num++;
      if(img_num>9)
      {
        img_num = 0;
      }
    }
    if(mousePressed && mouseX>124&&mouseX<(124+35)&&mouseY>475&&mouseY<(475+35))//判断图片数量递减
    {
      img_num = img_num - 1;
      if(img_num<0)
      {
        img_num = 2;
      }
    }
    if(mousePressed && mouseX>202&&mouseX<(202+35)&&mouseY>635&&mouseY<(635+35))//判断线条长度增加
    {
      if(line_length<=200)
      {
        line_length = line_length + 10;
      }
    }
    if(mousePressed && mouseX>124&&mouseX<(124+35)&&mouseY>635&&mouseY<(635+35))//判断线条长度减少
    {
      if(line_length>0)
      {
        line_length = line_length - 10;
      }
    }
    if(mousePressed && mouseX>202&&mouseX<(202+35)&&mouseY>555&&mouseY<(555+35))//判断亮度阙值增加
    {
      if(line_brightness<1)
      {
        line_brightness = line_brightness + 0.1;
      }
    }
    if(mousePressed && mouseX>124&&mouseX<(124+35)&&mouseY>555&&mouseY<(555+35))//判断亮度阙值减少
    {
      if(line_brightness>0.1)
      {
        line_brightness = line_brightness -0.1;
      }
    }
    if(mousePressed && mouseX>510&&mouseX<(510+35)&&mouseY>475&&mouseY<(475+35))//判断线条数量增加
    {
      if(line_num<10)
      {
        line_num = line_num+1;
      }
    }
    if(mousePressed && mouseX>436&&mouseX<(436+35)&&mouseY>475&&mouseY<(475+35))//判断线条数量减少
    {
      if(line_num>1)
      {
        line_num=line_num-1;
      }
    }
    if(mousePressed && mouseX>510&&mouseX<(510+35)&&mouseY>555&&mouseY<(555+35))//判断线条粗细增加
    {
      if(stroke_weight<2)
      {
        stroke_weight = stroke_weight+0.1;
      }
    }
    if(mousePressed && mouseX>436&&mouseX<(436+35)&&mouseY>555&&mouseY<(555+35))//判断线条粗细减少
    {
      if(stroke_weight>0)
      {
        stroke_weight = stroke_weight-0.1;
      }
    }
  }
  
  void update()
  {
    img = loadImage("mode_2_"+img_num+".jpg");
    //img.loadPixels();
  }
  
  void parameter_run()
  {  
    textFont(myFont);
    textAlign(CENTER,CENTER);  //文本全部以中心进行绘制
    fill(0);
    textSize(16);
    
    text("当前为第"+img_num+"张",210,491);
    text(line_brightness,186,570);//亮度阙值
    text(line_length,180,650);//线条长度
    text(line_num,490,490); //线条数量
    text(stroke_weight,496,570); //线条粗细
  }
}
