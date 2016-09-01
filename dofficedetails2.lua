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
local oname, oversion, odbversion, oitem, oasset, oserial, oip, ocomment
local currentLatitude = 0
local currentLongitude = 0
local latitude = display.newText( "--", 0, 0, native.systemFont, 26 )
local longitude = display.newText( "--", 0, 0, native.systemFont, 26 )
local oupdate = display.newText( "--", 0, 0, native.systemFont, 26 )
local oregistered = display.newText( "--", 0, 0, native.systemFont, 26 )
local emaildata, emaildata1, emaildata2, ophoto, ephoto
local oname,ooversion, oupdate, oregistered,odbversion,oreg, i
local photoAttachmentTable = {}
local myPhotoFileNames = {}
local selpic = {}
display.setDefault( "anchorX", 0.0 )







local function pvemail( event )
local fruit_array = { "Apples", "Bananas", "Cherries" }
print( fruit_array[2] )
print (photoAttachmentTable[1])
print (photoAttachmentTable[1])
local pat1= (photoAttachmentTable[1])
local pat2= (photoAttachmentTable[2])
local pat3= (photoAttachmentTable[3])
local pat4= (photoAttachmentTable[4])
local pat5= (photoAttachmentTable[5])
local pat6= (photoAttachmentTable[6])
local pat7= (photoAttachmentTable[7])
local pat8= (photoAttachmentTable[8])
local pat9= (photoAttachmentTable[9])
local pat10= (photoAttachmentTable[10])


	-- compose an HTML email with two attachments
	local options =
	{
	   to = { ooversion },
	   --cc = {  },
	   subject = "PVDB "..seloffice,
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
    composer.gotoScene("options")      
        
        
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
       composer.removeScene("dofficedetails")
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
 --_G.GUI.RemoveAllWidgets()
 display.setStatusBar(display.HiddenStatusBar)
 local path = system.pathForFile("config.db", system.DocumentsDirectory)
    db = sqlite3.open( path ) 
    --print all the table contents
    local sql = "SELECT * FROM configuration"
    oname="Name"
    ooversion="Email"
    oupdate="Version"
   oregistered="Not Registered"
   odbversion="URL:"
   oreg=0
      

 i = 1
  --  colorTable[1] = "blue"
  --  colorTable[2] = "red"
  --  colorTable[3] = "yellow"
  --  colorTable[4] = "green"
  --  colorTable[5] = "purple"

   -- print( colorTable[3] )  -- output: "yellow"      
local path1 = system.pathForFile("Pictures.db", system.DocumentsDirectory)
         --local path = system.pathForFile( “Pictures.db”, system.DocumentsDirectory )
local db8 = sqlite3.open( path1 )

--local people = {} — starts off emtpy
local piccs = "SELECT * FROM Opics"
 for row in db8:nrows(piccs) do
--for row in db8:nrows(“SELECT * FROM Opics”) do
     if seloffice==row.oname then 
           oname=row.oname
           selpic[i]= row.ophoto
           i=(i+1)
--            photoTable=row.ophoto
--             --photoTable = { baseDir=system.DocumentsDirectory, filename=myPhotoFileNames[i], type='image' } -- table for a single photo file
--        table.insert(photoAttachmentTable, photoTable)
        end      
  end
   db8:close() 
    
    
   local   path = system.pathForFile("assets.db", system.DocumentsDirectory)
    db = sqlite3.open( path ) 
    
    
    
    
    
  --  for row in db:nrows(sql) do
    --    --local text = row.oname.." "..row.oversion
      --  oname=row.oname
     --   ooversion=row.oversion
     --   oupdate=row.oupdate
     --   oregistered=row.oregistered
     --   odbversion=row.odbversion
     --   oreg=row.oregno
       -- local t = display.newText( text, 120, 30 * row.id, native.systemFont, 24 )
       -- t:setTextColor( 255,255,255 )
      -- end
 local titleText = display.newText( "Parks Victoria", halfW, titleBar.y, native.systemFontBold, 22 )
 
-- local path = system.pathForFile("asset.db", system.DocumentsDirectory)
--mcst = sqlite3.open( path ) 
--local tablesetup = [[CREATE TABLE IF NOT EXISTS office (id INTEGER PRIMARY KEY autoincrement, name, version, update,registered, dbversion);]]
--print(tablesetup)
--mcst:exec( tablesetup )
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
        db:close()
        end
-----------------------------------

  -- where myPhotoFileNames is your array of photo file names (image1.jpg, image2.jpg, etc.)
    local photoTable = {}
--    photoTable = { baseDir=system.DocumentsDirectory, filename=myPhotoFileNames[i], type='image' } -- table for a single photo file
--    table.insert(photoAttachmentTable, photoTable) -- add the single photo file to your attachments table
--end

-----------------------------------
i=1
        --nrows=0
         local path1 = system.pathForFile("Pictures.db", system.DocumentsDirectory)
         --local path = system.pathForFile( “Pictures.db”, system.DocumentsDirectory )
local db8 = sqlite3.open( path1 )

--local people = {} — starts off emtpy
local piccs = "SELECT * FROM Opics"
  for row in db8:nrows(piccs) do
--for row in db8:nrows(“SELECT * FROM Opics”) do
     if seloffice==row.oname then 
             oname=row.oname
            photoTable=row.ophoto
             --photoTable = { baseDir=system.DocumentsDirectory, filename=myPhotoFileNames[i], type='image' } -- table for a single photo file
        table.insert(photoAttachmentTable, photoTable)
        end      
         
         
         
         
         
         
         
--         local path1 = system.pathForFile("Pictures.db", system.DocumentsDirectory)
--    db2 = sqlite3.open( path1 ) 
--local piccs = "SELECT * FROM Opics" 
 --   for row in db2:nrows(piccs) do
 --       --local text = row.oname.." "..row.oversion
 --       if seloffice==row.oname then 
 --            oname=row.oname
 --           photoTable=row.ophoto
 --            --photoTable = { baseDir=system.DocumentsDirectory, filename=myPhotoFileNames[i], type='image' } -- table for a single photo file
 --       table.insert(photoAttachmentTable, photoTable)
 --       end  
        for i = 1, #myPhotoFileNames do
          --  emaildata1=("<br/>====================================".."<br/>Item "..oitem.."<br/>Asset No "..oasset.."<br/>Serial "..oserial.."<br/>IP "..oip.."<br/>Comments "..ocomment)
         --emaildata2=(emaildata2..emaildata1)
        -- pvemail()
        end
end        
       -- local t = display.newText( text, 120, 30 * row.id, native.systemFont, 24 )
       -- t:setTextColor( 255,255,255 )
       end
----------------------------------------------------------------------------------------------------------------
-- @return

-- @return

-- @return

-- @return

-- @return

-- @return

-- @return

-- @return

       
------------------------------------------------------------------------------------------------------------------       
       
 emaildata=(emaildata..emaildata2)
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
        emaildata2="<br/>"
        
        _G.GUI.GetHandle("dofficedetails"):destroy() 
	_G.GUI.GetHandle("emaildate"):destroy() 
        _G.GUI.GetHandle("emaildata2"):destroy() 
        _G.GUI.GetHandle("seloffice"):destroy() 
	_G.GUI.GetHandle("pat1"):destroy() 
        _G.GUI.GetHandle("pat2"):destroy() 
        _G.GUI.GetHandle("pat3"):destroy() 
        _G.GUI.GetHandle("pat4"):destroy() 
        _G.GUI.GetHandle("pat5"):destroy() 
        _G.GUI.GetHandle("pat6"):destroy() 
        _G.GUI.GetHandle("pat7"):destroy() 
        _G.GUI.GetHandle("pat8"):destroy() 
        _G.GUI.GetHandle("pat9"):destroy() 
        _G.GUI.GetHandle("pat10"):destroy() 
        
end

function scene:destroy( event )
	
end


scene:addEventListener( "create",scene )
scene:addEventListener( "exit",scene )
scene:addEventListener( "show",scene )
scene:addEventListener( "destroy",scene )

return scene









