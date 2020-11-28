String whole_str;
String[] word;
String[] whole_text;
String str_gap = " ,.:;!?";
int[] word_num;
int[] word_total;
int cl;
int line;
float line_gap;
float point_x;
float point_y;
int num;
int color_num;
int xx=0;

void setup()
{
  size(800,800);
  background(255);
}

void draw()
{
  background(255);
  if(xx==0)
  {
    whole_text = loadStrings("txt_1.txt");
  //println(whole_text.length);
  }
  else if(xx==1)
  {
    whole_text = loadStrings("txt_2.txt");
  //println(whole_text.length);
  }
  else if(xx==2)
  {
    whole_text = loadStrings("txt_3.txt");
  //println(whole_text.length);
  }
  else if(xx==3)
  {
    whole_text = loadStrings("txt_4.txt");
  //println(whole_text.length);
  }
  else if(xx==4)
  {
    whole_text = loadStrings("txt_5.txt");
  //println(whole_text.length);
  }
  
  whole_str = join(whole_text,"");
  //println(whole_str.length());
  word = splitTokens(whole_str,str_gap);
  //println(word.length);
  
  word_num = new int[word.length];
  word_total = new int[word.length];
  
  for(int i=0;i<word.length;i++)
  {
    word_num[i] = word[i].length();
    for(int j=0;j < word[i].length();j++)
    {
      char m = word[i].charAt(j);
      cl = int(m);
      word_total[i] = word_total[i] + cl;
    }
    //println(word_num[i]);
    //println(int(word_total[i]));
  }
  
  //println(word_num.length);
  //println(word_total.length);
  
  line = int(sqrt(word.length))+1;
  //println(line);
  
  line_gap = width/line;
  
  for(int i=0;i<line;i++)
  {
    for(int j=0;j<line;j++)    // line*i+j
    {
      point_x = line_gap*i;
      point_y = line_gap*j;
      num = line*i+j;
      if(num<word_num.length)
      {
         if(word_num[num] == 1)
         {
           line_color(word_total[num],word[num].length());
           line(point_x,point_y,point_x+line_gap,point_y+line_gap);
          }
          else if(word_num[num] == 2)
         {
           triangle_color(word_total[num],word[num].length());
           triangle(point_x,point_y,point_x+line_gap,point_y,point_x,point_y+line_gap);
           }
          else if(word_num[line*i+j] == 3)
          {
            line_color(word_total[num],word[num].length());
            line(point_x,point_y+line_gap,point_x+line_gap,point_y);
          }
          else if(word_num[line*i+j] == 4)
          {
            triangle_color(word_total[num],word[num].length());  
            triangle(point_x,point_y,point_x+line_gap,point_y,point_x+line_gap,point_y+line_gap);
           }
          else if(word_num[line*i+j] == 5)
          {
            triangle_color(word_total[num],word[num].length());
            triangle(point_x,point_y,point_x,point_y+line_gap,point_x+line_gap,point_y+line_gap);
          }
          else
          {
            triangle_color(word_total[num],word[num].length());
            triangle(point_x+line_gap,point_y,point_x+line_gap,point_y+line_gap,point_x,point_y+line_gap);
          }
      }
    }
  }
  
  xx = xx+1;
  if(xx>=5)
  {
    xx = 0;
  }
  
  delay(300);
}



void line_color(int x,int y)
{
  strokeWeight(2);
  println(x);
  int m = abs(x/y);
  stroke(random(m-50,m+50),random(m-50,m+50),random(m-50,m+50));
}

void triangle_color(int x,int y)
{
  noStroke();
  int m = abs(x/y);
  fill(random(m-50,m+50),random(m-50,m+50),random(m-50,m+50));
}
