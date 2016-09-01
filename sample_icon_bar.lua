-- WHEN A SAMPLE HAS BEEN CHOSEN FROM THE LIST, MAIN.LUA LOADS A SAMPLE
-- CODE AND CALLS ITS Create() FUNCTION. TAPPING THE BACK BUTTON 
-- (ALSO CREATED IN MAIN.LUA) CALLS THE Remove() FUNCTION OF THE LOADED 
-- SAMPLE CODE TO REMOVE THE SAMPLE WIDGETS AGAIN. 

local V = {}

----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA AND CREATES THE WIDGET
----------------------------------------------------------------
V.Create = function()

	-- CREATE A HORIZONTAL BAR
	_G.GUI.NewIconBar(
		{
		x               = "right",                
		y               = "bottom",                
		width           = "90%",
		height          = 60,
		scale           = _G.GUIScale,
		name            = "BAR1",            
		parentGroup     = nil,                     
		theme           = "theme_1",               
		border          = {"normal",6,1, .37,.37,.37,1,  .72,.72,.72,.58}, 
		bgImage         = {"images/iconbar_background.png", .45, "add" },
		marker          = {8,1, 1,1,1,.39,  0,0,0,.19}, 
		glossy		= 0,
		iconSize        = 32,
		fontSize        = 15,
		textColor       = {.25,.25,.25},
		textColorActive = {1,1,1},
		textAlign       = "bottom",
		iconAlign       = "top",
		icons           = 
			{
				{icon = 7 , flipX = false, text = "OPTION 1"},
				{icon = 8 , flipX = false, text = "OPTION 2"},
				{icon = 18, flipX = false, text = "OPTION 3"},
				{icon = 38, flipX = true , text = "OPTION 4"},
				{icon = 21, flipX = false, text = "OPTION 5"},
			},
		onPress         = function(EventData) print("ICON "..EventData.selectedIcon.." PRESSED!") end, 
		-- onRelease    = function(EventData) EventData.Widget:setMarker(0) end,
		} )

	-- SELECT ICON NUMBER 2
	_G.GUI.GetHandle("BAR1"):setMarker(2)

		
		
	-- CREATE A VERTICAL BAR, USING CUSTOM IMAGES
	_G.GUI.NewIconBar(
		{
		x               = "right",                
		y               = "top",                
		width           = 60,
		height          = 250,
		scale           = _G.GUIScale,
		name            = "BAR2",            
		parentGroup     = nil,                     
		theme           = "theme_1",               
		border          = {"normal",6,1, .07,.07,0,.39,  .72,.72,.72,.58}, 
		marker          = {8,1, 1,1,1,.39,  0,0,0,.19}, 
		glossy          = .15,
		iconSize        = 32,
		fontSize        = 15,
		textColor       = {.6,.6,.6},
		textColorActive = {1,1,1},
		textAlign       = "right",
		iconAlign       = "left",
		icons           = 
			{
				{image = "images/custom_icon1.png", baseDir = system.ResourceDirectory, text = "ICON 1" },
				{image = "images/custom_icon2.png", baseDir = system.ResourceDirectory, text = "ICON 2" },
				{image = "images/custom_icon3.png", baseDir = system.ResourceDirectory, text = "ICON 3" },
				{image = "images/custom_icon4.png", baseDir = system.ResourceDirectory, text = "ICON 4" },
			},
		onPress         = function(EventData) print("ICON "..EventData.selectedIcon.." PRESSED!")  end,
		-- onRelease    = function(EventData) EventData.Widget:setMarker(0) end,
		} )

	-- SELECT ICON NUMBER 1
	_G.GUI.GetHandle("BAR2"):setMarker(1)

end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() 
	_G.GUI.GetHandle("BAR1"):destroy() 
	_G.GUI.GetHandle("BAR2"):destroy() 
end

return V
