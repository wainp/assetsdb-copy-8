-- WHEN A SAMPLE HAS BEEN CHOSEN FROM THE LIST, MAIN.LUA LOADS A SAMPLE
-- CODE AND CALLS ITS Create() FUNCTION. TAPPING THE BACK BUTTON 
-- (ALSO CREATED IN MAIN.LUA) CALLS THE Remove() FUNCTION OF THE LOADED 
-- SAMPLE CODE TO REMOVE THE SAMPLE WIDGETS AGAIN. 

local V = {}

V.positionsX = {"left","center","right"}
V.positionsY = {"top","center","bottom"}
V.posX       = 2
V.posY       = 1

----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA AND CREATES THE WIDGET
----------------------------------------------------------------
V.Create = function()

	-- CREATE A TEXT
	_G.GUI.NewText(
		{
		x               = V.positionsX[V.posX],                
		y               = V.positionsY[V.posY], 
		width           = "33%",
		scale           = _G.GUIScale,
		height          = "auto",
		name            = "TXT_1",            
		parentGroup     = nil,                     
		theme           = _G.theme, 
		caption         = "You can position widgets either by using absolute values, percentual values or 'top', 'center', 'bottom', 'left' and 'right'.",
		textAlign       = "center",
		textColor       = {0,0,0},
		border          = {"normal",4,1, 1,1,1,1, 0,0,0,1},
		} )
	
	-- BUTTON: SET X POS
	_G.GUI.NewButton(
		{
		x               = "17%",                
		y               = display.contentHeight*.6, 
		width           = "33%",
		scale           = _G.GUIScale,
		name            = "BUT_X",            
		parentGroup     = nil,                     
		theme           = _G.theme, 
		caption         = "Change X Pos",
		icon            = 6,
		onPress         = function(EventData)
					V.posX = V.posX + 1; if V.posX > 3 then V.posX = 1 end
					_G.GUI.GetHandle("TXT_1"):set("x"      , V.positionsX[V.posX])
					_G.GUI.GetHandle("BUT_X"):set("caption", "X = '"..V.positionsX[V.posX].."'")
				  end,
		} )

	-- BUTTON: SET Y POS
	_G.GUI.NewButton(
		{
		x               = "50%",                
		y               = display.contentHeight*.6, 
		width           = "33%",
		scale           = _G.GUIScale,
		name            = "BUT_Y",            
		parentGroup     = nil,                     
		theme           = _G.theme, 
		caption         = "Change Y Pos",
		icon            = 6,
		onPress         = function(EventData)
					V.posY = V.posY + 1; if V.posY > 3 then V.posY = 1 end
					_G.GUI.GetHandle("TXT_1"):set("y"      , V.positionsY[V.posY])
					_G.GUI.GetHandle("BUT_Y"):set("caption", "Y = '"..V.positionsY[V.posY].."'")
				  end,
		} )

	-- SLIDER: SET PERCENTUAL X POS
	_G.GUI.NewSlider(
		{
		x                 = "center",
		y                 = display.contentHeight*.72, 
		name              = "SLD_X",
		width             = "66%",
		scale             = _G.GUIScale,
		parentGroup       = nil,
		theme             = _G.theme,
		minValue          = 0,
		maxValue          = 100,
		value             = 50,
		step              = 5,
		tickStep          = 5,  -- SET TO NIL OR < 2 TO HIDE TICKS
		textFormatter     = function(value) return "X Pos: "..value.."%" end,
		onChange          = function(EventData) _G.GUI.GetHandle("TXT_1"):set("x", EventData.value.."%") end,
		} )

	-- SLIDER: SET PERCENTUAL Y POS
	_G.GUI.NewSlider(
		{
		x                 = "center",
		y                 = display.contentHeight*.84, 
		name              = "SLD_Y",
		width             = "66%",
		scale             = _G.GUIScale,
		parentGroup       = nil,
		theme             = _G.theme,
		minValue          = 0,
		maxValue          = 100,
		value             = 50,
		step              = 5,
		tickStep          = 5,  -- SET TO NIL OR < 2 TO HIDE TICKS
		textFormatter     = function(value) return "Y Pos: "..value.."%" end,
		onChange          = function(EventData) _G.GUI.GetHandle("TXT_1"):set("y", EventData.value.."%") end,
		} )

end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() 
	_G.GUI.GetHandle("TXT_1"):destroy()
	_G.GUI.GetHandle("BUT_X"):destroy()
	_G.GUI.GetHandle("BUT_Y"):destroy()
	_G.GUI.GetHandle("SLD_X"):destroy()
	_G.GUI.GetHandle("SLD_Y"):destroy()
end

return V
