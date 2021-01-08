local set_bonsai = require("set_bonsai")
local component = require("component")
local event = require("event")
local m = component.modem
m.open(123)

while true do
  local _, _, from, port, _, message = event.pull("modem_message")
  set_bonsai.setBonsai(tostring(message))
end
