import processing.pdf.*;
import processing.svg.*;

PFont myFont;
Button[] bt;
int mode_check;
int mode3_road_alpha;
Mode_1 mode1;
Mode_2 mode2;
Mode_3 mode3;
int savecount_png;
int savecount_svg;
int savecount_pdf;
boolean saveSVG;
boolean savePDF;

void setup()
{
  size(1920,1080);
  background(255);
  mode3_road_alpha = 50;
  mode_check = 0;
  savecount_png = 1;
  savecount_svg = 1;
  savecount_pdf = 1;
  saveSVG = false;
  savePDF = false;
  myFont = createFont("微软雅黑",24);
  bt = new Button[40];
  mode1 = new Mode_1();
  mode2 = new Mode_2();
  mode3 = new Mode_3();
  
  menu_draw();
  frameRate(120);
}

void draw()
{
  menu_update();
  menu_draw();
  button_update();
  
  if(saveSVG)
  {
    beginRecord(SVG, "output_"+savecount_svg+".svg");
  }
  if(savePDF)
  {
    beginRecord(PDF, "output_"+savecount_pdf+".pdf");
  }
  
  Mode_Check();
  if(mode_check==1)
  {
    mode1.run();
  }
  else if(mode_check==2)
  {
    mode2.run();
  }
  else if(mode_check==3)
  {
    mode3.run();
    mode3_road_alpha = mode3.road_alpha_check();
  }
  
  menu_update();
  menu_draw();
  button_update();
  
  if(mode_check==1)
  {
    mode1.parameter_run();
  }
  else if(mode_check==2)
  {
    mode2.parameter_run();
  }
  else if(mode_check==3)
  {
    mode3.parameter_run();
  }
  
  if(saveSVG)
  {
    endRecord();
    savecount_svg++;
    saveSVG = false;
  }
  if(savePDF)
  {
    endRecord();
    savecount_pdf++;
    savePDF = false;
  }
  if(mode_check==3)
  {
    mode3_display_clear(mode3_road_alpha);
  }
  
  exit_check();
  save_check();
}

void menu_update()
{
  noStroke();
  fill(250);
  rectMode(CORNER);
  rect(0,0,620,height);
  
}

