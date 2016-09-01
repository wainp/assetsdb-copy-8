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
local coname, coversion, coupdate, coregistered, codbversion, ownerdb
local oname, oversion, odbversion, oitem, oasset, oserial, oip, ocomment, i
local currentLatitude = 0
local currentLongitude = 0
local selpic = {}
local latitude = display.newText( "--", 0, 0, native.systemFont, 26 )
local longitude = display.newText( "--", 0, 0, native.systemFont, 26 )
local oupdate = display.newText( "--", 0, 0, native.systemFont, 26 )
local oregistered = display.newText( "--", 0, 0, native.systemFont, 26 )
local emaildata, emaildata1, emaildata2
display.setDefault( "anchorX", 0.0 )







local function pvemail( event )

	-- compose an HTML email with two attachments
	local options =
	{
	   to = { oversion },
	   --cc = {  },
           subject =  dispname.. " - Database ",
	   --subject = "PVDB "..seloffice,
	   isBodyHtml = true,
	   body = emaildata,
	   attachment =
	   {
              -- #photoAttachmentTable, 
                  { baseDir=system.DocumentsDirectory, filename="assets.db"},
                --  { baseDir=system.DocumentsDirectory, filename=myPhotoFileNames[i], type='image' }
                 -- { photoAttachmentTable },   
                  { baseDir=system.DocumentsDirectory, filename=selpic[1] },
                  { baseDir=system.DocumentsDirectory, filename=selpic[2] },
                  { baseDir=system.DocumentsDirectory, filename=selpic[3] },
                  { baseDir=system.DocumentsDirectory, filename=selpic[4] },
                  { baseDir=system.DocumentsDirectory, filename=selpic[5] },
                  { baseDir=system.DocumentsDirectory, filename=selpic[6] },                  
                  { baseDir=system.DocumentsDirectory, filename=selpic[7] },
                  { baseDir=system.DocumentsDirectory, filename=selpic[8] },
                  { baseDir=system.DocumentsDirectory, filename=selpic[9] },
                  { baseDir=system.DocumentsDirectory, filename=selpic[10] },
           --	{ baseDir=system.DocumentsDirectory, filename="mcg2.jpg", type="image" },
       		--  { baseDir=system.DocumentsDirectory, filename="mcg3.jpg", type="image" },
           },
          -- local path = system.pathForFile("assets.db", system.DocumentsDirectory)
	}
	local result = native.showPopup("mail", options)
	
	if not result then
		print( "Mail Not supported/setup on this device" )
		native.showAlert( "Alert!",
		"Mail not supported/setup on this device.", { "OK" }
	);
	end
	-- NOTE: options table (and all child properties) are optional
        options=nil
	composer.gotoScene("configg")
end

local function map( event )
mapURL = "http://maps.google.com/maps?q=Hello,+Corona!@" .. currentLatitude .. "," .. currentLongitude

--mapURL = "http://maps.google.com/maps?q=Hello,+Corona!@" .. oupdate .. "," .. oregistered
	system.openURL( mapURL )

end

 local function oncomplete( event )
     _G.GUI.RemoveAllWidgets()
       composer.removeScene("kit1")
        --composer.purgeScene("intro")
        --_G.GUI.GetHandle("owner1"):destroy()
    composer.gotoScene("configg")      
        
        
end
   
 local function onassetcomplete( event )
     _G.GUI.RemoveAllWidgets()
       composer.removeScene("officedetails")
        --composer.purgeScene("intro")
        --_G.GUI.GetHandle("owner1"):destroy()
    composer.gotoScene("assets")      
        
        
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
 --       _G.GUI.RemoveAllWidgets()
--local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
--titleBar:setFillColor( titleGradient ) 
--titleBar.y = titleBar.contentHeight * 0.5
--_G.GUI.UnloadThemes("theme_4")
-- _G.GUI.RemoveAllWidgets()
 
 
 --composer:removeScene("scene3")
--local titleText = display.newText( "Parks SMS", halfW, titleBar.y, native.systemFontBold, 22 )
--local titleText = display.newText( "Eltham", halfW, titleBar.y, native.systemFontBold, 22 )

end


function scene:show( event )
	local group = self.view
--local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
--titleBar:setFillColor( titleGradient ) 
--titleBar.y = titleBar.contentHeight * 0.5
--_G.GUI.UnloadThemes("theme_4")
 --_G.GUI.RemoveAllWidgets()
 --display.setStatusBar(display.HiddenStatusBar)
 --local titleText = display.newText( "dOfficedetails", halfW, titleBar.y, native.systemFontBold, 22 )
 local path1 = system.pathForFile("Pictures.db", system.DocumentsDirectory)
         --local path = system.pathForFile( “Pictures.db”, system.DocumentsDirectory )
