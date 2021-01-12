local send = function(PORT, id, resource)
    local component = require("component")
    local m = component.modem

    function lpad(str, len, char)
        return string.rep(char, len - #str) .. str
    end

    id2 = lpad(id,3,'0')

    m.broadcast(PORT, id2..resource)
end

return {send = send}
