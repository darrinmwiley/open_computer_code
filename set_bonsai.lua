function set_bonsai(name)
  local bonsai_control = require("bonsai_control")
  local utils = require("utils")
  
  sapling_tab = {}
  
  local ct = 1
  for line in io.lines("sapling_db") do
    sapling_tab[line] = ct
    ct = ct + 1
  end
  
  ind = sapling_tab[name]
  bonsai_control.setBonsai(ind)
end

return {setBonsai = set_bonsai}
