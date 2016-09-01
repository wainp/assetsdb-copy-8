-- WHEN A SAMPLE HAS BEEN CHOSEN FROM THE LIST, MAIN.LUA LOADS A SAMPLE
-- CODE AND CALLS ITS Create() FUNCTION. TAPPING THE BACK BUTTON 
-- (ALSO CREATED IN MAIN.LUA) CALLS THE Remove() FUNCTION OF THE LOADED 
-- SAMPLE CODE TO REMOVE THE SAMPLE WIDGETS AGAIN. 

local V = {}

----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA AND CREATES THE WIDGET
----------------------------------------------------------------
V.Create = function()

	local screenH   = display.contentHeight
	local screenW   = display.contentWidth
	local listWidth = screenW - 100

	-- CREATE A TABLE OF DISPLAY GROUPS & ITEMS TO FILL THE LIST
	V.ListData = { }
	for i = 1, 60 do
		local Group, Tmp
		-- CREATE A GROUP THAT CONTAINS OBJECTS LIKE TEXTS, SHAPES, IMAGES ETC.
		-- DO NOT FORGET TO DELETE THESE GROUPS FROM MEMORY WHEN PURGING YOUR LIST
		-- (SEE REMOVE FUNCTION AT THE BOTTOM OF THIS FILE)
		Group  = display.newGroup()
		Group.anchorX = 0
		Group.anchorY = 0
		-- ADD A BIG TEXT
		Tmp = display.newText (Group, "This is item "..i, 0,0, listWidth,40, native.systemFontBold,18)
		Tmp.anchorX = 0
		Tmp.anchorY = 0
		Tmp:setFillColor(1,0,1)
		-- ADD A SMALLER TEXT
		Tmp = display.newText (Group, "Description of item "..i, 0,20, listWidth,40, native.systemFont,14)
		Tmp.anchorX = 0
		Tmp.anchorY = 0
		Tmp:setFillColor(.15,.15,.15)
		-- ADD VERTICAL DIVIDER LINES
		Tmp = display.newLine(Group, 190,2, 190,36); Tmp.strokeWidth = 1; Tmp:setStrokeColor(.31,.31,.31)
		Tmp.anchorX = 0
		Tmp.anchorY = 0
		Tmp = display.newLine(Group, 191,2, 191,36); Tmp.strokeWidth = 1; Tmp:setStrokeColor(.86,.86,.86)	
		Tmp.anchorX = 0
		Tmp.anchorY = 0
		-- ADD IMAGE
		Tmp         = display.newImageRect(Group, "images/image_user"..math.random(10)..".jpg", 32,32)
		Tmp.anchorX = 0
		Tmp.anchorY = 0
		Tmp.x       = 200
		Tmp.y       = 4
		
		-- CREATE THE WIDGET'S LIST OF DATA
		table.insert(V.ListData, 
			{ 
			content    = Group, -- USE .content PROPERTY TO ATTACH OUR CUSTOM GROUP TO THIS LIST ITEM
			iconL      = 20, 
			anyData    = "Item "..i,
			} )
	end

	-- CREATE A LIST
	_G.GUI.NewCustomList(
		{
		x                 = "center",               
		y                 = 20,               
		width             = listWidth,                  
		height            = "75%",                  
		scale             = _G.GUIScale,
		parentGroup       = nil,                    
		theme             = _G.theme,              
		name              = "LST_SAMPLE",             
		caption           = "List with Custom Items",
		scrollbar         = "onScroll",
		list              = V.ListData,               
		allowDelete       = true,      
		readyCaption      = "Quit Editing", 
		border            = {"shadow", 8,8, .25},
		onSelect          = function(EventData)
					local List = EventData.List
					local num  = EventData.selectedIndex
					print("Selected item number: "..num.." customData: "..List[num].anyData)
				    end,
		onItemRemove      = function(EventData) print("Removed item at position "..EventData.pos) end,
		onIconPress       = function(EventData) print("Clicked icon at position "..EventData.selectedIndex) end,
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
						_G.GUI.GetHandle("LST_SAMPLE"):set("caption", "List with Custom Items")
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
	-- REMOVE THE WIDGETS
	_G.GUI.GetHandle("LST_SAMPLE"):destroy()
	_G.GUI.GetHandle("BUT_1"):destroy()
	_G.GUI.GetHandle("BUT_2"):destroy()
	
	-- IMPORTANT! REMOVE ALL ITEM DISPLAY GROUPS WE CREATED BEFORE, OTHERWISE THIS DATA REMAINS IN MEMORY
	for i = #V.ListData,1,-1 do
		if V.ListData[i].content ~= nil then 
			V.ListData[i].content:removeSelf() 
			V.ListData[i].content = nil
		end
		V.ListData[i] = nil
	end
	V.ListData = nil
end

return V
