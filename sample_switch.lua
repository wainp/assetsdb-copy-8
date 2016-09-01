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

	-- CREATE A SWITCH
	_G.GUI.NewSwitch(
		{
		x               = "center",                
		y               = "center", 
		width           = 200,
		scale           = _G.GUIScale,
		name            = "SWITCH",            
		parentGroup     = nil,
		theme           = _G.theme,
		toggleState     = false,
		textColor       = {1,1,1},
		textAlign       = "left",
		caption         = "This is a switch",
		onChange        = function(EventData) 
					local value = tostring(EventData.toggleState) 
					EventData.Widget:set  ("caption", "My Value: "..value)
				  end
		} )

	-- BUTTON: CHANGE SWITCH STATE PROGRAMMATICALLY
	_G.GUI.NewButton(
		{
		x               = "center",                
		y               = "bottom",                
		width           = "50%",                   
		scale           = _G.GUIScale,
		name            = "BUT_SIMPLE",            
		parentGroup     = nil,                     
		theme           = _G.theme,               
		caption         = "Change Programmatically", 
		textAlign       = "center",                  
		icon            = 20,
		border          = {"shadow", 8,8, .25},
		onPress         = function(EventData)
					local Switch = _G.GUI.GetHandle("SWITCH")
					local state  = not Switch:get("toggleState")
					Switch:set( "toggleState", state )
				  end,
		} )

end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() 
	_G.GUI.GetHandle("SWITCH"):destroy() 
	_G.GUI.GetHandle("BUT_SIMPLE"):destroy() 
end

return V
