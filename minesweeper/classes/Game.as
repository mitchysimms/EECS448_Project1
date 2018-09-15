﻿package classes
{
	import flash.events.MouseEvent;
	import flash.events.Event;
	import classes.Board;
	import flash.display.MovieClip;
	/**
	 * Processes each move and checks whether the game is over
	 */
    public class Game extends MovieClip
    {
		/**
		 * Board object for the game
		 */
		private var board:Board;
		/**
		 * Number of rows on the board
		 */
		private var rowSize:int;
		/**
		 * Number of columns on the board
		 */
		private var colSize:int;
		/**
		 * Number of flags currently on the board
		 */
		private var flagCount:int;
		/**
		 * Whether the next click is the first one
		 */
		private var firstClick:Boolean;
		/**
		 * Stores or intitializes class variables, adds event listenser to all pieces
		 * @post all pieces respond to clicking
		 * @param myBoard Board used for the game
		 */
        public function Game( myBoard:Board ) //initialize private variables, set clicks, call isEmpty function for left click, setFlag for right click
        {
			board = myBoard;
			rowSize = myBoard.getRows();
			colSize = myBoard.getCols();
			flagCount = 0;
			firstClick = true;
			for (var i:int = 0; i < rowSize; i++) {
				for (var j:int = 0; j < colSize; j++) {
					myBoard.getBoardPiece(i, j).addEventListener(MouseEvent.CLICK, handleClick);
					myBoard.getBoardPiece(i, j).buttonMode = true;
				}
			}
        }
		/**
		 * If unclear piece is clicked, piece is cleared or mine is set off. If unclicked piece is shift-clicked, flag is toggled and
		 * flagCounter is updated. If numbered piece is clicked and that number of flags surround it, clicks all unclicked pieces around that piece.
		 * @pre a piece is clicked
		 * @param evt MouseEvent object passed from the event listener
		 */
		public function handleClick(evt:MouseEvent):void {
			if(evt.shiftKey == true){

				if (evt.currentTarget.currentFrame == 11){
					evt.currentTarget.gotoAndStop(10);
					flagCount--;
					return;
				}
				if (flagCount < board.getMines()) {
					if (evt.currentTarget.currentFrame == 10) {
						flagCount++;
						evt.currentTarget.gotoAndStop(11);
					}
				}
			}
			else if (evt.currentTarget.currentFrame >= 1 && evt.currentTarget.currentFrame <= 8) {
				if (countFlags(evt.currentTarget.currentFrame,evt.currentTarget.getRow(), evt.currentTarget.getCol()) == evt.currentTarget.currentFrame) {
					clearSurrounding(evt.currentTarget.getRow(), evt.currentTarget.getCol());
					if (endCheck()) {
						flagAll();
						endGame();
					}					
				}
			}
			else if (evt.currentTarget.currentFrame == 10) {
				if (firstClick) {
					firstClick = false;
					board.setBoardMines(evt.currentTarget.getRow(), evt.currentTarget.getCol());
				}
				isEmpty(evt.currentTarget.getRow(), evt.currentTarget.getCol());
				if (endCheck()) {
					flagAll();
					endGame();
				}
			}
		}
		/**
		 * Flags all non-flagged mines
		 * @pre All non-mine spaces have been cleared
		 * @post all mines are flagged
		 */
		public function flagAll():void {
			for (var i:int = 0; i < rowSize; i++) {
				for (var j:int = 0; j < colSize; j++) {
					if (board.getBoardPiece(i,j).checkForMine()) {
						board.getBoardPiece(i,j).gotoAndStop(11);
					}
				}
			}				
		}
		/**
		 * Removes event listeners from all pieces
		 * @pre mine has been clicked or only mines are left unclicked
		 * @post board no longer responds to clicks
		 */
		public function endGame():void {
			for (var i:int = 0; i < rowSize; i++) {
				for (var j:int = 0; j < colSize; j++) {
					board.getBoardPiece(i, j).removeEventListener(MouseEvent.CLICK, handleClick);
				}
			}			
		}
		/**
		 * Clears unclicked pieces around a given piece
		 * @pre piece has been cleared and its number matches how many flags surround it
		 * @post all unclicked pieces around it get clicked
		 * @param row row of piece
		 * @param col column of piece
		 */
		public function clearSurrounding(row:int, col:int):void {
			if (row-1>=0)
			{
				if(board.getBoardPiece(row-1,  col).currentFrame == 10)//checks left-down
				{
					isEmpty(row-1,  col);
				}

				if(col+1<colSize)
				{
					if(board.getBoardPiece(row-1,  col+1).currentFrame == 10)//checks left-down
					{
					isEmpty(row-1,  col+1);
					}
				}
				if(col-1>=0)
				{
					if(board.getBoardPiece(row-1,  col-1).currentFrame == 10)//checks left-down
					{
					isEmpty(row-1,  col-1);
					}

				}
			}

			if(col+1<colSize)
			{
				if(board.getBoardPiece(row,  col+1).currentFrame == 10)//checks left-down
				{
					isEmpty(row,  col+1);
				}
			}
			if(col-1>=0)
			{
				if(board.getBoardPiece(row,  col-1).currentFrame == 10)//checks left-down
				{
					isEmpty(row,  col-1);
				}
			}
			if (row+1<rowSize)
			{
				if(board.getBoardPiece(row+1,  col).currentFrame == 10)//checks left-down
				{
					isEmpty(row+1,  col);
				}
				if(col+1<colSize)
				{
					if(board.getBoardPiece(row+1,  col+1).currentFrame == 10)//checks left-down
					{
						isEmpty(row+1,  col+1);
					}
				}
				if(col-1>=0)
				{
					if(board.getBoardPiece(row+1,  col-1).currentFrame == 10)//checks left-down
					{
					isEmpty(row+1,  col-1);
					}
				}
			}
		}
		/**
		 * Counts flags around a given numbered piece and returns the number
		 * @param x number of the piece
		 * @param row row of the piece
		 * @param col column of the piece
		 * @return number of flags surrounding the piece
		 */
		public function countFlags(x:int,row:int,col:int):int {
			var count:int = 0;
			if (row-1>=0)
			{
				if((board.getBoardPiece(row-1, col)).currentFrame == 11)//checks left-down
				{
					count++;
				}

				if(col+1<colSize)
				{
					if((board.getBoardPiece(row-1, col+1)).currentFrame == 11)//checks left-down
					{
					count++;
					}
				}
				if(col-1>=0)
				{
					if((board.getBoardPiece(row-1, col-1)).currentFrame == 11)//checks left-down
					{
					count++;
					}

				}
			}

			if(col+1<colSize)
			{
				if((board.getBoardPiece(row, col+1)).currentFrame == 11)//checks left-down
				{
					count++;
				}
			}
			if(col-1>=0)
			{
				if((board.getBoardPiece(row, col-1)).currentFrame == 11)//checks left-down
				{
					count++;
				}
			}
			if (row+1<rowSize)
			{
				if((board.getBoardPiece(row+1, col)).currentFrame == 11)//checks left-down
				{
					count++;
				}
				if(col+1<colSize)
				{
					if((board.getBoardPiece(row+1, col+1)).currentFrame == 11)//checks left-down
					{
						count++;
					}
				}
				if(col-1>=0)
				{
					if((board.getBoardPiece(row+1, col-1)).currentFrame == 11)//checks left-down
					{
					count++;
					}
				}
			}
			return count;
		}
		/**
		 * Checks whether there are no more non-mine pieces that can be clicked
		 * @pre a piece has just been clicked
		 * @return whether board has been cleared
		 */
		public function endCheck():Boolean{
			var count:int = 0;
			for (var i:int = 0; i < rowSize; i++) {
				for (var j:int = 0; j < colSize; j++) {
					if (!board.getBoardPiece(i, j).checkForMine() && board.getBoardPiece(i, j).currentFrame != 10) {
						count++;
					}
				}
			}
			if (count == rowSize*colSize - board.getMines()) {
				return true;
			}
			return false;
		}

		/**
		 * Detonates mine and ends game or clicks piece
		 * @post mines are set off and game ends, or pieces are cleared until numbered pieces or edge of board is found
		 * @param row row of given piece
		 * @param col column of given piece
		 */
		public function isEmpty( row:int, col:int ):void //returns false if there's a bomb, true if it's an empty space
		{
			if((board.getBoardPiece(row, col)).checkForMine()==false)
			{
				Checker(row, col);
			}
			else
			{
				revealMines();
				board.getBoardPiece(row,col).gotoAndStop(13);
				endGame();
			}
		}
		/**
		 * Reveals all mines on the board
		 * @pre a mine has been clicked
		 * @post mines are all revealed
		 */
		public function revealMines():void {
			for (var i:int = 0; i < rowSize; i++) {
				for (var j:int = 0; j < colSize; j++) {
					if (board.getBoardPiece(i, j).checkForMine()) {
						board.getBoardPiece(i, j).gotoAndStop(12);
					}
				}
			}
		}
		/**
		 * Recursively clears pieces until numbered piece or edge of board is found
		 * @pre original clicked piece is not a mine
		 * @param row row of piece to be checked
		 * @param col column of piece to be checked
		 */
		public function Checker( row:int, col:int ):void //recursive function that checks around the selected spot
		{
			var counter:int = 0;
			if(row>=rowSize || col>=colSize || row<0 || col<0)
			{
				return;
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

					}

					if(col-1>=0){
						if((board.getBoardPiece(row-1, col-1)).checkForMine())//check left-up
						{
							counter = counter+1;
						}

					}
				}
				if(col+1<colSize){
					if((board.getBoardPiece(row, col+1)).checkForMine())//checks right
					{
						counter = counter+1;
					}
				}
				if(col-1>=0){
						if((board.getBoardPiece(row, col-1)).checkForMine())//checks left
						{
							counter = counter+1;
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
					if (row-1>=0)
					{
						if((board.getBoardPiece(row-1, col)).currentFrame == 10)//checks left-down
						{
							Checker(row-1, col);
						}

						if(col+1<colSize)
						{
							if((board.getBoardPiece(row-1, col+1)).currentFrame == 10)//checks left-down
							{
							Checker(row-1, col+1);
							}
						}
						if(col-1>=0)
						{
							if((board.getBoardPiece(row-1, col-1)).currentFrame == 10)//checks left-down
							{
							Checker(row-1, col-1);
							}

						}
					}

					if(col+1<colSize)
					{
						if((board.getBoardPiece(row, col+1)).currentFrame == 10)//checks left-down
						{
							Checker(row, col+1);
						}
					}
					if(col-1>=0)
					{
						if((board.getBoardPiece(row, col-1)).currentFrame == 10)//checks left-down
						{
							Checker(row, col-1);
						}
					}
					if (row+1<rowSize)
					{
						if((board.getBoardPiece(row+1, col)).currentFrame == 10)//checks left-down
						{
							Checker(row+1, col);
						}
						if(col+1<colSize)
						{
							if((board.getBoardPiece(row+1, col+1)).currentFrame == 10)//checks left-down
							{
								Checker(row+1, col+1);
							}
						}
						if(col-1>=0)
						{
							if((board.getBoardPiece(row+1, col-1)).currentFrame == 10)//checks left-down
							{
							Checker(row+1, col-1);
							}
						}
					}
					return;
				}
				if(counter!=0)
				{
					(board.getBoardPiece(row, col)).gotoAndStop(counter); //switch frame to counter
				}

			}
		}
    }
}
