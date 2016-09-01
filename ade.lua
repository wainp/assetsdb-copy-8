-- Ade
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
local oname, oversion, oupdate, oregistered, odbversion,offname
local aname,aoffice, aasset,amanufactor, aserial, amac, aip, acommes, aitem, amodal, acomments
local newItemCount, seloffice, offbrand, offmodal
local qrscanner = require('plugin.qrscanner')




local function listener(message)
    -- message variable contains the value of a scanned QR Code or a barcode.
   --native.showAlert('QR Code Scanner', message, {'OK'})
   
  	_G.GUI.Set("Asset", {caption = message} )
  	aasset=message
  	--local alert = native.showAlert( aasset, message, { "Yes","N0"} )
end


local function listeners(message)
    -- message variable contains the value of a scanned QR Code or a barcode.
   --native.showAlert('QR Code Scanner', message, {'OK'})
  	_G.GUI.Set("Serial", {caption = message} )
  	aserial=message
  	--local alert = native.showAlert( aserial, message, { "Yes","N0"} )
end

        
    

local function showoffice(event)
local path = system.pathForFile("assets.db", system.DocumentsDirectory)
 -- local path = system.pathForFile("assets.db", system.DocumentsDirectory)
    db = sqlite3.open( path ) 
   local newItemCount = 0
    for row in db:nrows("SELECT * FROM OFFICE order by office") do
        offname=row.office
        if offname==nil 
            then oname="End" 
        end
        newItemCount = newItemCount + 1   
        table.insert(ListData, newItemCount, {iconL = 20, caption = offname})
end
end
 local function oncomplete( event )
     _G.GUI.RemoveAllWidgets()
    composer.removeScene("ade")
    composer.gotoScene("oassets")      
        
        
end
   
local function dbsavedb( event )
    
local path = system.pathForFile("assets.db", system.DocumentsDirectory)
vassets = sqlite3.open( path )
if aaset == nil then aaset ="N/A" end
if aitem == nil then aitem ="N/A" end
if amodal == nil then amodal ="N/A" end
if aserial == nil then aserial =message end
if amac == nil then amac ="N/A" end
if aip == nil then aip ="N/A" end
if aitem == nil then aitem ="N/A" end
if acomments == nil then acomments ="N/A" end
--local tablesetup = [[CREATE TABLE IF NOT EXISTS office (id INTEGER PRIMARY KEY autoincrement, office, address, x,y, contact);]]
--print(tablesetup)
--mcst:exec( tablesetup )''
--amodal="SRX210"
 --local tablefill =[[INSERT INTO office VALUES (NULL, ']].."oname"..[[',']].."oversion"..[[',']].."oupdate"..[[',']].."oregistered"..[[',']].."odbversion"..[['); ]]
  local tablefill =[[INSERT INTO assets VALUES (NULL, ']]..seloffice..[[',']]..aasset..[[',']]..aitem..[[',']]..amodal..[[',']]..aserial..[[',']]..amac..[[',']]..aip..[[',']]..aitem..[[',']]..acomments..[['); ]]
