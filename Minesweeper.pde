import de.bezier.guido.*;
//Declare and initialize NUM_ROWS and NUM_COLS = 20
public final static int NUM_ROWS =20;
public final static int NUM_COLUMNS=20;
public final static int BOMBS= 50;
private MSButton[][] buttons; //2d array of minesweeper buttons
private ArrayList <MSButton> bombs; //ArrayList of just the minesweeper buttons that are mined
public int cherck;
void setup ()
{
    size(800, 800);
    textAlign(CENTER,CENTER);
    bombs=new ArrayList();
    // make the manager
    Interactive.make( this );
    
    buttons=new MSButton[NUM_ROWS][NUM_COLUMNS];//your code to declare and initialize buttons goes here
    for (int row=0; row<NUM_ROWS;row++){
      for (int col=0; col<NUM_COLUMNS; col++){
       buttons[row][col]=new MSButton(row,col);
      }
    }
 
    setBombs();
}
public void setBombs()
{
  for (int mine=0; mine<BOMBS; ){
    int qq=(int) (Math.random()*NUM_ROWS);
    int bb=(int) (Math.random()*NUM_COLUMNS);
    if (!bombs.contains(buttons[qq][bb])){
        bombs.add(buttons[qq][bb]); 
        mine++;
    }
  }
    //your code
}

public void draw ()
{
    background( 0 );
    if(isWon())
        displayWinningMessage();
}
public boolean isWon()
{
    //your code here
    return false;
}
public void displayLosingMessage()
{
  text("You lose. Loser!",200,200,13);
    //your code here
}
public void displayWinningMessage()
{
    //your code here
}

public class MSButton
{
    private int r, c;
    private float x,y, width, height;
    private boolean clicked, marked;
    private String label;
    
    public MSButton ( int rr, int cc )
    {
         width = 800/NUM_COLUMNS;
         height = 800/NUM_ROWS;
        r = rr;
        c = cc; 
        x = c*width;
        y = r*height;
        label = "";
        marked = clicked = false;
        Interactive.add( this ); // register it with the manager
    }
    public boolean isMarked()
    {
        return marked;
    }
    public boolean isClicked()
    {
        return clicked;
    }
    // called by manager
    
    public void mousePressed () 
    {
        clicked=true;
              if(clicked == true)
        {
          marked = false;
          if(isValid(r,c-1) && !bombs.contains(buttons[r][c-1]))
            buttons[r][c-1].mousePressed();
          if(isValid(r-1,c)&& !bombs.contains(buttons[r-1][c]))
            buttons[r-1][c].mousePressed();
          if(isValid(r+1,c)&& !bombs.contains(buttons[r+1][c]))
            buttons[r+1][c].mousePressed();
          if(isValid(r,c+1) && !bombs.contains(buttons[r][c+1]))
            buttons[r][c+1].mousePressed();
          }
 
        if(mouseButton==RIGHT){
          marked=!marked;
          System.out.println(marked);
            if(marked==false)
            clicked=false;
        }
        else if(bombs.contains(buttons[r][c]))
        displayLosingMessage();
        else if(countBombs(r,c)>0)
        text(""+countBombs(r,c), buttons[r][c].x,buttons[r][c].y);
        else {
        mousePressed();
               
        }
        
  
        
//}   
      
        //your code here
    }

    public void draw () 
    {    
        if (marked)
            fill(0);
         else if( clicked && bombs.contains(this) ) 
             fill(255,0,0);
        else if(clicked)
            fill( 200 );
        else 
            fill( 100 );

        rect(x, y, width, height);
        fill(0);
        text(label,x+width/2,y+height/2);
    }
    public void setLabel(String newLabel)
    {
        label = newLabel;
    }
    public boolean isValid(int r, int c)
    {
      if (r<NUM_ROWS && r>=0 && c <NUM_COLUMNS && c>=0)
      return true;
        //your code here
        return false;
    }
    public int countBombs(int row, int col)
    {
        int numBombs = 0;
        if(buttons[row-1][col+1].isValid(row,col)==true&& bombs.contains(buttons[row-1][col+1]))
        numBombs++;
        if(buttons[row-1][col].isValid(row,col)==true&& bombs.contains(buttons[row-1][col]))
        numBombs++;
        if(buttons[row-1][col-1].isValid(row,col)==true&& bombs.contains(buttons[row-1][col-1]))
        numBombs++;
        if(buttons[row][col+1].isValid(row,col)==true&& bombs.contains(buttons[row][col+1]))
        numBombs++;
        if(buttons[row][col-1].isValid(row,col)==true&& bombs.contains(buttons[row][col-1]))
        numBombs++;
        if(buttons[row+1][col+1].isValid(row,col)==true&& bombs.contains(buttons[row+1][col+1]))
        numBombs++;
        if(buttons[row+1][col].isValid(row,col)==true&& bombs.contains(buttons[row+1][col]))
        numBombs++;
        if(buttons[row+1][col-1].isValid(row,col)==true&& bombs.contains(buttons[row+1][col-1]))
        numBombs++;
        
        //your code here
        System.out.println(numBombs);
        //cherck=numBombs;
        return numBombs;
        
    }
}