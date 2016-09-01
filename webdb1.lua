--This module webdb1 imports the data file assets.db from the webserver using JSON format
require "sqlite3"
local widget = require( "widget" )
local composer = require( "composer" )
local scene = composer.newScene()
local halfW = display.contentCenterX
local halfH = display.contentCenterY
local widget = require( "widget" )
local rep, dcrew, junkf, junkn, junkc, pvsmsto, junkl,aserial
local odbversion, oname, oversion, oupdate, oregistered, capp

 local function networkListenernet( event )
    if ( event.isError ) then
        print( "Network error: ", event.response )
        local alert = native.showAlert( "Warning", event.response, { "OK" } )
    elseif ( event.phase == "began" ) then
        if ( event.bytesEstimated <= 0 ) then
            print( "Download starting, size unknown" )
        else
            print( "Download starting, estimated size: " .. event.bytesEstimated )
        end

    elseif ( event.phase == "progress" ) then
        if ( event.bytesEstimated <= 0 ) then
            print( "Download progress: " .. event.bytesTransferred )
        else
            print( "Download progress: " .. event.bytesTransferred .. " of estimated: " .. event.bytesEstimated )
        end

    elseif ( event.phase == "ended" ) then
        print( "Download complete, total bytes transferred: " .. event.bytesTransferred )
    end
    capp="Download Complete filesize = "..event.bytesEstimated
     _G.GUI.NewLabel(
		{
		x               = "center",                
		y               = display.contentHeight * .2, 
		width           = "50%",
		scale           = _G.GUIScale,
		name            = "LBL_2",            
		parentGroup     = nil,                     
		theme           = "theme_1", 
		icon            = 14,
		caption         = capp,
		textAlign       = "center",
		textColor       = {1,1,1},
		border          = {"normal",4,1, 0,0,0,.19, 1,1,1,.78},
		} )
end
 
 
 
function scene:show( event )
local group = self.view
_G.GUI.RemoveAllWidgets()
 _G.GUI.RemoveAllWidgets()
 local path = system.pathForFile("configs.db", system.DocumentsDirectory)
    db = sqlite3.open( path ) 
    --print all the table contents
    local sql = "SELECT * FROM owner"
    for row in db:nrows(sql) do
        --local text = row.oname.." "..row.oversion
        oname=row.oname
        oversion=row.oversion
        oupdate=row.oupdate
        oregistered=row.oregistered
        odbversion=row.odbversion
    end


local function networkListener( event )
    if ( event.isError ) then
        print( "Network error!" )

    elseif ( event.phase == "began" ) then
        if ( event.bytesEstimated <= 0 ) then
            print( "Download starting, size unknown" )
        else
            _G.GUI.NewLabel(
		{
		x               = "center",                
		y               = display.contentHeight * .1, 
		width           = "50%",
		scale           = _G.GUIScale,
		name            = "LBL_2",            
		parentGroup     = nil,                     
		theme           = "theme_1", 
		icon            = 14,
		caption         = "Download starting.",
		textAlign       = "center",
		textColor       = {1,1,1},
		border          = {"normal",4,1, 0,0,0,.19, 1,1,1,.78},
		} )
            print( "Download starting, estimated size: " .. event.bytesEstimated )
        end

    elseif ( event.phase == "progress" ) then
        if ( event.bytesEstimated <= 0 ) then
            print( "Download progress: " .. event.bytesTransferred )
        else
            print( "Download progress: " .. event.bytesTransferred .. " of estimated: " .. event.bytesEstimated )
        end

    elseif ( event.phase == "ended" ) then
        --local alert = native.showAlert( event.bytesTransferred, "Download Complete", { "OK" } )
        _G.GUI.GetHandle("LBL_2"):destroy()
        db = sqlite3.open( path ) 
        local tablefill =[[INSERT INTO owner VALUES (NULL, ']]..oname..[[',']]..oversion..[[',']]..oupdate..[[',']]..oregistered..[[',']]..odbversion..[['); ]]
        db:exec( tablefill )
        db:close()
         _G.GUI.NewLabel(
		{
		x               = "center",                
		y               = display.contentHeight * .2, 
		width           = "50%",
		scale           = _G.GUIScale,
		name            = "LBL_2",            
		parentGroup     = nil,                     
		theme           = "theme_1", 
		icon            = 14,
		caption         = "Download Complete.",
		textAlign       = "center",
		textColor       = {1,1,1},
		border          = {"normal",4,1, 0,0,0,.19, 1,1,1,.78},
		} )
		
		
        
        
        print( "Download complete, total bytes transferred: " .. event.bytesTransferred )
    end
