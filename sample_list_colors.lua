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
			{ iconL = 14, caption = "Text Color Black" , textColor = {0,0,0} },
			{ iconL = 14, caption = "Text Color Grey" , textColor = {.58,.58,.58} },
			{ iconL = 14, caption = "Text Color Yellow", textColor = {1,1,0} },
			{ iconL = 14, caption = "Text Color Orange", textColor = {1,.58,0} },
			{ iconL = 14, caption = "Text Color Green" , textColor = {0,.58,0} },
			{ iconL = 14, caption = "Text Color Blue"  , textColor = {.19,.19,1} },
			{ iconL = 14, caption = "Background Color Red"   , bgColor = {1,0,0}, },
			{ iconL = 14, caption = "Background Color Orange", bgColor = {1,.58,0}, },
			{ iconL = 14, caption = "Background Color Yellow", bgColor = {1,1,0}, },
			{ iconL = 14, caption = "Background Color Green" , bgColor = {0,1,0}, },
			{ iconL = 14, caption = "Background Color Blue"  , bgColor = {0,0,1}, },
			{ iconL = 14, caption = "Background Color Purple", bgColor = {1,0,1}, },
			{ iconL = 14, caption = "Background Color Black" , textColor = {1,1,1}, bgColor = {0,0,0}, },
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
		caption           = "Setting List Item Colors",   
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
