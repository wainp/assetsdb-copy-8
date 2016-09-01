local mime = require("mime")
local json = require("json")

local userid = "username-goes-here"
local password = "password-goes-here"

local URL = "http://your-server-name-here.com/json.php?userid=" 
.. mime.b64(userid) .. "&password=" .. mime.b64(password)

-- DEBUG: Show constructed url
-- print ( "Remote URL: " .. URL )

local function loginCallback(event)
    
    -- perform basic error handling
    if ( event.isError ) then
        print( "Network error!")
    else
        -- return a response code
        print ( "RESPONSE: " .. event.response )
        local data = json.decode(event.response)
        
        -- display a result to the user
        if data.result == 200 then
            -- player logged in okay, display welcome message
            print("Welcome back",data.firstname:gsub("^%l", string.upper))
        else
            -- bad password, or player not found. Prompt user to login again
            print("Please try again")
        end
    end
    
    return true
end

-- make JSON call to the remote server
network.request( URL, "GET", loginCallback ) 


