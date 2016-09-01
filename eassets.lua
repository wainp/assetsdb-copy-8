require "sqlite3"
local widget = require( "widget" )
local composer = require( "composer" )
local scene = composer.newScene()
local halfW = display.contentCenterX
local halfH = display.contentCenterY
local widget = require( "widget" )
_G.GUI = require("widget_candy")
local rep, dcrew, junkf, junkn, junkc, pvsmsto, junkl
local coname, coversion, coupdate, coregistered, codbversion
local oname, oversion, oupdate, oregistered, odbversion
local aname,aoffice, aasset,amanufactor, aserial, amac, aip, acommes, aitem, amodal, acomments
local aitem, aasset, newItemCount



 local function oncomplete( event )
     _G.GUI.RemoveAllWidgets()
    composer.removeScene("kit1")
    composer.gotoScene("options")      
        
        
end
   
local function dbsavedb( event )
    
--local path = system.pathForFile("assets.db", system.DocumentsDirectory)
--vassets = sqlite3.open( path ) 
local myVariable = "Stock"
--local updateTable = [[UPDATE ASSETS SET ASSET = ]] .. myVariable .. [[ WHERE id=12]]
--vassets:exec( updateTable )
--    vassets:close()
    
   local adusty="Emily"
local path = system.pathForFile("assets.db", system.DocumentsDirectory)
mcst = sqlite3.open( path )
local updateTable = [[UPDATE ASSETS SET SERIAL = ]]..adusty..[[] WHERE id=51;]]
--local updateTable = [[UPDATE ASSETS SET ASSET = ]] .. myVariable .. [[ WHERE id=12]]
print(updateTable)
mcst:exec(updateTable)
_G.GUI.RemoveAllWidgets()
       composer.removeScene("kit1")
        --composer.purgeScene("intro")
        --_G.GUI.GetHandle("owner1"):destroy()
    composer.gotoScene("options")   
    --composer.gotoScene("Intro")
end
      
   
   
 





function scene:create( event )
	local group = self.view
        _G.GUI.RemoveAllWidgets()
local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
titleBar:setFillColor( titleGradient ) 
titleBar.y = titleBar.contentHeight * 0.5
end


function scene:show( event )
	local group = self.view
        _G.GUI.RemoveAllWidgets()
local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
titleBar:setFillColor( titleGradient ) 
titleBar.y = titleBar.contentHeight * 0.5
--_G.GUI.UnloadThemes("theme_4")
 --_G.GUI.RemoveAllWidgets()
 display.setStatusBar(display.HiddenStatusBar)
 local titleText = display.newText( "Asset Collection", halfW, titleBar.y, native.systemFontBold, 22 )
 
 
 
      local path = system.pathForFile("assets.db", system.DocumentsDirectory)
    db = sqlite3.open( path ) 
   aoffice="Office"
   aasset="Asset"
   amanufactor="Manufactor"
   aserial ="Serial"
   amac="MAC" 
   aip="IP"
   acommes="Comments" 
   aitem= "Item"
    newItemCount = 1
   local sql = "SELECT * FROM assets order by office"
     for row in db:nrows(sql) do
        --local text = row.oname.." "..row.oversion
        if seled== newItemCount then
            aoffice=row.office
            aid=row.id
            aitem=row.item
            aasset=row.asset
            amanufactor=row.manufactor
            amodal=row.modal
            aserial=row.serial
            amac=row.mac
            aip=row.ip
            acommes=row.comments
            --if aitem==blank then
            --    aitem="No Assets known"
           end
           newItemCount=newItemCount +1
           end
        
_G.GUI = require("widget_candy")

-- CREATE THE WIDGET
_G.GUI.NewWindow(
		{
		x               = "center",
		y               = "15%",
		scale           = _G.GUIScalea,
		parentGroup     = nil,
		width           = "95%",
		height          = "75%",
		minHeight       = 50,
		theme           = _G.theme,
		name            = "Owner1",
		caption         = "Office Assets Details",
		textAlign       = "center",
		icon            = 19,
		fadeInTime      = 500,
                modal           = "True",
		margin          = 20,
		noTitle         = false,
		shadow          = true,
		closeButton     = true,
		dragX           = true,
		dragY           = true,
		slideOut        = .7,
		dragArea        = "auto",
		--onPress         = function(EventData) print("WINDOW PRESSED!") end,
		--onDrag          = function(EventData) print("WINDOW DRAGGED!") end,
		--onRelease       = function(EventData) print("WINDOW RELEASED!"..EventData.value) end,
		--onWidgetPress   = function(EventData) print("WINDOW WIDGET PRESSED: "..EventData.name) end,
		onClose         = function(EventData) _G.UnloadSample() end,
		} )
                
