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
			caption    = "Item "..i, 
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
		scrollbar         = "never",
		list              = V.ListData,               
		allowDelete       = true,      
		readyCaption      = "Quit Editing", 
		border            = {"shadow", 8,8, .25},
		onItemRemove      = function(EventData) print("Removed item at position "..EventData.pos) end,

		-- IF YOU SPECIFY AN EVENT LISTENER FUNCTION NAMED onItemRemoveRequest,
		-- LIST ITEMS ARE *NOT* REMOVED WHEN THE USER TAPS ON A DELETE ICON.
		-- INSTEAD, THIS LISTENER FUNCTION IS CALLED THEN. HERE WE DISPLAY
		-- A CONFIRMATION WINDOW TO LET THE USER CONFIRM THIS ACTION, THEN 
		-- DELETE THE WANTED ITEM -OR NOT:
		onItemRemoveRequest = function(EventData) 
				_G.GUI.Confirm(
					{
					customData    = {ListWidget = EventData.Widget, list = EventData.list, index = EventData.pos},
					name          = "WIN_CONFIRM1",
					modal         = true,
					theme         = _G.theme, 
					width         = "65%",
					height        = "auto",
					scale         = _G.GUIScale,
					icon          = 14,
					fadeInTime    = 500,
					title         = "Remove item '"..EventData.list[EventData.pos].caption.."'?",
					caption       = "Would you like to remove this item from the list?", 
					buttons       = { {icon = 15, caption = "Yes",}, {icon = 16, caption = "No" ,}, },
					onPress       = function(EventData)  end,
					onRelease     = function(EventData) 
								-- CLICKED 'YES' BUTTON?
								if EventData.button == 1 then
									EventData.customData.ListWidget:deleteItem(EventData.customData.list,EventData.customData.index, true) 
								end 
							end,
					} )
					end,
		} )


	-- BUTTON: ADD / REMOVE LIST'S CAPTION
	_G.GUI.NewButton(
		{
		x               = "center",                
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

end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() 
	_G.GUI.GetHandle("LST_SAMPLE"):destroy()
	_G.GUI.GetHandle("BUT_1"):destroy()
	V.ListData = nil
end

return V
