-- WHEN A SAMPLE HAS BEEN CHOSEN FROM THE LIST, MAIN.LUA LOADS A SAMPLE
-- CODE AND CALLS ITS Create() FUNCTION. TAPPING THE BACK BUTTON 
-- (ALSO CREATED IN MAIN.LUA) CALLS THE Remove() FUNCTION OF THE LOADED 
-- SAMPLE CODE TO REMOVE THE SAMPLE WIDGETS AGAIN. 

local V = {}

----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA AND CREATES THE WIDGET
----------------------------------------------------------------
V.Create = function()

	-- CREATE A PROGRESS BAR
	_G.GUI.NewProgBar(
		{
		x               = "center",                
		y               = display.contentHeight *.3, 
		width           = "50%",
		scale           = _G.GUIScale,
		name            = "BAR1",            
		parentGroup     = nil,                     
		theme           = _G.theme, 
		caption         = " ",    -- INITIAL CAPTION
		value           = .5,            -- 0.0 - 1.0
		textColor       = {1,1,1},
		textFormatter   = function(value) valueToDisplay = "My value: "..math.floor(value*100).."%"; return valueToDisplay end,
		} )

	-- CREATE A DRAGGABLE (INTERACTIVE) PROGRESS BAR, 
	_G.GUI.NewProgBar(
		{
		x               = "center",                
		y               = display.contentHeight *.5, 
		width           = "50%",
		scale           = _G.GUIScale,
		name            = "BAR2",            
		parentGroup     = nil,                     
		theme           = _G.theme, 
		caption         = "Drag me!",    -- INITIAL CAPTION
		value           = .5,            -- 0.0 - 1.0
		textColor       = {1,1,1},
		textFormatter   = function(value) valueToDisplay = "Drag me: "..math.floor(value*100).."%"; return valueToDisplay end,

		allowDrag       = true,
		onPress         = function(EventData) print("Pressed!") end,
		onDrag          = function(EventData) print(EventData.value) end,
		onRelease       = function(EventData) print("Released!") end,
		} )
	
	_G.GUI.NewText(
		{
		x               = "center",                
		y               = display.contentHeight *.7, 
		width           = "50%",
		scale           = _G.GUIScale,
		name            = "TXT",            
		parentGroup     = nil,                     
		theme           = _G.theme, 
		caption         = "Set the .allowDrag property of the bar to true to make it draggable. ",
		textAlign       = "center",
		textColor       = {1,1,1},
		} )

	-- UPDATE PROGRESS BAR
	V.Timer = timer.performWithDelay(1000, function()
		local Bar = _G.GUI.GetHandle("BAR1")
		local v   = Bar:get("value")
		if v < 1.0 then v = v + .1 else v = 0 end
		Bar:set("value", v)
	end , 0)
end

----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() 
	timer.cancel(V.Timer)
	_G.GUI.GetHandle("BAR1"):destroy()
	_G.GUI.GetHandle("BAR2"):destroy()
	_G.GUI.GetHandle("TXT"):destroy()
end

return V
