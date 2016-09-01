-- WHEN A SAMPLE HAS BEEN CHOSEN FROM THE LIST, MAIN.LUA LOADS A SAMPLE
-- CODE AND CALLS ITS Create() FUNCTION. TAPPING THE BACK BUTTON 
-- (ALSO CREATED IN MAIN.LUA) CALLS THE Remove() FUNCTION OF THE LOADED 
-- SAMPLE CODE TO REMOVE THE SAMPLE WIDGETS AGAIN. 

local V = {}

----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA AND CREATES THE WIDGET
----------------------------------------------------------------
V.Create = function()

	-- ADD A BORDER WIDGET
	_G.GUI.NewBorder(
		{
		name              = "BORDER",
		parentGroup       = nil,
		name              = "BORDER",
		theme             = _G.theme,
		group             = "MyGroup1", -- ADD BORDER TO GROUP "MyGroup1" (SAME GROUP AS THE RADIO BUTTONS)
		border            = {"inset",4,1, .96,1,.96,.19}, 
		} )

	-- CREATE A CHECKBOX
	_G.GUI.NewCheckbox(
		{
		x               = "center",                
		y               = display.contentHeight *.4, 
		width           = "50%",
		scale           = _G.GUIScale,
		name            = "CHK_1",            
		parentGroup     = nil,                     
		theme           = _G.theme, 
		caption         = "This is a checkbox.",
		textAlign       = "right",
		textColor       = {1,1,1},
		toggleState     = true,
		group           = "MyGroup1",
		
		onPress         = function(EventData) print(EventData.toggleState) end,
		--onRelease       = function(EventData) print("Released!") end,
		} )

	_G.GUI.NewCheckbox(
		{
		x               = "center",                
		y               = _G.GUI.GetHandle("CHK_1").y + _G.GUI.GetHandle("CHK_1").contentHeight, 
		width           = "50%",
		scale           = _G.GUIScale,
		name            = "CHK_2",            
		parentGroup     = nil,                     
		theme           = _G.theme, 
		caption         = "This is another checkbox.",
		textColor       = {1,1,1},
		textAlign       = "right",
		group           = "MyGroup1",

		onPress         = function(EventData) print(EventData.toggleState) end,
		--onRelease       = function(EventData) print("Released!") end,
		} )

	-- WE'VE DRAWN THE BORDER FIRST TO LET IT APPEAR -BEHIND- THE RADIO BUTTONS
	-- NOW UPATE THE BORDER WIDGET AND IT WILL AUTOMATICALLY RESIZE TO THE
	-- PROPORTIONS OF THE "MyGroup1" WIDGET GROUP, BECAUSE IT HAS THE SAME
	-- GROUP NAME ASSIGNED AS THE RADIO BUTTONS ABOVE:
	_G.GUI.GetHandle("BORDER"):update()

	-- BUTTON: SET CHECKBOX PROGRAMMATICALLY
	_G.GUI.NewButton(
		{
		x               = "center",                
		y               = "bottom",                
		width           = "50%",                   
		scale           = _G.GUIScale,
		name            = "BUT_SIMPLE",            
		parentGroup     = nil,                     
		theme           = _G.theme,               
		caption         = "Toggle First Checkbox", 
		textAlign       = "center",                  
		icon            = 20,
		border          = {"shadow", 8,8, .25},
		onPress         = function(EventData) 
							local state = not _G.GUI.GetHandle("CHK_1"):get("toggleState")
							_G.GUI.GetHandle("CHK_1"):set("toggleState", state)
						  end,
		} )

end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() 
	_G.GUI.GetHandle("CHK_1"):destroy()
	_G.GUI.GetHandle("CHK_2"):destroy()
	_G.GUI.GetHandle("BORDER"):destroy()
	_G.GUI.GetHandle("BUT_SIMPLE"):destroy()
end

return V
