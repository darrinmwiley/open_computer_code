function getConfiguration()
  return configuration
end

function setConfiguration(tab)
  configuration = tab
  for k, v in pairs(tab) do
    setSingle(k, v)
  end
end

function setSingle(bonsai_num, resource)
  local send_util = require("send_util")
  send_util.send(bonsai_num, resource)
end
