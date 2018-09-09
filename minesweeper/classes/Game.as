package classes
{
	import classes.Board;
	import classes.BoardPiece;
    public class Game 
    {
        public function Game() //initialize private variables, set clicks, call isEmpty function for left click, setFlag for right click
        {
             
        }
		public function isEmpty( row:int, col:int ):Boolean //returns false if there's a bomb, true if it's an empty space
		{
			if(m_array[row][col].isEmpty())
			{
				Checker(row, col);
				return true;
			}
			else
			{
				return false; //Bomb explodes
			}
		}
		public function setFlag( row:int,col:int ):Boolean
		{
			m_array[row][col].toggleFlagged();
		}
		public function Checker( row:int, col:int ):Boolean //recursive function that checks around the selected spot 
		{
			if(row==rowSize || col==colSize)
			{
				return true;
			}
			else
			{
				if(row-1>=0){
					if(m_array[row-1][col].isEmpty()==false)//checks up
					{
						counter = counter+1;
					}
					
					if(col+1<colSize){
						if(m_array[row-1][col+1].isEmpty()==false)//checks right-up
						{
							counter = counter+1;
						}
						if(m_array[row][col+1].isEmpty()==false)//checks right
						{
							counter = counter+1;
						}
					}
					
					if(col-1>=0){
						if(m_array[row-1][col-1].isEmpty()==false)//check left-up
						{
							counter = counter+1;
						}
						if(m_array[row][col-1].isEmpty()==false)//checks left
						{
							counter = counter+1;
						}
					}
				}
				
				if(row+1<rowSize){
					if(m_array[row+1][col].isEmpty()==false)//checks down
					{
						counter = counter+1;
					}
					if(m_array[row+1][col+1].isEmpty()==false)//check right-down
					{
						counter = counter+1;
					}
					if(m_array[row+1][col-1].isEmpty()==false)//checks left-down
					{
						counter = counter+1;
					}
				}
				
				if(counter==0)
				{
					m_arr[row][col].gotoAndStop(9); //switch frame to empty
					Checker(row, col+1);
					Checker(row, col-1);
					Checker(row+1, col);
					Checker(row+1, col+1);
					Checker(row+1, col-1);
					Checker(row-1, col);
					Checker(row-1, col+1);
					Checker(row-1, col-1);
					return true;
				}
				if(counter!=0)
				{
					m_arr[row][col].gotoAndStop(counter); //switch frame to counter
					counter=0;
					return true;
				}
				
			}
		}
		private var m_array:Array;
		private var rowSize:int;
		private var colSize:int;
		private var counter:int;
		
    }
}