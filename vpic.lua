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
local oname, oversion, odbversion, oid
local currentLatitude = 0
local currentLongitude = 0
local latitude = display.newText( "--", 0, 0, native.systemFont, 26 )
local longitude = display.newText( "--", 0, 0, native.systemFont, 26 )
local oupdate = display.newText( "--", 0, 0, native.systemFont, 26 )
local oregistered = display.newText( "--", 0, 0, native.systemFont, 26 )
display.setDefault( "anchorX", 0.0 )
local screenH = display.contentHeight



function scene:create( event )
	local group = self.view
        _G.GUI.RemoveAllWidgets()
local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
titleBar:setFillColor( titleGradient ) 
titleBar.y = titleBar.contentHeight * 0.5
end


function scene:show( event )
ListData = { }
newItemCount =0
	local names   = {"Jane Doe","Kim Lee","Joan Doe","Sarah Woods","John Handsome","T. J. Hooker","Bello","Frank Coder","Angry Girl","Maya Man"}
        local oid, oname, ophoto, ocomments, odate
   local path = system.pathForFile("Pictures.db", system.DocumentsDirectory)
    db = sqlite3.open( path ) 
    --print all the table contents
    local sql = "SELECT * FROM Opics"  --where Office = Seloffice "
    
    for row in db:nrows(sql) do
        --local text = row.oname.." "..row.oversion
       
            oid=row.id
            oname=row.oname
            ophoto=row.ophoto
            ocomments=ocomments
            odate=row.odate
            oid=row.id
--if oid== nil then
    newItemCount = newItemCount + 1   

                table.insert(ListData, 
                        newItemCount, 
                        {iconL = 20, 
                        caption = ophoto
                       -- image=ophoto,
                       -- imageSize = 60,
                       -- baseDir   = system.DocumentsDirectory
                        })
                
                
                
                
                
                
                
                
              -- table.insert(ListData, 
		--	{ 
		--	caption   = "This is Item "..ophoto, 
		--	anyData   = ophoto,
		--	image     = ophoto, -- IMAGE FILE TO BE USED FOR THIS ITEM
		--	imageSize = 60,                             -- DEFAULT IS ICON SIZE (AS DEFINED IN THEME.LUA)
		--	baseDir   = system.DocumentsDirectory,       -- IMAGE FILE BASE DIRECTORY (F.E. system.DocumentsDirectory ETC. )
		--	} )
		--table.insert(ListData, 
		--	{ 
		--	caption   = "This is Item ", 
		--	anyData   = oname,
		--	image     = ophoto, -- IMAGE FILE TO BE USED FOR THIS ITEM
		--	imageSize = 60,                             -- DEFAULT IS ICON SIZE (AS DEFINED IN THEME.LUA)
		--	--baseDir   = system.DocumentsDirectory,       -- IMAGE FILE BASE DIRECTORY (F.E. system.DocumentsDirectory ETC. )
		--	} )
	--end
end
--end
	-- CREATE A LIST
	_G.GUI.NewList(
		{
		x                 = "center",               
		y                 = 37,               
		width             = "60%",                  
		height            = "75%",                  
		scale             = _G.GUIScale,
		parentGroup       = nil,                    
		theme             = _G.theme,              
		name              = "LST_SAMPLE",             
		caption           = "Using Custom Images",
		list              = ListData,      
		itemHeight        = 80,                        -- NEW: SET HEIGHT OF LIST ITEMS
		allowDelete       = true,                   
		readyCaption      = "Quit Editing",   
		border            = {"shadow", 8,8, .25},
		onSelect          = function(EventData) 
                                 seled =(EventData.Item)
                                -- print("Selected Items Number: "..seled)
                                  seloffice=seled.caption
                                   _G.GUI.RemoveAllWidgets()
                                    composer.gotoScene("vpic1")
                                    local background = display.newImage( seloffice, display.contentCenterX, display.contentCenterY, true )
                                    --local myImage = display.newImage(ophoto)
                                                                
                                                                
                                                                --print("Selected Item Number: "..num.." customData: "..List[num].anyData)
							end,
		} )

	-- BUTTON: ADD REMOVE LIST'S CAPTION
	_G.GUI.NewButton(
		{
		x               = "center",                
		y               = "bottom",                
		width           = "70%",                   
		scale           = _G.GUIScale,
		name            = "BUT_SIMPLE",            
		parentGroup     = nil,                     
		theme           = _G.theme,               
		caption         = "Add  Remove List's Title Caption", 
		textAlign       = "center",                  
		icon            = 20,
		toggleButton    = true,
		toggleState     = false,
		border          = {"shadow", 8,8, .25},
		onRelease       = function(EventData) 
							if EventData.Props.toggleState == true then
								_G.GUI.GetHandle("LST_SAMPLE"):set("caption", "")
							else
								_G.GUI.GetHandle("LST_SAMPLE"):set("caption", "Simple List")
							end
						  end,
		} )
--end
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
