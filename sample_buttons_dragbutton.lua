-- WHEN A SAMPLE HAS BEEN CHOSEN FROM THE LIST, MAIN.LUA LOADS A SAMPLE
-- CODE AND CALLS ITS Create() FUNCTION. TAPPING THE BACK BUTTON 
-- (ALSO CREATED IN MAIN.LUA) CALLS THE Remove() FUNCTION OF THE LOADED 
-- SAMPLE CODE TO REMOVE THE SAMPLE WIDGETS AGAIN. 

local V = {}

----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA AND CREATES THE WIDGET
----------------------------------------------------------------
V.Create = function()

	-- CREATE A DRAG BUTTON
	_G.GUI.NewDragButton(
		{
		x               = "center",                
		y               = display.contentHeight *.45,    
		scale           = _G.GUIScale,
		name            = "BUT_DRAG",            
		parentGroup     = nil,                     
		theme           = _G.theme,               
		
		value           = 10,
		minValue        = 1,
		maxValue        = 100,
		step            = 10,
		sensitivity     = 0.05,
		hideBubble      = false,

		onChange        = function(EventData) print(EventData.value) end,
		onPress         = function(EventData) print("Pressed!") end,
		onRelease       = function(EventData) print("Released!") end,
		} )

	-- CREATE SOME TEXT
	_G.GUI.NewLabel(
		{
		x               = "center",                
		y               = display.contentHeight *.55, 
		width           = "100%",
		scale           = _G.GUIScale,
		name            = "LBL_DRAG", 
		parentGroup     = nil,                     
		theme           = _G.theme,               
		caption         = "Tap and hold the button, then drag upwards or downwards.",
		textColor       = {1,1,1},
		textAlign       = "center",
		} )
end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() 
	_G.GUI.GetHandle("BUT_DRAG"):destroy()
	_G.GUI.GetHandle("LBL_DRAG"):destroy()
end

return V
