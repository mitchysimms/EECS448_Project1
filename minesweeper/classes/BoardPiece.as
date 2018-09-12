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
    public class BoardPiece extends MovieClip
    {
		private var hasMine:Boolean
		private var row:int
		private var col:int


		//i dont think you can pass anything to a constructor in actionscript so we will have to call the setMine function
        public function BoardPiece(Row:int, Col:int)
        {
			//sets frame to unclicked when the board piece is created
			this.gotoAndStop(10);

			 this.hasMine = false;
			 this.row = Row;
			 this.col = Col;
        }

		public function getRow():int {
			return row;
		}

		public function getCol():int {
			return col;
		}

		public function setMine():void{
			this.hasMine = true;
		}

		public function isEmpty():Boolean{
               if(this.hasMine){
                    return false;
               }
               else {
                    return true;
               }
          }

		public function checkForMine():Boolean{
			return this.hasMine;
		}



		public function toggleFlagged():void{
			if(this.currentFrame == 10){
				this.gotoAndStop(11);
			}
			if(this.currentFrame == 11){
				this.gotoAndStop(10);
			}
		}
    }
}