void menu_draw()
{
  rectMode(CORNER);
  noStroke();
  fill(#112d4e);  
  rect(0,0,width,60);
  textFont(myFont);
  textAlign(CENTER,CENTER);  //文本全部以中心进行绘制
  fill(#f9f7f7);
  textSize(24);
  text("图片风格化处理工具",134,27);
  textSize(18);
  text("designed by 李雨峰",340,32);
  textSize(16);
  text("注：1）如果要使用某个模式下的功能，请首先点击“点击进入”按钮以切换到当前模式",1540,17);
  text("2）在任何模式下，您都可以随时点击使用综合区的保存和退出按钮",1500,39);
  
  fill(#3f72af);
  rect(0,60,80,315);  //line(0,375,620,375);
  fill(#dbe2ef);
  rect(80,60,540,315);
  
  fill(#3f72af);
  rect(0,375,80,315); //line(0,690,620,690);
  fill(#dbe2ef);
  rect(80,375,540,315);
  
  fill(#3f72af);
  rect(0,690,80,235);//line(0,925,620,925);
  fill(#dbe2ef);
  rect(80,690,540,235);

  fill(#3f72af);
  rect(0,925,80,155);
  fill(#dbe2ef);
  rect(80,925,540,155);
  
  fill(#f9f7f7);
  textSize(28);
  text("模式一",20,130,40,180);
  text("模式二",20,440,40,180);
  text("模式三",20,715,40,180);
  text("综",20,920,40,80);
  text("合",20,960,40,80);
  
  fill(#112d4e);
  textSize(18);
  text("图片数：",160,140);
  text("粒子尺寸：",480,140);
  text("粒子形状：",167,220);
  text("粒子不透明度：",500,220);
  text("边框显示：",480,300);
  text("灰度显示：",167,300);
  bt[0] = new Button(270,80,140,40,"点击进入",true);  // mouseX>270&&mouseX<(270+140)&&mouseY>80&&mouseY<(80+40)
  bt[1] = new Button(124,160,35,35,"-",true);  //判断图片数量递减  mouseX>124&&mouseX<(124+35)&&mouseY>160&&mouseY<(160+35)
  //textSize(16);
  //text("当前为第"+0+"张",210,176);
  bt[2] = new Button(262,160,35,35,"+",true);  //判断图片数量递增  mouseX>262&&mouseX<(262+35)&&mouseY>160&&mouseY<(160+35)
  bt[3] = new Button(124,240,120,35,"正方形(默认)",false);   //   mouseX>124&&mouseX<(124+120)&&mouseY>240&&mouseY<(240+35)
  bt[4] = new Button(252,240,55,35,"圆形",false);   //   mouseX>252&&mouseX<(252+55)&&mouseY>240&&mouseY<(240+35)
  bt[5] = new Button(315,240,70,35,"三角形",false);  //   mouseX>315&&mouseX<(315+70)&&mouseY>240&&mouseY<(240+35)
  
  bt[6] = new Button(124,320,90,35,"否(默认)",false);   //判断不会灰度显示   mouseX>124&&mouseX<(124+90)&&mouseY>320&&mouseY<(320+35)
  bt[7] = new Button(222,320,50,35,"是",false);    //判断会灰度显示    mouseX>222&&mouseX<(222+50)&&mouseY>320&&mouseY<(320+35)
  
  bt[8] = new Button(436,160,35,35,"-",true);  //判断碎片尺寸减少  mouseX>436&&mouseX<(436+35)&&mouseY>160&&mouseY<(160+35)
  //textSize(16);
  //text("50",490,175);
  bt[9] = new Button(510,160,35,35,"+",true);  //判断碎片尺寸增加  mouseX>510&&mouseX<(510+35)&&mouseY>160&&mouseY<(160+35)
  
  bt[10] = new Button(436,240,35,35,"-",true);  //判断碎片不透明度减少    mouseX>436&&mouseX<(436+35)&&mouseY>240&&mouseY<(240+35)
  //textSize(16);
  //text("250",490,255);
  bt[11] = new Button(510,240,35,35,"+",true);  //判断碎片不透明度增加   mouseX>510&&mouseX<(510+35)&&mouseY>240&&mouseY<(240+35)
  
  bt[12] = new Button(436,320,90,35,"否(默认)",false);//判断没有边框  mouseX>436&&mouseX<(436+90)&&mouseY>320&&mouseY<(320+35)
  bt[13] = new Button(534,320,50,35,"是",false);//判断有边框  mouseX>534&&mouseX<(534+50)&&mouseY>320&&mouseY<(320+35)
  
  
  
  bt[14] = new Button(270,395,140,40,"点击进入",true);  // mouseX>270&&mouseX<(270+140)&&mouseY>395&&mouseY<(395+40)
  textSize(18);
  text("图片数：",160,455);   
  text("线条数量：",480,455); 
  text("亮度阙值：",167,535);
  text("线条粗细：",480,535);
  text("线条长度：",167,615);

  //textSize(16);
  bt[15] = new Button(124,475,35,35,"-",true);  //判断图片数量递减   mouseX>124&&mouseX<(124+35)&&mouseY>475&&mouseY<(475+35)
  //text("当前为第0张",210,491);
  bt[16] = new Button(262,475,35,35,"+",true);  //判断图片数量递增   mouseX>262&&mouseX<(262+35)&&mouseY>475&&mouseY<(475+35)
  
  bt[17] = new Button(124,555,35,35,"-",true);   //判断亮度阙值减少  mouseX>124&&mouseX<(124+35)&&mouseY>555&&mouseY<(555+35)
  //text("0.1",180,570);
  bt[18] = new Button(218,555,35,35,"+",true);   //判断亮度阙值增加  mouseX>202&&mouseX<(202+35)&&mouseY>555&&mouseY<(555+35)
  
  bt[19] = new Button(124,635,35,35,"-",true);   //判断线条长度减少  mouseX>124&&mouseX<(124+35)&&mouseY>635&&mouseY<(635+35)
  //text("100",180,650);
  bt[20] = new Button(202,635,35,35,"+",true);   //判断线条长度增加  mouseX>202&&mouseX<(202+35)&&mouseY>635&&mouseY<(635+35)
  
  bt[21] = new Button(436,475,35,35,"-",true);   //判断线条数量减少  mouseX>436&&mouseX<(436+35)&&mouseY>475&&mouseY<(475+35)
  //text("1",490,490);
  bt[22] = new Button(510,475,35,35,"+",true);   //判断线条数量增加  mouseX>510&&mouseX<(510+35)&&mouseY>475&&mouseY<(475+35)
  
  bt[23] = new Button(436,555,35,35,"-",true);   //判断线条粗细减少  mouseX>436&&mouseX<(436+35)&&mouseY>555&&mouseY<(555+35)
  //text("0.1",490,570);
  bt[24] = new Button(526,555,35,35,"+",true);   //判断线条粗细增加  mouseX>510&&mouseX<(510+35)&&mouseY>555&&mouseY<(555+35)
  
  
  bt[25] = new Button(270,710,140,40,"点击进入",true);  // mouseX>270&&mouseX<(270+140)&&mouseY>710&&mouseY<(710+40)
  textSize(18);
  text("图片数：",160,770);   
  text("轨迹透明度：",489,770); 
  text("粒子数量：",167,850);
  text("是否排斥：",480,850);
  
  //textSize(16);
  bt[26] = new Button(124,790,35,35,"-",true);  //判断图片数量减少   mouseX>124&&mouseX<(124+35)&&mouseY>790&&mouseY<(790+35)
  //text("当前为第0张",210,806);
  bt[27] = new Button(262,790,35,35,"+",true);  //判断图片数量增加   mouseX>262&&mouseX<(262+35)&&mouseY>790&&mouseY<(790+35)
  
  bt[28] = new Button(124,870,35,35,"-",true);   //判断粒子数量减少  mouseX>124&&mouseX<(124+35)&&mouseY>870&&mouseY<(870+35)
  //text("10000",186,885);
  bt[29] = new Button(218,870,35,35,"+",true);   //判断粒子数量增加  mouseX>218&&mouseX<(218+35)&&mouseY>870&&mouseY<(870+35)
  
  bt[30] = new Button(436,790,35,35,"-",true);   //判断粒子透明通道减少  mouseX>436&&mouseX<(436+35)&&mouseY>790&&mouseY<(790+35)
  //text("250",490,805);
  bt[31] = new Button(510,790,35,35,"+",true);   //判断粒子透明通道增加  mouseX>510&&mouseX<(510+35)&&mouseY>790&&mouseY<(790+35)
  
  bt[32] = new Button(436,870,90,35,"是(默认)",false);  //判断粒子间没有排斥力  mouseX>436&&mouseX<(436+90)&&mouseY>870&&mouseY<(870+35)
  bt[33] = new Button(534,870,50,35,"否",false);      //判断粒子间有排斥力  mouseX>534&&mouseX<(534+50)&&mouseY>870&&mouseY<(870+35)
  
  
  //bt[25] = new Button(270,710,140,40,"点击进入",true);  // mouseX>270&&mouseX<(270+140)&&mouseY>710&&mouseY<(710+40)
  textSize(18);
  text("保存当前画面至文件夹：",221,965);   
  text("退出当前程序：",498,965); 
  bt[34] = new Button(124,990,60,35,"PNG",false);    // mouseX>124&&mouseX<(124+60)&&mouseY>990&&mouseY<(990+35)
  bt[35] = new Button(192,990,60,35,"SVG",false);    // mouseX>192&&mouseX<(192+60)&&mouseY>990&&mouseY<(990+35)
  bt[36] = new Button(260,990,60,35,"PDF",false);    // mouseX>260&&mouseX<(260+60)&&mouseY>990&&mouseY<(990+35)
  
  bt[37] = new Button(436,990,60,35,"退出",false);   // mouseX>436&&mouseX<(436+60)&&mouseY>990&&mouseY<(990+35)
  
  stroke(#112d4e);
  strokeWeight(2);
  //line(620,0,620,height);
  line(0,375,620,375);
  line(0,690,620,690);
  line(0,925,620,925);
}

void button_update()
{
  for(int i=0;i<38;i++)
  {
    bt[i].showButton();
  }
}

void Mode_Check()
{
  if(mousePressed&&mouseX>270&&mouseX<(270+140)&&mouseY>80&&mouseY<(80+40))
  {
    mode_check = 1;
    display_clear();
  }
  if(mousePressed&&mouseX>270&&mouseX<(270+140)&&mouseY>395&&mouseY<(395+40))
  {
    mode_check = 2;
    display_clear();
  }
  if(mousePressed&&mouseX>270&&mouseX>270&&mouseX<(270+140)&&mouseY>710&&mouseY<(710+40))
  {
    mode_check = 3;
    display_clear();
  }
}

void display_clear()
{
  fill(255);
  noStroke();
  rect(620,60,1300,1020);
}

void mode3_display_clear(int a)
{
  fill(255,a);
  noStroke();
  rect(620,60,1300,1020);
}

void save_check()
{
  if(mousePressed&&mouseX>124&&mouseX<(124+60)&&mouseY>990&&mouseY<(990+35))  //PNG
  {
    save("output_" + savecount_png + ".png");
    savecount_png++;
  }
  if(mousePressed&&mouseX>192&&mouseX<(192+60)&&mouseY>990&&mouseY<(990+35))  //SVG
  {
    saveSVG = true;
  }
  if(mousePressed&&mouseX>260&&mouseX<(260+60)&&mouseY>990&&mouseY<(990+35))   //PDF
  {
    savePDF = true;
  }
}

void exit_check()
{
  if(mousePressed&& mouseX>436&&mouseX<(436+60)&&mouseY>990&&mouseY<(990+35))
  {
    exit();
  }
}
