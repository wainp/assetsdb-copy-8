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
local oname, oversion, oupdate, oregistered, odbversion, oitem, ooffice, oserial, oasset
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
local oname, oversion, odbversion, oid, newItemCount,  oassetl
local currentLatitude = 0
local currentLongitude = 0
local latitude = display.newText( "--", 0, 0, native.systemFont, 26 )
local longitude = display.newText( "--", 0, 0, native.systemFont, 26 )
local oupdate = display.newText( "--", 0, 0, native.systemFont, 26 )
local oregistered = display.newText( "--", 0, 0, native.systemFont, 26 )
display.setDefault( "anchorX", 0.0 )


local function map( event )
mapURL = "http://maps.google.com/maps?q=Hello,+Corona!@" .. currentLatitude .. "," .. currentLongitude

--mapURL = "http://maps.google.com/maps?q=Hello,+Corona!@" .. oupdate .. "," .. oregistered
	system.openURL( mapURL )

end

 local function oncomplete( event )
     _G.GUI.RemoveAllWidgets()
       composer.removeScene("sitem")
        --composer.purgeScene("intro")
        --_G.GUI.GetHandle("owner1"):destroy()
    composer.gotoScene("options")      
        
        
end
   
 local function onassetcomplete( event )
     _G.GUI.RemoveAllWidgets()
       composer.removeScene("officedetails")
        --composer.purgeScene("intro")
        --_G.GUI.GetHandle("owner1"):destroy()
    composer.gotoScene("oassets")      
        
        
end
      
   
   
 local function dbsavedb( event )
