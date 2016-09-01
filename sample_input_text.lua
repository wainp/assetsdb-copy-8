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

	-- CREATE INPUT TEXT
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
		inputType       = "default", -- "number" | "phone" | "default" | "url" | "email"
		allowedChars    = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 -'.",
		quitCaption     = "Tap screen to finish text input.",
		onFocus         = function(EventData) 
							-- CLEAR TEXT WHEN TEXT FIELD IS FOCUSED FIRST TIME:
							if EventData.value == V.defaultCaption then _G.GUI.Set("INP_SAMPLE", {caption = ""} ) end
						  end,
		onChange        = function(EventData) print("TEXT CHANGED: "..EventData.value) end,
		onBlur          = function(EventData) print("FINISHED TEXT INPUT: "..EventData.value) end,
		} )

end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() _G.GUI.GetHandle("INP_SAMPLE"):destroy() end

return V
