-- WHEN A SAMPLE HAS BEEN CHOSEN FROM THE LIST, MAIN.LUA LOADS A SAMPLE
-- CODE AND CALLS ITS Create() FUNCTION. TAPPING THE BACK BUTTON 
-- (ALSO CREATED IN MAIN.LUA) CALLS THE Remove() FUNCTION OF THE LOADED 
-- SAMPLE CODE TO REMOVE THE SAMPLE WIDGETS AGAIN. 

local V = {}

----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA AND CREATES THE WIDGET
----------------------------------------------------------------
V.Create = function()

	x = display.contentWidth  * .2
	y = display.contentHeight * .2
	
	-- CREATE THREE WINDOWS:
	for i = 1,3 do
		_G.GUI.NewWindow(
			{
			x               = x + i*(40*_G.GUIScale),
			y               = y + i*(40*_G.GUIScale),
			scale           = _G.GUIScale,
			parentGroup     = nil,
			width           = 250,
			height          = "auto",
			theme           = _G.theme,
			name            = "WIN"..i,
			caption         = "WINDOW "..i,
			textAlign       = "center",
			icon            = 19,
			tapToFront      = true, -- BRING THIS WINDOW TO FRONT WHEN TAPPED
			margin          = 20,
			shadow          = true,
			closeButton     = false,
			dragX           = true,
			dragY           = true,
			slideOut        = .7,
			dragArea        = "auto",
			} )

		-- ADD A TEXT
		_G.GUI.NewText(
			{
			x               = "center",
			y               = "auto",
			name            = "LABEL"..i,
			parentGroup     = "WIN"..i,
			width           = "100%",
			theme           = _G.theme,
			caption         = "Tap this window to bring it to front.",
			textAlign       = "center",
			} )

		-- AUTO-ARRANGE (POSITION) WIDGETS INSIDE WINDOW 
		_G.GUI.GetHandle("WIN"..i):layout(false) 
	end
	
	-- DO NOT ALLOW WINDOW 1 TO JUMP TO FRONT WHEN TAPPED:
	_G.GUI.GetHandle("WIN1"  ):set("tapToFront", false)
	_G.GUI.GetHandle("LABEL1"):set("caption"   , "This window stays behind.")
end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() 
	for i = 1,3 do _G.GUI.GetHandle("WIN"..i):destroy() end
end

return V
