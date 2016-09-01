-- WHEN A SAMPLE HAS BEEN CHOSEN FROM THE LIST, MAIN.LUA LOADS A SAMPLE
-- CODE AND CALLS ITS Create() FUNCTION. TAPPING THE BACK BUTTON 
-- (ALSO CREATED IN MAIN.LUA) CALLS THE Remove() FUNCTION OF THE LOADED 
-- SAMPLE CODE TO REMOVE THE SAMPLE WIDGETS AGAIN. 

local V = {}

----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA AND CREATES THE WIDGET
----------------------------------------------------------------
V.Create = function()

	-- CUSTOM KEYBOARD LAYOUT FOR EMAIL ADDRESSES
	V.layoutEmail  = 
		{
		-- PAGE 1: EMAIL-SAFE CHARS
		page1 =
			{
			allowCase = true,
			{ {"Q","1"}, {"W","2"}, {"E","3"}, {"R","4"}, {"T","5"}, {"Y","6"}, {"U","7"}, {"I","8"}, {"O","9"}, {"P","0"} },
			{ {"A"}, {"S"}, {"D"}, {"F"}, {"G","-"}, {"H"}, {"J"}, {"K"}, {"L"} },
			{ {"SHIFT"}, {"Z","_"}, {"X"}, {"C"}, {"V"}, {"B"}, {"N"}, {"M"}, {"DEL"} },
			{ {"PAGE2"}, {"@"}, {".","_","-"}, {".COM"}, {"OK"}, {"CLEAR"} },
			},
		-- PAGE 2: NUMBERS
		page2 =
			{
			allowCase = false,
			{ {"1"}, {"2"}, {"3"}, {"0"},  },
			{ {"4"}, {"5"}, {"6"}, {"@"}, },
			{ {"7"}, {"8"}, {"9"}, {".","_","-"} },
			{ {"PAGE1"}, {"SPACE"}, {"DEL"}, {"OK"}, {"CLEAR"} },
			},
		}

	-- CUSTOM KEYBOARD LAYOUT FOR NUMBERS ONLY
	V.layoutNumbers  = 
		{
		-- PAGE 1: NUMBERS ONLY
		page1 =
			{
			allowCase = false,
			{ {"1"}, {"2"}, {"3"}, },
			{ {"4"}, {"5"}, {"6"}, },
			{ {"7"}, {"8"}, {"9"}, },
			{ {"OK"}, {"."}, {"0"}, {"DEL"}, {"CLEAR"} },
			},
		}


	-- BUTTONS
	_G.GUI.NewButton(
		{
		x               = "center",                
		y               = "10%",                
		width           = "60%",                   
		scale           = _G.GUIScale,
		name            = "BUT_1", 
		parentGroup     = nil,                     
		theme           = _G.theme,               
		caption         = "Example: Email-safe layout", 
		textAlign       = "center",                  
		icon            = 46,  
		border          = {"shadow", 8,8, .25},
		onRelease       = function(EventData)  
					_G.GUI.Keyboard_Show(
						{
						height   = "50%",
						onType   = function(EventData) print("TYPE: "..EventData.char) end,
						onOK     = function(EventData) print("OK!") end,	
						layout   = V.layoutEmail ,
						} )
				end,
		} )

	_G.GUI.NewButton(
		{
		x               = "center",                
		y               = "30%",                
		width           = "60%",                   
		scale           = _G.GUIScale,
		name            = "BUT_2", 
		parentGroup     = nil,                     
		theme           = _G.theme,               
		caption         = "Example: Numbers only", 
		textAlign       = "center",                  
		icon            = 46,  
		border          = {"shadow", 8,8, .25},
		onRelease       = function(EventData)  
					_G.GUI.Keyboard_Show(
						{
						height   = "50%",
						onType   = function(EventData) print("TYPE: "..EventData.char) end,
						onOK     = function(EventData) print("OK!") end,	
						layout   = V.layoutNumbers ,
						} )
				end,
		} )

	-- CREATE A TEXT
	_G.GUI.NewText(
		{
		x               = "center",                
		y               = "bottom", 
		width           = "70%",
		scale           = _G.GUIScale,
		height          = "auto",
		name            = "TXT_1",            
		parentGroup     = nil,                     
		theme           = _G.theme, 
		caption         = "Widget Candy's default keyboard layout fits most cases. But you can also define custom keyboard layouts -at any time! Specify what keys and in what order are displayed when calling Keyboard_Show. Just pass a table that contains the keys you want to display. Any keys you don't specify won't show up then. It's as easy! If you don't pass a custom layout, Widget Candy's default layout is used.",
		textAlign       = "left",
		textColor       = {1,1,1},
		border          = {"normal",4,1, .5,.5,.5,.5, 1,1,1,1},
		} )

end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() 
	_G.GUI.GetHandle("BUT_1"):destroy() 
	_G.GUI.GetHandle("BUT_2"):destroy() 
	_G.GUI.GetHandle("TXT_1"):destroy() 
end

return V
