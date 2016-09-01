-- WHEN A SAMPLE HAS BEEN CHOSEN FROM THE LIST, MAIN.LUA LOADS A SAMPLE
-- CODE AND CALLS ITS Create() FUNCTION. TAPPING THE BACK BUTTON 
-- (ALSO CREATED IN MAIN.LUA) CALLS THE Remove() FUNCTION OF THE LOADED 
-- SAMPLE CODE TO REMOVE THE SAMPLE WIDGETS AGAIN. 

local V = {}

----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA AND CREATES THE WIDGET
----------------------------------------------------------------
V.Create = function()

	local screenW = display.contentWidth
	local screenH = display.contentHeight

	-- ADD A BORDER TO ENCLOSE RADIO BUTTON GROUP
	_G.GUI.NewBorder(
		{
		name              = "BORDER",
		parentGroup       = nil,
		theme             = _G.theme, 
		group             = "MyGroup1", -- << ASSIGN TO GROUP "MyGroup1"
		border            = {"normal",4,1, 1,1,1 ,.25, 1,1,1, 1}, 
		zindex            = 2, -- PLACE BELOW OTHER WIDGETS, BUT AFTER BACKGROUND IMAGE
		} )

	-- CREATE SOME RADIO BUTTONS
	local y = screenH*.2
	for i = 1, 3 do
		_G.GUI.NewRadiobutton(
			{
			x               = "center",                
			y               =  y, 
			width           = "50%",
			height          = 40,
			scale           = _G.GUIScale,
			name            = "RADIO_"..i,            
			parentGroup     = nil,
			group           = "MyGroup1", -- << ASSIGN TO GROUP "MyGroup1"
			theme           = _G.theme, 
			toggleState     = i == 1 and true or false,
			textAlign       = "right",
			textColor       = {0,0,0},
			caption         = "Radio Button "..i, 
			} )
		y = y + 40 * _G.GUIScale
	end

	-- WE'VE DRAWN THE BORDER FIRST TO LET IT APPEAR -BEHIND- THE RADIO BUTTONS
	-- NOW UPATE THE BORDER WIDGET AND IT WILL AUTOMATICALLY RESIZE TO THE
	-- PROPORTIONS OF THE "MyGroup1" WIDGET GROUP, BECAUSE IT HAS THE SAME
	-- GROUP NAME ASSIGNED AS THE RADIO BUTTONS ABOVE:
	_G.GUI.GetHandle("BORDER"):update()

	-- TEXT
	_G.GUI.NewText(
		{
		x               = "center",                
		y               = _G.GUI.GetHandle("BORDER").y + _G.GUI.GetHandle("BORDER").contentHeight + 20, 
		width           = "50%",
		scale           = _G.GUIScale,
		name            = "TXT",            
		parentGroup     = nil,                     
		theme           = _G.theme,  
		caption         = "A border widget adds a colored background and a border and can either enclose a single widget or a group of widgets.",
		textAlign       = "center",
		textColor       = {0,0,0},
		border          = {"normal",4,1, 1,1,1 ,1, 0,0,0, 1}, 
		} )

end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() 
	for i = 1, 3 do _G.GUI.GetHandle("RADIO_"..i):destroy() end
	_G.GUI.GetHandle("TXT"):destroy() 
	_G.GUI.GetHandle("BORDER"):destroy()
end

return V
