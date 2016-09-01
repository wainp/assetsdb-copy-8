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
local aoffice, aasset, amanufactor, aserial, amac, aip, aitem, acomments, amodel
aid=""


 local function oncomplete( event )
     _G.GUI.RemoveAllWidgets()
       composer.removeScene("kit1")
    composer.gotoScene("options")      
        
        
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
       composer.removeScene("kit1")
        --composer.purgeScene("intro")
        --_G.GUI.GetHandle("owner1"):destroy()
    composer.gotoScene("options")   
    --composer.gotoScene("Intro")
end

function scene:create( event )
	local group = self.view
       -- _G.GUI.GetHandle("LST_main"):destroy()
        _G.GUI.RemoveAllWidgets()
	local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
	titleBar:setFillColor( titleGradient ) 
	titleBar.y = titleBar.contentHeight * 0.5
end


function scene:show( event )
	local group = self.view
local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
titleBar:setFillColor( titleGradient ) 
titleBar.y = titleBar.contentHeight * 0.5
--_G.GUI.UnloadThemes("theme_4")
 --_G.GUI.RemoveAllWidgets()
 display.setStatusBar(display.HiddenStatusBar)
-- local titleText = display.newText( seloffice, halfW, titleBar.y, native.systemFontBold, 22 )
  local titleText = display.newText( " Asset Collection", halfW, titleBar.y, native.systemFontBold, 22 )  
 local path = system.pathForFile("asset.db", system.DocumentsDirectory)
mcst = sqlite3.open( path ) 
local tablesetup = [[CREATE TABLE IF NOT EXISTS office (id INTEGER PRIMARY KEY autoincrement, name, version, update,registered, dbversion);]]
print(tablesetup)
mcst:exec( tablesetup )
oname="Name"
oversion="Version"
oupdate="Update"
oregistered="Registered"
odbversion="DB_Version"
--           wtb="wtb"                -- local alert = native.showAlert( "testvalue[1]", name, { "Yes", "No" }, onComplete )
			--local tablefill =[[INSERT INTO owner VALUES (NULL, ']]..oname..[[',']]..oversion..[[',']]..oupdate..[[',']]..oregistered..[[',']]..odbversion..[['); ]]
                        local tablefill =[[INSERT INTO office VALUES (NULL, "oname"'"oversion"'"oupdate"'"oregistered"'"odbversion)"; ]]
                        mcst:exec( tablefill )
 
      local path = system.pathForFile("assets.db", system.DocumentsDirectory)
    db = sqlite3.open( path ) 
  local  ListData3 =     
	{
	 --{ iconL = 20, caption = "This is Item A."},
	}
   
       local newItemCount = 0
       newItemCount = 1
                                  for row in db:nrows("SELECT * FROM assets order by office") do
                                         if seled==newItemCount then
                                             aoffice=row.office
                                             aid=row.id
                                        end
                                        newItemCount = newItemCount + 1
                                    end
      
        table.insert(ListData3, newItemCount, {iconL = 21, caption = (aitem)})
      --  table.insert(ListDatao, newItemCount, {iconL = 20, caption = offname})
           
        
--local alert = native.showAlert( seloffice, row.office, { "OK", row.id })
   -- end
     
       --end



_G.GUI.NewList(
	{
	x                 = "center",               
	y                 = "center",               
	width             = "5%",                  
	height            = "60%",          
	scale             = _G.GUIScaleb,
	parentGroup       = MainWindow,                    
	theme             = _G.theme,               
	name              = "LST_asset2",             
	caption           ="Assets",   
	list              = ListData3,               
	allowDelete       = false, 
	readyCaption      = "Quit Editing",   
	scrollbar         = "onScroll",
	scrollbarAlpha    = 255,
	border            = {"shadow", 8,8, .25},
	onSelect          = function(EventData) 
                                 seled =(EventData.Item)
                                -- print("Selected Items Number: "..seled)
                               --   selid=row.id
                              composer.gotoScene("selasset")
                                
                
                                
                            end,
        
        
        
  
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









