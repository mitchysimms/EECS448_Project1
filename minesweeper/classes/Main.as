package classes
{
	import flash.display.*;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.*;
	import classes.Game;
	/**
	 * Handles the user input, creates a board with the parameters given, then gives it to a new game.
	 */
    public class Main extends MovieClip
    {
		/**
		 * Number of rows to create board
		 */
		var numRows:int;
		/**
		 * Number of cols to create board
		 */	
		var numCols:int;
		/**
		 * Number of mines to create board
		 */		
		var numMines:int;
		/**
		 * Creates input text fields and aligns board
		 * @post OK button is clicked
		 */
        public function Main()
        {
			stage.scaleMode = StageScaleMode.NO_SCALE; 
			stage.align = StageAlign.TOP_LEFT; 
			stop();
			trace("main is working as document class");
			inputRows.restrict = "0-9";
			inputCols.restrict = "0-9";
			inputMines.restrict = "0-9";
			
			inputsOkButton.addEventListener(MouseEvent.CLICK, takeIn);
			inputsEasyButton.addEventListener(MouseEvent.CLICK, easyMode);
        }
		/**
		 * Stores user input in class variables, and calls beginGame()
		 * @pre OK button is clicked
		 * @post beginGame() is called, all variables for creating board are assigned
		 * @param event MouseEvent object passed from the event listener
		 */
		private function takeIn(event:MouseEvent):void
		{
			numCols = Number(inputRows.text);
			numRows = Number(inputCols.text);
			numMines = Number(inputMines.text);
			if(numMines < numRows * numCols && numMines > 0 && numRows < 30 && numCols < 30 && numRows > 1 && numCols > 1){
				beginGame();
			}
			
		}
		/**
		 * Creates board with given parameters and gives it to a new game
		 * @pre numRows, numCols, numMines are all assigned values
		 * @post new Board is created with these parameters, and Game is created with the board. Menu disappears
		 */
		private function beginGame():void
		{
			inputsOkButton.removeEventListener(MouseEvent.CLICK, takeIn);
			gotoAndStop(2);
			var gameBoard:Board = new Board(numRows, numCols, numMines);
			var theGame:Game = new Game(gameBoard);
			addChild(gameBoard);
		}
		
		private function easyMode(event:MouseEvent):void {
			numCols = 9;
			numRows = 9;
			numMines = 10;
			beginGame();
		}
    }
}