local path = system.pathForFile("assets.db", system.DocumentsDirectory)
mcst = sqlite3.open( path ) 
local tablesetup = [[CREATE TABLE IF NOT EXISTS office (id INTEGER PRIMARY KEY autoincrement, office, address, x,y, contact);]]
print(tablesetup)
mcst:exec( tablesetup )
-- local alert = native.showAlert( oname, "Do you wish to save data ?", { "Yes","N0"} )
--oname="name"
--           wtb="wtb"                -- local alert = native.showAlert( "testvalue[1]", name, { "Yes", "No" }, onComplete )
			local tablefill =[[INSERT INTO office VALUES (NULL, ']]..oname..[[',']]..oversion..[[',']]..oupdate..[[',']]..oregistered..[[',']]..odbversion..[['); ]]
                       -- local tablefill =[[INSERT INTO owner VALUES (NULL, "oname"'"oversion"'"oupdate"'"oregistered"'"odbversion)"; ]]
                        mcst:exec( tablefill )
    db:close()
-- local alert = native.showAlert( oname, "Do you wish to save data ?", { "Yes","N0"} )
_G.GUI.RemoveAllWidgets()
       composer.removeScene("officedetails")
        --composer.purgeScene("intro")
        --_G.GUI.GetHandle("owner1"):destroy()
    composer.gotoScene("oassets")   
    --composer.gotoScene("Intro")
end

function scene:create( event )
	local group = self.view
        _G.GUI.RemoveAllWidgets()


end


function scene:show( event )
	local group = self.view

 
 local path = system.pathForFile("asset.db", system.DocumentsDirectory)
mcst = sqlite3.open( path ) 
local tablesetup = [[CREATE TABLE IF NOT EXISTS office (id INTEGER PRIMARY KEY autoincrement, name, version, update,registered, dbversion);]]
print(tablesetup)
mcst:exec( tablesetup )
--oname="Name"
--oversion="Version"
--oupdate="Update"
--oregistered="Registered"
--odbversion="DB_Version"
--           wtb="wtb"                -- local alert = native.showAlert( "testvalue[1]", name, { "Yes", "No" }, onComplete )
			--local tablefill =[[INSERT INTO owner VALUES (NULL, ']]..oname..[[',']]..oversion..[[',']]..oupdate..[[',']]..oregistered..[[',']]..odbversion..[['); ]]
--                        local tablefill =[[INSERT INTO office VALUES (NULL, "oname"'"oversion"'"oupdate"'"oregistered"'"odbversion)"; ]]
--                        mcst:exec( tablefill )
 ListData =     
	{
	
               
	}
      local path = system.pathForFile("assets.db", system.DocumentsDirectory)
    db = sqlite3.open( path ) 
    --print all the table contents
    local sql = "SELECT * FROM assets"  --where Office = Seloffice "
    ooffice="Office"
    oasset="Asset"
    oitem="item"
   oserial="serial"
    --odbversion="Contact"
    newItemCount =0
    for row in db:nrows(sql) do
        --local text = row.oname.." "..row.oversion
        if seloffice==row.item then 
             ooffice=row.office
            oasset=row.asset
            oitem=row.item
            oserial=row.serial
            oassetl=oasset.."    "..ooffice.."    "..oserial
           newItemCount = newItemCount + 1
             table.insert(ListData, newItemCount, {iconL = 20, caption = oassetl})
        end
       -- local t = display.newText( text, 120, 30 * row.id, native.systemFont, 24 )
       -- t:setTextColor( 255,255,255 )
       end
 
 
 
_G.GUI = require("widget_candy")

-- CREATE THE WIDGET
--_G.GUI.NewWindow(
--		{
--		x               = "center",
--		y               = "15%",
--		scale           = _G.GUIScale,
--		parentGroup     = nil,
--		width           = "95%",
--		height          = "65%",
--		minHeight       = 50,
--		theme           = _G.theme,
--		name            = "Owner1",
---		caption         = oitem,
--		textAlign       = "center",
--		icon            = 19,
--		fadeInTime      = 500,
  --              modal           = "True",
--		margin          = 20,
--		noTitle         = false,
--		shadow          = true,
--		closeButton     = true,
--		dragX           = true,
--		dragY           = true,
--		slideOut        = .7,
--		dragArea        = "auto",
--		--onPress         = function(EventData) print("WINDOW PRESSED!") end,
		--onDrag          = function(EventData) print("WINDOW DRAGGED!") end,
		--onRelease       = function(EventData) print("WINDOW RELEASED!"..EventData.value) end,
		--onWidgetPress   = function(EventData) print("WINDOW WIDGET PRESSED: "..EventData.name) end,
--		onClose         = function(EventData) _G.UnloadSample() end,
--		} )
                
--V.defaultCaption = "Enter Your Name..."

  --  _G.GUI.GetHandle("LST_MAIN"):destroy()    
  _G.GUI.NewList(
	{
	x                 = "center",               
	y                 = "center",               
	width             = "75%",                  
	height            = "80%",          
	scale             = _G.GUIScale,
        fontSize          = "30", 
	parentGroup       = MainWindow,                    
	theme             = _G.theme,               
	name              = "LST_MAIN",             
	caption           = oitem,   
	list              = ListData,               
	allowDelete       = false, 
	readyCaption      = "Quit Editing",   
	scrollbar         = "onScroll",
	scrollbarAlpha    = 255,
	border            = {"shadow", 8,8, .25},
	onSelect          = function(EventData) 
                            
                               composer.gotoScene("options")
                                
                
                                
                            end,
        
        
        
       -- onPress          = function(EventData)
         --                       print("ICON "..EventData.selectedIcon.." PRESSED!") 
           --                     
             --                   selectd=EventData.selectedIcon
               --                 print(selectd)
                 --               if selectd ==1 then composer.gotoScene("tab1")end
                   --             if selectd==2 then composer.gotoScene("tab2")end
                     --           if selectd==3 then composer.gotoScene("tab3")end
        
        
        
	} )     
       








_G.GUI.NewButton(
		{
		x               = "center",                
		y               = "90%",                
		width           = "50%",                   
		scale           = _G.GUIScale,
		name            = "BUT_1", 
		parentGroup     = nil,                     
		theme           = _G.theme,               
		caption         = "Close.", 
		textAlign       = "center",                  
		icon            = 20,  
		flipIconX       = true,
		flipIconY       = false,
		border          = {"shadow", 8,8, .25},
		--onPress         = function(EventData) EventData.Widget:set("caption", oname)  end,
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
        _G.GUI.RemoveAllWidgets()
       --   composer.removeScene("intro")
        --composer.purgeScene("intro")
        _G.GUI.GetHandle("INP_SAMPLE"):destroy() 
	_G.GUI.GetHandle("TXT_1"):destroy() 
end

function scene:destroy( event )
	
end


scene:addEventListener( "create",scene )
scene:addEventListener( "exit",scene )
scene:addEventListener( "show",scene )
scene:addEventListener( "destroy",scene )

return scene









