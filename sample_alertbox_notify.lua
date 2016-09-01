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
		width           = 200,                   
		scale           = _G.GUIScale,
		name            = "BUT_SIMPLE",            
		parentGroup     = nil,                     
		theme           = _G.theme,                
		caption         = "Show Alert", 
		textAlign       = "center",                  
		icon            = 37,      
		border          = {"shadow", 8,8, .25},
		onPress         = function(EventData) end,
		onRelease       = function(EventData) V.ShowAlert() end,
		} )
end


----------------------------------------------------------------
-- SHOW AN ALERTBOX
----------------------------------------------------------------
V.ShowAlert = function()
	_G.GUI.Confirm(
		{
		name    = "WIN_ALERT1",
		modal   = true,
		theme   = _G.theme, 
		width   = "50%",
		scale   = _G.GUIScale,
		icon    = 14,
		title   = "Did you know..?",
		caption = "This is a simple alertbox.", 
		buttons = { { icon = 15, caption = "Okay", }, },
		} )
end

----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() _G.GUI.GetHandle("BUT_SIMPLE"):destroy() end

return V
