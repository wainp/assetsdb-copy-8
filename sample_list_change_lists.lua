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

	-- MAIN LIST
	V.ListMain = 
		{
			-- NO .parentList PROPERTY SET HERE (= NO BACK BUTTON DISPLAYED)
			parentList = nil, 
			{ iconL = 21, iconR = 6, caption = "Go to List A"},
			{ iconL = 22, iconR = 6, caption = "Go to List B"},
		}

	-- LIST A
	V.ListA = 
		{
			-- SETTING THE .parentList PROPERTY OF A LIST ARRAY
			-- WILL DISPLAY THE "BACK" BUTTON ON TOP OF THIS LIST 
			-- WHICH WILL SWAP BACK TO THE PARENT LIST WHEN TAPPED:
			parentList = V.ListMain,
			{ iconL = 21, caption = "This is List A, Item 1"},
			{ iconL = 21, caption = "This is List A, Item 2"},
			{ iconL = 21, caption = "This is List A, Item 3"},
		}

	-- LIST B
	V.ListB = 
		{
			-- SETTING THE .parentList PROPERTY OF A LIST ARRAY
			-- WILL DISPLAY THE "BACK" BUTTON ON TOP OF THIS LIST 
			-- WHICH WILL SWAP BACK TO THE PARENT LIST WHEN TAPPED:
			parentList = V.ListMain,
			{ iconL = 22, caption = "This is List B, Item 1"},
			{ iconL = 22, caption = "This is List B, Item 2"},
			{ iconL = 22, caption = "This is List B, Item 3"},
			{ iconL = 22, caption = "This is List B, Item 4"},
			{ iconL = 22, caption = "This is List B, Item 5"},
			{ iconL = 22, caption = "This is List B, Item 6"},
			{ iconL = 22, caption = "This is List B, Item 7"},
			{ iconL = 22, caption = "This is List B, Item 8"},
			{ iconL = 22, caption = "This is List B, Item 9"},
			{ iconL = 22, caption = "This is List B, Item 10"},
			{ iconL = 22, caption = "This is List B, Item 11"},
			{ iconL = 22, caption = "This is List B, Item 12"},
			{ iconL = 22, caption = "This is List B, Item 13"},
			{ iconL = 22, caption = "This is List B, Item 14"},
			{ iconL = 22, caption = "This is List B, Item 15"},
		}

	-- CREATE A LIST
	_G.GUI.NewList(
		{
		x                 = "center",               
		y                 = "center",               
		width             = "70%",                  
		height            = "70%",
		scale             = _G.GUIScale,
		parentGroup       = nil,                    
		theme             = _G.theme,              
		name              = "LST_SAMPLE",             
		caption           = "Replacing Lists",   
		list              = V.ListMain,               
		scrollbar         = "never",
		allowDelete       = true,                   
		readyCaption      = "Quit Editing",   
		border            = {"shadow", 8,8, .25},
		noSlide           = false,
		onSelect          = function(EventData)
								local Widget = EventData.Widget
								local List   = EventData.List
								local Item   = EventData.Item
								local num    = EventData.selectedIndex
								-- SWITCH TO LIST A OR B
								if List == V.ListMain then
									    if num == 1 then Widget:setList(V.ListA, "left")
									elseif num == 2 then Widget:setList(V.ListB, "left") end
								end
							end,
							
		onBackButton      = function(EventData)
								local Widget = EventData.Widget
								local List   = EventData.List
								local Item   = EventData.Item
								local num    = EventData.selectedIndex
		                    	print("BACK BUTTON PRESSED ON LIST "..Widget.Props.name)
		                    end,
		} )

end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() 
	_G.GUI.GetHandle("LST_SAMPLE"):destroy() 
	V.ListA.parentList = nil
	V.ListB.parentList = nil
	V.ListA    = nil
	V.ListB    = nil
	V.ListMain = nil
end

return V
