-- WHEN A SAMPLE HAS BEEN CHOSEN FROM THE LIST, MAIN.LUA LOADS A SAMPLE
-- CODE AND CALLS ITS Create() FUNCTION. TAPPING THE BACK BUTTON 
-- (ALSO CREATED IN MAIN.LUA) CALLS THE Remove() FUNCTION OF THE LOADED 
-- SAMPLE CODE TO REMOVE THE SAMPLE WIDGETS AGAIN. 

local V = {}

----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA AND CREATES THE WIDGET
----------------------------------------------------------------
V.Create = function()

	-- CREATE A TEXT
	_G.GUI.NewText(
		{
		x               = "center",                
		y               = "center", 
		width           = "50%",
		scale           = _G.GUIScale,
		height          = "auto",
		name            = "TXT_1",            
		parentGroup     = nil,                     
		theme           = _G.theme, 
		caption         = "This is a multiline text, which can be centered, left or right aligned. A border can be applied, too. Multiline texts are automatically wrapped, if their given width is exceeded. You can add line breaks using the pipe char:||This is a new line.",
		textAlign       = "left",
		textColor       = {1,1,1},
		border          = {"normal",4,1, 1,1,1,.25, 0,0,0,1},
		} )
	
	_G.GUI.NewButton(
		{
		x               = "center",                
		y               = _G.GUI.GetHandle("TXT_1").y + 20 + _G.GUI.GetHandle("TXT_1").contentHeight, 
		width           = "50%",
		scale           = _G.GUIScale,
		name            = "BUT_ALIGN",            
		parentGroup     = nil,                     
		theme           = _G.theme, 
		caption         = "Change Text Align",
		icon            = 6,
		onPress         = function(EventData) 
					local TextWidget = _G.GUI.GetHandle("TXT_1")
					local align = TextWidget:get("textAlign")
					    if align == "left"   then align = "center"
					elseif align == "center" then align = "right"
					elseif align == "right"  then align = "left" end
					TextWidget:set("textAlign", align)
				  end,
		} )

end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() 
	_G.GUI.GetHandle("TXT_1"):destroy()
	_G.GUI.GetHandle("BUT_ALIGN"):destroy()
end

return V
