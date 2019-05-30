public class BoardItem {

  private int colId, rowId;
  private int maxRow, maxCol;

  private int[][] glyphData;
  
  public String dataName;

  public BoardItem(int rowAt, int colAt){
     this.rowId = rowAt;
     this.colId = colAt;
  }

  public void setData(int[][] data){
     glyphData = data; 
  }
  
  public void setDataName(String name){
    dataName = name;
  }
  
  public String getDataName(){
    return dataName;
  }

  public int row(){ return rowId; }

  public int col(){ return colId; }

  public void show(int xAt, int yAt, int cellSize){
    for(int row = 0; row < glyphData.length; row++){
       for(int col = 0; col < glyphData[row].length; col++){
          int fillColor = glyphData[row][col];
          if(fillColor > -1){
            fill(fillColor);
            strokeWeight(1);
            int x = xAt + col*cellSize;
            int y = yAt + row*cellSize;
            rect(x,y,cellSize,cellSize);
          }
          if(fillColor == -2){
            fill(203, 193, 193);
            strokeWeight(1);
            int x = xAt + col*cellSize;
            int y = yAt + row*cellSize;
            triangle(x+cellSize/2, y, x+cellSize, y+cellSize, x, y+cellSize);
          }
          if(fillColor == -3){
            fill(203, 193, 193);
            strokeWeight(1);
            int x = xAt + col*cellSize;
            int y = yAt + row*cellSize;
            triangle(x, y, x+cellSize, y+cellSize/2, x, y+cellSize);
          }
          if(fillColor == -4){
           fill(0);
           strokeWeight(0);
           int x = xAt + col*cellSize;
           int y = yAt + row*cellSize;
           rect(x,y,cellSize,cellSize);
          }
       }
    }
  }

  public void setBounds(int rows, int cols){
    maxRow = rows;
    maxCol = cols;
  }

  public void updateCol(int by){
    if(colId + by <= maxCol - glyphData[0].length && colId + by >= 0)
       colId += by; 
  }

  public void updateRow(int by){
     if(rowId + by <= maxRow - glyphData.length  && rowId + by >= 0)
       rowId += by;
  }
  
  public Cell[] getVanguard( char direction ){
    ArrayList<Cell> result = new ArrayList<Cell>();
    
    if(direction == 'u'){
      for(int i=0; i < glyphData[0].length; i++){
        if(glyphData[0][i] > -1){
          int colVal = i +  colId;
          int rowVal = rowId - 1;
          Cell c = new Cell(rowVal, colVal);
          result.add(c);
        }
      }
    }
    if(direction == 'd'){
      for(int i=0; i < glyphData[glyphData.length - 1].length; i++){
        if(glyphData[glyphData.length - 1][i] > -1){
          int colVal = i + colId;
          int rowVal = rowId - 1;
          Cell c = new Cell(rowVal, colVal);
          result.add(c);
        }
      }
    }
    if(direction == 'l'){
      for(int i=0; i < glyphData.length; i++){
        if(glyphData[0][i] > -1){
          int colVal = i + colId;
          int rowVal = rowId - 1;
          Cell c = new Cell(rowVal, colVal);
          result.add(c);
        }
      }
    }
    if(direction == 'r'){
      for(int i=0; i < glyphData.length; i++){
        if(glyphData[glyphData.length-1][0] > -1){
          int colVal = i + colId;
          int rowVal = rowId - 1;
          Cell c = new Cell(rowVal, colVal);
          result.add(c);
        }
      }
    }
    
    return result.toArray(new Cell[0]);
  }
  
  public void setY(int num){
    rowId = num;
 }

}