end

if odbversion=="URL:"
    then
    native.showAlert( "Alert!",
		"Fill in owner details URL field eg asset.com.au.", { "OK" }
		)
    composer.gotoScene("configg")
end


local params = {}

-- Tell network.request() that we want the "began" and "progress" events:
params.progress = "download"

-- Tell network.request() that we want the output to go to a file:
params.response = {
    filename = "assets.db",
    baseDirectory = system.DocumentsDirectory
}

network.request(  "http://www."..odbversion.."/assets.db", "GET", networkListenernet,  params )
     local path = system.pathForFile("assets.db", system.DocumentsDirectory)
db = sqlite3.open( path ) 
     local tablefill =[[INSERT INTO owner VALUES (NULL, ']]..oname..[[',']]..oversion..[[',']]..oupdate..[[',']]..oregistered..[[',']]..odbversion..[['); ]]
                       -- local tablefill =[[INSERT INTO owner VALUES (NULL, "oname"'"oversion"'"oupdate"'"oregistered"'"odbversion)"; ]]
                        db:exec( tablefill )
    db:close()

_G.GUI.NewIconBar(
		{
		x               = "center",                
		y               = "bottom",                
		width           = "90%",
		height          = 50,
		scale           = _G.GUIScaleb,
		name            = "BAR1",            
		parentGroup     = nil,                     
		theme           = "theme_4",               
		border          = {"normal",6,1, .37,.37,.37,1,  .72,.72,.72,.58}, 
		bgImage         = {"images/iconbar_background.png", .45, "add" },
		marker          = {8,1, 1,1,1,.39,  0,0,0,.19}, 
		glossy		= 0,
		iconSize        = 32,
		fontSize        = 45,
		textColor       = {.25,.25,.25},
		textColorActive = {1,1,1},
		textAlign       = "bottom",
		iconAlign       = "top",
		icons           = 
			{
				{icon = 13 , flipX = false, text = "Intro"},
				{icon = 11 , flipX = false, text = "Assets"},
				{icon = 17, flipX = false, text = "Search"},
                                {icon = 18, flipX = false, text = "Config"},
			},
                        
             onPress         = function(EventData)
                                print("ICON "..EventData.selectedIcon.." PRESSED!") 
                                
                                selectd=EventData.selectedIcon
                                print(selectd)
                                if selectd==4 then composer.gotoScene("configg")end
                                if selectd==3 then composer.gotoScene("options")end
                                if selectd==2 then composer.gotoScene("oassets")end
                                if selectd==1 then composer.gotoScene("intro")end
                                
                                end, 
		} )

	-- SELECT ICON NUMBER to display as default
	_G.GUI.GetHandle("BAR1"):setMarker(4)
        






end
function scene:exit( event )
	local group = self.view
        _G.GUI.GetHandle("Bar1"):show(false)
        _G.GUI.RemoveAllWidgets()
         composer.removeScene("deploy")
        composer.purgeScene("deploy")
end

function scene:destroy( event )
	
end


scene:addEventListener( "create",scene )
scene:addEventListener( "exit",scene )
scene:addEventListener( "show",scene )
scene:addEventListener( "destroy",scene )

return scene



