-- WHEN A SAMPLE HAS BEEN CHOSEN FROM THE LIST, MAIN.LUA LOADS A SAMPLE
-- CODE AND CALLS ITS Create() FUNCTION. TAPPING THE BACK BUTTON 
-- (ALSO CREATED IN MAIN.LUA) CALLS THE Remove() FUNCTION OF THE LOADED 
-- SAMPLE CODE TO REMOVE THE SAMPLE WIDGETS AGAIN. 

local V = {}

----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA AND CREATES THE WIDGET
----------------------------------------------------------------
V.Create = function()

	local screenH = display.contentHeight

	V.activeButton = 1

	-- CREATE TOGGLE BUTTONS
	for i = 1,4 do
		_G.GUI.NewSquareButton(
			{
			x               = "center",                
			y               = 50 + i*40,                
			width           = "50%",                   
			scale           = _G.GUIScale,
			name            = "BUT_TOGGLE"..i,            
			parentGroup     = nil,                     
			theme           = _G.theme,               
			textAlign       = "left",                  
			icon            = 16+i, 

			toggleButton    = true,
			toggleState     = i == 1 and true or false,
			toggleGroup     = "MyToggleGroup",
			} )
	end
	
end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() 
	for i = 1, 4 do _G.GUI.GetHandle("BUT_TOGGLE"..i):destroy() end
end

return V
