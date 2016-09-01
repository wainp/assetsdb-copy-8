-- Offedit
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
local oname, offname

 local function oncomplete( event )
     
    
 end
 local function dbsavedb( event )
     if oregistered == nil then oregistered ="X" end
     if oupdate == nil then oupdate ="Address" end
     if odbversion == nil then oupdate ="Y" end
     local path = system.pathForFile("assets.db", system.DocumentsDirectory)
    mcst = sqlite3.open( path ) 
    local tablesetup = [[CREATE TABLE IF NOT EXISTS office (id INTEGER PRIMARY KEY autoincrement, office, address, x,y, contact);]]
    print(tablesetup)
    oversion=ove
    mcst:exec( tablesetup )
    local tablefill =[[INSERT INTO office VALUES (NULL, ']]..oname..[[',']]..oupdate..[[',']]..oregistered..[[',']]..oversion..[[',']]..odbversion..[['); ]]
    mcst:exec( tablefill )
    db:close()
--local alert = native.showAlert( oname, "Do you wish to save data ?", { "Yes","N0"} )
    _G.GUI.RemoveAllWidgets()
    composer.removeScene("kit1")
    composer.gotoScene("oassets")   
    --composer.gotoScene("Intro")
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
--local titleText = display.newText( "Parks SMS", halfW, titleBar.y, native.systemFontBold, 22 )
--local titleText = display.newText( "Eltham", halfW, titleBar.y, native.systemFontBold, 22 )

end


function scene:show( event )
	local group = self.view
--local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
--titleBar:setFillColor( titleGradient ) 
--titleBar.y = titleBar.contentHeight * 0.5
--_G.GUI.UnloadThemes("theme_4")
 _G.GUI.RemoveAllWidgets()
-- display.setStatusBar(display.HiddenStatusBar)
-- local titleText = display.newText( "Assets", halfW, titleBar.y, native.systemFontBold, 22 )
 --composer:removeScene("scene3")
--local titleText = display.newText( "Melbourne Central Support Team", halfW, titleBar.y, native.systemFontBold, 22 )
--local titleText = display.newText( "Eltham", halfW, titleBar.y, native.systemFontBold, 22 )
 ListData =     
	{
	--{ iconR = 23, caption = "Office Details" , textColor = {1,1,.39}, bgColor = {0,0,0}, selectable = false },
          --      { iconL = 29, caption = "Manual entry"         },	
                
               
	}
local bpark = "Brinni Park"
local path = system.pathForFile("assets.db", system.DocumentsDirectory)
 -- local path = system.pathForFile("assets.db", system.DocumentsDirectory)
    db = sqlite3.open( path ) 
   local newItemCount = 0
    for row in db:nrows("SELECT * FROM OFFICE order by office") do
        offname=row.office
        if offname==nil 
            then oname="End" 
        end
        newItemCount = newItemCount + 1   
        table.insert(ListData, newItemCount, {iconL = 20, caption = offname})
end






----------------------------------
-- MAIN MENU LIST
----------------------------------
_G.GUI.NewList(
	{
	x                 = "center",               
	y                 = "center",               
	width             = "95%",                  
	height            = "90%",    
        fontSize          = fonts,
	scale             = _G.GUIScalec,
	parentGroup       = MainWindow,                    
	theme             = _G.theme,               
	name              = "LST_MAIN",             
	caption           = "Offices",   
	list              = ListData,               
	allowDelete       = false, 
	readyCaption      = "Quit Editing",   
	scrollbar         = "onScroll",
	scrollbarAlpha    = 255,
	border            = {"shadow", 8,8, .25},
	onSelect          = function(EventData) 
                                 seled =(EventData.Item)
                                -- print("Selected Items Number: "..seled)
                                  seloffice=seled.caption
                                   _G.GUI.RemoveAllWidgets()
                               composer.gotoScene("offeditview")
                                
                
                                
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
 -- _G.GUI.GetHandle("NewList")  

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
	_G.GUI.GetHandle("BAR1"):setMarker(2)
        






end
function scene:exit( event )
	local group = self.view
        _G.GUI.GetHandle("Bar1"):show(false)
        _G.GUI.RemoveAllWidgets()
         composer.removeScene("offall")
        composer.purgeScene("offall")
end

function scene:destroy( event )
	
end


scene:addEventListener( "create",scene )
scene:addEventListener( "exit",scene )
scene:addEventListener( "show",scene )
scene:addEventListener( "destroy",scene )

return scene





