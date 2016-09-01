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
		_G.GUI.NewButton(
			{
			x               = "center",                
			y               = 50 + i*40,                
			width           = "50%",                   
			scale           = _G.GUIScale,
			name            = "BUT_TOGGLE"..i,            
			parentGroup     = nil,                     
			theme           = _G.theme,               
			caption         = "Option "..i, 
			textAlign       = "center",   
			iconAlign       = "left",
			icon            = 15,                       
			
			toggleButton    = true,
			toggleState     = i == 1 and true or false,
			toggleGroup     = "MyToggleGroup",
			} )
	end
	
	_G.GUI.NewButton(
		{
		x               = "center",                
		y               = "bottom",                
		width           = "50%",                   
		scale           = _G.GUIScale,
		name            = "BUT_SET",            
		parentGroup     = nil,                     
		theme           = _G.theme,               
		caption         = "Select First Option", 
		textAlign       = "left",                  
		icon            = 27, 
		onPress         = function(EventData) _G.GUI.GetHandle("BUT_TOGGLE1"):set("toggleState", true) end,
		} )

end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() 
	_G.GUI.GetHandle("BUT_SET"):destroy()
	for i = 1, 4 do _G.GUI.GetHandle("BUT_TOGGLE"..i):destroy() end
end

return V
