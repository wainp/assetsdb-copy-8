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

	-- NOW CREATE RADIO BUTTTONS, ALSO USING THE SAME WIDGET GROUP ("MyGroup1")
	for i = 1, 4 do
		-- CREATE A RADIO BUTTON
		_G.GUI.NewRadiobutton(
			{
			x               = "center",                
			y               = display.contentHeight *.2 + (i*34)*_G.GUIScale, 
			width           = "50%",
			scale           = _G.GUIScale,
			name            = "RAD_"..i,            
			parentGroup     = nil,                     
			theme           = _G.theme, 
			caption         = "This is radio button number "..i,
			textColor       = {1,1,1},
			textAlign       = "right",
			toggleState     = i == 1 and true or false,
			toggleGroup     = "RadioGroup1",
			group           = "MyGroup1",
			onPress         = function(EventData) print(EventData.toggleState) end,
			--onRelease       = function(EventData) print("Released!") end,
			} )
	end
	
	-- WE'VE DRAWN THE BORDER FIRST TO LET IT APPEAR -BEHIND- THE RADIO BUTTONS
	-- NOW UPATE THE BORDER WIDGET AND IT WILL AUTOMATICALLY RESIZE TO THE
	-- PROPORTIONS OF THE "MyGroup1" WIDGET GROUP, BECAUSE IT HAS THE SAME
	-- GROUP NAME ASSIGNED AS THE RADIO BUTTONS ABOVE:
	_G.GUI.GetHandle("BORDER"):update()

	-- BUTTON: SET RADIO BUTTON PROGRAMMATICALLY
	_G.GUI.NewButton(
		{
		x               = "center",                
		y               = "bottom",                
		width           = "50%",                   
		scale           = _G.GUIScale,
		name            = "BUT_SIMPLE",            
		parentGroup     = nil,                     
		theme           = _G.theme,               
		caption         = "Select First Option", 
		textAlign       = "center",                  
		icon            = 20,
		border          = {"shadow", 8,8, .25},
		onPress         = function(EventData) 
					_G.GUI.GetHandle("RAD_1"):set("toggleState", true)
				  end,
		} )

end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() 
	for i = 1,4 do _G.GUI.GetHandle("RAD_"..i):destroy() end 
	_G.GUI.GetHandle("BORDER"):destroy() 
	_G.GUI.GetHandle("BUT_SIMPLE"):destroy()
end

return V
