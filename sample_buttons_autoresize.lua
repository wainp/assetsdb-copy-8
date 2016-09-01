-- WHEN A SAMPLE HAS BEEN CHOSEN FROM THE LIST, MAIN.LUA LOADS A SAMPLE
-- CODE AND CALLS ITS Create() FUNCTION. TAPPING THE BACK BUTTON 
-- (ALSO CREATED IN MAIN.LUA) CALLS THE Remove() FUNCTION OF THE LOADED 
-- SAMPLE CODE TO REMOVE THE SAMPLE WIDGETS AGAIN. 

local V = {}

----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA AND CREATES THE WIDGET
----------------------------------------------------------------
V.Create = function()

	V.captions =
		{
		"Short text.",
		"Long text -button width automatically adjusted.",
		"Short again.",
		"Some medium text here.",
		}
	V.num = 0

	-- CREATE A SIMPLE BUTTON
	_G.GUI.NewButton(
		{
		x               = "center",                
		y               = "center",                
		width           = "auto", -- <-- IF SET TO "AUTO", THE BUTTON WILL SHRINK OR EXPAND ACCORDING TO IT'S TEXT.                   
		scale           = _G.GUIScale,
		name            = "BUT_SIMPLE",            
		parentGroup     = nil,                     
		theme           = _G.theme,               
		caption         = "Tap me to change my text.", 
		textAlign       = "left",                  
		icon            = 9,
		border          = {"shadow", 8,8, .25},
		onRelease       = function(EventData) 
			V.num = (V.num == #V.captions and 1 or V.num + 1)
			EventData.Widget:set("caption", V.captions[V.num])  
			end,
		} )
end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() _G.GUI.GetHandle("BUT_SIMPLE"):destroy() end

return V
