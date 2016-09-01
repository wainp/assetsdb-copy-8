-- WHEN A SAMPLE HAS BEEN CHOSEN FROM THE LIST, MAIN.LUA LOADS A SAMPLE
-- CODE AND CALLS ITS Create() FUNCTION. TAPPING THE BACK BUTTON 
-- (ALSO CREATED IN MAIN.LUA) CALLS THE Remove() FUNCTION OF THE LOADED 
-- SAMPLE CODE TO REMOVE THE SAMPLE WIDGETS AGAIN. 

local V = {}

----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA AND CREATES THE WIDGET
----------------------------------------------------------------
V.Create = function()

	V.gradientColors1 = 
		{
		{1,1,0, .07},
		{1,0,1, .07},
		{0,1,1, .07},
		{0,1,0, .07},
		{1,1,1, .07},
		}

	V.gradientColors2 = 
		{
		{1,1,0, .07},
		{1,0,1, .07},
		{0,1,1, .07},
		{0,1,0, .07},
		{1,1,1, .07},
		}
		
	V.directions = {"up","down","left","right"}
		
	-- CREATE A WINDOW
	_G.GUI.NewWindow(
		{
		x               = "center",
		y               = "center",
		scale           = _G.GUIScale,
		parentGroup     = nil,
		width           = 350,
		height          = _G.isTablet == true and 80 or 200,
		minHeight       = 50,
		theme           = _G.theme,
		name            = "WIN_SAMPLE",
		caption         = "WINDOW COLOR GRADIENTS",
		textAlign       = "center",
		icon            = 38,

		margin          = 20,
		shadow          = true,
		closeButton     = true,
		dragX           = true,
		dragY           = true,
		slideOut        = .7,
		dragArea        = "auto",
		onClose         = function(EventData) _G.UnloadSample() end,
		} )

	-- TEXT
	_G.GUI.NewText(
		{
		x               = "auto",                
		y               = "auto", 
		width           = "100%",
		height          = "auto",
		name            = "TXT_1",            
		parentGroup     = "WIN_SAMPLE",                     
		theme           = _G.theme, 
		caption         = "Beside tinting widgets using their 'color' property, you can additionally apply a colored background gradient to window widgets by using the 'gradientColor' property. Click the button below to apply different color gradients:",
		textColor       = {0,0,0},
		textAlign       = "center",
		bottomMargin    = 10,
		} )
	
	-- BUTTON
	_G.GUI.NewButton(
		{
		x               = "center",                
		y               = "auto",
		width           = 150,
		name            = "BUT_ALIGN",            
		parentGroup     = "WIN_SAMPLE",                     
		theme           = _G.theme, 
		caption         = "Change Color",
		icon            = 38,
		onPress         = function(EventData) 
					-- CHANGE WINDOW GRADIENT
					_G.GUI.GetHandle("WIN_SAMPLE"):set(
						{
						gradientColor1    = V.gradientColors1[math.random(#V.gradientColors1)],
						gradientColor2    = V.gradientColors2[math.random(#V.gradientColors2)],
						gradientDirection = V.directions[math.random(#V.directions)],
						})
					_G.GUI.GetHandle("WIN_SAMPLE"):update()
				  end,
		} )	
		
	_G.GUI.GetHandle("WIN_SAMPLE"):layout(true)
end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() 
	_G.GUI.GetHandle("WIN_SAMPLE"):destroy() 
end

return V
