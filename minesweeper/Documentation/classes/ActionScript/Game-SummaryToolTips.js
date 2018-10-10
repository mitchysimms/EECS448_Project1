NDSummary.OnToolTipsLoaded("ActionScriptClass:Game",{19:"<div class=\"NDToolTip TClass LActionScript\"><div class=\"NDClassPrototype\" id=\"NDClassPrototype19\"><div class=\"CPEntry TClass Current\"><div class=\"CPModifiers\"><span class=\"SHKeyword\">public</span></div><div class=\"CPName\">Game</div></div></div><div class=\"TTSummary\">Processes each move and checks whether the game is over</div></div>",21:"<div class=\"NDToolTip TVariable LActionScript\"><div id=\"NDPrototype21\" class=\"NDPrototype NoParameterForm\"><span class=\"SHKeyword\">public var</span> localScores:SharedObject</div><div class=\"TTSummary\">Stores local leaderboard data</div></div>",22:"<div class=\"NDToolTip TVariable LActionScript\"><div id=\"NDPrototype22\" class=\"NDPrototype NoParameterForm\"><span class=\"SHKeyword\">private var</span> didPlayerWin:Boolean</div><div class=\"TTSummary\">Represents if the player won.</div></div>",23:"<div class=\"NDToolTip TVariable LActionScript\"><div id=\"NDPrototype23\" class=\"NDPrototype NoParameterForm\"><span class=\"SHKeyword\">private var</span> m_gameType:String</div><div class=\"TTSummary\">Type of game</div></div>",24:"<div class=\"NDToolTip TVariable LActionScript\"><div id=\"NDPrototype24\" class=\"NDPrototype NoParameterForm\"><span class=\"SHKeyword\">private var</span> m_playerName:String</div><div class=\"TTSummary\">Player\'s name</div></div>",25:"<div class=\"NDToolTip TVariable LActionScript\"><div id=\"NDPrototype25\" class=\"NDPrototype NoParameterForm\"><span class=\"SHKeyword\">private var</span> timer:Timer</div><div class=\"TTSummary\">Timer for game</div></div>",26:"<div class=\"NDToolTip TVariable LActionScript\"><div id=\"NDPrototype26\" class=\"NDPrototype NoParameterForm\"><span class=\"SHKeyword\">private var</span> board:Board</div><div class=\"TTSummary\">Board object for the game</div></div>",27:"<div class=\"NDToolTip TVariable LActionScript\"><div id=\"NDPrototype27\" class=\"NDPrototype NoParameterForm\"><span class=\"SHKeyword\">private var</span> rowSize:<span class=\"SHKeyword\">int</span></div><div class=\"TTSummary\">Number of rows on the board</div></div>",28:"<div class=\"NDToolTip TVariable LActionScript\"><div id=\"NDPrototype28\" class=\"NDPrototype NoParameterForm\"><span class=\"SHKeyword\">private var</span> colSize:<span class=\"SHKeyword\">int</span></div><div class=\"TTSummary\">Number of columns on the board</div></div>",29:"<div class=\"NDToolTip TVariable LActionScript\"><div id=\"NDPrototype29\" class=\"NDPrototype NoParameterForm\"><span class=\"SHKeyword\">private var</span> flagCount:<span class=\"SHKeyword\">int</span></div><div class=\"TTSummary\">Number of flags currently on the board</div></div>",30:"<div class=\"NDToolTip TVariable LActionScript\"><div id=\"NDPrototype30\" class=\"NDPrototype NoParameterForm\"><span class=\"SHKeyword\">private var</span> firstClick:Boolean</div><div class=\"TTSummary\">Whether the next click is the first one</div></div>",31:"<div class=\"NDToolTip TVariable LActionScript\"><div id=\"NDPrototype31\" class=\"NDPrototype NoParameterForm\"><span class=\"SHKeyword\">private var</span> frameArray:Array</div><div class=\"TTSummary\">Array to hold current frames of every tile. Used to perserve board state before everything is visible in cheat mode.</div></div>",32:"<div class=\"NDToolTip TVariable LActionScript\"><div id=\"NDPrototype32\" class=\"NDPrototype NoParameterForm\"><span class=\"SHKeyword\">private var</span> isClicked:Boolean</div><div class=\"TTSummary\">used to see if \'c\' has been clicked. There was a bug when activating cheat mode while already in cheat mode.</div></div>",33:"<div class=\"NDToolTip TVariable LActionScript\"><div id=\"NDPrototype33\" class=\"NDPrototype NoParameterForm\"><span class=\"SHKeyword\">private var</span> inCheatMode:Boolean</div><div class=\"TTSummary\">Used to make sure you\'re in cheat mode when trying to deactivate cheat mode. Trying to deactivate cheat mode when not in cheat mode also had a bug.</div></div>",35:"<div class=\"NDToolTip TFunction LActionScript\"><div id=\"NDPrototype35\" class=\"NDPrototype WideForm PascalStyle\"><table><tr><td class=\"PBeforeParameters\"><span class=\"SHKeyword\">public function</span> Game(</td><td class=\"PParametersParentCell\"><table class=\"PParameters\"><tr><td class=\"PName first\">myBoard</td><td class=\"PTypeNameSeparator\">:&nbsp;</td><td class=\"PType last\">Board,</td></tr><tr><td class=\"PName first\">gameType</td><td class=\"PTypeNameSeparator\">:&nbsp;</td><td class=\"PType last\">String,</td></tr><tr><td class=\"PName first\">playerName</td><td class=\"PTypeNameSeparator\">:&nbsp;</td><td class=\"PType last\">String</td></tr></table></td><td class=\"PAfterParameters\">)</td></tr></table></div><div class=\"TTSummary\">Stores or intitializes class variables, adds event listenser to all pieces</div></div>",36:"<div class=\"NDToolTip TFunction LActionScript\"><div id=\"NDPrototype36\" class=\"NDPrototype WideForm PascalStyle\"><table><tr><td class=\"PBeforeParameters\"><span class=\"SHKeyword\">public function</span> cheatMode(</td><td class=\"PParametersParentCell\"><table class=\"PParameters\"><tr><td class=\"PName first\">evt</td><td class=\"PTypeNameSeparator\">:&nbsp;</td><td class=\"PType last\">KeyboardEvent</td></tr></table></td><td class=\"PAfterParameters\">):<span class=\"SHKeyword\">void</span></td></tr></table></div><div class=\"TTSummary\">Fills frameArray, deactivates ability to click, and reveals board.</div></div>",37:"<div class=\"NDToolTip TFunction LActionScript\"><div id=\"NDPrototype37\" class=\"NDPrototype NoParameterForm\"><span class=\"SHKeyword\">public function</span> revertCheat():<span class=\"SHKeyword\">void</span></div><div class=\"TTSummary\">sets each piece to the frame obtained from the frameArray..</div></div>",38:"<div class=\"NDToolTip TFunction LActionScript\"><div id=\"NDPrototype38\" class=\"NDPrototype WideForm PascalStyle\"><table><tr><td class=\"PBeforeParameters\"><span class=\"SHKeyword\">public function</span> handleClick(</td><td class=\"PParametersParentCell\"><table class=\"PParameters\"><tr><td class=\"PName first\">evt</td><td class=\"PTypeNameSeparator\">:&nbsp;</td><td class=\"PType last\">MouseEvent</td></tr></table></td><td class=\"PAfterParameters\">):<span class=\"SHKeyword\">void</span></td></tr></table></div><div class=\"TTSummary\">If unclear piece is clicked, piece is cleared or mine is set off. If unclicked piece is shift-clicked, flag is toggled and flagCounter is updated. If numbered piece is clicked and that number of flags surround it, clicks all unclicked pieces around that piece.</div></div>",39:"<div class=\"NDToolTip TFunction LActionScript\"><div id=\"NDPrototype39\" class=\"NDPrototype NoParameterForm\"><span class=\"SHKeyword\">public function</span> flagAll():<span class=\"SHKeyword\">void</span></div><div class=\"TTSummary\">Flags all non-flagged mines</div></div>",40:"<div class=\"NDToolTip TFunction LActionScript\"><div id=\"NDPrototype40\" class=\"NDPrototype NoParameterForm\"><span class=\"SHKeyword\">public function</span> endGame():<span class=\"SHKeyword\">void</span></div><div class=\"TTSummary\">Removes event listeners from all pieces</div></div>",41:"<div class=\"NDToolTip TFunction LActionScript\"><div id=\"NDPrototype41\" class=\"NDPrototype NoParameterForm\"><span class=\"SHKeyword\">public function</span> recordGame():<span class=\"SHKeyword\">void</span></div><div class=\"TTSummary\">Records game data in cookie</div></div>",42:"<div class=\"NDToolTip TFunction LActionScript\"><div id=\"NDPrototype42\" class=\"NDPrototype WideForm PascalStyle\"><table><tr><td class=\"PBeforeParameters\"><span class=\"SHKeyword\">public function</span> clearSurrounding(</td><td class=\"PParametersParentCell\"><table class=\"PParameters\"><tr><td class=\"PName first\">row</td><td class=\"PTypeNameSeparator\">:&nbsp;</td><td class=\"PType last\"><span class=\"SHKeyword\">int</span>,</td></tr><tr><td class=\"PName first\">col</td><td class=\"PTypeNameSeparator\">:&nbsp;</td><td class=\"PType last\"><span class=\"SHKeyword\">int</span></td></tr></table></td><td class=\"PAfterParameters\">):<span class=\"SHKeyword\">void</span></td></tr></table></div><div class=\"TTSummary\">Clears unclicked pieces around a given piece</div></div>",43:"<div class=\"NDToolTip TFunction LActionScript\"><div id=\"NDPrototype43\" class=\"NDPrototype WideForm PascalStyle\"><table><tr><td class=\"PBeforeParameters\"><span class=\"SHKeyword\">public function</span> countFlags(</td><td class=\"PParametersParentCell\"><table class=\"PParameters\"><tr><td class=\"PName first\">x</td><td class=\"PTypeNameSeparator\">:&nbsp;</td><td class=\"PType last\"><span class=\"SHKeyword\">int</span>,</td></tr><tr><td class=\"PName first\">row</td><td class=\"PTypeNameSeparator\">:&nbsp;</td><td class=\"PType last\"><span class=\"SHKeyword\">int</span>,</td></tr><tr><td class=\"PName first\">col</td><td class=\"PTypeNameSeparator\">:&nbsp;</td><td class=\"PType last\"><span class=\"SHKeyword\">int</span></td></tr></table></td><td class=\"PAfterParameters\">):<span class=\"SHKeyword\">int</span></td></tr></table></div><div class=\"TTSummary\">Counts flags around a given numbered piece and returns the number</div></div>",44:"<div class=\"NDToolTip TFunction LActionScript\"><div id=\"NDPrototype44\" class=\"NDPrototype NoParameterForm\"><span class=\"SHKeyword\">public function</span> countFlaggedMines():<span class=\"SHKeyword\">int</span></div><div class=\"TTSummary\">Counts the number of flagged mines on the board</div></div>",45:"<div class=\"NDToolTip TFunction LActionScript\"><div id=\"NDPrototype45\" class=\"NDPrototype NoParameterForm\"><span class=\"SHKeyword\">public function</span> endCheck():Boolean</div><div class=\"TTSummary\">Detonates mine and ends game or clicks piece</div></div>",49:"<div class=\"NDToolTip TFunction LActionScript\"><div id=\"NDPrototype49\" class=\"NDPrototype WideForm PascalStyle\"><table><tr><td class=\"PBeforeParameters\"><span class=\"SHKeyword\">public function</span> isEmpty(</td><td class=\"PParametersParentCell\"><table class=\"PParameters\"><tr><td class=\"PName first\">row</td><td class=\"PTypeNameSeparator\">:&nbsp;</td><td class=\"PType last\"><span class=\"SHKeyword\">int</span>,</td></tr><tr><td class=\"PName first\">col</td><td class=\"PTypeNameSeparator\">:&nbsp;</td><td class=\"PType last\"><span class=\"SHKeyword\">int</span>&nbsp;</td></tr></table></td><td class=\"PAfterParameters\">):<span class=\"SHKeyword\">void</span></td></tr></table></div><div class=\"TTSummary\">Detonates mine and ends game or clicks piece</div></div>",47:"<div class=\"NDToolTip TFunction LActionScript\"><div id=\"NDPrototype47\" class=\"NDPrototype NoParameterForm\"><span class=\"SHKeyword\">public function</span> revealMines():<span class=\"SHKeyword\">void</span></div><div class=\"TTSummary\">Reveals all mines on the board</div></div>",50:"<div class=\"NDToolTip TFunction LActionScript\"><div id=\"NDPrototype50\" class=\"NDPrototype WideForm PascalStyle\"><table><tr><td class=\"PBeforeParameters\"><span class=\"SHKeyword\">public function</span> Checker(</td><td class=\"PParametersParentCell\"><table class=\"PParameters\"><tr><td class=\"PName first\">row</td><td class=\"PTypeNameSeparator\">:&nbsp;</td><td class=\"PType last\"><span class=\"SHKeyword\">int</span>,</td></tr><tr><td class=\"PName first\">col</td><td class=\"PTypeNameSeparator\">:&nbsp;</td><td class=\"PType last\"><span class=\"SHKeyword\">int</span>&nbsp;</td></tr></table></td><td class=\"PAfterParameters\">):<span class=\"SHKeyword\">void</span></td></tr></table></div><div class=\"TTSummary\">Recursively clears pieces until numbered piece or edge of board is found</div></div>"});