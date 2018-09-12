package classes
{
	import classes.BoardPiece;
	import flash.display.*;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.*;
	import flash.display.MovieClip;
	import classes.BoardPiece;
	import flash.display.MovieClip;

    public class Board extends MovieClip
    {
		private var rowTotal:int;
		private var colsTotal:int;
		private var minesTotal:int;
		private var gameBoard:Array;

		public function Board(userRowsChoice:int, userColsChoice:int, userMinesChoice:int){
			rowTotal = userRowsChoice;
			colsTotal = userColsChoice;
			minesTotal = userMinesChoice;
			gameBoard = [];
			fillBoardArray();
			setBoardMines();
		}

		public function fillBoardArray():void{
			for (var i = 0; i < rowTotal; i++){
				gameBoard[i] = new Array(colsTotal)
				for (var j = 0; j < colsTotal; j++){
					trace("what up");
					gameBoard[i][j] = new BoardPiece(i, j);
					addChild(gameBoard[i][j]);
					gameBoard[i][j].x = i*65 + 65/2;
					gameBoard[i][j].y = j*65 + 65/2;
				}
			}
		}

		public function setBoardMines():void{
			for(var i = 0; i < minesTotal; i++){
				var x:int = Math.floor(Math.random() * rowTotal);
				var y:int = Math.floor(Math.random() * colsTotal);

				if (gameBoard[x][y].isEmpty()){
					gameBoard[x][y].setMine();
				}
				else {
					i--;
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
			return colsTotal;
		}

		public function getBoardPiece(desiredRow:int, desiredCol:int):BoardPiece{
			return gameBoard[desiredRow][desiredCol];
		}
    }
}
