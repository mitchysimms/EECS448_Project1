NDSummary.OnToolTipsLoaded("File:Board.as",{76:"<div class=\"NDToolTip TClass LActionScript\"><div class=\"NDClassPrototype\" id=\"NDClassPrototype76\"><div class=\"CPEntry TClass Current\"><div class=\"CPModifiers\"><span class=\"SHKeyword\">public</span></div><div class=\"CPName\">Board</div></div></div><div class=\"TTSummary\">Stores 2D array of BoardPieces and board dimensions</div></div>",78:"<div class=\"NDToolTip TVariable LActionScript\"><div id=\"NDPrototype78\" class=\"NDPrototype NoParameterForm\"><span class=\"SHKeyword\">private var</span> rowTotal:<span class=\"SHKeyword\">int</span></div><div class=\"TTSummary\">Number of rows on the board</div></div>",79:"<div class=\"NDToolTip TVariable LActionScript\"><div id=\"NDPrototype79\" class=\"NDPrototype NoParameterForm\"><span class=\"SHKeyword\">private var</span> colsTotal:<span class=\"SHKeyword\">int</span></div><div class=\"TTSummary\">Number of columns on the board</div></div>",80:"<div class=\"NDToolTip TVariable LActionScript\"><div id=\"NDPrototype80\" class=\"NDPrototype NoParameterForm\"><span class=\"SHKeyword\">private var</span> minesTotal:<span class=\"SHKeyword\">int</span></div><div class=\"TTSummary\">Number of mines on the board</div></div>",81:"<div class=\"NDToolTip TVariable LActionScript\"><div id=\"NDPrototype81\" class=\"NDPrototype NoParameterForm\"><span class=\"SHKeyword\">private var</span> gameBoard:Array</div><div class=\"TTSummary\">2D array of BoardPieces</div></div>",83:"<div class=\"NDToolTip TFunction LActionScript\"><div id=\"NDPrototype83\" class=\"NDPrototype WideForm PascalStyle\"><table><tr><td class=\"PBeforeParameters\"><span class=\"SHKeyword\">public function</span> Board(</td><td class=\"PParametersParentCell\"><table class=\"PParameters\"><tr><td class=\"PName first\">userRowsChoice</td><td class=\"PTypeNameSeparator\">:&nbsp;</td><td class=\"PType last\"><span class=\"SHKeyword\">int</span>,</td></tr><tr><td class=\"PName first\">userColsChoice</td><td class=\"PTypeNameSeparator\">:&nbsp;</td><td class=\"PType last\"><span class=\"SHKeyword\">int</span>,</td></tr><tr><td class=\"PName first\">userMinesChoice</td><td class=\"PTypeNameSeparator\">:&nbsp;</td><td class=\"PType last\"><span class=\"SHKeyword\">int</span></td></tr></table></td><td class=\"PAfterParameters\">)</td></tr></table></div><div class=\"TTSummary\">Stores parameters in class variables, initializes 2D board array and fills it with new BoardPieces</div></div>",84:"<div class=\"NDToolTip TFunction LActionScript\"><div id=\"NDPrototype84\" class=\"NDPrototype NoParameterForm\"><span class=\"SHKeyword\">public function</span> fillBoardArray():<span class=\"SHKeyword\">void</span></div><div class=\"TTSummary\">Fills the 2D board array with new BoardPieces</div></div>",85:"<div class=\"NDToolTip TFunction LActionScript\"><div id=\"NDPrototype85\" class=\"NDPrototype WideForm PascalStyle\"><table><tr><td class=\"PBeforeParameters\"><span class=\"SHKeyword\">public function</span> setBoardMines(</td><td class=\"PParametersParentCell\"><table class=\"PParameters\"><tr><td class=\"PName first\">row</td><td class=\"PTypeNameSeparator\">:&nbsp;</td><td class=\"PType last\"><span class=\"SHKeyword\">int</span>,</td></tr><tr><td class=\"PName first\">col</td><td class=\"PTypeNameSeparator\">:&nbsp;</td><td class=\"PType last\"><span class=\"SHKeyword\">int</span></td></tr></table></td><td class=\"PAfterParameters\">):<span class=\"SHKeyword\">void</span></td></tr></table></div><div class=\"TTSummary\">Randomly sets mines on the board in any position but the one clicked first</div></div>",86:"<div class=\"NDToolTip TFunction LActionScript\"><div id=\"NDPrototype86\" class=\"NDPrototype NoParameterForm\"><span class=\"SHKeyword\">public function</span> getMines():<span class=\"SHKeyword\">int</span></div><div class=\"TTSummary\">Returns number of mines on the board</div></div>",87:"<div class=\"NDToolTip TFunction LActionScript\"><div id=\"NDPrototype87\" class=\"NDPrototype NoParameterForm\"><span class=\"SHKeyword\">public function</span> getRows():<span class=\"SHKeyword\">int</span></div><div class=\"TTSummary\">Returns number of rows on the board</div></div>",88:"<div class=\"NDToolTip TFunction LActionScript\"><div id=\"NDPrototype88\" class=\"NDPrototype NoParameterForm\"><span class=\"SHKeyword\">public function</span> getCols():<span class=\"SHKeyword\">int</span></div><div class=\"TTSummary\">Returns number of columns on the board</div></div>",89:"<div class=\"NDToolTip TFunction LActionScript\"><div id=\"NDPrototype89\" class=\"NDPrototype WideForm PascalStyle\"><table><tr><td class=\"PBeforeParameters\"><span class=\"SHKeyword\">public function</span> getBoardPiece(</td><td class=\"PParametersParentCell\"><table class=\"PParameters\"><tr><td class=\"PName first\">desiredRow</td><td class=\"PTypeNameSeparator\">:&nbsp;</td><td class=\"PType last\"><span class=\"SHKeyword\">int</span>,</td></tr><tr><td class=\"PName first\">desiredCol</td><td class=\"PTypeNameSeparator\">:&nbsp;</td><td class=\"PType last\"><span class=\"SHKeyword\">int</span></td></tr></table></td><td class=\"PAfterParameters\">):BoardPiece</td></tr></table></div><div class=\"TTSummary\">Returns the BoardPiece at the given row and column</div></div>"});