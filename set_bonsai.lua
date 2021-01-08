local bonsai control = require("bonsai_control")
function set_bonsai(name)
  local utils = require("utils")
  
  local addr_tab = {}
  local arr = {}
  local ct = 1
  
  for line in io.lines("addr_db") do
    arr[ct] = line
    ct = ct + 1
  end
  
  sapling_tab = {}
  
  ct = 1
  for line in io.lines("sapling_db") do
    sapling_tab[line] = ct
    ct = ct + 1
  end
  
  ind = sapling_tab[name]
  bonsai_control.setBonsai(ind)
end

return {setBonsai = set_bonsai}