--V.defaultCaption = "Enter Your Name..."

        _G.GUI.NewInput(
		{
		x               = "2%",
		y               = "1%",
		parentGroup     = "Owner1",
		width           = "55%",
		scale           = _G.GUIScalec,
		theme           = "theme_1",
		name            = "Name",
                FontSize        = "22",
                quitCaption      ="Tap screen to finish text input.",
		caption         = aoffice,
		textColor       = {.07,.14,.07},
		notEmpty        = false,
		isSecure        = false,
		-- DO NOT USE NATIVE KEYBOARD:
		disableInput    = true,
               -- onBlur          =  if EventData.value == "Name" then "oname"=EventData.value end,
	--					  end,
                onFocus         = function(EventData) 
							-- CLEAR TEXT WHEN TEXT FIELD IS FOCUSED FIRST TIME:
							if EventData.value == "Name" then _G.GUI.Set("Name", {caption = ""} ) end
						  end,
		-- PRESSED: SHOW WIDGET CANDY KEYBOARD
		onPress         = function(EventData)  
					_G.GUI.Keyboard_Show(
						{
						height   = "50%",
						target   = "Name",
						align    = "bottom",
						onType   = function(EventData) print("TYPE: "..EventData.char) end,
						onOK     = function(EventData) print("OK!") end,	
						} )
				end,
                                onBlur          = function(EventData) aoffice=EventData.value end,
                             --   onBlur          = function(EventData) print("FINISHED TEXT INPUT: "..EventData.value) end,
                } )
                

_G.GUI.NewInput(
		{
		x               = "65%",
		y               = "1%",
		parentGroup     = "Owner1",
		width           = "27%",
		scale           = _G.GUIScalec,
		theme           = "theme_1",
		name            = "Asset",
                FontSize        = "22",
		caption         = aasset,
		textColor       = {.07,.14,.07},
		notEmpty        = false,
		isSecure        = false,
		-- DO NOT USE NATIVE KEYBOARD:
		disableInput    = true,
                onFocus         = function(EventData) 
							-- CLEAR TEXT WHEN TEXT FIELD IS FOCUSED FIRST TIME:
							if EventData.value == "asset" then _G.GUI.Set("Asset", {caption = ""} ) end
						  end,
		-- PRESSED: SHOW WIDGET CANDY KEYBOARD
		onPress         = function(EventData)  
					_G.GUI.Keyboard_Show(
						{
						height   = "30%",
						target   = "Asset",
						align    = "bottom",
						onType   = function(EventData) print("TYPE: "..EventData.char) end,
						onOK     = function(EventData) print("OK!") end,	
						} )
				end,
                onBlur          = function(EventData) aasset=EventData.value end,
                } )
_G.GUI.NewInput(
		{
		x               = "2%",
		y               = "15%",
		parentGroup     = "Owner1",
		width           = "90%", 
		scale           = _G.GUIScalec,
		theme           = "theme_1",
		name            = "manufactor",
                FontSize        = "22",
		caption         = amanufactor,
		textColor       = {.07,.14,.07},
		notEmpty        = false,
		isSecure        = false,
		-- DO NOT USE NATIVE KEYBOARD:
		disableInput    = true,
                onFocus         = function(EventData) 
							-- CLEAR TEXT WHEN TEXT FIELD IS FOCUSED FIRST TIME:
							if EventData.value == "Item" then _G.GUI.Set("Item", {caption = ""} ) end
						  end,
		-- PRESSED: SHOW WIDGET CANDY KEYBOARD
		onPress         = function(EventData)  
					_G.GUI.Keyboard_Show(
						{
						height   = "30%",
						target   = "manufactor",
						align    = "bottom",
						onType   = function(EventData) print("TYPE: "..EventData.char) end,
						onOK     = function(EventData) print("OK!") end,	
						} )
				end,
                onBlur          = function(EventData) aitem=EventData.value end,
                } )
	-- CREATE A TEXT
