import java.util.Iterator;
ParticleSystem ps;
PVector gravity = new PVector(0,0.02);
PVector wind = new PVector();
float tree_angle = PI*(-1)/2;
ArrayList leaves;
float[][] trees_data = new float[20][5];
int count = 0;
int yes_count = 0;
int count_1 = 1;
int m = 0;

void setup()
{
  size(1200,900);
  background(153);
  leaves = new ArrayList();
  ps = new ParticleSystem();
  stroke(0);
  smooth();
}

void draw()
{
  fill(153,100);
  rect(0,0,width,height);
  //background(0);
  if(m==0)
  {
    for (int i=0; i<leaves.size(); i++) 
    {
      Leaf ls = (Leaf)leaves.get(i);
      ls.run();
    }
    for(int i=0;i<trees_data.length;i++)
    {
      branch(trees_data[i][0],trees_data[i][1],trees_data[i][2],trees_data[i][3],trees_data[i][4]);
    }
  }
   float x = map(sin(frameCount),-1,1,-0.2,0.2);
  wind.x = x;
  ps.applyForce(gravity);
  ps.applyForce(wind);
  ps.addParticle();
  ps.run();
}



void branch(float x,float y,float angle,float tree_height,float tree_weight)
  {
    float temp_angle = -PI/20 + angle;
    float next_x = cos(temp_angle)*tree_height + x;
    float next_y = sin(temp_angle)*tree_height + y;
    stroke(#272121);

    noFill();
    strokeWeight(tree_weight);
    bezier(x,y,x,(y + next_y)/2,next_x,(y + next_y)/2,next_x,next_y);
    
    if(tree_height>40)
    {
      branch(next_x,next_y,angle-PI/12,tree_height*0.64,tree_weight*0.6);
      branch(next_x,next_y,angle-PI/8,tree_height*0.64,tree_weight*0.6);
      branch(next_x,next_y,angle+PI/4,tree_height*0.8,tree_weight*0.6); 
    }
    else
    {
      PVector place = new PVector(next_x,next_y);
      Leaf temp_leaf = new Leaf(place);

      //for(int i=0; i<leaves.size(); i++)
      //{
      //  Leaf ls = (Leaf)leaves.get(i);
      //  if(ls.location.x == temp_leaf.location.x && ls.location.y == temp_leaf.location.y)
      //  {
      //    yes_count = 0;
      //  }
      //  else
      //  {
      //    yes_count = 1;
      //  }
      //}
      if(yes_count==1)
      {
        leaves.add(temp_leaf);
      }
        //stroke(#fc5185);
        //strokeWeight(15);
        //point(next_x,next_y);
    }
}

void mouseReleased()
{
  yes_count = 1;
  m = 0;
  float tree_height = map(height-mouseY,0,height,0,260);
  branch(mouseX, height,-PI/2,tree_height,tree_height/14);
  trees_data[count][0] = mouseX;
  trees_data[count][1] = height;
  trees_data[count][2] = -PI/2;
  trees_data[count][3] = tree_height;
  trees_data[count][4] = tree_height/10;
  count ++;
  yes_count = 0;
}

void keyPressed()
{
  if(key=='a')
  {
    save("work" + count + ".png");
    count_1++;
  }
  if(key=='d')
  {
     m = 1;
     leaves.clear();
     for(int i=0;i<trees_data.length;i++)
     {
       trees_data[i][0] = 0;
       trees_data[i][1] = 0;
       trees_data[i][2] = 0;
       trees_data[i][3] = 0;
       trees_data[i][4] = 0;
     }
  }
}
