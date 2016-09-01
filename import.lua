local json = require "json"

function scene:create( event )

end


function scene:show( event )
local t = {
    ["name1"] = "value1",
    ["name2"] = { 1, false, true, 23.54, "a \021 string" },
    name3 = json.null
}

local encoded = json.encode( t )
print( encoded )  --> {"name1":"value1","name3":null,"name2":[1,false,true,23.54,"a \u0015 string"]}

local encoded = json.encode( t, { indent = true } )
print( encoded )  --[[> {
  "name1":"value1",
  "name3":null,
  "name2":[1,false,true,23.54,"a \u0015 string"]
}
--]]

-- Since this was just encoded using the same library it's unlikely to fail but
-- it's good practice to handle errors anyway
local decoded, pos, msg = json.decode( encoded )
if not decoded then
    print("Decode failed at "..tostring(pos)..": "..tostring(msg))
else
    print( decoded.name2[4] )  --> 23.54
end
end

function scene:exit( event )
	local group = self.view
        _G.GUI.GetHandle("Bar1"):show(false)
        _G.GUI.RemoveAllWidgets()
         composer.removeScene("delitem")
        composer.purgeScene("delitem")
end

function scene:destroy( event )
	
end


scene:addEventListener( "create",scene )
scene:addEventListener( "exit",scene )
scene:addEventListener( "show",scene )
scene:addEventListener( "destroy",scene )

return scene
