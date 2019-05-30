Board theBoard;
MainGuy player1;
boolean beginGame = false;
boolean gameEnd = false;
boolean isDucked = false;
boolean jump;
boolean upPressed;
int startFrame;
int score;
int speed = 7;
int gap = 80;
int jumpFrame;
PFont f;
int beginScoring;

ArrayList<Spike> spikes;

int[][] layer = {
         /*0*/  {#EAFA0F,#EAFA0F,#EAFA0F,#71CBE5,255,255,255,255,255,255,#71CBE5,#71CBE5,#71CBE5,255,255,255,255,255,255,#71CBE5},
         /*1*/  {#EAFA0F,#EAFA0F,#EAFA0F,#71CBE5,#71CBE5,255,255,255,255,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,255,255,255,255,#71CBE5,#71CBE5},
         /*2*/  {#EAFA0F,#EAFA0F,#EAFA0F,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5},
         /*3*/  {#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5},
         /*4*/  {#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5},
         /*5*/  {#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5},
         /*6*/  {#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5},
         /*7*/  {#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5},
         /*8*/  {#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5},
         /*9*/  {#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5},
         /*10*/ {#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5,#71CBE5},
         /*11*/ {#9B713A,#9B713A,#9B713A,#9B713A,#9B713A,#9B713A,#9B713A,#9B713A,#9B713A,#9B713A,#9B713A,#9B713A,#9B713A,#9B713A,#9B713A,#9B713A,#9B713A,#9B713A,#9B713A,#9B713A}
          };
          
int[][] hell = {
               {#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600},
               {#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600},
               {#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600},
               {#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600},
               {#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#D80000,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#D80000,#FA9600,#FA9600,#FA9600},
               {#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#D80000,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#FA9600,#D80000,#FA9600,#FA9600,#FA9600},
               {#D80000,#FA9600,#FA9600,#FA9600,#D80000,#FA9600,#D80000,#D80000,#FA9600,#D80000,#FA9600,#FA9600,#FA9600,#D80000,#FA9600,#D80000,#D80000,#FA9600,#D80000,#FA9600},
               {#D80000,#FA9600,#FA9600,#FA9600,#D80000,#D80000,#D80000,#FEFF1F,#D80000,#D80000,#FA9600,#FA9600,#FA9600,#D80000,#D80000,#D80000,#FEFF1F,#D80000,#D80000,#FA9600},
               {#FEFF1F,#D80000,#FA9600,#FA9600,#D80000,#FEFF1F,#D80000,#FEFF1F,#D80000,#D80000,#D80000,#FA9600,#FA9600,#D80000,#FEFF1F,#D80000,#FEFF1F,#D80000,#D80000,#FA9600},
               {#FEFF1F,#D80000,#D80000,#FA9600,#D80000,#FEFF1F,#FEFF1F,#FEFF1F,#FEFF1F,#D80000,#D80000,#D80000,#D80000,#D80000,#FEFF1F,#FEFF1F,#FEFF1F,#FEFF1F,#D80000,#D80000},
               {#FEFF1F,#D80000,#D80000,#D80000,#D80000,#FEFF1F,#FEFF1F,#FEFF1F,#FEFF1F,#D80000,#D80000,#D80000,#D80000,#D80000,#FEFF1F,#FEFF1F,#FEFF1F,#FEFF1F,#D80000,#D80000}, 
               {#9B713A,#9B713A,#9B713A,#9B713A,#9B713A,#9B713A,#9B713A,#9B713A,#9B713A,#9B713A,#9B713A,#9B713A,#9B713A,#9B713A,#9B713A,#9B713A,#9B713A,#9B713A,#9B713A,#9B713A}
};
          
int[][] theDude = {
                  {100},
                  {100},
                  {100},
                  {100}
};

int[][] theDudeDucked = {
                   {-1,-1,-1},
                   {-1,-1,-1},
                   {100,100,100},
                   {100,-1,-1}

};

int[][] oneSpike = {
                  {-2}
};

int[][] flySpike = {
                      {120, -3},
                      {120, -3},
};

int[][] twoSpike = {
                  {-2, -2}
};

int[][] nothing = { {-1} }; 



void setup(){
   size(1000,800);

   theBoard = new Board(width/6 - 100, height/6, 12, 20, 40);
   
   theBoard.addLayer( layer );
   
   player1 = new MainGuy(7, 16);
   player1.setData(theDude);
   theBoard.addItem(player1);
   
   spikes = new ArrayList<Spike>();
   
   f = createFont("Comic Sans MS",16,true);
   textFont(f,36);
  
   
}

void draw(){
  background(255);
  theBoard.show();
  
  int whichSpike = int(random(1, 4));
  
  if(beginGame){
    
    score = (frameCount - beginScoring) /10;
  }
  
  fill(0);
  text("Score:" + score, 190, 290);
  
  if(frameCount % gap == 0 && beginGame){
    if(whichSpike == 1){
      Spike currSpike = new Spike(10, 0);
      currSpike.setData(oneSpike);
      currSpike.setDataName("oneSpike");
      theBoard.addItem(currSpike);
      spikes.add(currSpike);
    }
    if(whichSpike == 2){
      Spike currSpike = new Spike(10, 0);
      currSpike.setData(twoSpike);
      currSpike.setDataName("twoSpike");
      theBoard.addItem(currSpike);
      spikes.add(currSpike);
    }
    if(whichSpike == 3){
      Spike currSpike = new Spike(6, 0);
      currSpike.setData(flySpike);
      currSpike.setDataName("flySpike");
      theBoard.addItem(currSpike);
      spikes.add(currSpike);
    }
  }
  
  if(frameCount == 900){
    speed = 5;
    gap = 60;
  }
  if(frameCount == 1800){
    speed = 4;
    gap = 40;
  }
  if(frameCount == 2700){
    speed = 3;
    theBoard.addLayer( hell );
  }
    
  
  if(frameCount % speed == 0 && beginGame){
    for(int i=0; i<spikes.size(); i++){
      Spike s = spikes.get(i);
      if(s.col() < 19)
        s.update();
      if(s.col() == 19 || s.col() == 18)
        s.setData(nothing);
    }
    
  }
  
  if(jump){
    upPressed = false;
    int x = frameCount - startFrame;
    player1.setY(7-(((x*(30-x)))/50));
    if(player1.row() == 7 && x > 1){
      jump = false;
    }
  }
  
  for(int i=0; i<spikes.size(); i++){
    Spike s = spikes.get(i);
      if(s.getDataName().equals("oneSpike")){
        if(player1.row() == 7 && s.col() == 16){
          beginGame = false;
          gameEnd = true;
        }
      }
      if(s.getDataName().equals("twoSpike")){
        if(player1.row() == 7 && (s.col() == 15 || s.col() == 16)){
          beginGame = false;
          gameEnd = true;
        }
      }
      if(s.getDataName().equals("flySpike")){
        if(isDucked == false && (s.col() == 15 || s.col() == 16)){
          beginGame = false;
          gameEnd = true;
        }
        if(isDucked && (s.col() == 15 || s.col() == 16) && (player1.row() == 5 || player1.row() == 4)){
          beginGame = false;
          gameEnd = true;
        }
      }
  }
  
  if(gameEnd){
    fill(#2FDE00);
    player1.setData(nothing);
    textFont(f, 50);
    text("GAME OVER", height/2, width/2);
  }
}

void mousePressed(){
   println(theBoard.getCell(mouseX, mouseY));
   if( !gameEnd && !beginGame ){
     beginGame = true; 
     beginScoring = frameCount;
   }
}

void keyPressed(){
   if (key == CODED) {
    if (keyCode == UP) {
      if(player1.row() == 7){
        startFrame = frameCount;
        jump = true;
      }
    } else if (keyCode == DOWN && !gameEnd) {
         isDucked = true;
         player1.setData(theDudeDucked);
    } 
  }
}

void keyReleased() {
  if(key == CODED){
    if(keyCode == DOWN && !gameEnd){
      isDucked = false;
      player1.setData(theDude);
    }
  }
}
