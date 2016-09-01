--require "CiderDebugger";
local sqlite3 = require ("sqlite3")
local myNewData 
local json = require ("json")
local decodedData 
local movie
local widget = require( "widget" )
local composer = require( "composer" )
local scene = composer.newScene()


local SaveData = function ()
    
    --Save new data to a sqlite file
    --open SQLite database, if it doesn't exist, create database
    local path = system.pathForFile("pvsms.db", system.DocumentsDirectory)
mcst = sqlite3.open( path ) 
local tablesetup = [[drop TABLE detail]]
mcst:exec(tablesetup)
print(path)
    local path = system.pathForFile("pvsms.db", system.DocumentsDirectory)
    db = sqlite3.open( path ) 
    print(path)
    
    --setup the table if it doesn't exisst
    local tablesetup = "CREATE TABLE IF NOT EXISTS detail (id INTEGER PRIMARY KEY, name, phone, crew);"
    db:exec( tablesetup )
    print(tablesetup)
    
    --save  data to database
    local counter = 1
    
    dindex = counter
    movie = decodedData[dindex]
    print(movie)
    
    while ( movie ~= nil ) do
        local tablefill ="INSERT INTO detail VALUES (NULL,'" .. movie[2] .. "','" .. movie[3] .."','" .. movie[4] .."');"
        print(tablefill)
        db:exec( tablefill )
        counter=counter+1
        index = counter
        movie = decodedData[index]
    end
    
    --everything is saved to SQLite database; close database
    db:close()
    
    --Load database contents to screen
    --open database  
    local path = system.pathForFile("pvsms.db", system.DocumentsDirectory)
    db = sqlite3.open( path ) 
    print(path)
    
    --print all the table contents
    local sql = "SELECT * FROM detail"
    for row in db:nrows(sql) do
        local text = row.name.." "..row.phone
        --local t = display.newText( text, 120, 30 * row.id, native.systemFont, 24 )
        --t:setTextColor( 255,255,255 )
    end    
    db:close()
    
end


local function networkListener( event )
    
    if ( event.isError ) then
        print( "Network error!")
    else
        myNewData = event.response
        print ("From server: "..myNewData)
        decodedData = (json.decode( myNewData))
        SaveData()
    end
    
end

network.request( "http://pardat.com/pvsms.php", "GET", networkListener )
composer.gotoScene("intro")
--view raw