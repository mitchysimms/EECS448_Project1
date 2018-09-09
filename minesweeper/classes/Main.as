package classes
{
	//import flash.display.*;
	//import flash.events.Event;
	//import flash.text.*;
    import flash.display.MovieClip;
	import classes.Board;
	import classes.Game;
    public class Main extends MovieClip
    {
        public function Main():void
        {
			trace("main is working as document class");
			inputRows.restrict = "0-9";
			inputCols.restrict = "0-9";
			inputMines.restrict = "0-9";
			var numRows:int;
			var numCols:int;
			var numMines:int;
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
			//I'll create instances of classes here.
		}
    }
}