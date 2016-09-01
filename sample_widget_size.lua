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
	_G.GUI.NewText(
		{
		x               = "center",                
		y               = "center", 
		width           = "50%",
		height          = "50%",
		scale           = _G.GUIScale,
		height          = "auto",
		name            = "TXT_1",            
		parentGroup     = nil,                     
		theme           = _G.theme, 
		caption         = "To specify a widget's width and height, you can either use absolute or percentual values. Use the slider to change my width.",
		textColor       = {0,0,0},
		textAlign       = "center",
		border          = {"normal",4,1, 1,1,1,1, 0,0,0,1},
		} )
	
	-- SLIDER: SET WIDTH
	_G.GUI.NewSlider(
		{
		x                 = "center",
		y                 = display.contentHeight*.82, 
		name              = "SLIDER",
		width             = "66%",
		scale             = _G.GUIScale,
		parentGroup       = nil,
		theme             = _G.theme,
		minValue          = 15,
		maxValue          = 100,
		value             = 50,
		step              = 5,
		tickStep          = 0,  -- SET TO NIL OR < 2 TO HIDE TICKS
		textFormatter     = function(value) return "Text Width: "..value.."%" end,
		onChange          = function(EventData) _G.GUI.GetHandle("TXT_1"):set("width", EventData.value.."%") end,
		} )

end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() 
	_G.GUI.GetHandle("TXT_1" ):destroy()
	_G.GUI.GetHandle("SLIDER"):destroy()
end

return V
