-- WHEN A SAMPLE HAS BEEN CHOSEN FROM THE LIST, MAIN.LUA LOADS A SAMPLE
-- CODE AND CALLS ITS Create() FUNCTION. TAPPING THE BACK BUTTON 
-- (ALSO CREATED IN MAIN.LUA) CALLS THE Remove() FUNCTION OF THE LOADED 
-- SAMPLE CODE TO REMOVE THE SAMPLE WIDGETS AGAIN. 

local V = {}

----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA AND CREATES THE WIDGET
----------------------------------------------------------------
V.Create = function()

	-- CREATE A SQUARED BUTTON
	_G.GUI.NewButton(
		{
		x               = "center",                
		y               = "center",   
		width           = 100,
		scale           = _G.GUIScale,
		name            = "BUT_1",            
		parentGroup     = nil,        
		theme           = _G.theme,   
		caption         = "Tap me.",
		textAlign       = "center",
		icon            = 0,
		onPress         = function(EventData) 
						V.currPosition = V.currPosition + 1; if V.currPosition > #V.positions then V.currPosition = 1 end
						_G.GUI.GetHandle("TOOLTIP1"):set( { position = V.positions[V.currPosition], color = V.bubbleColors[V.currPosition], caption = V.texts[V.currPosition], showArrow = V.arrow[V.currPosition] } ) 
						_G.GUI.GetHandle("TOOLTIP1"):position("BUT_1")
						_G.GUI.GetHandle("TOOLTIP1"):show(true, true) 
						end,
		} )

	V.positions      = {"top","right","bottom","left","top","right","bottom","left"}
	V.arrow          = {true,true,true,true,false,false,false,false}
	V.bubbleColors   = { {1,1,1},{1,1,.8},{1,.8,1},{.8,1,1},{.8,.8,1},{1,1,1},{1,1,.8},{1,.8,1},{.8,1,1},{.8,.8,1} }
	V.texts          = { "Placed on top...","Placed on right side.","Bottom side...","Left side...","Placed on top, without arrow.","Right, no arrow","Bottom, no arrow","Left, no arrow" }
	V.currPosition   = 1

	-- INFO BUBBLE
	_G.GUI.NewInfoBubble(
		{
		x               = "center",                
		y               = "center", 
		width           = 150,
		scale           = _G.GUIScale,
		name            = "TOOLTIP1",            
		parentGroup     = nil,                     
		theme           = _G.theme, 
		caption         = "This is an info bubble widget to display hint texts, an optional icon and an arrow to point on a given widget. Tap the button below to show some variations.",
		icon            = 14,
		textAlign       = "center",
		fontSize        = 18,
		textColor       = {.2,.2,.2},
		color           = {1,1,1},
		showArrow       = true,
		position        = "top",
		animation       = true,
		bubbleAlpha     = 1.0,
		targetDistance  = 20,
		-- HIDE ON TAP
		onPress         = function(EventData) EventData.Widget:show(false, true) end,
		} )

	-- POSITIONS INFO BUBBLE AT BUTTON
	_G.GUI.GetHandle("TOOLTIP1"):position("BUT_1")

end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() 
	_G.GUI.GetHandle("BUT_1"):destroy()
	_G.GUI.GetHandle("TOOLTIP1"):destroy()
end

return V
