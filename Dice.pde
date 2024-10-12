// Good code :3 UwU 
void setup()
{
  size(320, 340);
  noLoop();
}
void draw()
{
  background(255,255,255);
  Die[][] dice = {
    {new Die (0,0), new Die (110,0), new Die (220,0)},
    {new Die (0,110), new Die (110,110), new Die (220,110)},
    {new Die (0,220), new Die (110,220), new Die (220,220)},
  };
  int sum = 0;
  for(Die[] row: dice){
    for(Die die: row){
      die.roll();
      die.show();
      sum += (die.value+1);
    }
  }
  textSize(20);
  text("SUM: "+sum+(sum==54?" Congrats on a 1 in 10077696 achievment":""), 0, 340);
}
void mousePressed()
{
  redraw();
}
class Die //models one single dice cube
{
  boolean spot = true;
  boolean[][][] allspots = {
    {
      {false, false, false},
      {false, spot, false},
      {false, false, false}
    },
    {
      {spot, false, false},
      {false, false, false},
      {false, false, spot}
    },
    {
      {spot, false, false},
      {false, spot, false},
      {false, false, spot}
    },
    {
      {spot, false, spot},
      {false, false, false},
      {spot, false, spot}
    },
    {
      {spot, false, spot},
      {false, spot, false},
      {spot, false, spot}
    },
    {
      {spot, false, spot},
      {spot, false, spot},
      {spot, false, spot}
    }
   };
  boolean[][] spots;
  int x;
  int y;
  int value = 0;
  int size = 100;
  Die(int x, int y) //constructor
  {
    this.x = x;
    this.y = y;
  }
  void roll()
  {
    this.value = (int)(Math.random()*6);
    this.spots = allspots[this.value];
  }
  void show()
  {
    noFill();
    rect(x,y,size,size,10);
    int sx = 0;
    int sy = 0;
    for(int cy=size/4;cy<size; cy+=size/4){
      for(int cx=size/4;cx<size; cx+=size/4){
        if(this.spots[sy][sx]){
          fill(0);
          ellipse(x+cx, y+cy, size/6, size/6);
        }
        sx++;
    }
      sx = 0;
      sy++;
    }
  }
}
