package classes
{
	import classes.BoardPiece;
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
		}
		
		public function fillBoardArray(){
			for (i = 0; i < rowTotal; i++){
				gameBoard[i] = new Array(colsTotal)
				for (j = 0; j < colsTotal; j++){
					gameBoard[i][j] = new BoardPiece();
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
			
			for (i = 0; i < rowTotal; i){
				for (j = 0; j < colsTotal; j){
					boardTraceCounter = Math.random() * colsTotal - 1;
					j += boardTraceCounter;
					gameBoard[i][j].setMine();
					j = 0;
				}
			}
		}
		
		public function getRows(){
			return rowTotal;
		}
		
		public function getCols(){
			return colTotal;
		}
		
		public function getBoardPiece(desiredRow:int, desiredCol:int){
			return gameBoard[desiredRow][desiredCol];
		}
    }
}