--local tablefill =[[INSERT INTO odetails VALUES (NULL, ']]..aoffice..[[',']]..aasset..[[',']]..amanufactor..[[',']]..aserial..[[',']]..amac..[['); ]]

                       -- local tablefill =[[INSERT INTO owner VALUES (NULL, "oname"'"oversion"'"oupdate"'"oregisteredc"'"odbversion)"; ]]
   vassets:exec( tablefill )
    vassets:close()
--local alert = native.showAlert( aserial, message, { "Yes","N0"} )
--local alert = native.showAlert( message, "message ?", { "Yes","N0"} )
_G.GUI.GetHandle("Owner5"):destroy() 
_G.GUI.RemoveAllWidgets()
       composer.removeScene("ade")
        composer.purgeScene("ade")
        --_G.GUI.GetHandle("owner1"):destroy()
    composer.gotoScene("oassets")   
    --composer.gotoScene("Intro")
end
      
   
   
 





function scene:create( event )
	local group = self.view
        _G.GUI.RemoveAllWidgets()
--local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
--titleBar:setFillColor( titleGradient ) 
--titleBar.y = titleBar.contentHeight * 0.5
        

end


function scene:show( event )
	local group = self.view
--local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
--titleBar:setFillColor( titleGradient ) 
--titleBar.y = titleBar.contentHeight * 0.5
--_G.GUI.UnloadThemes("theme_4")
 --_G.GUI.RemoveAllWidgets()
 --display.setStatusBar(display.HiddenStatusBar)
 --local titleText = display.newText( "Office Assets - Enter Details", halfW, titleBar.y, native.systemFontBold, 22 )
 ListData = nil
 ListData =     
	{
	--{ iconR = 23, caption = "Office Details" , textColor = {1,1,.39}, bgColor = {0,0,0}, selectable = false },
          --      { iconL = 29, caption = "Manual entry"         },	
                
               
	}
ListDatao =     
	{
	--{ iconR = 23, caption = "Office Details" , textColor = {1,1,.39}, bgColor = {0,0,0}, selectable = false },
          --      { iconL = 29, caption = "Manual entry"         },	
                
               
	}
newItemCount=0
--local path = system.pathForFile("assets.db", system.DocumentsDirectory)
--   db = sqlite3.open( path ) 
--   local newItemCount = 0
--      for row in db:nrows("SELECT DISTINCT OFFICE FROM ASSETS order by office;") do
    
--        offname=row.office
--        if offname==nil 
--            then oname="End" 
        --end
--     newItemCount = newItemCount + 1
--                               table.insert(ListData, newItemCount, {iconL = 20, caption = offname})
                                
--         end               
 
      local path = system.pathForFile("assets.db", system.DocumentsDirectory)
    db = sqlite3.open( path ) 
   aoffice="Office"
   aasset="Asset"
   amanufactor="Manufactor"
   aserial ="Serial"
   amodal="N/A"
   amac="MAC" 
   aip="IP"
   acommes="Comments" 
   aitem= "Item"
   seloffice="Office"
   
-- CREATE THE WIDGET
_G.GUI.NewWindow(
		{
		x               = "center",
		y               = "15%",
		scale           = _G.GUIScaled,
		parentGroup     = nil,
		width           = "95%",
		height          = "65%",
		minHeight       = 50,
		theme           = _G.theme,
		name            = "Owner5",
		caption         = "Office Details",
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
		parentGroup     = "Owner5",
		width           = "90%",
		scale           = _G.GUIScalec,
		theme           = "theme_1",
		name            = "office",
                fontSize        = fonts,
                quitCaption      ="Tap screen to finish text input.",
		caption         = "Office",
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
                    
local path = system.pathForFile("assets.db", system.DocumentsDirectory)
 -- local path = system.pathForFile("assets.db", system.DocumentsDirectory)
    db = sqlite3.open( path ) 
   local newItemCount = 0
    for row in db:nrows("SELECT * FROM OFFICE order by office") do
        offname=row.office
        if offname==nil 
            then oname="End" 
        end
        newItemCount = newItemCount + 1   
      
        table.insert(ListData, newItemCount, {iconL = 20, caption = offname})
      --  table.insert(ListDatao, newItemCount, {iconL = 20, caption = offname})
end                    
                    
                    
_G.GUI.NewList(
	{
	x                 = "center",               
	y                 = "center",               
	width             = "95%",                  
	height            = "70%",          
	scale             = _G.GUIScale,
	parentGroup       = MainWindow,                    
	theme             = _G.theme,               
	name              = "LST_MAIN",  
        fontSize        = fonts,
	caption           = "Offices",   
	list              = ListData,               
	allowDelete       = false, 
	readyCaption      = "Quit Editing",   
	scrollbar         = "onScroll",
	scrollbarAlpha    = 255,
	border            = {"shadow", 8,8, .25},
	onSelect          = function(EventData) 
                                 seled =(EventData.Item)
                                 --print("Selected Items Number: "..seled)
                                  seloffice=seled.caption
                                  --aoffice=EventData.value
                                  _G.GUI.GetHandle("LST_MAIN"):destroy()
                                  _G.GUI.Set("office", {caption = seled.caption} )
                                  -- _G.GUI.RemoveAllWidgets()
                              -- composer.gotoScene("ade")
                                end,
                            } )
				end,
                                onBlur          = function(EventData) aoffice=EventData.value end,
                             --   onBlur          = function(EventData) print("FINISHED TEXT INPUT: "..EventData.value) end,
                } )
                
message="N/A"
_G.GUI.NewInput(
		{
		x               = "2%",
		y               = "13%",
		parentGroup     = "Owner5",
		width           = "90%",
		scale           = _G.GUIScalec,
		theme           = "theme_1",
		name            = "Asset",
                fontSize        = fonts,
		caption         = "asset",
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
								_G.GUI.Confirm(
		{
		name       = "WIN_ALERT1",
		modal      = true,
		theme      = _G.theme, 
		width      = "65%",
		height     = "auto",
		scale      = _G.GUIScalec,
		icon       = 14,
		fadeInTime = 500,
		title      = "Barcode ?",
		caption    = "Would you like to Scan Barcode?", 
		onPress    = function(EventData) print("Button pressed: "..EventData.button) end,
		onRelease  = function(EventData) if EventData.button == 2 then 
			_G.GUI.Keyboard_Show(
						{
						height   = "30%",
						target   = "Asset",
						align    = "bottom",
						onType   = function(EventData) print("TYPE: "..EventData.char) end,
						onOK     = function(EventData) print("OK!") end,	
						} ) 
		
					print(EventData.button)
					elseif EventData.button == 1 then 
						local rect = display.newRect(display.contentCenterX, display.contentCenterY, 100, 100)
						rect:setFillColor(0.75)
							qrscanner.show(listener)
							 _G.GUI.Set("Asset", {caption = message} )
							--aserial==message
							display.remove( rect)
							print(message)
							--print(EventData.button)
						end end,
						
		buttons    = 
			{
				{icon = 15, caption = "Yes",},
				{icon = 16, caption = "No" ,},
			},
		} )

	
	
				
		

			end,
		
                onBlur          = function(EventData) aasset=EventData.value end,
                } )
        _G.GUI.NewInput(
		{
		x               = "2%",
		y               = "26%",
		parentGroup     = "Owner5",
		width           = "90%",
		scale           = _G.GUIScalec,
		theme           = "theme_1",
		name            = "item",
                fontSize        = fonts,
                quitCaption      ="Tap screen to finish text input.",
		caption         = "Name",
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
                    
local path = system.pathForFile("assets.db", system.DocumentsDirectory)
 -- local path = system.pathForFile("assets.db", system.DocumentsDirectory)
    db = sqlite3.open( path ) 
   local newItemCount = 0
    for row in db:nrows("SELECT * FROM item order by item") do
        offname=row.item
        offbrand=row.make
        offmodal=row.modal
        if offname==nil 
            then oname="End" 
        end
        newItemCount = newItemCount + 1   
      
        table.insert(ListDatao, newItemCount, {iconL = 20, caption = (offname.."    "..offbrand.."     "..offmodal)})
      --  table.insert(ListDatao, newItemCount, {iconL = 20, caption = offname})
end                    
                    
                    
_G.GUI.NewList(
	{
	x                 = "center",               
	y                 = "center",               
	width             = "95%",                  
	height            = "60%",          
	scale             = _G.GUIScaleb,
	parentGroup       = MainWindow,                    
	theme             = _G.theme,    
        fontSize        = fonts,
	name              = "LST_MAINo",             
	caption           = "Offices",   
	list              = ListDatao,               
	allowDelete       = false, 
	readyCaption      = "Quit Editing",   
	scrollbar         = "onScroll",
	scrollbarAlpha    = 255,
	border            = {"shadow", 8,8, .25},
	onSelect          = function(EventData) 
                                 seled =(EventData.Item)
                                 --print("Selected Items Number: "..seled)
                                  aitem=seled.caption
                                  --aoffice=EventData.value
                                  _G.GUI.Set("item", {caption = seled.caption} )
                                  -- _G.GUI.RemoveAllWidgets()
                                  _G.GUI.GetHandle("LST_MAINo"):destroy()
                              -- composer.gotoScene("ade")
                                end,
                            } )
				end,
                                onBlur          = function(EventData) aitem=EventData.value end,
                             --   onBlur          = function(EventData) print("FINISHED TEXT INPUT: "..EventData.value) end,
                } )







	-- CREATE A TEXT
_G.GUI.NewInput(
		{
		x               = "2%",
		y               = "39%",
		parentGroup     = "Owner5",
		width           = "90%",
		scale           = _G.GUIScalec,
		theme           = "theme_1",
		name            = "Manufactor",
              fontSize        = fonts,  
		caption         = "Manufactor",
		textColor       = {.07,.14,.07},
		notEmpty        = false,
		isSecure        = false,
		-- DO NOT USE NATIVE KEYBOARD:
		disableInput    = true,
                onFocus         = function(EventData) 
							-- CLEAR TEXT WHEN TEXT FIELD IS FOCUSED FIRST TIME:
							if EventData.value == "Manufactor" then _G.GUI.Set("Manufactor", {caption = "N/A"} ) end
						  end,
		-- PRESSED: SHOW WIDGET CANDY KEYBOARD
		onPress         = function(EventData)  
					_G.GUI.Keyboard_Show(
						{
						height   = "30%",
						target   = "Manufactor",
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
		y               = "52%",
		parentGroup     = "Owner5",
		width           = "90%",
		scale           = _G.GUIScalec,
		theme           = "theme_1",
		name            = "Serial",
                fontSize        = fonts,
		caption         = "Serial",
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
								_G.GUI.Confirm(
		{
		name       = "WIN_ALERT1",
		modal      = true,
		theme      = _G.theme, 
		width      = "65%",
		height     = "auto",
		scale      = _G.GUIScale,
		icon       = 14,
		fadeInTime = 500,
		title      = "Barcode ?",
		caption    = "Would you like to Scan Barcode?", 
		onPress    = function(EventData) print("Button pressed: "..EventData.button) end,
		onRelease  = function(EventData) if EventData.button == 2 then 
			_G.GUI.Keyboard_Show(
						{
						height   = "30%",
						target   = "Serial",
						align    = "bottom",
						onType   = function(EventData) print("TYPE: "..EventData.char) end,
						onOK     = function(EventData) print("OK!") end,	
						} ) 
		
					print(EventData.button)
					elseif EventData.button == 1 then 
						local rect = display.newRect(display.contentCenterX, display.contentCenterY, 100, 100)
						rect:setFillColor(0.75)
							qrscanner.show(listeners)
							_G.GUI.Set("Serial", {caption = message} )
							display.remove( rect)
							print(message)
								aserial=message
							--print(EventData.button)
						end end,
						
		buttons    = 
			{
				{icon = 15, caption = "Yes",},
				{icon = 16, caption = "No" ,},
			},
		} )

	
	
				
		

			end,
		
                onBlur          = function(EventData) aasset=EventData.value end,
                } )_G.GUI.NewInput(
		{
		x               = "2%",
		y               = "65%",
		parentGroup     = "Owner5",
		width           = "90%",
		scale           = _G.GUIScalec,
		theme           = "theme_1",
		name            = "vdate",
                fontSize        = fonts,
                quitCaption      ="Tap screen to finish text input.",
		caption         = "Visit Date",
		textColor       = {.07,.14,.07},
		notEmpty        = false,
		isSecure        = false,
		-- DO NOT USE NATIVE KEYBOARD:
		disableInput    = true,
               -- onBlur          =  if EventData.value == "Name" then "oname"=EventData.value end,
	--					  end,
                onFocus         = function(EventData) 
							-- CLEAR TEXT WHEN TEXT FIELD IS FOCUSED FIRST TIME:
							if EventData.value == "vdate" then _G.GUI.Set("vdate", {caption = os.date()} ) end
						  end,
		-- PRESSED: SHOW WIDGET CANDY KEYBOARD
		onPress         = function(EventData)  
                    
--local path = system.pathForFile("assets.db", system.DocumentsDirectory)
--     db = sqlite3.open( path ) 
--   local newItemCount = 0
--    for row in db:nrows("SELECT * FROM OFFICE order by office") do
--        offname=row.office
--        if offname==nil 
--            then oname="End" 
 --       end
 --       newItemCount = newItemCount + 1   
      
 --       table.insert(ListData, newItemCount, {iconL = 20, caption = offname})
--end                    
 local ListDatav =     
	{
		--{ iconL = 29, caption = "Update Database"        , fileName = "sample_list_scro" },
                   { iconR = 23, caption = "Select Site Visit Date" , textColor = {1,1,.39}, bgColor = {0,0,0}, selectable = false },
                
                { iconL = 34, caption = "October   2015"  },
                { iconL = 34, caption = "November  2015"  },
                { iconL = 34, caption = "December  2015"  },
                { iconL = 34, caption = "Januarary 2016"  },
                { iconL = 33, caption = "February  2016"  },
                { iconL = 34, caption = "March     2016"  },
                { iconL = 34, caption = "April     2016"  },
                { iconL = 34, caption = "May       2016"  },
                { iconL = 30, caption = "June      2016"  },
                { iconL = 31, caption = "July      2016"  },
		{ iconL = 32, caption = "August    2016"  },
                { iconL = 33, caption = "September 2016"  },
                { iconL = 34, caption = "October   2016"  },
                { iconL = 34, caption = "November  2016"  },
                { iconL = 34, caption = "December  2016"  },
                { iconL = 34, caption = "Januarary 2017"  },
                { iconL = 33, caption = "February  2017"  },
                { iconL = 34, caption = "March     2017"  },
                { iconL = 34, caption = "April     2017"  },
                { iconL = 34, caption = "May       2017"  },
	}                   
                    
_G.GUI.NewList(
	{
	x                 = "center",               
	y                 = "center",               
	width             = "75%",                  
	height            = "60%",          
	scale             = _G.GUIScale,
	parentGroup       = MainWindow,                    
	theme             = _G.theme,               
	name              = "LST_vdate",  
        fontSize        = fonts,
	caption           = "Dates",   
	list              = ListDatav,               
	allowDelete       = false, 
	readyCaption      = "Quit Editing",   
	scrollbar         = "onScroll",
	scrollbarAlpha    = 255,
	border            = {"shadow", 8,8, .25},
	onSelect          = function(EventData) 
                                 seled =(EventData.Item)
                                 --print("Selected Items Number: "..seled)
                                  amac=seled.caption
                                  --aoffice=EventData.value
                               
                                  _G.GUI.Set("vdate", {caption = seled.caption} )
                                   _G.GUI.GetHandle("LST_vdate"):destroy()
                                  -- _G.GUI.RemoveAllWidgets()
                              -- composer.gotoScene("ade")
                                end,
                            } )
				end,
                                onBlur          = function(EventData) amac=EventData.value end,
                             --   onBlur          = function(EventData) print("FINISHED TEXT INPUT: "..EventData.value) end,
                } )
                	

GUI.NewInput(
		{
		x               = "2%",
		y               = "78%",
		parentGroup     = "Owner5",
		width           = "90%",
		scale           = _G.GUIScalec,
		theme           = "theme_1",
		name            = "IP",
                fontSize        = fonts,
		caption         = "IP",
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
                
                
                
          --      GUI.NewInput(
	--	{
	--	x               = "55%",
	--	y               = "60%",
	--	parentGroup     = "Owner5",
	--	width           = "30%",
	--	scale           = _G.GUIScale,
	--	theme           = "theme_1",
	--	name            = "Item",
          --      FontSize        = "22",
	--	caption         = "Item",
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
		y               = "91%",
		parentGroup     = "Owner5",
		width           = "90%",
		scale           = _G.GUIScalec,
		theme           = "theme_1",
		name            = "Comments",
                fontSize        = fonts,
		caption         = "Comments",
		textColor       = {.07,.14,.07},
		notEmpty        = false,
		isSecure        = false,
		-- DO NOT USE NATIVE KEYBOARD:
		disableInput    = true,
                onFocus         = function(EventData) 
							-- CLEAR TEXT WHEN TEXT FIELD IS FOCUSED FIRST TIME:
							if EventData.value == "Comments" then _G.GUI.Set("Comments", {caption = "Notes: "} ) end
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
                
                
                
_G.GUI.NewButton(
		{
		x               = "left",                
		y               = "90%",                
		width           = "50%",                   
		scale           = _G.GUIScale,
		name            = "BUT_1", 
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
		width           = "50%",                   
		scale           = _G.GUIScale,
		name            = "BUT_2", 
		parentGroup     = nil,                     
		theme           = _G.theme,               
		caption         = "Cancel.", 
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


end
function scene:exit( event )
	local group = self.view
       --composer.purgeScene("intro")
        _G.GUI.GetHandle("LST_MAIN"):destroy() 
        _G.GUI.GetHandle("LST_MAINo"):destroy() 
        _G.GUI.GetHandle("Owner5"):destroy()
        _G.GUI.GetHandle(""):destroy() 
        _G.GUI.GetHandle("office"):destroy()
         _G.GUI.GetHandle("Asset"):destroy()
         _G.GUI.GetHandle("item"):destroy()
         _G.GUI.GetHandle("Manufactor"):destroy()
          _G.GUI.GetHandle("Serial"):destroy()
          _G.GUI.GetHandle("MAC"):destroy()
          _G.GUI.GetHandle("IP"):destroy()
          _G.GUI.GetHandle("Comments"):destroy()
          _G.GUI.GetHandle("BUT_1"):destroy()
          _G.GUI.GetHandle("BUT_2"):destroy()
          _G.GUI.GetHandle("LST_MAIN"):destroy()
         
         
        --_G.GUI.GetHandle("TXT_1"):destroy()
         _G.GUI.RemoveAllWidgets()
         composer.removeScene("ade")
end

function scene:destroy( event )
--_G.GUI.GetHandle("Owner5"):destroy() 	
end


scene:addEventListener( "create",scene )
scene:addEventListener( "exit",scene )
scene:addEventListener( "show",scene )
scene:addEventListener( "destroy",scene )

return scene





