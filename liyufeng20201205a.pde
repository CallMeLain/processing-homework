int start_value = 50;
float area_height = 150;
float speed = 0;
float distance = 0;
int count = 1;
color c,cc_1,cc_2,cc_3;
color cc_0 = 0;
int brush_mode = 1;
float angle,size,size_1;
int mode_3_gap = 5;
float mode4_x,mode4_y;

void setup()
{
  size(displayWidth, displayHeight);
  background(255);
  
  Menu_Bar_Draw();
  
  mouseX = -start_value;
  mouseY = -start_value;  //避免鼠标起始位置在左上角

  Menu_Bar_Refresh();
  c = cc_0;
  Color_Change();
}

void draw()
{
  frameRate(144);
  fill(255);
  noStroke();//kanyaobuyaoshan
  rect(width/2,100,width,100);
  stroke(0);
  strokeWeight(2);
  line(width/3,0,width/3,150);
  line(width/3+width/3,0,width/3+width/3,150);
  line(0,150,width,150);
  
  float w = constrain(mouseX, 0, width);
  float x = constrain(mouseY, area_height, height);
  float y = constrain(pmouseX, 0, width);
  float z = constrain(pmouseY, area_height, height);
  
  Button_Border();
  Button_Function();
  
  if(mousePressed == true)
  {
    if(brush_mode==1)
    {
      distance = dist(mouseX, mouseY, pmouseX, pmouseY);
      speed = speed + (distance - speed)*0.03;
      stroke(c);
      cursor(ARROW);
      strokeWeight(speed/2);
      line(w,x,y,z);
    }
    else if(brush_mode==2)
    {
      stroke(c,80);
      strokeWeight(2);
      fill(255,255,255,0);
      cursor(ARROW);
      angle = map(w, 0, width, 0, TWO_PI);
      size = map(x, area_height, height, 50, 500);
      pushMatrix();
      translate(w,x);
      rotate(angle);
      triangle(0,size/2,(-1)*(size/2),(-1)*(size/2),size/2,(-1)*(size/2));
      popMatrix();
    }
    else if(brush_mode==3)
    {
      stroke(c,80);
      strokeWeight(1);
      cursor(ARROW);
      mode_3_gap = 5;
      size_1 = map(w,0,width,20,100);
      pushMatrix();
      translate(w,x);
      noFill();
      beginShape();
      curveVertex(0,0);
      curveVertex(random(size_1-mode_3_gap,+mode_3_gap),random(size_1-mode_3_gap,size_1+mode_3_gap));
      curveVertex(random(0-mode_3_gap,0+mode_3_gap),random(size_1-mode_3_gap,size_1+mode_3_gap));
      curveVertex(random(-size_1-mode_3_gap,-size_1+mode_3_gap),random(size_1-mode_3_gap,size_1+mode_3_gap));
      curveVertex(random(-size_1-mode_3_gap,-size_1+mode_3_gap),random(0-mode_3_gap,0+mode_3_gap));
      curveVertex(random(-size_1-mode_3_gap,-size_1+mode_3_gap),random(-size_1-mode_3_gap,-size_1+mode_3_gap));
      curveVertex(random(0-mode_3_gap,0+mode_3_gap),random(-size_1-mode_3_gap,-size_1+mode_3_gap));
      curveVertex(random(size_1-mode_3_gap,+mode_3_gap),random(-size_1-mode_3_gap,-size_1+mode_3_gap));
      curveVertex(random(size_1-mode_3_gap,+mode_3_gap),random(0-mode_3_gap,0+mode_3_gap));
      curveVertex(random(size_1-mode_3_gap,+mode_3_gap),random(size_1-mode_3_gap,size_1+mode_3_gap));
      curveVertex(0,0);
      endShape();
      popMatrix();
    }
    else if(brush_mode==4)
    {
      noStroke();
      cursor(ARROW);
      pushMatrix();
      translate(w,x);
      for(int i=0;i<100;i++)
      {
        mode4_x = random(0-36,0+36);
        mode4_y = random(0-36,0+36);
        if(dist(mode4_x,mode4_y,0,0)<random(16,36))
        {
          fill(c,random(255));
          ellipse(mode4_x,mode4_y,3,3);
        }
      }
      popMatrix();
    }
  }
  
  Menu_Bar_Refresh();
  
  if((mouseX>1315)&&(mouseX<1585)&&(mouseY>65)&&(mouseY<135)&&(mousePressed==true)) //clear
  {
    fill(255);
    noStroke();//kanyaobuyaoshan
    rect(width/2,(height-50)/2+50,width,height-50);
    stroke(0);
    strokeWeight(2);
    line(width/3,0,width/3,150);
    line(width/3+width/3,0,width/3+width/3,150);
    line(0,150,width,150);
  }
  if((mouseX>1615)&&(mouseX<1885)&&(mouseY>65)&&(mouseY<135)&&(mousePressed==true)) //save
  {
    save("work" + count + ".png");
    count++;
  }
  Menu_Bar_Refresh();
}



