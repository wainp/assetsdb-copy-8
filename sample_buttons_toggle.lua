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
		y               = "center",                
		width           = "50%",                   
		scale           = _G.GUIScale,
		name            = "BUT_SIMPLE",            
		parentGroup     = nil,                     
		theme           = _G.theme,               
		caption         = "I am a toggle button.", 
		textAlign       = "center",                  
		icon            = 16,                       
		toggleButton    = true,
		toggleState     = false,
		onPress         = function(EventData) EventData.Widget:set("caption", "Pressed!")  end,
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
V.Remove = function() _G.GUI.GetHandle("BUT_SIMPLE"):destroy() end

return V
