require "sqlite3"
require "CiderDebugger"
local widget = require( "widget" )
local composer = require( "composer" )
local scene = composer.newScene()
local halfW = display.contentCenterX
local halfH = display.contentCenterY
local widget = require( "widget" )
local rep, dcrew, junkf, junkn, junkc, pvsmsto, junkl
local centerX = display.contentCenterX
local centerY = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight
_G.GUI = require("widget_candy")
local evd, pfile, picsave

local function dbsavedb( event )
    
local path = system.pathForFile("pictures.db", system.DocumentsDirectory)
picsave = sqlite3.open( path ) 
  local tablefill =[[INSERT INTO opics VALUES (NULL, ']]..aoffice..[[',']]..pfile..[['); ]]
--local tablefill =[[INSERT INTO odetails VALUES (NULL, ']]..aoffice..[[',']]..aasset..[[',']]..amanufactor..[[',']]..aserial..[[',']]..amac..[['); ]]

                       -- local tablefill =[[INSERT INTO owner VALUES (NULL, "oname"'"oversion"'"oupdate"'"oregisteredc"'"odbversion)"; ]]
   picsave:exec( tablefill )
    picsave:close()
 local alert = native.showAlert( aoffice, "Do you wish to save data ?", { "Yes","N0"} )
--_G.GUI.GetHandle("Owner5"):destroy() 
--_G.GUI.RemoveAllWidgets()
--       composer.removeScene("photop")
--        composer.purgeScene("photop")
        --_G.GUI.GetHandle("owner1"):destroy()
    --composer.gotoScene("configg")   
    --composer.gotoScene("Intro")
end

composer.gotoScene("photop")
dbsavedb()
