package classes
{
	import classes.BoardPiece;
	import flash.display.*;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.*;
		import flash.display.MovieClip;
    public class Board
    {
		private var rowTotal:int;
		private var colsTotal:int;
		private var minesTotal:int;
		private var gameBoard:Array;


        public function Board(){

        }

		public function Board(userRowsChoice:int, userColsChoice:int, userMinesChoice:int){
			rowTotal = userRowsChoice;
			colsTotal = userColsChoice;
			minesTotal = userMinesChoice;
			gameBoard = [];
			fillBoardArray();
			setBoardMines();
		}

		public function fillBoardArray():void{
			for (i = 0; i < rowTotal; i++){
				gameBoard[i] = new Array(colsTotal)
				for (j = 0; j < colsTotal; j++){
					gameBoard[i][j] = new BoardPiece(i, j);
					addChild(gameBoard[i][j]);
					gameBoard[i][j].x = j*65 + 65/2;
					gameBoard[i][j].y = j*65 + 65/2;
				}
			}
		}

		public function setBoardMines():void{
			for(i = 0; i < minesTotal; i++){
				var x:int = Math.floor(Math.Random() * rowsTotal);
				var y:int = Math.floot(Math.Random() * colsTotal);

				if (gameBoard[x][y].isEmpty()){
					gameBoard[x][y].setMine();
				}
				else {
					i = i-1;
				}
			}
		}

		public function getMines():int {
			return minesTotal;
		}

		public function getRows():int{
			return rowTotal;
		}

		public function getCols():int{
			return colTotal;
		}

		public function getBoardPiece(desiredRow:int, desiredCol:int):BoardPiece{
			return gameBoard[desiredRow][desiredCol];
		}
    }
}
