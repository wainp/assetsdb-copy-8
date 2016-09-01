-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

  local sqlite3 = require ("sqlite3")
local myNewData 
local json = require ("json")
local decodedData 
 require "sqlite3"
local widget = require( "widget" )
local composer = require( "composer" )
local BG = display.newGroup()                 -- TO HOLD BACKGROUND IMAGES
local statusBox = display.newGroup()
local mygroup = display.newGroup()
local LoadedSample     
local halfW = display.contentCenterX
local halfH = display.contentCenterY
local defaultField
local namec, versionc, updatec, registerc, versionc
local scene = composer.newScene()
local vdate, seled
local  cname, cversion, cupdate, cregistern, cmobile, cpic, crole
local cdbver
local fname, fversion, fupdate, fregister, fdbversion 
local myNewData, mnd
local json = require ("json")


local SaveData = function ()

  local path = system.pathForFile("mcst.db", system.DocumentsDirectory)
mcst = sqlite3.open( path ) 
-------------------------------------------
-- remove data from old table
--local tablesetup = [[drop TABLE crew]]
--print(path)
--mcst:exec( tablesetup )

--------------------------------------------
local path = system.pathForFile("mcst.db", system.DocumentsDirectory)
mcst = sqlite3.open( path ) 
local tablesetup = [[CREATE TABLE IF NOT EXISTS crew (id INTEGER PRIMARY KEY autoincrement, name,  mobile, email, role );]]
print(path)
mcst:exec( tablesetup )
    

  local counter = 1
  local index = counter
   movie = decodedData[index]
  print(movie)
 
  while ( movie ~= nil ) do
    local tablefill ="INSERT INTO crew VALUES (NULL,'" .. movie[1] .. "','" .. movie[2].. "','" .. movie[3].. "','" .. movie[4] .."');"
    print(tablefill)
    mcst:exec( tablefill )
    local titleText = display.newText( tablefill, halfW, titleBar.y, native.systemFontBold, 22 )
    counter=counter+1
    index = counter
    movie = decodedData[index]
  end
 
  --everything is saved to SQLite database; close database
  mcst:close()
   --_G.GUI.RemoveAllWidgets()   
                            --composer.gotoScene("intro")
 
end
 
 
local function networkListener( event )
  if ( event.isError ) then
    print( "Network error!")
  else
   -- _G.GUI.GetHandle("NewProgBar")  
    value=10
    myNewData = event.response
    --print ("From server: "..myNewData)
    decodedData = (json.decode( myNewData))
   -- local myText = display.newText(myNewData, 100, 200, native.systemFont, 16 )
    SaveData()
   
  end
 
end
--network.request( "http://pardat.com/pvsms.php", "GET", networkListener )
network.request( "http://pardat.com/pvsms.php", "GET", networkListener )