_G.GUI.NewInput(
		{
		x               = "2%",
		y               = "30%",
		parentGroup     = "Owner1",
		width           = "90%",
		scale           = _G.GUIScalec,
		theme           = "theme_1",
		name            = "Modal",
                FontSize        = "22",
		caption         = amodal,
		textColor       = {.07,.14,.07},
		notEmpty        = false,
		isSecure        = false,
		-- DO NOT USE NATIVE KEYBOARD:
		disableInput    = true,
                onFocus         = function(EventData) 
							-- CLEAR TEXT WHEN TEXT FIELD IS FOCUSED FIRST TIME:
							if EventData.value == "Manufactor" then _G.GUI.Set("Manufactor", {caption = ""} ) end
						  end,
		-- PRESSED: SHOW WIDGET CANDY KEYBOARD
		onPress         = function(EventData)  
					_G.GUI.Keyboard_Show(
						{
						height   = "30%",
						target   = "Modal",
						align    = "top",
						onType   = function(EventData) print("TYPE: "..EventData.char) end,
						onOK     = function(EventData) print("OK!") end,	
						} )
				end,
                onBlur          = function(EventData) amanufactor=EventData.value end,
                } )	
 
 _G.GUI.NewInput(
		{
		x               = "2%",
		y               = "45%",
		parentGroup     = "Owner1",
		width           = "90%",
		scale           = _G.GUIScalec,
		theme           = "theme_1",
		name            = "Serial",
                FontSize        = "22",
		caption         = aserial,
		textColor       = {.07,.14,.07},
		notEmpty        = false,
		isSecure        = false,
		-- DO NOT USE NATIVE KEYBOARD:
		disableInput    = true,
                onFocus         = function(EventData) 
							-- CLEAR TEXT WHEN TEXT FIELD IS FOCUSED FIRST TIME:
							if EventData.value == "Serial" then _G.GUI.Set("Serial", {caption = ""} ) end
						  end,
		-- PRESSED: SHOW WIDGET CANDY KEYBOARD
		onPress         = function(EventData)  
					_G.GUI.Keyboard_Show(
						{
						height   = "40%",
						target   = "Serial",
						align    = "top",
						onType   = function(EventData) print("TYPE: "..EventData.char) end,
						onOK     = function(EventData) print("OK!") end,	
						} )
				end,
                onBlur          = function(EventData) aserial=EventData.value end,
                } )	
--local titleText = display.newText( "Eltham", halfW, titleBar.y, native.systemFontBold, 22 )
_G.GUI.NewInput(
		{
		x               = "2%",
		y               = "60%",
		parentGroup     = "Owner1",
		width           = "90%",
		scale           = _G.GUIScalec,
		theme           = "theme_1",
		name            = "MAC",
                FontSize        = "22",
		caption         = amac,
		textColor       = {.07,.14,.07},
		notEmpty        = false,
		isSecure        = false,
		-- DO NOT USE NATIVE KEYBOARD:
		disableInput    = true,
                onFocus         = function(EventData) 
							-- CLEAR TEXT WHEN TEXT FIELD IS FOCUSED FIRST TIME:
							if EventData.value == "MAC" then _G.GUI.Set("MAC", {caption = ""} ) end
						  end,
		-- PRESSED: SHOW WIDGET CANDY KEYBOARD
		onPress         = function(EventData)  
					_G.GUI.Keyboard_Show(
						{
						height   = "40%",
						target   = "MAC",
						align    = "top",
						onType   = function(EventData) print("TYPE: "..EventData.char) end,
						onOK     = function(EventData) print("OK!") end,	
						} )
				end,
                onBlur          = function(EventData) amac=EventData.value end,
                } )	

