local bonsai_control = require("bonsai_control")
local component = require("component")
local event = require("event")
local m = component.modem
m.open(123)

while true do
  local _, _, from, port, _, message = event.pull("modem_message")
  bonsai_control.setBonsai(tostring(message))
end
