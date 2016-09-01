-- WHEN A SAMPLE HAS BEEN CHOSEN FROM THE LIST, MAIN.LUA LOADS A SAMPLE
-- CODE AND CALLS ITS Create() FUNCTION. TAPPING THE BACK BUTTON 
-- (ALSO CREATED IN MAIN.LUA) CALLS THE Remove() FUNCTION OF THE LOADED 
-- SAMPLE CODE TO REMOVE THE SAMPLE WIDGETS AGAIN. 

local V = {}

----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA AND CREATES THE WIDGET
----------------------------------------------------------------
V.Create = function()

	-- CREATE A TEXT
	_G.GUI.NewTextSimple(
		{
		x               = "center",                
		y               = "center", 
		width           = "50%",
		scale           = _G.GUIScale,
		height          = "auto",
		name            = "TXT_1",            
		parentGroup     = nil,                     
		theme           = "theme_1",
		textColor       = {1,1,1},
		caption         = "NewTextSimple() creates a simple wrapped text which is faster than NewText() but provides left-aligned text wrapping only, no centered or right-aligned text.",
		textAlign       = "left", -- IGNORED BY NewTextSimple()
		border          = {"normal",4,1, 1,1,1,.25, 0,0,0,1},
		} )

end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() 
	_G.GUI.GetHandle("TXT_1"):destroy()
end

return V
