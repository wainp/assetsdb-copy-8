-- WHEN A SAMPLE HAS BEEN CHOSEN FROM THE LIST, MAIN.LUA LOADS A SAMPLE
-- CODE AND CALLS ITS Create() FUNCTION. TAPPING THE BACK BUTTON 
-- (ALSO CREATED IN MAIN.LUA) CALLS THE Remove() FUNCTION OF THE LOADED 
-- SAMPLE CODE TO REMOVE THE SAMPLE WIDGETS AGAIN. 

local V = {}

----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA AND CREATES THE WIDGET
----------------------------------------------------------------
V.Create = function()

	local screenW = display.contentWidth
	local screenH = display.contentHeight

	-- HORIZONTAL SLIDER
	_G.GUI.NewSlider(
		{
		x                 = "center",
		y                 = screenH*.2,
		name              = "SLD_1",
		width             = "50%",
		scale             = _G.GUIScale,
		vertical          = false,
		parentGroup       = nil,
		theme             = _G.theme,
		minValue          = 1,
		maxValue          = 50,
		value             = 10,
		step              = 1,
		alwaysShowBubble  = false,-- KEEP BUBBLE ALWAYS VISIBLE?
		tickStep          = 2,    -- SET TO NIL OR < 2 TO HIDE TICKS
		textFormatter     = function(value) return "My Value: "..value end,
		onChange          = function(EventData) print(EventData.value) end,
		onPress           = function(EventData) print("Pressed!") end,
		onRelease         = function(EventData) print("Released!") end,
		} )

	-- HORIZONTAL SLIDER, REVERSED
	_G.GUI.NewSlider(
		{
		x                 = "center",
		y                 = screenH*.35,
		name              = "SLD_2",
		width             = "50%",
		scale             = _G.GUIScale,
		vertical          = false,
		parentGroup       = nil,
		theme             = _G.theme,
		minValue          = 1,
		maxValue          = 50,
		value             = 10,
		step              = 1,
		tickStep          = 0,  -- SET TO NIL OR < 2 TO HIDE TICKS
		reversed          = true,-- SET TO "REVERSED" DRAG MODE
		textFormatter     = function(value) return "My Value: "..value end,
		onChange          = function(EventData) print(EventData.value) end,
		onPress           = function(EventData) print("Pressed!") end,
		onRelease         = function(EventData) print("Released!") end,
		} )

	-- VERTICAL SLIDER
	_G.GUI.NewSlider(
		{
		x                 = screenW*.4,
		y                 = screenH*.5,
		name              = "SLD_3",
		height            = "25%",
		scale             = _G.GUIScale,
		vertical          = true,
		parentGroup       = nil,
		theme             = _G.theme,
		minValue          = 0,
		maxValue          = 50,
		value             = 10,
		step              = 10,
		tickStep          = 10,  -- SET TO NIL OR < 2 TO HIDE TICKS
		textFormatter     = function(value) return "My Value: "..value end,
		onChange          = function(EventData) print(EventData.value) end,
		onPress           = function(EventData) print("Pressed!") end,
		onRelease         = function(EventData) print("Released!") end,
		} )

	-- VERTICAL SLIDER, REVERSED
	_G.GUI.NewSlider(
		{
		x                 = screenW*.55,
		y                 = screenH*.5,
		name              = "SLD_4",
		height            = "25%",
		scale             = _G.GUIScale,
		vertical          = true,
		parentGroup       = nil,
		theme             = _G.theme,
		minValue          = 0,
		maxValue          = 50,
		value             = 10,
		step              = 10,
		reversed          = true,-- SET TO "REVERSED" DRAG MODE
		tickStep          = 0,   -- SET TO NIL OR < 2 TO HIDE TICKS
		textFormatter     = function(value) return "My Value: "..value end,
		onChange          = function(EventData) print(EventData.value) end,
		onPress           = function(EventData) print("Pressed!") end,
		onRelease         = function(EventData) print("Released!") end,
		} )

end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() 
	_G.GUI.GetHandle("SLD_1"):destroy()
	_G.GUI.GetHandle("SLD_2"):destroy()
	_G.GUI.GetHandle("SLD_3"):destroy()
	_G.GUI.GetHandle("SLD_4"):destroy()
end

return V
