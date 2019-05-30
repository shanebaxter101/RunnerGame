public class Spike extends BoardItem {
  Spike(int rowAt,int colAt){
    super(rowAt, colAt);
  }
  
  public void show(int xAt,int yAt,int cellSize){
    super.show(xAt, yAt, cellSize);
  }
  
  public void update(){
    updateCol(1);
  }
  
}
