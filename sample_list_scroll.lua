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
		table.insert(V.ListData, { iconL = 20, caption = "This is Item "..i, anyData = "Item "..i } )
	end

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
		list              = V.ListData,               
		allowDelete       = true,      
		readyCaption      = "Quit Editing",   
		border            = {"shadow", 8,8, .25},
		onSelect          = function(EventData)
					local List = EventData.List
					local num  = EventData.selectedIndex
					print("Selected Item Number: "..num.." customData: "..List[num].anyData)
				end,
		} )

	-- BUTTON: ADD REMOVE LIST'S CAPTION
	_G.GUI.NewButton(
		{
		x               = "17%",                
		y               = "bottom",                
		width           = "33%",                   
		scale           = _G.GUIScale,
		name            = "BUT_1",            
		parentGroup     = nil,                     
		theme           = _G.theme,               
		caption         = "Scroll Top", 
		textAlign       = "center",                  
		icon            = 20,
		toggleButton    = false,
		toggleState     = false,
		border          = {"shadow", 8,8, .25},
		onRelease       = function(EventData)
							-- SCROLL LIST TO ITEM 1
							_G.GUI.GetHandle("LST_SAMPLE"):scrollTo(1)
						  end,
		} )

	-- BUTTON: ADD REMOVE LIST'S CAPTION
	_G.GUI.NewButton(
		{
		x               = "50%",                
		y               = "bottom",                
		width           = "33%",                   
		scale           = _G.GUIScale,
		name            = "BUT_2",            
		parentGroup     = nil,                     
		theme           = _G.theme,               
		caption         = "Scroll +1", 
		textAlign       = "center",                  
		icon            = 20,
		toggleButton    = false,
		toggleState     = false,
		border          = {"shadow", 8,8, .25},
		onRelease       = function(EventData)
							-- MOVE LIST UP BY 1 ITEM
							_G.GUI.GetHandle("LST_SAMPLE"):scrollBy(1)
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