local db8 = sqlite3.open( path1 )
i=1
--local people = {} — starts off emtpy
local piccs = "SELECT * FROM Opics"
 for row in db8:nrows(piccs) do
--for row in db8:nrows(“SELECT * FROM Opics”) do
     if seloffice==row.oname then 
           oname=row.oname
           selpic[i]= row.ophoto
           i=(i+1)
        end      
  end
   db8:close() 
 
 
 
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
 
      local path = system.pathForFile("assets.db", system.DocumentsDirectory)
    db = sqlite3.open( path ) 
    --print all the table contents
    local sql = "SELECT * FROM office"  --where Office = Seloffice "
    oname="Office"
    oversion="Address"
    oupdate="x"
   oregistered="Y"
    odbversion="Contact"
    
    for row in db:nrows(sql) do
        --local text = row.oname.." "..row.oversion
        if seloffice==row.office then 
             oname=row.office
            oversion=row.address
            currentLatitude=row.x
            currentLongitude=row.y
            emaildata=("Office "..seloffice.."<br/> Address "..oversion.."<br/> Latitude "..currentLatitude.." <br/>Longitude "..currentLongitude)
           
            end
    end
    emaildata2="<br/>"
     local sql1 = "SELECT * FROM assets"  --where Office = Seloffice "
    for row in db:nrows(sql1) do
        --local text = row.oname.." "..row.oversion
        if seloffice==row.office then 
             oname=row.office
            oitem=row.item
            oasset=row.asset
            oserial=row.serial
            oip=row.ip
            ocomment=row.comments
            emaildata1=("<br/>====================================".."<br/>Item "..oitem.."<br/>Asset No "..oasset.."<br/>Serial "..oserial.."<br/>IP "..oip.."<br/>Comments "..ocomment)
         emaildata2=(emaildata2..emaildata1)
        -- pvemail()
        end
        
       -- local t = display.newText( text, 120, 30 * row.id, native.systemFont, 24 )
       -- t:setTextColor( 255,255,255 )
       end
 emaildata=(emaildata..emaildata2)
  local path = system.pathForFile("assets.db", system.DocumentsDirectory)
    db = sqlite3.open( path )  
    --print all the table contents
    local sql = "SELECT * FROM owner"
    oname="Name"
    oversion="Email"
    oupdate="Version"
   oregistered="Not Registered"
   odbversion="URL:"
   oreg=0
    
    for row in db:nrows(sql) do
        --local text = row.oname.." "..row.oversion
        ownerdb=row.oname
        oversion=row.oversion
        oupdate=row.oupdate
        oregistered=row.oregistered
        odbversion=row.odbversion
        --oreg=row.oregno
       -- local t = display.newText( text, 120, 30 * row.id, native.systemFont, 24 )
       -- t:setTextColor( 255,255,255 )
       end
 
         pvemail()
 
 
 
 
 	--local group = self.view
        
--        local statusText = display.newText( "Name", 120, 90, 200, 0, native.systemFont, 22 )     
--        oname = native.newTextField( 250, 90, 156, 12 )
--        oname:addEventListener( "userInput", onamel )
--        oname:setTextColor(0, 0, 0)
_G.GUI = require("widget_candy")

-- CREATE THE WIDGET

_G.GUI.NewButton(
		{
		x               = "center",                
		y               = "70%",                
		width           = "50%",                   
		scale           = _G.GUIScale,
		name            = "BUT_2", 
		parentGroup     = owner1,                     
		theme           = _G.theme,               
		caption         = "Assets.", 
		textAlign       = "center",                  
		icon            = 20,  
		flipIconX       = true,
		flipIconY       = false,
		border          = {"shadow", 8,8, .25},
		--onPress         = function(EventData) EventData.Widget:set("caption", oname)  end,
		onRelease       = function(EventData) 
                                                        onassetcomplete()
							-- RELEASED WHILE INSIDE BUTTON?
							--if EventData.inside then EventData.Widget:set("caption", oname) 
						  	-- RELEASED WHILE OUTSIDE BUTTON?
						  	  --                  else EventData.Widget:set("caption", "Saved") end
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

                
   _G.GUI.NewButton(
		{
		x               = "center",                
		y               = "80%",                
		width           = "50%",                   
		scale           = _G.GUIScale,
		name            = "BUT_3", 
		parentGroup     = nil,                     
		theme           = _G.theme,               
		caption         = "Map", 
		textAlign       = "center",                  
		icon            = 20,  
		flipIconX       = true,
		flipIconY       = false,
		border          = {"shadow", 8,8, .25},
		onPress         = function(EventData) EventData.Widget:set("caption", "Cancel")  end,
		onRelease       = function(EventData) 
                                                        map()
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











