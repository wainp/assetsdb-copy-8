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
--local mywidget = _G.GUI.NewWindow(
--    {
--	x               = "left",                
--	y               = "top", 
--	width           = "100%",
  --      height          = "100%",
--	scale           = _G.GUIScale,
--	name            = "LD",            
--	parentGroup     = nil,                     
--	theme           = _G.theme, 
--	caption         = "Loading Database",
--	textAlign       = "center",
--	textColor       = {1,1,1},
--	} )
  --       _G.GUI.GetHandle("NewWindow") 
         
         
 --        _G.GUI.NewText(
--		{
--		x               = "center",                
--		y               = "center", 
--		width           = "50%",
--		scale           = _G.GUIScale,
--		height          = "auto",
--		name            = "TXT_1",            
--		parentGroup     = nil,                     
--		theme           = _G.theme, 
--		caption         = "Importing data ....",
--		textAlign       = "left",
--		textColor       = {1,1,1},
--		border          = {"normal",4,1, 1,1,1,.25, 0,0,0,1},
--		} )
	
	--_G.GUI.NewButton(
	--	{
	--	x               = "center",                
	--	y               = _G.GUI.GetHandle("TXT_1").y + 20 + _G.GUI.GetHandle("TXT_1").contentHeight, 
	--	width           = "50%",
	--	scale           = _G.GUIScale,
	--	name            = "BUT_ALIGN",            
	--	parentGroup     = nil,                     
	--	theme           = _G.theme, 
	--	caption         = "Exit Import Database",
	--	icon            = 6,
	--	onPress         = function(EventData) 
                                         --_G.GUI.Remove(LD)
	--				composer.gotoScene("intro")
                                        --exit
	--			  end,
	--	} )

--end
         
         
  --Save new data to a sqlite file
  --open SQLite database, if it doesn't exist, create database
  local path = system.pathForFile("mcst.db", system.DocumentsDirectory)
mcst = sqlite3.open( path ) 
local tablesetup = [[drop TABLE crew]]
print(path)
mcst:exec( tablesetup )
  local path = system.pathForFile("mcst.db", system.DocumentsDirectory)
mcst = sqlite3.open( path ) 
local tablesetup = [[CREATE TABLE IF NOT EXISTS crew (id INTEGER PRIMARY KEY autoincrement, name,  mobile, email, role );]]
print(path)
mcst:exec( tablesetup )
    
  --save  data to database
 -- local t = json.decode( jsonFile( "sample.json" ) )
  local counter = 1
  local index = counter
   movie = decodedData[index]
  print(movie)
 
  while ( movie ~= nil ) do
    local tablefill ="INSERT INTO crew VALUES (NULL,'" .. movie[1] .. "','" .. movie[2].. "','" .. movie[3].. "','" .. movie[4] .."');"
    print(tablefill)
    mcst:exec( tablefill )
    counter=counter+1
    index = counter
    movie = decodedData[index]
  end
 
  --everything is saved to SQLite database; close database
  mcst:close()
   --_G.GUI.RemoveAllWidgets()
     --                       composer.gotoScene("Main")   
 
 
end
 
 
local function networkListener( event )
  if ( event.isError ) then
    print( "Network error!")
  else
   -- _G.GUI.GetHandle("NewProgBar")  
    value=10
    myNewData = event.response
    print ("From server: "..myNewData)
    decodedData = (json.decode( myNewData))
    local myText = display.newText(myNewData, 100, 200, native.systemFont, 16 )
    SaveData()
  --  _G.GUI.GetHandle("NewProgBar")
    --composer.gotoScene("intro")
    composer.gotoScene("intro")
  end
 
end

 -- local mywidget = _G.GUI.NewWindow(
 --   {
--	x               = "left",                
--	y               = "top", 
--	width           = "100%",
  --      height          = "100%",
--	scale           = _G.GUIScale,
--	name            = "LD",            
--	parentGroup     = nil,                     
--	theme           = _G.theme, 
--	caption         = "Loading Database",
--	textAlign       = "center",
--	textColor       = {1,1,1},
--	} )
  --       _G.GUI.GetHandle("NewWindow") 

network.request( "http://pardat.com/pvsms.php", "GET", networkListener )






