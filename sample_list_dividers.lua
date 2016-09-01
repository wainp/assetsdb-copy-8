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

	-- LIST DATA
	V.ListData = 
		{
			{ iconR = 23, caption = "Category One" , textColor = {1,1,.39}, bgColor = {0,0,0}, selectable = false },
			{ iconL = 17, caption = "Item 1" },
			{ iconL = 17, caption = "Item 2" },
			{ iconL = 17, caption = "Item 3" },
			{ iconL = 17, caption = "Item 4" },
			{ iconR = 23, caption = "Category Two" , textColor = {1,1,.39}, bgColor = {0,0,0}, selectable = false },
			{ iconL = 18, caption = "Item 5" },
			{ iconL = 18, caption = "Item 6" },
			{ iconL = 18, caption = "Item 7" },
			{ iconL = 18, caption = "Item 8" },
			{ iconR = 23, caption = "Category Three" , textColor = {1,1,.39}, bgColor = {0,0,0}, selectable = false },
			{ iconL = 11, caption = "Item 9" },
			{ iconL = 11, caption = "Item 10" },
			{ iconL = 11, caption = "Item 11" },
			{ iconL = 11, caption = "Item 12" },
			{ iconR = 23, caption = "Category Four" , textColor = {1,1,.39}, bgColor = {0,0,0}, selectable = false },
			{ iconL = 15, caption = "Item 13" },
			{ iconL = 15, caption = "Item 14" },
			{ iconL = 15, caption = "Item 15" },
			{ iconL = 15, caption = "Item 16" },
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
		caption           = "Using List Items as Dividers",   
		list              = V.ListData,               
		allowDelete       = true,                   
		readyCaption      = "Quit Editing",   
		border            = {"shadow", 8,8, .25},
		onSelect          = function(EventData) end,
		} )

end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() 
	_G.GUI.GetHandle("LST_SAMPLE"):destroy()
	V.ListData = nil
end

return V
