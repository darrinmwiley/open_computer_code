local function exploreTable(tbl, prefix)
  prefix = prefix or ""
  for k,v in pairs(tbl) do
    if type(v) == "table" then
      print(prefix..k..": ")
      exploreTable(v, prefix.."  ")
    elseif type(v) == "function" then
      print(prefix.."key: "..k.." function")
    else
      print(prefix..k..": "..tostring(v))
    end
  end
end

local function str_startswith(str, start)
  return string.sub(str, 1, string.len(start)) == start
end

return {exploreTable = exploreTable, str_startswith = str_startswith}
