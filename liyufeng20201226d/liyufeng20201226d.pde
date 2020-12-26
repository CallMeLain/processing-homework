int lifetime;  //每一代鸟应该存在的理论时长，对应需要多少个力
Population population;
int lifeCounter;   //每一代鸟当前处于的时长状态，变量
PVector target;  //目标位置
float target_radius;
float mouse_y;
float m_1,m_2,m_3;

PImage[] dover = new PImage[6];

void setup()
{
  size(1280,800);
  smooth();
  
  imageMode(CENTER);
  for (int i = 0; i < 6; i ++)
  {
    dover[i] = loadImage("dove0"+(i+1)+".png");
  }

  lifetime = 700;
  lifeCounter = 0;
  target = new PVector(width, height/2);
  target_radius = 100;

  population = new Population();
  
  frameRate(60);
}

void draw() {
  fill(#f9f7f7,150);
  noStroke();
  rect(0,0,width,height);
  
  mouse_y = map(mouseY,0,height,-100,100);
  m_1 = mouse_y;
  m_2 = mouse_y * (-2);
  m_3 = mouse_y * (-3);
  
  //background(#eaffd0);
  fill(#3f72af);
  noStroke();
  ellipse(target.x,target.y,target_radius*2,target_radius*2);
  wall_draw();
  

  if (lifeCounter<lifetime)  //如果这代还没有结束
  {
    population.live();  //该代确认存活
    lifeCounter++;  //每一帧加一次
  } 
  else  //这代消失，进入下一代
  {
    lifeCounter = 0;
    population.selection();
    population.reproduction();
  }


  fill(0);  //描述信息
  text("Generation : " + population.generations, 30, 36);
  text("Cycles left: " + (lifetime-lifeCounter), 30, 54);
}

void wall_draw()
{
  stroke(#3f72af);
  strokeWeight(8);
  line(320,0,320,100+m_1);
  line(320,700+m_1,320,800);
  line(640,0,640,200+m_2);
  line(640,600+m_2,640,800);
  line(960,0,960,300+m_3);
  line(960,500+m_3,960,800);
}
