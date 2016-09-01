require "sqlite3"
local widget = require( "widget" )
local composer = require( "composer" )
local scene = composer.newScene()
local halfW = display.contentCenterX
local halfH = display.contentCenterY
local widget = require( "widget" )
local rep, dcrew, junkf, junkn, junkc, pvsmsto, junkl

 local function pvonSendSMS( event )
	-- compose an SMS message (doesn't support attachments)
        --print(junkn)
        junkl=( string.format( "%s %q", junkn, ", ") )
       -- junkn=("testsms")
        local options =
	{
	   to = { "junkn" },
	   body = "I scored over 9000!!! Can you do better?"
	}
	local result = native.showPopup("sms", options)

	if not result then
		print( "SMS Not supported/setup on this device" )
		native.showAlert( "Alert!",
		"SMS not supported/setup on this device.", { "OK" }
		)
	end

	-- NOTE: options table (and all child properties) are optional
end

 local function onSendSMS( event )
        local path = system.pathForFile("pvsms.db", system.DocumentsDirectory)
    db = sqlite3.open( path )
    print(path)
    pvsmsto=""
    junkn=""
    --print all the table contents
    local sql = "SELECT * FROM detail"
    for row in db:nrows(sql) do
        local text = row.name.." "..row.phone
       -- local t = display.newText( text, 120, 30 * row.id, native.systemFont, 24 )
       -- t:setTextColor( 255,255,255 )
        junkf=row.name
        junkn=junkn .." "..junkf..","
        print (junkn)
        junkc=row.crew
        print(junkc)
        if junkc=="Fire" then
            print(junkc)
           -- pvsmsto( pvsmsto .. ","..junkn  )
           -- pvsmsto=string.rep( "junkn ", 1 )
            print(pvsmsto)

	 pvonSendSMS()





            local alert = native.showAlert( junkf, junkc, { "OK" } )
        end
        print(junkf)
    end

    db:close()
    local alert = native.showAlert( junkf, junkc, { "OK" } )

end

function scene:create( event )
	local group = self.view
        _G.GUI.RemoveAllWidgets()
local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
titleBar:setFillColor( titleGradient )
titleBar.y = titleBar.contentHeight * 0.5
--_G.GUI.UnloadThemes("theme_4")
-- _G.GUI.RemoveAllWidgets()


 --composer:removeScene("scene3")
--local titleText = display.newText( "Parks SMS", halfW, titleBar.y, native.systemFontBold, 22 )
--local titleText = display.newText( "Eltham", halfW, titleBar.y, native.systemFontBold, 22 )

end


function scene:show( event )
	local group = self.view
local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
titleBar:setFillColor( titleGradient )
titleBar.y = titleBar.contentHeight * 0.5
--_G.GUI.UnloadThemes("theme_4")
 _G.GUI.RemoveAllWidgets()
 display.setStatusBar(display.HiddenStatusBar)
 local titleText = display.newText( "MCST - Cache", halfW, titleBar.y, native.systemFontBold, 22 )


----------------------------------
-- MAIN MENU LIST
----------------------------------


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
		fontSize        = 15,
		textColor       = {.25,.25,.25},
		textColorActive = {1,1,1},
		textAlign       = "bottom",
		iconAlign       = "top",
		icons           =
			{
				{icon = 13 , flipX = false, text = "Intro"},
				{icon = 11 , flipX = false, text = "Deploy"},
				{icon = 17, flipX = false, text = "Cache"},
                                {icon = 18, flipX = false, text = "Config"},
			},

             onPress         = function(EventData)
                                print("ICON "..EventData.selectedIcon.." PRESSED!")

                                selectd=EventData.selectedIcon
                                print(selectd)
                                if selectd==4 then composer.gotoScene("configg")end
                                if selectd==3 then composer.gotoScene("options")end
                                if selectd==2 then composer.gotoScene("deploy")end
                                if selectd==1 then composer.gotoScene("intro")end

                                end,
		} )

	-- SELECT ICON NUMBER 1
	_G.GUI.GetHandle("BAR1"):setMarker(3)







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
