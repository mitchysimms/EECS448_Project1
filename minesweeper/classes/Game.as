package classes
{
	import classes.Board;
	import classes.BoardPiece;
    public class Game 
    {
        public function Game()
        {
             
        }
		public function isEmpty( row:int, col:int ):Boolean //returns true if there's a bomb, false if it's an empty space
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
		public function Checker( row:int, col:int ):Boolean
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
				
			}
		}
		private var m_array:Array;
		private var rowSize:int;
		private var colSize:int;
		private var counter:int;
		
    }
}