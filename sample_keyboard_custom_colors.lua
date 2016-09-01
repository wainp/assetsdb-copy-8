-- WHEN A SAMPLE HAS BEEN CHOSEN FROM THE LIST, MAIN.LUA LOADS A SAMPLE
-- CODE AND CALLS ITS Create() FUNCTION. TAPPING THE BACK BUTTON 
-- (ALSO CREATED IN MAIN.LUA) CALLS THE Remove() FUNCTION OF THE LOADED 
-- SAMPLE CODE TO REMOVE THE SAMPLE WIDGETS AGAIN. 

local V = {}

----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA AND CREATES THE WIDGET
----------------------------------------------------------------
V.Create = function()

	-- BUTTONS
	_G.GUI.NewButton(
		{
		x               = "center",                
		y               = "10%",                
		width           = "60%",                   
		scale           = _G.GUIScale,
		name            = "BUT_1", 
		parentGroup     = nil,                     
		theme           = _G.theme,               
		caption         = "Widget Candy default", 
		textAlign       = "center",                  
		icon            = 38,  
		border          = {"shadow", 8,8, .25},
		onRelease       = function(EventData)  
					_G.GUI.Keyboard_Show(
						{
						height = "50%",
						onType = function(EventData) print("TYPE: "..EventData.char) end,
						onOK   = function(EventData) print("OK!") end,	
						} )
				end,
		} )

	_G.GUI.NewButton(
		{
		x               = "center",                
		y               = "30%",                
		width           = "60%",                   
		scale           = _G.GUIScale,
		name            = "BUT_2", 
		parentGroup     = nil,                     
		theme           = _G.theme,               
		caption         = "Custom style example 1", 
		textAlign       = "center",                  
		icon            = 38,  
		border          = {"shadow", 8,8, .25},
		onRelease       = function(EventData)  
					_G.GUI.Keyboard_Show(
						{
						height        = "50%",
						glossy        = true,
						corners       = 4,
						bgColor       = {.4,.3,.4, 1},
						charColor1    = {1,1,1, 1},	
						charColor2    = {.5,.8,1, 1},	
						keyColor1     = {.6,.4,.6, .75},
						keyColor2     = {.4,.2,.4, .75},
						keyStroke     = {2, 1,.5,1, .5},	
						pressColor    = {1,0,1, .5},	
						onType        = function(EventData) print("TYPE: "..EventData.char) end,
						onOK          = function(EventData) print("OK!") end,	
						} )
				end,
		} )

	_G.GUI.NewButton(
		{
		x               = "center",                
		y               = "50%",                
		width           = "60%",                   
		scale           = _G.GUIScale,
		name            = "BUT_3", 
		parentGroup     = nil,                     
		theme           = _G.theme,               
		caption         = "Custom style example 2", 
		textAlign       = "center",                  
		icon            = 38,  
		border          = {"shadow", 8,8, .25},
		onRelease       = function(EventData)  
					_G.GUI.Keyboard_Show(
						{
						height        = "50%",
						glossy        = false,
						corners       = 0,
						bgColor       = {.15,.1,.1, .9},
						charColor1    = {1,1,.9, .8},	
						charColor2    = {.8,1,1, .8},	
						keyColor1     = {.4,.5,.5, .75},
						keyColor2     = {.2,.3,.3, .75},
						keyStroke     = {2, .9,1,1, .5},	
						pressColor    = {1,1,1, .5},	
						onType        = function(EventData) print("TYPE: "..EventData.char) end,
						onOK          = function(EventData) print("OK!") end,	
						} )
				end,
		} )

	-- CREATE A TEXT
	_G.GUI.NewText(
		{
		x               = "center",                
		y               = "bottom", 
		width           = "70%",
		scale           = _G.GUIScale,
		height          = "auto",
		name            = "TXT_1",            
		parentGroup     = nil,                     
		theme           = _G.theme, 
		caption         = "You can define custom colors for the char keys and the function keys, as well as custom key icons, rounded corners, a glossy shine effect, highlight color, text color, color of the char sub menu texts and more..!",
		textAlign       = "left",
		textColor       = {1,1,1},
		border          = {"normal",4,1, .5,.5,.5,.5, 1,1,1,1},
		} )

end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() 
	_G.GUI.GetHandle("BUT_1"):destroy() 
	_G.GUI.GetHandle("BUT_2"):destroy() 
	_G.GUI.GetHandle("BUT_3"):destroy() 
	_G.GUI.GetHandle("TXT_1"):destroy() 
end

return V