void Menu_Bar_Draw()
{
  noStroke();
  fill(66,133,244);
  rect(0,0,width/3,50);
  fill(52,168,83);
  rect(width/3,0,width/3,50);
  fill(251,188,5);
  rect(width/3+width/3,0,width/3,50);
  fill(255);
  rect(0,50,width,100);
  stroke(0);
  strokeWeight(2);
  line(width/3,0,width/3,150);
  line(width/3+width/3,0,width/3+width/3,150);
  line(0,150,width,150);
  
  textAlign(CENTER,CENTER);  //文本全部以中心进行绘制
  textSize(24); 
  fill(255);
  text("Brush Color",width/3/2,25);
  text("Brush Mode",width/3/2+width/3,25);
  text("Clear && Save",width/3/2+width/3+width/3,25);
}



void Menu_Bar_Refresh()
{
  Area_Color_Draw();
  Area_Color_Reset();
  Area_Brush_Mode();
  Area_Clear_Save();
}



void Area_Color_Draw()
{
  rectMode(CENTER);
  noStroke();
  fill(cc_1);
  rect(320,80,80,30);
  fill(cc_2);
  rect(160,80,80,30);
  fill(cc_3);
  rect(480,80,80,30);
}



void Color_Change()
{
  cc_1 = color(random(255), random(255), random(255));
  cc_2 = color(random(255), random(255), random(255));
  cc_3 = color(random(255), random(255), random(255));
}



void Area_Color_Reset()
{
  rectMode(CENTER);
  noStroke();
  fill(202,204,209);
  rect(320,123,120,36);
  textAlign(CENTER,CENTER);  //文本全部以中心进行绘制
  textSize(18); 
  fill(0);
  text("Reset Color",320,123);
}



void Area_Brush_Mode()
{
  rectMode(CENTER);
  fill(202,204,209);
  noStroke();
  rect(830,78,180,36); //mode1
  rect(1090,78,180,36);  //mode2
  rect(830,122,180,36); //mode3
  rect(1090,122,180,36); //mode4
  textAlign(CENTER,CENTER);  //文本全部以中心进行绘制
  textSize(18); 
  fill(0);
  text("Line (default)",830,78);
  text("Rotating Triangle",1090,78);
  text("Unstable polygons",830,122);
  text("Gathered Circle",1090,122);
}




void Area_Clear_Save()
{
  rectMode(CENTER);
  fill(202,204,209);
  noStroke();
  rect(1450,100,270,70); //clear
  rect(1750,100,270,70); //save
  textAlign(CENTER,CENTER);  //文本全部以中心进行绘制
  textSize(18); 
  fill(0);
  text("Clear the current canvas",1450,100);
  text("Save current canvas to folder",1750,100);
}



void Button_Function()
{
  if((mouseX>260)&&(mouseX<380)&&(mouseY>105)&&(mouseY<141)&&(mousePressed==true))
  {
    Color_Change();
    c = cc_0;
  }
  
  if((mouseX>120)&&(mouseX<200)&&(mouseY>65)&&(mouseY<95)&&(mousePressed==true))
  {
    c = cc_2;
  }
  
  if((mouseX>280)&&(mouseX<360)&&(mouseY>65)&&(mouseY<95)&&(mousePressed==true))
  {
    c = cc_1;
  }
  
  if((mouseX>440)&&(mouseX<520)&&(mouseY>65)&&(mouseY<95)&&(mousePressed==true))
  {
    c = cc_3;
  }
  
  if((mouseX>740)&&(mouseX<920)&&(mouseY>60)&&(mouseY<96)&&(mousePressed==true)) //mode1
  {
    brush_mode = 1;
  }
  
  if((mouseX>1000)&&(mouseX<1180)&&(mouseY>60)&&(mouseY<96)&&(mousePressed==true)) //mode2
  {
    brush_mode = 2;
  }
  
  if((mouseX>740)&&(mouseX<920)&&(mouseY>104)&&(mouseY<140)&&(mousePressed==true)) //mode3
  {
    brush_mode = 3;
  }
  
  if((mouseX>1000)&&(mouseX<1180)&&(mouseY>104)&&(mouseY<140)&&(mousePressed==true)) //mode4
  {
    brush_mode = 4;
  }
}