GUI.NewInput(
		{
		x               = "2%",
		y               = "75%",
		parentGroup     = "Owner1",
		width           = "90%",
		scale           = _G.GUIScalec,
		theme           = "theme_1",
		name            = "IP",
                FontSize        = "22",
		caption         = aip,
		textColor       = {.07,.14,.07},
		notEmpty        = false,
		isSecure        = false,
		-- DO NOT USE NATIVE KEYBOARD:
		disableInput    = true,
                onFocus         = function(EventData) 
							-- CLEAR TEXT WHEN TEXT FIELD IS FOCUSED FIRST TIME:
							if EventData.value == "IP" then _G.GUI.Set("IP", {caption = "192.168."} ) end
						  end,
		-- PRESSED: SHOW WIDGET CANDY KEYBOARD
		onPress         = function(EventData)  
					_G.GUI.Keyboard_Show(
						{
						height   = "40%",
						target   = "IP",
						align    = "top",
						onType   = function(EventData) print("TYPE: "..EventData.char) end,
						onOK     = function(EventData) print("OK!") end,	
						} )
				end,
                onBlur          = function(EventData) aip=EventData.value end,
                } )
                
                
                
         --       GUI.NewInput(
	--	{
	--	x               = "55%",
	--	y               = "60%",
	--	parentGroup     = "Owner1",
	--	width           = "30%",
	--	scale           = _G.GUIScale,
	--	theme           = "theme_1",
	--	name            = "Item",
          --      FontSize        = "22",
	--	caption         = acommes,
	--	textColor       = {.07,.14,.07},
	--	notEmpty        = false,
	--	isSecure        = false,
	--	-- DO NOT USE NATIVE KEYBOARD:
	--	disableInput    = true,
          --      onFocus         = function(EventData) 
							-- CLEAR TEXT WHEN TEXT FIELD IS FOCUSED FIRST TIME:
	--						if EventData.value == "Item" then _G.GUI.Set("Item", {caption = ""} ) end
	--					  end,
		-- PRESSED: SHOW WIDGET CANDY KEYBOARD
	--	onPress         = function(EventData)  
	--				_G.GUI.Keyboard_Show(
	--					{
	--					height   = "40%",
	--					target   = "Item",
	--					align    = "top",
	--					onType   = function(EventData) print("TYPE: "..EventData.char) end,
	--					onOK     = function(EventData) print("OK!") end,	
	--					} )
	--			end,
          --      onBlur          = function(EventData) aitem=EventData.value end,
            --    } )	
                
                
                GUI.NewInput(
		{
		x               = "2%",
		y               = "90%",
		parentGroup     = "Owner1",
		width           = "90%",
		scale           = _G.GUIScalec,
		theme           = "theme_1",
		name            = "Comments",
                FontSize        = "22",
		caption         = "Comments",
		textColor       = {.07,.14,.07},
		notEmpty        = false,
		isSecure        = false,
		-- DO NOT USE NATIVE KEYBOARD:
		disableInput    = true,
                onFocus         = function(EventData) 
							-- CLEAR TEXT WHEN TEXT FIELD IS FOCUSED FIRST TIME:
							if EventData.value == "Comments" then _G.GUI.Set("Comments", {caption = "N/A"} ) end
						  end,
		-- PRESSED: SHOW WIDGET CANDY KEYBOARD
		onPress         = function(EventData)  
					_G.GUI.Keyboard_Show(
						{
						height   = "40%",
						target   = "Comments",
						align    = "top",
						onType   = function(EventData) print("TYPE: "..EventData.char) end,
						onOK     = function(EventData) print("OK!") end,	
						} )
				end,
                onBlur          = function(EventData) acomments=EventData.value end,
                } )	
                
                
                
