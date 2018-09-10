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
			if((board.getBoardPiece(row, col)).checkForMine())
			{
				Checker(row, col);
				return true;
			}
			else
			{
				return false; //Bomb explodes
			}
		}
		public function setFlag( row:int,col:int ):void
		{
			board.getBoardPiece(row, col).toggleFlagged();
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
					if((board.getBoardPiece(row-1, col)).checkForMine()==false)//checks up
					{
						counter = counter+1;
					}
					
					if(col+1<colSize){
						if((board.getBoardPiece(row-1, col+1)).checkForMine()==false)//checks right-up
						{
							counter = counter+1;
						}
						if((board.getBoardPiece(row, col+1)).checkForMine()==false)//checks right
						{
							counter = counter+1;
						}
					}
					
					if(col-1>=0){
						if((board.getBoardPiece(row-1, col-1)).checkForMine()==false)//check left-up
						{
							counter = counter+1;
						}
						if((board.getBoardPiece(row, col-1)).checkForMine()==false)//checks left
						{
							counter = counter+1;
						}
					}
				}
				
				if(row+1<rowSize){
					if((board.getBoardPiece(row+1, col)).checkForMine()==false)//checks down
					{
						counter = counter+1;
					}
					if((board.getBoardPiece(row+1, col+1)).checkForMine()==false)//check right-down
					{
						counter = counter+1;
					}
					if((board.getBoardPiece(row+1, col-1)).checkForMine()==false)//checks left-down
					{
						counter = counter+1;
					}
				}
				
				if(counter==0)
				{
					(board.getBoardPiece(row, col)).gotoAndStop(9); //switch frame to empty
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
					(board.getBoardPiece(row, col)).gotoAndStop(counter); //switch frame to counter
					counter=0;
					return true;
				}
				
			}
		}
		//private var m_array:Array;
		private var board:Board;
		private var rowSize:int;
		private var colSize:int;
		private var counter:int;
		
    }
}