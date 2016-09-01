-- WHEN A SAMPLE HAS BEEN CHOSEN FROM THE LIST, MAIN.LUA LOADS A SAMPLE
-- CODE AND CALLS ITS Create() FUNCTION. TAPPING THE BACK BUTTON 
-- (ALSO CREATED IN MAIN.LUA) CALLS THE Remove() FUNCTION OF THE LOADED 
-- SAMPLE CODE TO REMOVE THE SAMPLE WIDGETS AGAIN. 

local V = {}

----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA AND CREATES THE WIDGET
----------------------------------------------------------------
V.Create = function()

	V.themeName       = _G.theme
	V.themeColor      = {1,1,1}
	_G.GUI.SetTheme     (V.themeName, false, V.themeColor)

	-- CREATE A WINDOW
	_G.GUI.NewWindow(
		{
		x               = "center",
		y               = "top",
		scale           = _G.GUIScale,
		parentGroup     = nil,
		width           = 380,
		height          = "auto",
		minHeight       = 50,
		name            = "WIN_SAMPLE",
		caption         = "THEME TEST WINDOW",
		textAlign       = "center",
		icon            = 40,

		margin          = 20,
		shadow          = true,
		closeButton     = true,
		dragX           = false,
		dragY           = true,
		slideOut        = .7,
		dragArea        = "auto",
		onPress         = function(EventData) 
					local Calendar = _G.GUI.GetHandle("CALENDAR")
					if Calendar.isVisible == true then Calendar:show(false, true) end
				end,
		onWidgetPress   = function(EventData)
					local Calendar = _G.GUI.GetHandle("CALENDAR")
					if Calendar.isVisible == true then Calendar:show(false, true) end
				end,
		onClose         = function(EventData) _G.UnloadSample() end,
		} )

	------------------------------------------------------------
	-- RGB SLIDERS
	------------------------------------------------------------
	_G.GUI.NewLabel(
		{
		x               = "auto",
		y               = "auto",
		parentGroup     = "WIN_SAMPLE",
		width           = "100%",
		caption         = "THEME & COLOR",
		textAlign       = "left",
		icon            = 38,
		border          = {"normal",4,1, .29,.29,.33,.19, .58,.58,.58,1}, -- TO REMOVE A BORDER PASS AN EMPTY TABLE {}
		newLayoutLine   = true,
		topMargin       = 5,
		} )

	-- SLIDER TEXTS
	local captions = {"R","G","B"}
	for i = 1,3 do
		_G.GUI.NewLabel(
			{
			x               = "auto",                
			y               = "auto",
			width           = 20,
			name            = "LBL_SLIDER"..i,
			parentGroup     = "WIN_SAMPLE",                     
			caption         = captions[i],
			icon            = 0,
			textAlign       = "center",
			})
	end	

	_G.GUI.NewLabel(
		{
		x               = "auto",                
		y               = "auto",
		width           = "60%",
		parentGroup     = "WIN_SAMPLE",                     
		caption         = "This is a label",
		icon            = 20,
		leftMargin      = -5,
		})

	-- R,G,B SLIDERS
	for i = 1,3 do
		_G.GUI.NewSlider(
			{
			x                 = "auto",
			y                 = "auto",
			height            = 100,
			vertical          = true,
			reversed          = true,
			parentGroup       = "WIN_SAMPLE",                     
			minValue          = 0,
			maxValue          = 1,
			value             = V.themeColor[i],
			step              = .1,
			tickStep          = 0,  -- SET TO NIL OR < 2 TO HIDE TICKS
			newLayoutLine     = i == 1 and true or false,
			myNumber          = i,
			onChange          = function(Event) 
						local i = Event.Props.myNumber
						V.themeColor[i] = Event.value
						_G.GUI.GetHandle("LBL_SLIDER"..i):set("caption", V.themeColor[i])
						_G.GUI.SetThemeColor(V.themeName, V.themeColor)
					end
			} )
	end
	
	-- CALENDAR BUTTON
	_G.GUI.NewButton(
		{
		x               = "auto",                
		y               = "auto",
		width           = "60%",
		parentGroup     = "WIN_SAMPLE",                     
		caption         = "Show Calendar",
		textAlign       = "center",
		icon            = 41,
		onRelease       = function(Event)
					_G.GUI.GetHandle("CALENDAR"):toFront()
					_G.GUI.GetHandle("CALENDAR"):show(true, true) 
				end,
		} )	

	------------------------------------------------------------
	-- TEST WIDGETS
	------------------------------------------------------------
	_G.GUI.NewLabel(
		{
		x               = "auto",
		y               = "auto",
		parentGroup     = "WIN_SAMPLE",
		width           = "100%",
		caption         = "TEST WIDGETS",
		textAlign       = "left",
		icon            = 11,
		border          = {"normal",4,1, .29,.29,.33,.19, .58,.58,.58,1}, -- TO REMOVE A BORDER PASS AN EMPTY TABLE {}
		topMargin       = 10,
		} )

	-- BUTTON
	_G.GUI.NewButton(
		{
		x               = "auto",                
		y               = "auto",
		width           = "49%",
		parentGroup     = "WIN_SAMPLE",                     
		caption         = "Normal Button",
		icon            = 20,
		toggleButton    = false,
		topMargin       = 10,
		} )	

	-- TOGGLE BUTTON
	_G.GUI.NewButton(
		{
		x               = "auto",                
		y               = "auto",
		width           = "49%",
		parentGroup     = "WIN_SAMPLE",                     
		caption         = "Toggle Button",
		icon            = 20,
		toggleButton    = true,
		} )	

	-- SQUARE BUTTON
	for i = 1,2 do
		_G.GUI.NewSquareButton(
			{
			x               = "auto",                
			y               = "auto",                
			parentGroup     = "WIN_SAMPLE",                     
			icon            = math.random(40),
			toggleButton    = i == 1 and true or false,
			} )
	end

	-- DRAG BUTTON
	for i = 1,2 do
		_G.GUI.NewDragButton(
			{
			x               = "auto",                
			y               = "auto",                
			parentGroup     = "WIN_SAMPLE",                     
			value           = 10,
			minValue        = 1,
			maxValue        = 20,
			} )
	end

	-- SWITCH
	for i = 1,2 do
		_G.GUI.NewSwitch(
			{
			x               = "auto",                
			y               = "auto",                
			parentGroup     = "WIN_SAMPLE",                     
			toggleState     = i == 1 and true or false,
			textAlign       = "left",
			caption         = "Switch",
			} )
	end
	

	-- CHECKBOXES
	for i = 1,3 do
		_G.GUI.NewCheckbox(
			{
			x               = "auto",                
			y               = "auto", 
			width           = "33%",
			parentGroup     = "WIN_SAMPLE",                     
			caption         = "Check "..i,
			textAlign       = "right",
			toggleState     = i == 1 and true or false,
			newLayoutLine   = i == 1 and true or false,
			topMargin       = i == 1 and 10 or 0,
			} )
	end

	-- RADIO BUTTONS
	for i = 1,3 do
		_G.GUI.NewRadiobutton(
			{
			x               = "auto",                
			y               = "auto", 
			width           = "33%",
			parentGroup     = "WIN_SAMPLE",                     
			caption         = "Radio "..i,
			textAlign       = "right",
			newLayoutLine   = i == 1 and true or false,
			toggleState     = i == 1 and true or false,
			toggleGroup     = "RadioGroup1",
			group           = "MyGroup1",
			} )
	end

	-- ADD A BORDER AROUND RADIO BUTTONS
	_G.GUI.NewBorder(
		{
		name              = "BORDER",
		parentGroup       = "WIN_SAMPLE",                     
		group             = "MyGroup1",
		border            = {"normal",4,1, 0,0,0,0, 1,1,1,.5}, 
		} )

	-- CREATE INPUT TEXT
	_G.GUI.NewInput(
		{
		x               = "auto",
		y               = "auto",
		parentGroup     = "WIN_SAMPLE",
		width           = "100%",
		caption         = "This is an input text field...",
		notEmpty        = true,
		inputType       = "default", -- "number" | "password" | "default"
		allowedChars    = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 -'.",
		quitCaption     = "Tap screen to finish text input.",
		newLayoutLine   = true,
		topMargin       = 10,
		} )

	------------------------------------------------------------
	-- LIST
	------------------------------------------------------------
	V.List1 = 
		{
			{ iconL = 20, iconR = 6, caption = "This is Item A", anyData = "John" },
			{ iconL = 20, iconR = 6, caption = "This is Item B", anyData = "Jim" },
			{ iconL = 20, iconR = 6, caption = "This is Item C", anyData = "Joe" },
			{ iconL = 20, iconR = 6, caption = "This is Item D", anyData = "Jack" },
			{ iconL = 20, iconR = 6, caption = "This is Item E", anyData = "Jill" },
			{ iconL = 20, iconR = 6, caption = "This is Item F", anyData = "June" },
		}

	V.List2 =
		{
			parentList = V.List1, 
			{ iconL = 20, caption = "This is List 2, Item 1"},
			{ iconL = 20, caption = "This is List 2, Item 2"},
			{ iconL = 20, caption = "This is List 2, Item 3"},
		}

	-- CREATE A LIST
	_G.GUI.NewList(
		{
		x                 = "auto",               
		y                 = "auto",               
		width             = "100%",                  
		height            = 200,                  
		parentGroup       = "WIN_SAMPLE",                    
		name              = "LST_SAMPLE",             
		caption           = "Sample List Widget",   
		list              = V.List1,               
		allowDelete       = true,                   
		readyCaption      = "Quit Editing", 
		topMargin         = 10,
		onSelect          = function(EventData)
								local Widget = EventData.Widget
								local List   = EventData.List
								local Item   = EventData.Item
								local num    = EventData.selectedIndex
								-- SWITCH TO LIST A OR B
								if List == V.List1 then Widget:setList(V.List2, "left") end
							end,
		} )

	-- SLIDER
	_G.GUI.NewSlider(
		{
		x                 = "auto",
		y                 = "auto",
		vertical          = true,
		parentGroup       = "WIN_SAMPLE",                     
		minValue          = 1,
		maxValue          = 50,
		value             = 10,
		step              = 5,
		tickStep          = 5,  -- SET TO NIL OR < 2 TO HIDE TICKS
		newLayoutLine     = true,
		topMargin         = 10,
		} )

	-- SLIDER
	_G.GUI.NewSlider(
		{
		x                 = "auto",
		y                 = "auto",
		width             = "88%",
		vertical          = false,
		parentGroup       = "WIN_SAMPLE",                     
		minValue          = 1,
		maxValue          = 50,
		value             = 10,
		step              = 1,
		tickStep          = 0,  -- SET TO NIL OR < 2 TO HIDE TICKS
		} )



	-- CREATE A PROGRESS BAR
	_G.GUI.NewProgBar(
		{
		x               = "center",                
		y               = "auto", 
		width           = "50%",
		parentGroup     = "WIN_SAMPLE",                     
		value           = .5,            -- 0.0 - 1.0
		allowDrag       = true,          -- DRAGGING ALLOWED
		textFormatter   = function(value) valueToDisplay = math.floor(value*100).."%"; return valueToDisplay end,
		newLayoutLine   = true,
		textColor       = {1,1,1},
		topMargin       = 10,
		} )


	-- AUTO-LAYOUT ALL WIDGETS OF THIS WINDOW		
	_G.GUI.GetHandle("WIN_SAMPLE"):layout(true)

	-- CREATE A CALENDAR WIDGET
	_G.GUI.NewCalendar(
		{
		x               = "center",                
		y               = "center", 
		scale           = _G.GUIScale,
		name            = "CALENDAR",            
		parentGroup     = nil,   
		theme           = _G.theme, 
		border          = {"shadow", 8,8, .5},
		onRelease       = function(EventData) if EventData.Props.buttonPressed == "DAY" then EventData.Widget:show(false, true) end end,
		} )
	_G.GUI.GetHandle("CALENDAR"):show(false)
end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO CLEAN UP THE SAMPLE
----------------------------------------------------------------
V.Remove = function() 
	_G.GUI.GetHandle("CALENDAR"):destroy() 
	_G.GUI.GetHandle("WIN_SAMPLE"):destroy() 
	V.List2.parentList = nil
	V.List2 = nil
	V.List1 = nil
end

return V
