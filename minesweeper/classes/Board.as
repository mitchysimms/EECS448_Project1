package classes
{
	import classes.BoardPiece;

    public class Board
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
		}
		
		public function fillBoardArray():void{
			for (var i = 0; i < rowTotal; i++){
				gameBoard[i] = new Array(colsTotal)
				for (var j = 0; j < colsTotal; j++){
					gameBoard[i][j] = new BoardPiece(i, j);
				}
			}
		}
		//Here, try this. I bet it works
		/* 
		public function setBoardMines():void{
			var mineCounter:int = 0;
			
			while (mineCounter != minesTotal) {
				var x:int = Math.random() * rowsTotal - 1;
				var y:int = Math.random() * colsTotal - 1;
				if (!gameBoard[x][y].checkForMine()) {
					gameBoard[x][y].setMine();
					mineCounter++;
				}
			}
		}
		*/
		//this is incomplete, ill need some help on it.
		public function setBoardMines(){
			var mineCounter:int = 0;
			var boardTraceCounter:int = 0;
			
			for (var i = 0; i < rowTotal; i){
				for (var j = 0; j < colsTotal; j){
					boardTraceCounter = Math.random() * colsTotal - 1;
					j += boardTraceCounter;
					gameBoard[i][j].setMine();
					j = 0;
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
