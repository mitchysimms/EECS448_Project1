package classes
{
	/*
	FRAMES:
	Frame 1-8: the number 1 - 8 is displayed
	Frame 9: empty clicked box
	Frame 10: unclicked
	Frame 11: flagged
	Frame 12: mine
	Frame 13: red mine if you click on a mine
	*/

	import flash.display.MovieClip;
	/**
	 * Stores its row and column, and whether it has a mine
	 */
    public class BoardPiece extends MovieClip
    {
		/**
		 * Whether the piece has a mine
		 */		
		private var hasMine:Boolean
		/**
		 * Row where this piece is on the board
		 */		
		private var row:int
		/**
		 * Column where this piece is on the board
		 */		
		private var col:int

		//i dont think you can pass anything to a constructor in actionscript so we will have to call the setMine function
		/**
		 * Stores location in class variables and initializes hasMine to false
		 * @post piece now knows where it is on the board and has no mine
		 * @param Row row location of piece
		 * @param Col column location of piece
		 */	
        public function BoardPiece(Row:int, Col:int)
        {
			//sets frame to unclicked when the board piece is created
			this.gotoAndStop(10);

			 this.hasMine = false;
			 this.row = Row;
			 this.col = Col;
        }
		/**
		 * Returns row location of piece
		 * @return row location of piece
		 */
		public function getRow():int {
			return row;
		}
		/**
		 * Returns column location of piece
		 * @return column location of piece
		 */
		public function getCol():int {
			return col;
		}
		/**
		 * Sets mine on the piece
		 * @post hasMine is true
		 */
		public function setMine():void{
			this.hasMine = true;
		}
		/**
		 * Returns whether piece is empty
		 * @return whether piece is empty
		 */
		public function isEmpty():Boolean{
               if(this.hasMine){
                    return false;
               }
               else {
                    return true;
               }
          }
		/**
		 * Returns whether piece has a mine
		 * @return whether piece has a mine
		 */
		public function checkForMine():Boolean{
			return this.hasMine;
		}
		/**
		 * Toggles piece between flagged and unflagged
		 * @post piece is either unflagged or flagged if previously flagged or unflagged
		 */
		public function toggleFlagged():void{
			if(this.currentFrame == 10){
				this.gotoAndStop(11);
			}
			if(this.currentFrame == 11){
				this.gotoAndStop(10);
			}
		}

		/**
		* Returns what frame this current BoardPiece is in. 
		* A frame number is returned to where the function was called. 
		*/
		public function getFrame():int {
			return(this.currentFrame);
		}
    }
}
