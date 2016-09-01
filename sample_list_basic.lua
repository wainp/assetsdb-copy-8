-- WHEN A SAMPLE HAS BEEN CHOSEN FROM THE LIST, MAIN.LUA LOADS A SAMPLE
-- CODE AND CALLS ITS Create() FUNCTION. TAPPING THE BACK BUTTON 
-- (ALSO CREATED IN MAIN.LUA) CALLS THE Remove() FUNCTION OF THE LOADED 
-- SAMPLE CODE TO REMOVE THE SAMPLE WIDGETS AGAIN. 

local V = {}

----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA AND CREATES THE WIDGET
----------------------------------------------------------------
V.Create = function()

	local screenH = display.contentHeight

	-- CREATE A TABLE TO FILL THE LIST
	V.ListData = { }
	for i = 1, 60 do
		table.insert(V.ListData, 
			{ 
			iconL      = 20, 
			caption    = "This is list Item "..i, 
			anyData    = "Item "..i 
			} )
	end
	V.ListData[1].iconR = 11

	-- CREATE A LIST
	_G.GUI.NewList(
		{
		x                 = "center",               
		y                 = 20,               
		width             = "70%",                  
		height            = "75%",                  
		scale             = _G.GUIScale,
		parentGroup       = nil,                    
		theme             = _G.theme,              
		name              = "LST_SAMPLE",             
		caption           = "Simple List",
		scrollbar         = "onScroll",
		list              = V.ListData,               
		allowDelete       = true,      
		readyCaption      = "Quit Editing", 
		fontSize          = 16,
		border            = {"shadow", 8,8, .25},
		onSelect          = function(EventData)
					local List = EventData.List
					local num  = EventData.selectedIndex
					print("Selected item number: "..num.." customData: "..List[num].anyData)
				    end,
		onItemRemove      = function(EventData) print("Removing item at position "..EventData.pos) end,
		onIconPress       = function(EventData) print("Clicked icon at position "..EventData.selectedIndex) end,
		onIconPressR      = function(EventData) print("Clicked right icon at position "..EventData.selectedIndex) end,
		} )

	-- BUTTON: ADD REMOVE LIST'S CAPTION
	_G.GUI.NewButton(
		{
		x               = "10%",                
		y               = "bottom",                
		width           = "40%",                   
		scale           = _G.GUIScale,
		name            = "BUT_1",            
		parentGroup     = nil,                     
		theme           = _G.theme,               
		caption         = "Add / Remove Title", 
		fontSize        = 14,
		textAlign       = "center",                  
		icon            = 20,
		toggleButton    = true,
		toggleState     = false,
		border          = {"shadow", 8,8, .25},
		onRelease       = function(EventData) 
					if EventData.Props.toggleState == true then
						_G.GUI.GetHandle("LST_SAMPLE"):set("caption", "")
					else
						_G.GUI.GetHandle("LST_SAMPLE"):set("caption", "Simple List")
					end
				  end,
		} )

	-- BUTTON: SHOW / HIDE SCROLLBAR
	_G.GUI.NewButton(
		{
		x               = "50%",                
		y               = "bottom",                
		width           = "40%",                   
		scale           = _G.GUIScale,
		name            = "BUT_2",            
		parentGroup     = nil,                     
		theme           = _G.theme,               
		caption         = "Show / Hide Scrollbar",
		fontSize        = 14,
		textAlign       = "center",                  
		icon            = 20,
		toggleButton    = true,
		toggleState     = false,
		border          = {"shadow", 8,8, .25},
		onRelease       = function(EventData) 
					-- POSSIBLE SCROLLBAR PROPERTIES: "always"|"onScroll"|"never"
					if EventData.Props.toggleState == true then
						_G.GUI.GetHandle("LST_SAMPLE"):set("scrollbar", "always")
					else
						_G.GUI.GetHandle("LST_SAMPLE"):set("scrollbar", "never")
					end
				  end,
		} )

end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() 
	_G.GUI.GetHandle("LST_SAMPLE"):destroy()
	_G.GUI.GetHandle("BUT_1"):destroy()
	_G.GUI.GetHandle("BUT_2"):destroy()
	V.ListData = nil
end

return V
