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

	V.newItemCount = 0

	-- TEXT LABEL
	_G.GUI.NewLabel(
		{
		x               = "center",
		y               = 15,
		scale           = _G.GUIScale,
		name            = "LBL_INFO",
		parentGroup     = nil,
		width           = "100%",
		theme           = _G.theme,
		caption         = "Swipe over list from left to right to enter edit mode.",
		textColor       = {1,1,1},
		textAlign       = "center",
		icon            = 14,
		} )

	-- CREATE A TABLE TO FILL THE LIST
	V.ListData = 
		{
			{ iconL = 20, caption = "This is Item A."},
			{ iconL = 20, caption = "This is Item B."},
		}

	-- CREATE A LIST
	_G.GUI.NewList(
		{
		x                 = "center",               
		y                 = "center",               
		width             = "70%",                  
		scale             = _G.GUIScale,
		height            = "70%",                  
		parentGroup       = nil,                    
		theme             = _G.theme,              
		name              = "LST_SAMPLE",             
		caption           = "Adding & Removing Items",   
		list              = V.ListData,               
		allowDelete       = true,      
		scrollbar         = "always",
		readyCaption      = "Quit Editing",   
		border            = {"shadow", 8,8, .25},
		onSelect          = function(EventData)
								local List = EventData.List
								local num  = EventData.selectedIndex
								if num ~= 0 then print("Selected item index: "..num.." caption: ''"..List[num].caption.."''") end
							end,
		onItemRemove      = function(EventData)	print("Item "..EventData.pos.." removed!") end,
		} )

	-- ADD ITEM BUTTON
	_G.GUI.NewButton(
		{
		x               = "16%",                
		y               = "bottom",                
		width           = "33%",                   
		scale           = _G.GUIScale,
		name            = "BUT_ADD",            
		parentGroup     = nil,                     
		theme           = _G.theme,               
		caption         = "Add Item", 
		textAlign       = "left",                  
		icon            = 7,                       
		border          = {"shadow", 8,8, .25},
		onRelease       = function(EventData) 
							V.newItemCount = V.newItemCount + 1
							-- ADD A NEW ITEM ON TOP (AT POSITION 1):
							table.insert(V.ListData, 1, {iconL = 20, caption = "New Item Number "..V.newItemCount})
						  	-- UPDATE (REDRAW) LIST WIDGET
						  	_G.GUI.GetHandle("LST_SAMPLE"):update()
						  end,
		} )

	-- DELETE ITEM BUTTON
	_G.GUI.NewButton(
		{
		x               = "49%",                
		y               = "bottom",                
		width           = "33%",                   
		scale           = _G.GUIScale,
		name            = "BUT_DEL",            
		parentGroup     = nil,                     
		theme           = _G.theme,               
		caption         = "Remove Item", 
		textAlign       = "left",                  
		icon            = 8,                       
		border          = {"shadow", 8,8, .25},
		onRelease       = function(EventData) 
							-- REMOVE TOP ITEM (POSITION 1):
							table.remove(V.ListData, 1)
						  	-- UPDATE (REDRAW) LIST WIDGET
						  	_G.GUI.GetHandle("LST_SAMPLE"):update()
						  end,
		} )

end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() 
	_G.GUI.GetHandle("LST_SAMPLE"):destroy() 
	_G.GUI.GetHandle("BUT_ADD"):destroy()
	_G.GUI.GetHandle("BUT_DEL"):destroy()
	_G.GUI.GetHandle("LBL_INFO"):destroy()
	V.ListData = nil
end

return V
