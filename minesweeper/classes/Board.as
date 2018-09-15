package classes
{
	import flash.display.*;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.*;
	import flash.display.MovieClip;
	import classes.BoardPiece;
	import flash.display.MovieClip;
	/**
	 * Stores 2D array of BoardPieces and board dimensions
	 */
    public class Board extends MovieClip
    {
		/**
		 * Number of rows on the board
		 */
		private var rowTotal:int;
		/**
		 * Number of columns on the board
		 */		
		private var colsTotal:int;
		/**
		 * Number of mines on the board
		 */		
		private var minesTotal:int;
		/**
		 * 2D array of BoardPieces
		 */		
		private var gameBoard:Array;
		/**
		 * Stores parameters in class variables, initializes 2D board array and fills it with new BoardPieces
		 * @post 2D array of BoardPieces is created according to dimensions
		 * @param userRowsChoice number of rows chosen
		 * @param userColsChoice number of columns chosen
		 * @param userMinesChocie number of mines chosen
		 */
		public function Board(userRowsChoice:int, userColsChoice:int, userMinesChoice:int){
			rowTotal = userRowsChoice;
			colsTotal = userColsChoice;
			minesTotal = userMinesChoice;
			gameBoard = new Array(rowTotal);
			fillBoardArray();			
		}
		/**
		 * Fills the 2D board array with new BoardPieces
		 * @pre rowTotal, colsTotal, and minesTotal have all been assigned and array is initialized
		 * @post 2D array of BoardPieces is created according to dimensions
		 */
		public function fillBoardArray():void{
			for (var i:int = 0; i < rowTotal; i++){
				gameBoard[i] = new Array(colsTotal)
				for (var j:int = 0; j < colsTotal; j++){
					gameBoard[i][j] = new BoardPiece(i, j);
					addChild(gameBoard[i][j]);
					gameBoard[i][j].width = 35;
					gameBoard[i][j].height = 35;
					gameBoard[i][j].x = i*35;
					gameBoard[i][j].y = j*35;
					
					
				}
			}
		}
		/**
		 * Randomly sets mines on the board in any position but the one clicked first
		 * @pre board is already created, one piece has been clicked already
		 * @post board is full of randomly placed mines
		 * @param row row of first click
		 * @param col column of first click
		 */
		public function setBoardMines(row:int, col:int):void{
			for(var i:int = 0; i < minesTotal; i++){
				var x:int = Math.floor(Math.random() * rowTotal);
				var y:int = Math.floor(Math.random() * colsTotal);

				if (gameBoard[x][y].isEmpty() && !(x == row && y == col)){
					gameBoard[x][y].setMine();
				}
				else {
					i--;
				}
			}
		}

		/**
		 * Returns number of mines on the board
		 * @return number of mines on the board
		 */
		public function getMines():int {
			return minesTotal;
		}
		/**
		 * Returns number of rows on the board
		 * @return number of rows on the board
		 */
		public function getRows():int{
			return rowTotal;
		}
		/**
		 * Returns number of columns on the board
		 * @return number of columns on the board
		 */
		public function getCols():int{
			return colsTotal;
		}
		/**
		 * Returns the BoardPiece at the given row and column
		 * @param desiredRow row of desired BoardPiece
		 * @param desiredCol column of desired BoardPiece
		 * @return BoardPiece at given row and column
		 */
		public function getBoardPiece(desiredRow:int, desiredCol:int):BoardPiece{
			return gameBoard[desiredRow][desiredCol];
		}
    }
}
