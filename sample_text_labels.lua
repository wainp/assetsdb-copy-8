-- WHEN A SAMPLE HAS BEEN CHOSEN FROM THE LIST, MAIN.LUA LOADS A SAMPLE
-- CODE AND CALLS ITS Create() FUNCTION. TAPPING THE BACK BUTTON 
-- (ALSO CREATED IN MAIN.LUA) CALLS THE Remove() FUNCTION OF THE LOADED 
-- SAMPLE CODE TO REMOVE THE SAMPLE WIDGETS AGAIN. 

local V = {}

----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA AND CREATES THE WIDGET
----------------------------------------------------------------
V.Create = function()

	-- LABEL 1
	_G.GUI.NewLabel(
		{
		x               = "center",                
		y               = display.contentHeight * .1, 
		width           = "50%",
		scale           = _G.GUIScale,
		name            = "LBL_1",            
		parentGroup     = nil,                     
		theme           = "theme_1", 
		icon            = 14,
		caption         = "This is a label with borders.",
		textAlign       = "center",
		textColor       = {1,1,1},
		border          = {"normal",4,1, 0,0,0,.19, 1,1,1,.78},
		} )

	-- LABEL 2
	_G.GUI.NewLabel(
		{
		x               = "center",                
		y               = display.contentHeight * .25, 
		width           = "50%",
		scale           = _G.GUIScale,
		name            = "LBL_2",            
		parentGroup     = nil,                     
		theme           = "theme_1", 
		icon            = 14,
		caption         = "Label without borders.",
		textAlign       = "center",
		textColor       = {1,1,1},
		} )

	-- LABEL 3
	_G.GUI.NewLabel(
		{
		x               = "center",                
		y               = display.contentHeight * .4, 
		width           = "50%",
		scale           = _G.GUIScale,
		name            = "LBL_3",            
		parentGroup     = nil,                     
		theme           = "theme_1", 
		icon            = 0,
		caption         = "With borders and no icon.",
		textAlign       = "center",
		border          = {"normal",4,1, 0,0,0,.19, 1,1,1,.78},
		textColor       = {1,1,1},
		} )

	-- LABEL 4
	_G.GUI.NewLabel(
		{
		x               = "center",                
		y               = display.contentHeight * .55, 
		width           = "50%",
		scale           = _G.GUIScale,
		name            = "LBL_4",            
		parentGroup     = nil,                     
		theme           = "theme_1", 
		icon            = 14,
		caption         = "Right-aligned, with icon.",
		textAlign       = "right",
		textColor       = {1,1,1},
		border          = {"normal",4,1, 0,0,0,.19, 1,1,1,.78},
		} )

	-- LABEL 5
	_G.GUI.NewLabel(
		{
		x               = "center",                
		y               = display.contentHeight * .7, 
		width           = "50%",
		scale           = _G.GUIScale,
		name            = "LBL_5",            
		parentGroup     = nil,                     
		theme           = "theme_1", 
		icon            = 15,
		caption         = "Colored label, no borders.",
		textAlign       = "center",
		textColor       = {1,.5,0},
		} )
		
end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() 
	for i = 1,5 do _G.GUI.GetHandle("LBL_"..i):destroy() end
end

return V
