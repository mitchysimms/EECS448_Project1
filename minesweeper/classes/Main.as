package classes
{
	import flash.display.*;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.*;
	import classes.Game;
	import flash.net.SharedObject;
    import flash.net.SharedObjectFlushStatus;
	/**
	 * Handles the user input, creates a board with the parameters given, then gives it to a new game.
	 */
    public class Main extends MovieClip
    {
		/**
		 * Represents the game object
		 */
		var game:Game = new Game(new Board(0, 0, 0), gameType, playerName);
		/**
		 * Name of player
		 */
		var playerName:String = "";
		/**
		 * Type of game (initialized to custom)
		 */
		var gameType:String = "";
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

			inputsLeaderboardButton.addEventListener(MouseEvent.CLICK, openLeaderboard);
			inputsCustomButton.addEventListener(MouseEvent.CLICK, customMode);
			inputsEasyButton.addEventListener(MouseEvent.CLICK, easyMode);
			inputsMediumButton.addEventListener(MouseEvent.CLICK, mediumMode);
			inputsHardButton.addEventListener(MouseEvent.CLICK, hardMode);
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
			gotoAndStop(3);
			var gameBoard:Board = new Board(numRows, numCols, numMines);
			game = new Game(gameBoard, gameType, playerName);
			addChild(gameBoard);
		}
		/**
		 * Set current frame to main menu and updates event listeners
		 * @pre None
		 * @post Main menu is displayed and live
		 */
		private function returnToMenu(even:MouseEvent):void {
			gotoAndStop(1);
			inputsLeaderboardButton.addEventListener(MouseEvent.CLICK, openLeaderboard);
			inputsCustomButton.addEventListener(MouseEvent.CLICK, customMode);
			inputsEasyButton.addEventListener(MouseEvent.CLICK, easyMode);
			inputsMediumButton.addEventListener(MouseEvent.CLICK, mediumMode);
			inputsHardButton.addEventListener(MouseEvent.CLICK, hardMode);
		}
		/**
		 * Opens leaderboard menu and populates leaderboard data
		 * @pre None
		 * @post Leaderboard is displayed
		 */
		private function openLeaderboard(even:MouseEvent):void {
			gotoAndStop(4);
			inputsMainMenuButton.addEventListener(MouseEvent.CLICK, returnToMenu);
			var scores = game.localScores.data;
			//game.localScores.clear(); Testing purposes.
			if (scores.easyMode != null)
			{
				for (var i = 0; i < scores.easyMode.length; i++)
				{
					easyModeScores.text += i+1 + ".  " + scores.easyMode[i].name + "  ->  " + scores.easyMode[i].score + "\n";
				}
			}
			if (scores.mediumMode != null)
			{
				for (var i = 0; i < scores.mediumMode.length; i++)
				{
					mediumModeScores.text += i+1 + ".  " + scores.mediumMode[i].name + "  ->  " + scores.mediumMode[i].score + "\n";
				}
			}
			if (scores.hardMode != null)
			{
				for (var i = 0; i < scores.hardMode.length; i++)
				{
					hardModeScores.text += i+1 + ".  " + scores.hardMode[i].name + "  ->  " + scores.hardMode[i].score + "\n";
				}
			}
		}
		/**
		 * Goes to custom mode menu
		 * @pre User has entered a name
		 * @post Custom mode menu is live
		 */
		private function customMode(event:MouseEvent):void {
			if (inputPlayerName.length != 0)
			{
				playerName = inputPlayerName.text;
				gotoAndStop(2);
				inputRows.restrict = "0-9";
				inputCols.restrict = "0-9";
				inputMines.restrict = "0-9";
				inputsMainMenuButton.addEventListener(MouseEvent.CLICK, returnToMenu);
				inputsOkButton.addEventListener(MouseEvent.CLICK, takeIn);
			}
		}
		/**
		 * Starts game on Easy mode
		 * @pre User has entered a name
		 * @post Game has started with Easy mode
		 */
		private function easyMode(event:MouseEvent):void {
			if (inputPlayerName.length != 0)
			{
				playerName = inputPlayerName.text;
				numCols = 9;
				numRows = 9;
				numMines = 10;
				gameType = "easy";
				beginGame();
			}
		}
		/**
		 * Starts game on Medium mode
		 * @pre User has entered a name
		 * @post Game has started with Medium mode
		 */
		private function mediumMode(event:MouseEvent):void {
			if (inputPlayerName.length != 0)
			{
				playerName = inputPlayerName.text;
				numCols = 16;
				numRows = 16;
				numMines = 40;
				gameType = "medium";
				beginGame();
			}
		}
		/**
		 * Starts game on Hard mode
		 * @pre User has entered a name
		 * @post Game has started with Hard mode
		 */
		private function hardMode(event:MouseEvent):void {
			if (inputPlayerName.length != 0)
			{
				playerName = inputPlayerName.text;
				numCols = 16;
				numRows = 30;
				numMines = 99;
				gameType = "hard";
				beginGame();
			}
		}
    }
}