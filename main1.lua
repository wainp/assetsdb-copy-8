require "sqlite3"
local widget = require( "widget" )
local composer = require( "composer" )
local BG = display.newGroup()                 -- TO HOLD BACKGROUND IMAGES
local LoadedSample     
local halfW = display.contentCenterX
local halfH = display.contentCenterY
local mygroup = display.newGroup()
local halfW = display.contentCenterX
local defaultField, owner
local namec, versionc, updatec, registerc, versionc
local scene = composer.newScene()
local vdate
selid=0
--fonts="20"
widget.setTheme( "widget_theme_ios" )	-- iOS5/6 theme
_G.GUI = require("widget_candy")              -- LOAD WIDGET CANDY, USING A GLOBAL VAR, SO WE CAN ACCESS IT FROM ANY LOADED SAMPLE CODE, TOO
_G.GUI.LoadTheme("theme_1", "themes/theme_1/")-- LOAD THEME 1
_G.GUI.LoadTheme("theme_2", "themes/theme_2/")-- LOAD THEME 2
_G.GUI.LoadTheme("theme_3", "themes/theme_3/")-- LOAD THEME 3
_G.GUI.LoadTheme("theme_4", "themes/theme_4/")-- LOAD THEME 4
_G.GUI.LoadTheme("theme_5", "themes/theme_5/")-- LOAD THEME 5
_G.GUI.LoadTheme("theme_6", "themes/theme_6/")-- LOAD THEME 6
_G.GUI.LoadTheme("theme_7", "themes/theme_7/")-- LOAD THEME 7
_G.GUI.ShowTouches(true, 128, {.7,.7,1})
local physicalW = math.round( (display.contentWidth  - display.screenOriginX*2) / display.contentScaleX)
local physicalH = math.round( (display.contentHeight - display.screenOriginY*2) / display.contentScaleY)
_G.isTablet     = false; if physicalW >= 1024 or physicalH >= 1024 then isTablet = true end
_G.GUIScale     = _G.isTablet == true and .5 or 1.0
_G.GUI.SetLogLevel(2)
_G.theme = "theme_4"
--local background = display.newImage( "bcamp.png", display.contentCenterX, display.contentCenterY, true )

_G.GUI.SetAllowedOrientations({"landscapeRight","landscapeLeft","portrait","portraitUpsideDown"})
--local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
--titleBar:setFillColor( titleGradient ) 
--titleBar.y = titleBar.contentHeight * 0.5

---------------------
local path = system.pathForFile("config.db", system.DocumentsDirectory)
owner = sqlite3.open( path ) 
local tablesetup = [[CREATE TABLE IF NOT EXISTS configuration (id INTEGER PRIMARY KEY autoincrement, oname,  oversion, oupdate,oregistered, odbversion, oregno );]]
print(tablesetup)
owner:exec( tablesetup )
--------------------------

local path = system.pathForFile("Pictures.db", system.DocumentsDirectory)
pics = sqlite3.open( path ) 
local tablesetup = [[CREATE TABLE IF NOT EXISTS Opics (id INTEGER PRIMARY KEY autoincrement, oname,  ophoto, ocomments,odate taken );]]
print(tablesetup)
pics:exec( tablesetup )





local path = system.pathForFile("assets.db", system.DocumentsDirectory)
itemdb = sqlite3.open( path ) 
local tablesetup = [[CREATE TABLE IF NOT EXISTS item (id INTEGER PRIMARY KEY autoincrement, item, make, modal );]]
print(tablesetup)
itemdb:exec( tablesetup )

local path = system.pathForFile("assets.db", system.DocumentsDirectory)
vassets = sqlite3.open( path ) 
local tablesetup = [[CREATE TABLE IF NOT EXISTS assets (id INTEGER PRIMARY KEY autoincrement, office, asset, manufactor, modal, serial, mac, ip, item, comments );]]
print(tablesetup)
vassets:exec( tablesetup )
 
 --local tablefill =[[INSERT INTO assets VALUES (NULL, ']].."aoffice"..[[',']].."aasset"..[['); ]]
  --mcst:exec( tablefill )
   -- mcst:close()
    
mcst = sqlite3.open( path ) 
local tablesetup = [[CREATE TABLE IF NOT EXISTS office (id INTEGER PRIMARY KEY autoincrement, office,  address, x integer, y integer, contact );]]
print(tablesetup)
mcst:exec( tablesetup )
mcst = sqlite3.open( path ) 
local tablesetup = [[CREATE TABLE IF NOT EXISTS owner (id INTEGER PRIMARY KEY autoincrement, oname,  oversion, oupdate,oregistered, odbversion );]]
print(tablesetup)
mcst:exec( tablesetup )
--local titleText = display.newText( "MCST", halfW, titleBar.y, native.systemFontBold, 22 )
	local path = system.pathForFile("assets.db", system.DocumentsDirectory)
    db = sqlite3.open( path ) 
    --print all the table contents
    local sql = "SELECT * FROM owner"
    oname="Name"
    oversion="Email"
    oupdate="Version"
   oregistered="Not Registered"
   odbversion="URL:"
   
    
    for row in db:nrows(sql) do
        --local text = row.oname.." "..row.oversion
        oname=row.oname
        oversion=row.oversion
        oupdate=row.oupdate
        oregistered=row.oregistered
        odbversion=row.odbversion
       dispname=oname
       -- local t = display.newText( text, 120, 30 * row.id, native.systemFont, 24 )
       -- t:setTextColor( 255,255,255 )
       end


local screenW = display.contentWidth
local screenH = display.contentHeight
local BG1     = display.newImage(BG, "images/bg.jpg") -- BACKGROUND IMAGE
local BG2     = display.newImage(BG, "images/bg.jpg") -- BACKGROUND IMAGE
BG1.xScale    = (BG1.width  / screenW * 1.5)
BG1.yScale    =  BG1.xScale
BG2.xScale    =  BG1.xScale
BG2.yScale    =  BG1.yScale
BG1.x         = screenW * .5
BG1.y         = screenH * .5
BG2.x         = screenW * .5
BG2.y         = screenH * .5
BG2.blendMode = "add"
BG2.alpha     = 0.75

timer.performWithDelay(1,function()
	BG1.rotation = math.sin(system.getTimer()*.00001)*360 
	BG2.rotation = math.sin(system.getTimer()*.00004)*360 
	BG1.x        = screenW*.5 + math.cos(system.getTimer()*.0005)*40 
	BG1.y        = screenH*.5 + math.sin(system.getTimer()*.001)*40 
	BG2.x        = screenW*.5 + math.sin(system.getTimer()*.0005)*50 
	BG2.y        = screenH*.5 + math.cos(system.getTimer()*.001)*50 
	BG2.alpha    = .8 + math.sin(system.getTimer()*.001)*.2
end,0)
if ( system.getInfo("model") == "iPad"   or
     	system.getInfo("model") == "iPhone" or
     	system.getInfo("model") == "iPod" )
      then
     	fonts=50
     else
     	fonts=20
end

composer.gotoScene("intro")