void Button_Border()
{
  if((mouseX>120)&&(mouseX<200)&&(mouseY>65)&&(mouseY<95))
  {
    fill(cc_2);
    stroke(0);
    strokeWeight(10);
    rect(160,80,80,30);
  }
  
  if((mouseX>280)&&(mouseX<360)&&(mouseY>65)&&(mouseY<95))
  {
    fill(cc_1);
    stroke(0);
    strokeWeight(10);
    rect(320,80,80,30);
  }
  
  if((mouseX>440)&&(mouseX<520)&&(mouseY>65)&&(mouseY<95))
  {
    fill(cc_3);
    stroke(0);
    strokeWeight(10);
    rect(480,80,80,30);
  }
  
  if((mouseX>260)&&(mouseX<380)&&(mouseY>105)&&(mouseY<141))
  {
    stroke(0);
    strokeWeight(10);
    rectMode(CENTER);
    fill(202,204,209);
    rect(320,123,120,36);
    textAlign(CENTER,CENTER);  //文本全部以中心进行绘制
    textSize(18); 
    fill(0);
    text("Reset Color",320,123);
  }
  
  if((mouseX>740)&&(mouseX<920)&&(mouseY>60)&&(mouseY<96)) //mode1
  {
    rectMode(CENTER);
    fill(202,204,209);
    stroke(0);
    strokeWeight(10);
    rect(830,78,180,36);
    textAlign(CENTER,CENTER);  //文本全部以中心进行绘制
    textSize(18); 
    fill(0);
    text("Line (default)",830,78);
  }
  
  if((mouseX>1000)&&(mouseX<1180)&&(mouseY>60)&&(mouseY<96)) //mode2
  {
    rectMode(CENTER);
    fill(202,204,209);
    stroke(0);
    strokeWeight(10);
    rect(1090,78,180,36);
    textAlign(CENTER,CENTER);  //文本全部以中心进行绘制
    textSize(18); 
    fill(0);
    text("Rotating Triangle",1090,78);
  }
  
  if((mouseX>740)&&(mouseX<920)&&(mouseY>104)&&(mouseY<140)) //mode3
  {
    rectMode(CENTER);
    fill(202,204,209);
    stroke(0);
    strokeWeight(10);
    rect(830,122,180,36);
    textAlign(CENTER,CENTER);  //文本全部以中心进行绘制
    textSize(18); 
    fill(0);
    text("Unstable polygons",830,122);
  }
  
  if((mouseX>1000)&&(mouseX<1180)&&(mouseY>104)&&(mouseY<140)) //mode4
  {
    rectMode(CENTER);
    fill(202,204,209);
    stroke(0);
    strokeWeight(10);
    rect(1090,122,180,36);
    textAlign(CENTER,CENTER);  //文本全部以中心进行绘制
    textSize(18); 
    fill(0);
    text("Gathered Circle",1090,122);
  }
  
  if((mouseX>1315)&&(mouseX<1585)&&(mouseY>65)&&(mouseY<135)) //clear
  {
    rectMode(CENTER);
    fill(202,204,209);
    stroke(0);
    strokeWeight(10);
    rect(1450,100,270,70); //clear
    textAlign(CENTER,CENTER);  //文本全部以中心进行绘制
    textSize(18); 
    fill(0);
    text("Clear the current canvas",1450,100);
  }
  
 if((mouseX>1615)&&(mouseX<1885)&&(mouseY>65)&&(mouseY<135)) //save
  {
    rectMode(CENTER);
    fill(202,204,209);
    stroke(0);
    strokeWeight(10);
    rect(1750,100,270,70); //save
    textAlign(CENTER,CENTER);  //文本全部以中心进行绘制
    textSize(18); 
    fill(0);
    text("Save current canvas to folder",1750,100);
  }
}
