-- WHEN A SAMPLE HAS BEEN CHOSEN FROM THE LIST, MAIN.LUA LOADS A SAMPLE
-- CODE AND CALLS ITS Create() FUNCTION. TAPPING THE BACK BUTTON 
-- (ALSO CREATED IN MAIN.LUA) CALLS THE Remove() FUNCTION OF THE LOADED 
-- SAMPLE CODE TO REMOVE THE SAMPLE WIDGETS AGAIN. 

local V = {}

----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA AND CREATES THE WIDGET
----------------------------------------------------------------
V.Create = function()

	V.numButtons = 1

	-- CREATE A WINDOW
	_G.GUI.NewWindow(
		{
		x               = "center",
		y               = "center",
		scale           = _G.GUIScale,
		parentGroup     = nil,
		width           = 265,
		height          = "auto",
		minHeight       = 40,
		theme           = _G.theme,
		name            = "WIN_SAMPLE",
		caption         = "LAYOUT SAMPLE",
		textAlign       = "center",
		icon            = 19,

		margin          = 20,
		shadow          = true,
		closeButton     = true,
		dragX           = true,
		dragY           = true,
		slideOut        = .7,
		dragArea        = "auto",
		onPress         = function(EventData) print("WINDOW PRESSED!") end,
		onDrag          = function(EventData) print("WINDOW DRAGGED!") end,
		onRelease       = function(EventData) print("WINDOW RELEASED!") end,
		onClose         = function(EventData) EventData.Widget:show(false, true) end,
		} )

	-- BUTTON: ADD A NEW BUTTON
	_G.GUI.NewButton(
		{
		x               = "center",  
		y               = "bottom",
		width           = "33%", 
		scale           = _G.GUIScale,
		name            = "BUT_ADD",            
		parentGroup     = nil,                     
		theme           = _G.theme,               
		caption         = "Add New Button", 
		textAlign       = "center",                  
		icon            = 7,        
		onPress         = function(EventData)
					_G.GUI.GetHandle("WIN_SAMPLE"):show(true, true)
					-- ADD A NEW BUTTON TO THE WINDOW
					V.numButtons = V.numButtons + 1
					_G.GUI.NewButton(
						{
						x               = "auto",        -- CALCULATE THE BUTTON'S X-POSITION AUTOMATICALLY WHEN ARRANGING THE WINDOW'S WIDGETS         
						y               = "auto",        -- CALCULATE THE BUTTON'S Y-POSITION AUTOMATICALLY WHEN ARRANGING THE WINDOW'S WIDGETS               
						includeInLayout = true,          -- INCLUDE THIS BUTTON IN AUTOMATIC WIDGET LAYOUT
						rightMargin     = 5,             -- MARGIN OF 5 PIXELS BETWEEN THIS WIDGET AND THE NEXT ONE

						width           = 110, 
						name            = "BUT_"..V.numButtons,            
						parentGroup     = "WIN_SAMPLE",                     
						theme           = _G.theme,               
						caption         = "Button "..V.numButtons, 
						textAlign       = "left",                  
						icon            = 9,        
						} )
					-- ARRANGE WINDOW WIDGETS
					_G.GUI.GetHandle("WIN_SAMPLE"):layout(true) 

				  end,
		onRelease       = function(EventData) end,
		} )
	
end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() 
	_G.GUI.GetHandle("WIN_SAMPLE"):destroy() 
	_G.GUI.GetHandle("BUT_ADD"):destroy() 
end

return V
