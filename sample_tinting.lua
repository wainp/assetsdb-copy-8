-- WHEN A SAMPLE HAS BEEN CHOSEN FROM THE LIST, MAIN.LUA LOADS A SAMPLE
-- CODE AND CALLS ITS Create() FUNCTION. TAPPING THE BACK BUTTON 
-- (ALSO CREATED IN MAIN.LUA) CALLS THE Remove() FUNCTION OF THE LOADED 
-- SAMPLE CODE TO REMOVE THE SAMPLE WIDGETS AGAIN. 

local V = {}

----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA AND CREATES THE WIDGET
----------------------------------------------------------------
V.Create = function()

	local colors = 
		{
		{1,.58,.19},
		{1,1,.19},
		{1,.58,1},
		{.58,1,.58},
		{.58,1,1},
		}

	-- CREATE SOME BUTTONS
	for i = 1, 5 do
		_G.GUI.NewButton(
			{
			x               = "center",                
			y               = 30 + i*40,                
			width           = "50%",                   
			scale           = _G.GUIScale,
			name            = "BUT"..i,            
			parentGroup     = nil,                     
			theme           = _G.theme,               
			caption         = "I am a simple button.", 
			textAlign       = "left",                  
			icon            = 20,                       
			border          = {"shadow", 8,8, .25},
			color           = colors[i], -- <-- SEE HERE, JUST PASS A COLOR ARRAY
			} )
	end
	
end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() 
	for i = 1,5 do
		_G.GUI.GetHandle("BUT"..i):destroy() 
	end
end

return V
