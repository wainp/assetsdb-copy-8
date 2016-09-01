
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

local function dbsavedb( event )
    
local path = system.pathForFile("pictures.db", system.DocumentsDirectory)
picsave = sqlite3.open( path ) 
  local tablefill =[[INSERT INTO opics VALUES (NULL, ']]..aoffice..[[',']]..pfile..[['); ]]
--local tablefill =[[INSERT INTO odetails VALUES (NULL, ']]..aoffice..[[',']]..aasset..[[',']]..amanufactor..[[',']]..aserial..[[',']]..amac..[['); ]]

                       -- local tablefill =[[INSERT INTO owner VALUES (NULL, "oname"'"oversion"'"oupdate"'"oregisteredc"'"odbversion)"; ]]
   picsave:exec( tablefill )
    picsave:close()
-- local alert = native.showAlert( oname, "Do you wish to save data ?", { "Yes","N0"} )
--_G.GUI.GetHandle("Owner5"):destroy() 
--_G.GUI.RemoveAllWidgets()
--       composer.removeScene("photop")
--        composer.purgeScene("photop")
        --_G.GUI.GetHandle("owner1"):destroy()
    --composer.gotoScene("configg")   
    --composer.gotoScene("Intro")
end

 local function oncomplete( event )
     
    
 end
 
function scene:create( event )
	local group = self.view
        _G.GUI.RemoveAllWidgets()
--local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
--titleBar:setFillColor( titleGradient ) 
--titleBar.y = titleBar.contentHeight * 0.5
--_G.GUI.UnloadThemes("theme_4")
-- _G.GUI.RemoveAllWidgets()
 
 
 --composer:removeScene("scene3")
--local titleText = display.newText( "                                  ", halfW, titleBar.y, native.systemFontBold, 22 )
--local titleText = display.newText( "Assets ", halfW, titleBar.y, native.systemFontBold, 22 )

end


function scene:show( event )
	local group = self.view
--local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
--titleBar:setFillColor( titleGradient ) 
--titleBar.y = titleBar.contentHeight * 0.5
--_G.GUI.UnloadThemes("theme_4")
 --_G.GUI.RemoveAllWidgets()
 --display.setStatusBar(display.HiddenStatusBar)
-- local titleText = display.newText( "Assets ", halfW, titleBar.y, native.systemFontBold, 22 )
  ListData2=     
	{
	   
	}
local bpark = "Brinni Park"
local path = system.pathForFile("assets.db", system.DocumentsDirectory)
 -- local path = system.pathForFile("assets.db", system.DocumentsDirectory)
    db = sqlite3.open( path ) 
   local newItemCount = 0
  --  officear=1
    for row in db:nrows("SELECT * FROM office order by office") do
      -- for row in db:nrows("SELECT DISTINCT OFFICE FROM ASSETS order by office;") do  
offname=row.office
aitem=row.item
aid=row.id
        if offname==nil 
            then oname="End" 
        end
        newItemCount = newItemCount + 1
      --  local titleText = display.newText( offname, halfW, titleBar.y, native.systemFontBold, 22 )

         table.insert(ListData2, newItemCount, {iconL = 20, caption = (offname)})
end






----------------------------------
-- MAIN MENU LIST
----------------------------------
_G.GUI.NewList(
	{
	x                 = "center",               
	y                 = "center",               
	width             = "95%",                  
	height            = "50%",  
        fontSize          = "32",
	scale             = _G.GUIScalec,
	parentGroup       = MainWindow,                    
	theme             = _G.theme,               
	name              = "LST_MAIN",             
	caption           = "Offices",   
	list              = ListData2,               
	allowDelete       = false, 
	readyCaption      = "Quit Editing",   
	scrollbar         = "onScroll",
	scrollbarAlpha    = 255,
	border            = {"shadow", 8,8, .25},
	onSelect          = function(EventData) 
                                seled =(EventData.Item)
                               --  seled =(EventData.selectedIndex)
                                 newItemCount = 1
                                  for row in db:nrows("SELECT * FROM office order by office") do
      -- for row in db:nrows("SELECT DISTINCT OFFICE FROM ASSETS order by office;") do  
                                       -- offname=row.office
                                        --rowno=seled
                                        --aid=row.id
                                         if seled.caption==row.office then
                                             aoffice=row.office
                                             aid=row.id
                                        end
                                        newItemCount = newItemCount + 1
                                    end
                    newItemCount = newItemCount + 1
     --   local titleText = display.newText( aoffice, halfW, titleBar.y, native.systemFontBold, 22 )

         table.insert(ListData2, newItemCount, {iconL = 20, caption = (offname)})
--end
                                -- print("Selected Items Number: "..seled)
                                 -- seled =(EventData.selectedIndex)
                                  seled =(EventData.Item)
                                  pfile=" "
                               composer.gotoScene("photop")
                                    pfile=nil
                                     alocat=nil                                                            
                              seled=""
                                
                            end,
	} )
        
       -- _G.GUI.GetHandle("Bar1"):show(false)
 -- _G.GUI.GetHandle("NewList")  

_G.GUI.NewIconBar(
		{
		x               = "center",                
		y               = "bottom",                
		width           = "90%",
		height          = 50,
		scale           = _G.GUIScalec,
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
       -- dbsavedb()
	_G.GUI.GetHandle("BAR1"):setMarker(4)
        






end
function scene:exit( event )
	local group = self.view
        _G.GUI.GetHandle("Bar1"):show(false)
        _G.GUI.RemoveAllWidgets()
         composer.removeScene("photooffice")
        composer.purgeScene("photooffice")
end

function scene:destroy( event )
	
end


scene:addEventListener( "create",scene )
scene:addEventListener( "exit",scene )
scene:addEventListener( "show",scene )
scene:addEventListener( "destroy",scene )

return scene







