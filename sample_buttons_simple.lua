-- WHEN A SAMPLE HAS BEEN CHOSEN FROM THE LIST, MAIN.LUA LOADS A SAMPLE
-- CODE AND CALLS ITS Create() FUNCTION. TAPPING THE BACK BUTTON 
-- (ALSO CREATED IN MAIN.LUA) CALLS THE Remove() FUNCTION OF THE LOADED 
-- SAMPLE CODE TO REMOVE THE SAMPLE WIDGETS AGAIN. 

local V = {}

----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA AND CREATES THE WIDGET
----------------------------------------------------------------
V.Create = function()

	-- CREATE A SIMPLE BUTTON
	_G.GUI.NewButton(
		{
		x               = "center",                
		y               = "30%",                
		width           = "50%",                   
		scale           = _G.GUIScale,
		name            = "BUT_1", 
		parentGroup     = nil,                     
		theme           = _G.theme,               
		caption         = "Simple button.", 
		textAlign       = "center",                  
		icon            = 20,  
		flipIconX       = true,
		flipIconY       = false,
		border          = {"shadow", 8,8, .25},
		onPress         = function(EventData) EventData.Widget:set("caption", "Button pressed!")  end,
		onRelease       = function(EventData) 
							-- RELEASED WHILE INSIDE BUTTON?
							if EventData.inside then EventData.Widget:set("caption", "Released inside!") 
						  	-- RELEASED WHILE OUTSIDE BUTTON?
						  	                    else EventData.Widget:set("caption", "Released outside!") end
						  end,
		} )

	-- CREATE A TOGGLE BUTTON
	_G.GUI.NewButton(
		{
		x               = "center",                
		y               = _G.GUI.GetHandle("BUT_1").y + 100,                
		width           = "50%",                   
		scale           = _G.GUIScale,
		name            = "BUT_2", 
		parentGroup     = nil,                     
		theme           = _G.theme,               
		caption         = "Toggle button - tap me!", 
		textAlign       = "center",                  
		icon            = 16,  
		toggleButton    = true,  -- IS A TOGGLE BUTTON NOW
		toggleState     = false, -- INITIAL TOGGLE STATE
		flipIconX       = false,
		flipIconY       = false,
		border          = {"shadow", 8,8, .25},
		onRelease       = function(EventData) 
							if EventData.Props.toggleState == true then
								EventData.Widget:set( { caption = "toggleState = true", icon = 15 } )
							else
								EventData.Widget:set( { caption = "toggleState = false", icon = 16 } )
							end
						  end,
		} )

end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() 
	_G.GUI.GetHandle("BUT_1"):destroy() 
	_G.GUI.GetHandle("BUT_2"):destroy() 
end

return V
