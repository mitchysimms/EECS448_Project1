
﻿package classes

{
	import flash.events.MouseEvent;
	import flash.events.Event;
	import classes.Board;
	import classes.BoardPiece;
	import flash.display.MovieClip;

    public class Game extends MovieClip
    {
        public function Game( myBoard:Board ) //initialize private variables, set clicks, call isEmpty function for left click, setFlag for right click
        {
			board = myBoard;
			rowSize = myBoard.getRows();
			colSize = myBoard.getCols();
			counter = 0;
			flagCount = 0;
			for (var i:int = 0; i < rowSize; i++) {
				for (var j:int = 0; j < colSize; j++) {
					myBoard.getBoardPiece(i, j).addEventListener(MouseEvent.CLICK, handleClick);
					myBoard.getBoardPiece(i, j).addEventListener(MouseEvent.RIGHT_CLICK, handleRightClick);
					myBoard.getBoardPiece(i, j).buttonMode = true;
				}
			}
        }

		public function handleClick(evt:MouseEvent):void {
			if (evt.currentTarget.currentFrame == 10) {
				isEmpty(evt.currentTarget.getRow(), evt.currentTarget.getCol());
			}
		}

		public function handleRightClick(evt:MouseEvent):void {

			if (evt.currentTarget.currentFrame == 11){
				flagCount--;
			}
			if (flagCount < board.getMines()) {
				if (evt.currentTarget.currentFrame == 10) {
					flagCount++;
				}
				changeFlag(evt.currentTarget.getRow(), evt.currentTarget.getCol());
			}
		}

		public function isEmpty( row:int, col:int ):Boolean //returns false if there's a bomb, true if it's an empty space
		{
			if((board.getBoardPiece(row, col)).checkForMine()==false)
			{
				Checker(row, col);
				return true;
			}
			else
			{
				return false; //Bomb explodes
			}
		}
		public function changeFlag( row:int,col:int ):void
		{
			trace("");
			(board.getBoardPiece(row, col)).toggleFlagged();
		}
		public function Checker( row:int, col:int ):Boolean //recursive function that checks around the selected spot
		{
			if(row>=rowSize || col>=colSize || row<0 || col<0)
			{
				return true;
			}
			else
			{
				if(row-1>=0){
					if((board.getBoardPiece(row-1, col)).checkForMine())//checks up
					{
						counter = counter+1;
					}

					if(col+1<colSize){
						if((board.getBoardPiece(row-1, col+1)).checkForMine())//checks right-up
						{
							counter = counter+1;
						}
						if((board.getBoardPiece(row, col+1)).checkForMine())//checks right
						{
							counter = counter+1;
						}
					}

					if(col-1>=0){
						if((board.getBoardPiece(row-1, col-1)).checkForMine())//check left-up
						{
							counter = counter+1;
						}
						if((board.getBoardPiece(row, col-1)).checkForMine())//checks left
						{
							counter = counter+1;
						}
					}
				}

				if(row+1<rowSize){
					if((board.getBoardPiece(row+1, col)).checkForMine())//checks down
					{
						counter = counter+1;
					}
					if (col+1<colSize)
					{
						if((board.getBoardPiece(row+1, col+1)).checkForMine())//check right-down
						{
							counter = counter+1;
						}
					}
					if (col-1>=0)
					{
						if((board.getBoardPiece(row+1, col-1)).checkForMine())//checks left-down
						{
							counter = counter+1;
						}
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
			return false;
		}
		//private var m_array:Array;
		private var board:Board;
		private var rowSize:int;
		private var colSize:int;
		private var counter:int;
		private var flagCount:int;

    }
}