package classes
{
	import flash.display.*;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.*;
    import flash.display.MovieClip;
	import classes.Board;
	import classes.Game;
	import classes.BoardPiece;
    public class Main extends MovieClip
    {
		var numRows:int;
		var numCols:int;
		var numMines:int;
        public function Main()
        {
			stop();
			trace("main is working as document class");
			inputRows.restrict = "0-9";
			inputCols.restrict = "0-9";
			inputMines.restrict = "0-9";
			
			inputsOkButton.addEventListener(MouseEvent.CLICK, takeIn);
        }
		private function takeIn(event:MouseEvent):void
		{
			numRows = Number(inputRows.text);
			numCols = Number(inputCols.text);
			numMines = Number(inputMines.text);
			
			beginGame();
		}
		private function beginGame():void
		{
			inputsOkButton.removeEventListener(MouseEvent.CLICK, takeIn);
			gotoAndStop(2);
			var gameBoard:Board = new Board(numRows, numCols, numMines);
			var theGame:Game = new Game(gameBoard);
			addChild(gameBoard);
		}
    }
}