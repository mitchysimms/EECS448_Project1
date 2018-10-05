﻿package classes
{
	import flash.display.*;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.*;
	import classes.Game;
	import flash.events.TimerEvent; 
    import flash.utils.Timer;
	import flash.net.SharedObject;
    import flash.net.SharedObjectFlushStatus;
	/**
	 * Processes each move and checks whether the game is over
	 */
    public class Game extends MovieClip
    {
		public var localScores:SharedObject = SharedObject.getLocal("localScores");
		/**
		 * Represents if the player won.
		 */
		private var didPlayerWin:Boolean = true;
		/**
		 * Type of game
		 */
		private var m_gameType:String;
		/**
		 * Player's name
	 	*/
		private var m_playerName:String;
		/**
		 * Timer for game
		 */
		private var timer:Timer = new Timer(1000, 0);
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
		 * Array to hold current frames of every tile. Used to perserve board state before everything is visible in cheat mode.
		 */
		private var frameArray:Array = [];
		/**
		 * Stores or intitializes class variables, adds event listenser to all pieces
		 * @post all pieces respond to clicking
		 * @param myBoard Board used for the game
		 */
        public function Game( myBoard:Board, gameType:String, playerName:String) //initialize private variables, set clicks, call isEmpty function for left click, setFlag for right click
        {
			m_gameType = gameType;
			m_playerName = playerName;
			board = myBoard;
			rowSize = myBoard.getRows();
			colSize = myBoard.getCols();
			flagCount = 0;
			firstClick = true;
			for (var i:int = 0; i < rowSize; i++) {
				for (var j:int = 0; j < colSize; j++) {
					myBoard.getBoardPiece(i, j).addEventListener(MouseEvent.CLICK, handleClick);
					myBoard.getBoardPiece(i,j).addEventListener(KeyboardEvent.KEY_DOWN, cheatMode);
					myBoard.getBoardPiece(i, j).buttonMode = true;
				}
			}
        }

		/**
		 * Fills frameArray, deactivates ability to click, and reveals board. 
		 * @post all board pieces are returned to the frames prior to cheat mode.
		 * @param KeyboardEvent - used to see what key was pressed.
		 */
		public function cheatMode(evt:KeyboardEvent):void {
			if(String.fromCharCode(evt.charCode) == "c")
			{
				//Cheat mode activated so now fill array with current board state.
				for (var i:int = 0; i < rowSize; i++) {
					frameArray[i] = [];
				for (var j:int = 0; j < colSize; j++) {
					frameArray[i][j] = board.getBoardPiece(i, j).getFrame();
				}
				}

				//disables clicking and reveals all tiles.
				for (var k:int = 0; k < rowSize; k++) {
				for (var l:int = 0; l < colSize; l++) {
					board.getBoardPiece(k, l).removeEventListener(MouseEvent.CLICK, handleClick);
					Checker(k,l);
				}
			}
			revealMines();
			}
			//cheat mode deactivated, allow clicking and return board to original state. 
			if(String.fromCharCode(evt.charCode) == "v")
			{
				for (var a:int = 0; a < rowSize; a++) {
				for (var b:int = 0; b < colSize; b++) {
					board.getBoardPiece(a, b).addEventListener(MouseEvent.CLICK, handleClick);
				}}
			revertCheat();	
			}
		}
		
		public function revertCheat():void {
			for (var i:int = 0; i < rowSize; i++) {
				for (var j:int = 0; j < colSize; j++) {
					(board.getBoardPiece(i, j)).gotoAndStop(frameArray[i][j]);
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
					timer.start(); //Starts timer
					board.setBoardMines(evt.currentTarget.getRow(), evt.currentTarget.getCol());
				}
				isEmpty(evt.currentTarget.getRow(), evt.currentTarget.getCol());
				if (endCheck()) {
					flagAll();
					endGame();
				}
			}
			(board.getBoardPiece(evt.currentTarget.getRow(), evt.currentTarget.getCol())).setClicked(); 
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
			if(didPlayerWin) recordGame();
		}
		/**
		 * Records game data in cookie
		 * @pre Game has ended by winning.
		 * @post Game data has been written to cookie if a highscore has occured.
		 */
		public function recordGame():void{
			timer.stop();
			var newScore:Object = {
				name: m_playerName,
				score: timer.currentCount
			};

			if (localScores.data.easyMode == null) localScores.data.easyMode = new Array();
			if (localScores.data.mediumMode == null) localScores.data.mediumMode = new Array();
			if (localScores.data.hardMode == null) localScores.data.hardMode = new Array();

			if (m_gameType == "easy")
			{
				localScores.data.easyMode.push(newScore);
				localScores.data.easyMode.sortOn("score", Array.NUMERIC);
				if (localScores.data.easyMode.length > 5) localScores.data.easyMode.pop();
			}
			else if (m_gameType == "medium")
			{
				localScores.data.mediumMode.push(newScore);
				localScores.data.mediumMode.sortOn("score", Array.NUMERIC);
				if (localScores.data.mediumMode.length > 5) localScores.data.mediumMode.pop();
			}
			else if (m_gameType == "hard")
			{
				localScores.data.hardMode.push(newScore);
				localScores.data.hardMode.sortOn("score", Array.NUMERIC);
				if (localScores.data.hardMode.length > 5) localScores.data.hardMode.pop();
			}
			localScores.flush();
		}
		/**
		 * Clears unclicked pieces around a given piece
		 * @pre piece has been cleared and its number matches how many flags surround it
		 * @post all unclicked pieces around it get clicked
		 * @param row row of piece
		 * @param col column of piece
		 */
		public function clearSurrounding(row:int, col:int):void {
			if((row - 1 >= 0) && board.getBoardPiece(row-1,  col).currentFrame == 10)//checks top
			{
				isEmpty(row-1,  col);
				(board.getBoardPiece(row-1, col)).setClicked(); 
				if((col + 1 < colSize) && board.getBoardPiece(row-1,  col+1).currentFrame == 10)//checks top-right
				{
					isEmpty(row-1,  col+1);
					(board.getBoardPiece(row-1, col+1)).setClicked(); 
				}
				if((col - 1 >= 0) && board.getBoardPiece(row-1,  col-1).currentFrame == 10)//checks top-left
				{
					isEmpty(row-1,  col-1);
					(board.getBoardPiece(row-1, col-1)).setClicked(); 
				}
			}
			if((col + 1 < colSize) && board.getBoardPiece(row,  col+1).currentFrame == 10)//checks right
			{
				isEmpty(row,  col+1);
				(board.getBoardPiece(row, col+1)).setClicked(); 
			}
			if((col - 1 >= 0) && board.getBoardPiece(row,  col-1).currentFrame == 10)//checks left
			{
				isEmpty(row,  col-1);
				(board.getBoardPiece(row, col-1)).setClicked(); 
			}
			if((row + 1 < rowSize) && board.getBoardPiece(row+1,  col).currentFrame == 10)//checks down
			{
				isEmpty(row+1,  col);
				(board.getBoardPiece(row+1, col)).setClicked(); 
				if((col + 1 < colSize) && board.getBoardPiece(row+1,  col+1).currentFrame == 10)//checks down-right
				{
					isEmpty(row+1,  col+1);
					(board.getBoardPiece(row+1, col+1)).setClicked();
				}
				if((col - 1 >= 0) && board.getBoardPiece(row+1,  col-1).currentFrame == 10)//checks down-left
				{
					isEmpty(row+1,  col-1);
					(board.getBoardPiece(row+1, col-1)).setClicked(); 
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
				didPlayerWin = false;
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
