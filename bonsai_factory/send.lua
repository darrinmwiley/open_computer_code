local PORT = 549

local component = require("component")
local m = component.modem

function lpad(str, len, char)
    return string.rep(char, len - #str) .. str
end

args = {...}

id = lpad(args[1],3,'0')
resource = args[2]

m.broadcast(PORT, id..resource)

