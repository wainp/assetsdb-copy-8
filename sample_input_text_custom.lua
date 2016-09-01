-- WHEN A SAMPLE HAS BEEN CHOSEN FROM THE LIST, MAIN.LUA LOADS A SAMPLE
-- CODE AND CALLS ITS Create() FUNCTION. TAPPING THE BACK BUTTON 
-- (ALSO CREATED IN MAIN.LUA) CALLS THE Remove() FUNCTION OF THE LOADED 
-- SAMPLE CODE TO REMOVE THE SAMPLE WIDGETS AGAIN. 

local V = {}

----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA AND CREATES THE WIDGET
----------------------------------------------------------------
V.Create = function()

	V.defaultCaption = "Enter Your Name..."

	-- REMOVE CUSTOM INPUT TEXT
	V.RemoveInput = function(txt)
		native.setKeyboardFocus(nil)
		_G.GUI.GetHandle("INP_SAMPLE"):set("caption", V.txt.text)
		V.txt:removeSelf   ()
		V.hint:removeSelf  ()
		V.fader:removeSelf ()
		V.border:removeSelf()
		V.txt    = nil
		V.hint   = nil
		V.fader  = nil
		V.border = nil
	end

	-- CREATE A CUSTOM INPUT TEXT
	V.CreateInput = function(Widget)
		local screenW = display.contentWidth
		local screenH = display.contentHeight
		-- BLACK SCREEN LAYER
		V.fader = display.newRect(0,0, screenW,screenH)
		V.fader.anchorX = 0
		V.fader.anchorY = 0
		V.fader:setFillColor     (0,0,0,.58)
		V.fader:addEventListener ("touch", function() V.RemoveInput(); return true end)
		-- BORDER AROUND INPUT TEXT
		V.border              = display.newRoundedRect(0,0,screenW-25,32, 8)
		V.border.anchorX      = .5
		V.border.anchorY      = .5
		V.border.x            = screenW * .5
		V.border.y            = screenH * .2
		V.border.strokeWidth  = 1
		V.border:setFillColor  (0,0,0,.58)
		V.border:setStrokeColor(1,1,1,1)
		-- HELP TEXT
		V.hint         = display.newText("", screenW*.3,10, screenW,20)
		V.hint.anchorX = 0
		V.hint.anchorY = 0
		V.hint.text    = "TAP ON SCREEN TO QUIT INPUT."
		V.hint:setTextColor(1,1,1)
		-- INPUT TEXT
		V.txt = native.newTextField(screenW*.5 - 25, screenH*5, screenW-50, 20)
		V.txt.anchorX      = .5
		V.txt.anchorY      = .5
		V.txt.x            = screenW * .5
		V.txt.y            = screenH * .2
		V.txt.text         = Widget:get("caption")
		V.txt.size         = 16
		V.txt.isSecure     = Widget:get("isSecure")
		V.txt.inputType    = Widget:get("inputType")
		V.txt.isEditable   = true
		V.txt:setTextColor     (0,0,0,1)  
		native.setKeyboardFocus(V.txt)
	end


	-- CREATE WIDGET CANDY INPUT TEXT
	_G.GUI.NewInput(
		{
		x               = "center",
		y               = "center",
		parentGroup     = nil,
		width           = "70%",
		scale           = _G.GUIScale,
		theme           = "theme_1",
		name            = "INP_SAMPLE",
		caption         = V.defaultCaption,
		notEmpty        = true,
		textColor       = {.07,.14,.07},
		isSecure        = false, -- TRUE: SHOW AS PASSWORD (MASKED)
		disableInput    = true,
		inputType       = "default", -- "number" | "phone" | "default" | "url" | "email"
		allowedChars    = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 -'.",
		quitCaption     = "Tap screen to finish text input.",
		onPress         = function(EventData) V.CreateInput( EventData.Widget ) end,
		} )

end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() _G.GUI.GetHandle("INP_SAMPLE"):destroy() end

return V
