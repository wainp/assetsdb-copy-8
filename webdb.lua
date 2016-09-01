require "sqlite3"
local widget = require( "widget" )
local composer = require( "composer" )
local scene = composer.newScene()
local halfW = display.contentCenterX
local halfH = display.contentCenterY
local widget = require( "widget" )
--_G.GUI = require("widget_candy")
local rep, dcrew, junkf, junkn, junkc, pvsmsto, junk1, officeno
local coname, coversion, coupdate, coregistered, codbversion
local halfW = display.contentCenterX
local halfH = display.contentCenterY
local oname, offname, aitem, aid

local function networkListener( event )
    if ( event.isError ) then
        print( "Network error!" )

    elseif ( event.phase == "began" ) then
        if ( event.bytesEstimated <= 0 ) then
            print( "Download starting, size unknown" )
            _G.GUI.NewLabel(
		{
		x               = "center",                
		y               = display.contentHeight * .1, 
		width           = "50%",
		scale           = _G.GUIScale,
		name            = "LBL_1",            
		parentGroup     = nil,                     
		theme           = "theme_1", 
		icon            = 14,
		caption         = "Download starting",
		textAlign       = "center",
		textColor       = {1,1,1},
		border          = {"normal",4,1, 0,0,0,.19, 1,1,1,.78},
		} )
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
        --local alert = native.showAlert( event.bytesTransferred, "Download Complete", { "OK" } )
        print( "Download complete, total bytes transferred: " .. event.bytesTransferred )
        lbl_1.caption="Download Complete"
        
    end
end

local params = {}

-- Tell network.request() that we want the "began" and "progress" events:
params.progress = "download"

-- Tell network.request() that we want the output to go to a file:
params.response = {
    filename = "assets.db",
    baseDirectory = system.DocumentsDirectory
}

network.request( "http://pardat.com/assets.db", "GET", networkListener,  params )

_G.GUI.NewIconBar(
		{
		x               = "center",                
		y               = "bottom",                
		width           = "90%",
		height          = 50,
		scale           = _G.GUIScale,
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

	-- SELECT ICON NUMBER 1
	_G.GUI.GetHandle("BAR1"):setMarker(4)
