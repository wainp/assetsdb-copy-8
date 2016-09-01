require "sqlite3"
local widget = require( "widget" )
local composer = require( "composer" )
local scene = composer.newScene()
local halfW = display.contentCenterX
local halfH = display.contentCenterY
local widget = require( "widget" )
local rep, dcrew, junkf, junkn, junkc, pvsmsto, junkl

 local function pvonSendSMS( event )
	
end
   
 local function onSendSMS( event )
        local path = system.pathForFile("assets.db", system.DocumentsDirectory)
    db = sqlite3.open( path ) 
    print(path)
    pvsmsto=""
    junkn=""
    --print all the table contents
    local sql = "SELECT * FROM owner"
    for row in db:nrows(sql) do
        local text = row.oname.." "..row.oversion
       -- local t = display.newText( text, 120, 30 * row.id, native.systemFont, 24 )
       -- t:setTextColor( 255,255,255 )
        junkf=row.name
        junkn=junkn .." "..junkf..","
        print (junkn)
        junkc=row.oversion
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
        
--local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
--titleBar:setFillColor( titleGradient ) 
--titleBar.y = titleBar.contentHeight * 0.5

end


function scene:show( event )
	local group = self.view
        composer.removeScene("searchitem")
        composer.purgeScene("searchitem")
        composer.removeScene("oassets")
        composer.purgeScene("oassets")
--local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
--titleBar:setFillColor( titleGradient ) 
--titleBar.y = titleBar.contentHeight * 0.5
--_G.GUI.UnloadThemes("theme_4")
 _G.GUI.RemoveAllWidgets()
 seled=nil
 --display.setStatusBar(display.HiddenStatusBar)
  --local titleText = display.newText( "Asset Collection", halfW, titleBar.y, native.systemFontBold, 22 )
 --composer:removeScene("scene3")
--local titleText = display.newText( "Assets - Config ", halfW, titleBar.y, native.systemFontBold, 22 )
--local titleText = display.newText( "Eltham", halfW, titleBar.y, native.systemFontBold, 22 )





local ListData =     
	{
		--{ iconL = 29, caption = "Update Database"        , fileName = "sample_list_scro" },
                { iconL = 30, caption = "Owner Details"        , fileName = "configapp" },
                { iconL = 31, caption = "Register"        , fileName = "sample_list_scroll" },
		{ iconL = 32, caption = "Take Photo"        , fileName = "sample_list_scroll" },
                { iconL = 33, caption = "Email Office record"        , fileName = "sample_list_scroll" },
                { iconL = 34, caption = "Email entire database"  },
                { iconL = 35, caption = "Retrieve db database"  },
               -- { iconL = 36, caption = "View Photos"  },
               -- { iconL = 37, caption = "Barcode Scan"  },
	}

----------------------------------
-- MAIN MENU LIST
----------------------------------
_G.GUI.NewList(
	{
	x                 = "center",               
	y                 = "center",               
	width             = "95%",                  
	height            = "80%",  
        fontSize        = fonts, 
	scale             = _G.GUIScalec,
	parentGroup       = MainWindow,                    
	theme             = _G.theme,               
	name              = "LST_MAIN",             
	caption           = "Config",   
	list              = ListData,               
	allowDelete       = false, 
	readyCaption      = "Quit Editing",   
	scrollbar         = "onScroll",
	scrollbarAlpha    = 255,
	border            = {"shadow", 8,8, .25},
	onSelect          = function(EventData) 
                                 seled =(EventData.selectedIndex)
                                 print("Selected Items Number: "..seled)
                            --_G.GUI.GetHandle("BAR1"):destroy() 
                                if seled==1 then composer.gotoScene("owdb")end
                             if seled==2 then composer.gotoScene("owner")end
                             if seled==3 then composer.gotoScene("photooffice")end   
                                if seled==4 then 
                                      composer.gotoScene("doffall")
                                end
                                
                                 if seled==5 then 
                                     
                                     if  oregistered=="Not Registered" then
                                        local alert = native.showAlert( "Not Registered", " This feature only available on registered version", { "OK" } )
                                         composer.gotoScene("configg")
                                     end
                                     if  oregistered=="Registered" then
                                        composer.gotoScene("dbpost")
                                     end 
                                end
                                
                                if seled==6 then 
                                    if  oregistered=="Not Registered" then
                                        local alert = native.showAlert( "Not Registered", " This feature only available on registered version", { "OK" } )
                                         composer.gotoScene("configg")
                                     end
                                     if  oregistered=="Registered" then
                                        composer.gotoScene("webdb1")
                                     end 
                                      --composer.gotoScene("webdb1")
                                end
                                if seled==7 then 
                                      composer.gotoScene("vpic")
                                end
                                if seled==8 then 
                                      composer.gotoScene("bcode")
                                end
                                      --  composer.purgeScene("tab5")
                                  --    EventData.selectedIcon = nil
                                    --    composer.gotoScene("tab5")
                                   -- end
                                
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
       -- _G.GUI.GetHandle("Bar1"):show(false)
  _G.GUI.GetHandle("NewList")  

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
		fontSize        = fonts,
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
        






end
function scene:exit( event )
	local group = self.view
	  _G.GUI.GetHandle("LST-MAIN"):destroy() 
        -- composer.removeScene("doffall")
       -- _G.GUI.GetHandle("LST_MAIN"):show(false)
       
        _G.GUI.RemoveAllWidgets()
         composer.removeScene("configg")
        composer.purgeScene("configg")
end

function scene:destroy( event )
	
end


scene:addEventListener( "create",scene )
scene:addEventListener( "exit",scene )
scene:addEventListener( "show",scene )
scene:addEventListener( "destroy",scene )

return scene
