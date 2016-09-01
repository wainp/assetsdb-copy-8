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

	local names   = {"Jane Doe","Kim Lee","Joan Doe","Sarah Woods","John Handsome","T. J. Hooker","Bello","Frank Coder","Angry Girl","Maya Man"}

	-- CREATE A TABLE TO FILL THE LIST
	V.ListData = { }
	for i = 1, 10 do
		table.insert(V.ListData, 
			{ 
			caption   = "This is Item "..i.."\nName: "..names[i], 
			anyData   = "Item "..i,
			image     = "images/image_user"..i..".jpg", -- IMAGE FILE TO BE USED FOR THIS ITEM
			imageSize = 60,                             -- DEFAULT IS ICON SIZE (AS DEFINED IN THEME.LUA)
			baseDir   = system.ResourceDirectory,       -- IMAGE FILE BASE DIRECTORY (F.E. system.DocumentsDirectory ETC. )
			} )
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
		caption           = "Using Custom Images",
		list              = V.ListData,      
		itemHeight        = 80,                        -- NEW: SET HEIGHT OF LIST ITEMS
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
		x               = "center",                
		y               = "bottom",                
		width           = "70%",                   
		scale           = _G.GUIScale,
		name            = "BUT_SIMPLE",            
		parentGroup     = nil,                     
		theme           = _G.theme,               
		caption         = "Add  Remove List's Title Caption", 
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
	_G.GUI.GetHandle("BUT_SIMPLE"):destroy()
	V.ListData = nil
end

return V
