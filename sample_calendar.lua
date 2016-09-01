-- WHEN A SAMPLE HAS BEEN CHOSEN FROM THE LIST, MAIN.LUA LOADS A SAMPLE
-- CODE AND CALLS ITS Create() FUNCTION. TAPPING THE BACK BUTTON 
-- (ALSO CREATED IN MAIN.LUA) CALLS THE Remove() FUNCTION OF THE LOADED 
-- SAMPLE CODE TO REMOVE THE SAMPLE WIDGETS AGAIN. 

local V = {}

----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA AND CREATES THE WIDGET
----------------------------------------------------------------
V.Create = function()

	-- CREATE A BUTTON TO SHOW CALENDAR
	_G.GUI.NewButton(
		{
		x               = "center",                
		y               = "center",                
		width           = "40%",                   
		scale           = _G.GUIScale,
		name            = "MY_BUTTON", 
		parentGroup     = nil,                     
		theme           = _G.theme,               
		caption         = "Show Calendar", 
		textAlign       = "center",                  
		icon            = 41,  
		border          = {"shadow", 8,8, .25},
		onRelease       = function(EventData) 
					-- RELEASED WHILE INSIDE BUTTON?
					if EventData.inside then 
						-- TO LET CALENDAR DISPLAY A CERTAIN DATE:
						--_G.GUI.GetHandle("MY_CALENDAR"):setDate(21,2,1974)
						_G.GUI.GetHandle("MY_CALENDAR"):show(true, true)
					end
				  end,
		} )

	-- CREATE A CALENDAR WIDGET
	_G.GUI.NewCalendar(
		{
		x               = "center",                
		y               = "center", 
		scale           = _G.GUIScale,
		name            = "MY_CALENDAR",            
		parentGroup     = nil,   
		theme           = _G.theme, 
		border          = {"shadow", 8,8, .25},

		-- CUSTOM PROPERTIES:
		-- markerColor     = {0,1,0, 1},
		-- dayNamesColor   = {1,1,0, 1},
		-- monthYearColor  = {1,1,0, 1},
		-- textColor       = {1,1,0, 1},
		-- day             = 25,
		-- month           = 1,
		-- year            = 2013,
		-- monthNames      = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"},
		-- dayNames        = {"SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"},
		-- startMonday     = true,
		-- highlightWeekend= true,
		
		
		onPress            = function(EventData) print("PRESSED!") end,
		onRelease          = function(EventData) 
						local button = EventData.buttonPressed
						-- USER PRESSED ONE OF THE CALENDAR'S BUTTONS
						if button == "Y-" then print("BUTTON PRESSED: PREV. YEAR") end
						if button == "Y+" then print("BUTTON PRESSED: NEXT YEAR") end
						if button == "M-" then print("BUTTON PRESSED: PREV. MONTH") end
						if button == "M+" then print("BUTTON PRESSED: NEXT MONTH") end
						-- USER PRESSED A DAY TILE
						if button == "DAY" then
							print("DAY:   "..EventData.day)
							print("MONTH: "..EventData.month)
							print("YEAR:  "..EventData.year)
							-- GET DAY NAME
							local timestamp = os.time{year=EventData.year, month=EventData.month, day=EventData.day, hour=0}
							local dayname   = os.date("%A", timestamp)
							print("DAY NAME: "..dayname)
							if EventData.dayInfo ~= nil then print("DAY ICON: "..EventData.dayInfo.icon) end
							-- ...OR USE EventData.Widget:getDate()
							EventData.Widget:show(false, true)
						end
					end,
		} )

	-- YOU CAN ADD ICONS AND CUSTOM BG COLOR TO CERTAIN DAYS
	_G.GUI.GetHandle("MY_CALENDAR"):setDayInfo(1,12,2013, {icon = 14, bgColor = {1,.8,.2}, textColor = {1,1,1} })
	_G.GUI.GetHandle("MY_CALENDAR"):setDayInfo(1, 1,2014, {icon = 9 , bgColor = {1,.8,.2}, textColor = {1,1,1} })
	_G.GUI.GetHandle("MY_CALENDAR"):setDayInfo(1, 2,2014, {icon = 37, bgColor = {1,.8,.2}, textColor = {1,1,1} })
	_G.GUI.GetHandle("MY_CALENDAR"):update()
	
	-- HIDE CALENDAR FIRST TO SHOW ON BUTTON PRESS
	_G.GUI.GetHandle("MY_CALENDAR"):show(false)

end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() 
	_G.GUI.GetHandle("MY_BUTTON"):destroy() 
	_G.GUI.GetHandle("MY_CALENDAR"):destroy() 
end

return V
