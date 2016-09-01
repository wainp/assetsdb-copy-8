-- WHEN A SAMPLE HAS BEEN CHOSEN FROM THE LIST, MAIN.LUA LOADS A SAMPLE
-- CODE AND CALLS ITS Create() FUNCTION. TAPPING THE BACK BUTTON 
-- (ALSO CREATED IN MAIN.LUA) CALLS THE Remove() FUNCTION OF THE LOADED 
-- SAMPLE CODE TO REMOVE THE SAMPLE WIDGETS AGAIN. 

local V = {}

----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA AND CREATES THE WIDGET
----------------------------------------------------------------
V.Create = function()

	-- CREATE A SQUARED BUTTON
	_G.GUI.NewSquareButton(
		{
		x               = "50%",                
		y               = "center",         
		scale           = _G.GUIScale,
		name            = "BUT_SQUARE1",            
		parentGroup     = nil,                     
		theme           = _G.theme,               
		icon            = 8,
		onPress         = function(EventData) print("Pressed - Button")  end,
		onRelease       = function(EventData) print("Released - Button") end,
		} )

	_G.GUI.NewSquareButton(
		{
		x               = "40%",                
		y               = "center",                
		scale           = _G.GUIScale,
		name            = "BUT_SQUARE2",            
		parentGroup     = nil,                     
		theme           = _G.theme, 
		icon            = 7,
		onPress         = function(EventData) print("Pressed + Button")  end,
		onRelease       = function(EventData) print("Released + Button") end,
		} )
end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() 
	_G.GUI.GetHandle("BUT_SQUARE1"):destroy()
	_G.GUI.GetHandle("BUT_SQUARE2"):destroy()
end

return V
