class Button
{
  float posx;
  float posy;
  float b_width;
  float b_height;
  String txt;
  boolean symbol;
  
  Button(float x,float y,float w,float h,String t,boolean s)
  {
    posx = x;
    posy = y;
    b_width = w;
    b_height = h;
    txt = t;
    symbol = s;
  }
  
  void showButton()
  {
    if(hover())
    {
      stroke(0);
      strokeWeight(4);
    }
    else
    {
      noStroke();
    }
    fill(#f9f7f7);
    rect(posx,posy,b_width,b_height);
    fill(#112d4e);
    textFont(myFont);
    textAlign(CENTER,CENTER);  //文本全部以中心进行绘制
    if(symbol)
    {
      textSize(22);
      text(txt,posx+b_width/2,posy+b_height/2-4);
    }
    else
    {
      textSize(17);
      text(txt,posx+b_width/2,posy+b_height/2-3);
    }
  }
  
  boolean hover()
  {
    if(((mouseX>posx)&&(mouseX<posx+b_width))&&((mouseY>posy)&&(mouseY<posy+b_height)))
    {
      return true;
    }
    else
    {
      return false;
    }
  }
}