--_G.GUI.NewButton(
--		{
--		x               = "left",                
--		y               = "90%",                
--		width           = "50%",                   
--		scale           = _G.GUIScale,
--		name            = "BUT_1", 
--		parentGroup     = nil,                     
--		theme           = _G.theme,               
--		caption         = "Save.", 
--		textAlign       = "center",                  
--		icon            = 20,  
--		flipIconX       = true,
--		flipIconY       = false,
--		border          = {"shadow", 8,8, .25},
--		onPress         = function(EventData) EventData.Widget:set("caption", "Save")  end,
--		onRelease       = function(EventData) 
  --                                                      dbsavedb()
							-- RELEASED WHILE INSIDE BUTTON?
							--if EventData.inside then EventData.Widget:set("caption", oname) 
						  	-- RELEASED WHILE OUTSIDE BUTTON?
						  	  --                  else EventData.Widget:set("caption", "Saved") end
--						  end,
--		} )
_G.GUI.NewButton(
		{
		x               = "left",                
		y               = "90%",                
		width           = "40%",                   
		scale           = _G.GUIScalea,
		name            = "BUT_2", 
		parentGroup     = nil,                     
		theme           = _G.theme,               
		caption         = "Save.", 
		textAlign       = "center",                  
		icon            = 20,  
		flipIconX       = true,
		flipIconY       = false,
		border          = {"shadow", 8,8, .25},
		onPress         = function(EventData) EventData.Widget:set("caption", "Save")  end,
		onRelease       = function(EventData) 
                                                        dbsavedb()
							-- RELEASED WHILE INSIDE BUTTON?
							--if EventData.inside then EventData.Widget:set("caption", oname) 
						  	-- RELEASED WHILE OUTSIDE BUTTON?
						  	  --                  else EventData.Widget:set("caption", "Saved") end
						  end,
		} )
                
                _G.GUI.NewButton(
		{
		x               = "right",                
		y               = "90%",                
		width           = "40%",                   
		scale           = _G.GUIScalea,
		name            = "BUT_3", 
		parentGroup     = nil,                     
		theme           = _G.theme,               
		caption         = "Exit.", 
		textAlign       = "center",                  
		icon            = 20,  
		flipIconX       = true,
		flipIconY       = false,
		border          = {"shadow", 8,8, .25},
		onPress         = function(EventData) EventData.Widget:set("caption", "Cancel")  end,
		onRelease       = function(EventData) 
                                                        oncomplete()
							-- RELEASED WHILE INSIDE BUTTON?
							--if EventData.inside then EventData.Widget:set("caption", oname) 
						  	-- RELEASED WHILE OUTSIDE BUTTON?
						  	  --                  else EventData.Widget:set("caption", "Saved") end
						  end,
		} )
--_G.GUI.NewIconBar(
--		{
--		x               = "center",                
--		y               = "bottom",                
--		width           = "90%",
--		height          = 50,
--		scale           = _G.GUIScale,
--		name            = "BAR1",            
--		parentGroup     = nil,                     
--		theme           = "theme_4",               
--		border          = {"normal",6,1, .37,.37,.37,1,  .72,.72,.72,.58}, 
--		bgImage         = {"images/iconbar_background.png", .45, "add" },
--		marker          = {8,1, 1,1,1,.39,  0,0,0,.19}, 
--		glossy		= 0,
--		iconSize        = 32,
--		fontSize        = 15,
--		textColor       = {.25,.25,.25},
--		textColorActive = {1,1,1},
--		textAlign       = "bottom",
--		iconAlign       = "top",
--		icons           = 
--			{
--				{icon = 13 , flipX = false, text = "Intro"},
--				{icon = 11 , flipX = false, text = "Deploy"},
--				{icon = 17, flipX = false, text = "Cache"},
  --                              {icon = 18, flipX = false, text = "Config"},
--			},
                        
  --           onPress         = function(EventData)
  --                              print("ICON "..EventData.selectedIcon.." PRESSED!") 
  --                              
  --                              selectd=EventData.selectedIcon
  --                              print(selectd)
  --                              if selectd==4 then dbsavedb() end--composer.gotoScene("configg")end
  --                              if selectd==3 then composer.gotoScene("options")end
  --                              if selectd==2 then composer.gotoScene("deploy")end
  --                              if selectd==1 then composer.gotoScene("Intro")end
                                
 --                               end, 
--		} )

	-- SELECT ICON NUMBER 1
--	_G.GUI.GetHandle("BAR1"):setMarker(4)
        






end
function scene:exit( event )
	local group = self.view
        _G.GUI.RemoveAllWidgets()
       --   composer.removeScene("")
        --composer.purgeScene("intro")
        _G.GUI.GetHandle("INP_SAMPLE"):destroy() 
	_G.GUI.GetHandle("Owner1"):destroy() 
end

function scene:destroy( event )
	
end


scene:addEventListener( "create",scene )
scene:addEventListener( "exit",scene )
scene:addEventListener( "show",scene )
scene:addEventListener( "destroy",scene )

return scene





