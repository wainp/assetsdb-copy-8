-- WHEN A SAMPLE HAS BEEN CHOSEN FROM THE LIST, MAIN.LUA LOADS A SAMPLE
-- CODE AND CALLS ITS Create() FUNCTION. TAPPING THE BACK BUTTON 
-- (ALSO CREATED IN MAIN.LUA) CALLS THE Remove() FUNCTION OF THE LOADED 
-- SAMPLE CODE TO REMOVE THE SAMPLE WIDGETS AGAIN. 

local V = {}

----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA AND CREATES THE WIDGET
----------------------------------------------------------------
V.Create = function()

	-- CREATE SOME CONTENT FOR THE SCROLLVIEW
	-- CAN BE AN IMAGE OR A GROUP OF OBJECTS:
	local i, Tmp
	local Group = display.newGroup()
	for i = 1, 10 do
		local Tmp = display.newImage("images/scrollview_page"..i..".jpg")
		Tmp.anchorX = 0
		Tmp.anchorY = 0
		Tmp.xScale = 260 / Tmp.width
		Tmp.yScale = 260 / Tmp.height
		Tmp.x      = (i-1)*260
		Group:insert (Tmp)
	end
	-- CREATE A SCROLLVIEW WIDGET AND APPLY OUR IMAGE TO IT
	_G.GUI.NewScrollView(
		{
		x               = "center",                
		y               = "center", 
		width           = 260,
		height          = 260,
		scale           = _G.GUIScale,
		name            = "MY_SCROLLVIEW",            
		parentGroup     = nil,                     
		theme           = _G.theme, 
		margin          = 8,
		dragX           = true,       -- ALLOW HORIZONTAL DRAGGING
		dragY           = false,      -- DISABLE VERTICAL DRAGGING
		scrollbarH      = "onScroll", -- SHOW HORIZONTAL SCROLLBAR DURING SCROLL
		slideOut        = .4,         -- DRAG-RELEASE SLIDE OUT SPEED (0-.99)
		pagingMode      = true,       -- PAGE MODE ENABLED
		currPage        = 1,          -- PAGE TO START WITH
		content         = Group,
		border          = {"inset",4,1, 1,1,1 ,.25, 0,0,0, 1}, 
		onPress         = function(EventData) print("PRESSED!") end,
		onRelease       = function(EventData) print("RELEASED!") end,
		onDidScroll     = function(EventData) print("SCROLLED TO PAGE:"..EventData.currPage) end
		} )

	-- TEXT LABEL
	_G.GUI.NewLabel(
		{
		x               = "center",                
		y               = "bottom", 
		width           = "75%",
		scale           = _G.GUIScale,
		name            = "LBL_1",            
		parentGroup     = nil,                     
		theme           = _G.theme, 
		icon            = 0,
		caption         = "Paged scroll view. Drag images inside.",
		textAlign       = "center",
		textColor       = {1,1,1},
		} )

end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() 
	_G.GUI.GetHandle("MY_SCROLLVIEW"):destroy() 
	_G.GUI.GetHandle("LBL_1"):destroy() 
end

return V
