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

	-- TEXT LABEL
	_G.GUI.NewLabel(
		{
		x               = "center",
		y               = "bottom",
		scale           = _G.GUIScale,
		name            = "LBL_INFO",
		parentGroup     = nil,
		width           = "100%",
		theme           = _G.theme,
		caption         = "Click an option item to turn it on or off.",
		textAlign       = "center",
		textColor       = {1,1,1},
		} )

	-- LIST DATA
	V.ListData = 
		{
			{ iconL = 14, iconR = 4, caption = "Option 1", myValue = true },
			{ iconL = 14, iconR = 5, caption = "Option 2", myValue = false},
			{ iconL = 14, iconR = 4, caption = "Option 3", myValue = true },
			{ iconL = 14, iconR = 4, caption = "Option 4", myValue = true },
			{ iconL = 14, iconR = 5, caption = "Option 5", myValue = false},
			{ iconL = 14, iconR = 4, caption = "Option 6", myValue = true },
			{ iconL = 14, iconR = 5, caption = "Option 7", myValue = false},
			{ iconL = 14, iconR = 4, caption = "Option 8", myValue = true },
			{ iconL = 14, iconR = 4, caption = "Option 9", myValue = true},
		}


	-- CREATE A LIST
	_G.GUI.NewList(
		{
		x                 = "center",               
		y                 = "center",               
		width             = "70%",                  
		height            = "75%",
		scale             = _G.GUIScale,
		parentGroup       = nil,                    
		theme             = _G.theme,              
		name              = "LST_SAMPLE",             
		caption           = "Option Items",   
		list              = V.ListData,               
		allowDelete       = false,                   
		readyCaption      = "Quit Editing",   
		border            = {"shadow", 8,8, .25},
		onSelect          = function(EventData)
					local Widget = EventData.Widget
					local List   = EventData.List
					local Item   = EventData.Item
					local num    = EventData.selectedIndex

					Item.myValue = not Item.myValue
					Item.iconR   = Item.myValue == true and 4 or 5
					_G.GUI.GetHandle("LST_SAMPLE"):update()
					_G.GUI.GetHandle("LBL_INFO"  ):set("caption", Item.caption..": "..tostring(Item.myValue))
				end,
		} )

end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() 
	_G.GUI.GetHandle("LBL_INFO"  ):destroy() 
	_G.GUI.GetHandle("LST_SAMPLE"):destroy() 
	V.ListData = nil
end

return V
