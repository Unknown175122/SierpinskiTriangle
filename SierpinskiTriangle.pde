double wh = 100;
double x = 0;
double y = 0;
int botlimit = 1;
int toplimit = 50;
float[] starsx = new float[100];
float[] starsy = new float[100];
void setup(){
size(400,400);
speckle();
bg();
doe(200);
}
void draw(){
}

void keyPressed(){
  if (keyCode == RIGHT){
    if(botlimit <=100){
    botlimit +=botlimit;
    }
  }
  if (keyCode == LEFT){
    if(botlimit > 1){
    botlimit -=botlimit/2;
    }
  }
  //background(200);
  bg();
  doe(200);
}


void doe(double hw){
  if (hw >botlimit){
  tri((int)x,(int)y, (int)hw);
  doe(hw/2); 
  x+=hw;
  tri((int)x,(int)y, (int)hw);
  doe(hw/2);
  y+=hw;
  x-=hw/2;
  tri((int)x,(int)y, (int)hw);
  doe(hw/2);
  x-=hw/2;
  y-=hw;
  }
  
}

void tri(int botx, int boty, int hw){
  boty = 400-boty-hw;    //revert to right side up if u want
  //hw = -hw;
  botx = 400 - botx-hw;
  if (Math.abs(hw) < botlimit+botlimit){//15*toplimit){
    mogu(botx,boty,hw, hw);
  }
}

void mogu(float x, float y, float w, float h){ // leftmost is 107.5 upmost is 101
  //noStroke();
  //fill(255,0,0);
  w = w/167.5; //167.5 is width 224 is length
  h = h/224;
  rect(x+w*152.5,y+h*49,w*50,h*125, 30);
  
  beginShape();
  curveVertex(x+w*92.5,y+h*99);
  curveVertex(x+w*92.5,y+h*179);
  curveVertex(x+w*82.5,y+h*224);
  curveVertex(x+w*25.5,y+h*214);
  curveVertex(x+w*17.5,y+h*124);
  curveVertex(x+w*22.5,y+h*54);
  curveVertex(x+w*52.5,y+h*14);
  curveVertex(x+w*92.5,y+h);
  curveVertex(x+w*132.5,y+h*14);
  curveVertex(x+w*162.5,y+h*54);
  curveVertex(x+w*167.5,y+h*124);
  curveVertex(x+w*159.5,y+h*214);
  curveVertex(x+w*102.5,y+h*224);
  curveVertex(x+w*92.5,y+h*179);
  curveVertex(x+w*92.5,y+h*99);
  endShape();
  
  //stroke(1);
  //fill(50,200,255);
  ellipse(x+w*57.5,y+h*74,w*115,h*60);
}

void bg(){
  background(0);
  int s;
  fill(255);
  for (int i = 0; i < 100; i++){
    s=(int)(Math.random()*3 )+5;
    ellipse(starsx[i],starsy[i],s,s);
  }
}

void speckle(){
  for (int i = 0; i < 100; i++){
    starsx[i] =(float)(Math.random()*400);
    starsy[i] =(float)(Math.random()*400);
  }
}


