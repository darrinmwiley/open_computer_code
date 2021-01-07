local component = require("component")
local fs = require("filesystem")
local internet = require("internet")
local shell = require("shell")
local text = require("text")

if not component.isAvailable("internet") then
  io.stderr:write("This program requires an internet card to run.")
  return
end

function wget(url, filename, quiet, force)
  if not filename then
    filename = url
    local index = string.find(filename, "/[^/]*$")
    if index then
      filename = string.sub(filename, index + 1)
    end
    index = string.find(filename, "?", 1, true)
    if index then
      filename = string.sub(filename, 1, index - 1)
    end
  end
  filename = text.trim(filename)
  if filename == "" then
    if not quiet then
      io.stderr:write("could not infer filename, please specify one")
    end
    return nil, "missing target filename" -- for programs using wget as a function
  end
  filename = shell.resolve(filename)

  local preexisted
  if fs.exists(filename) then
    preexisted = true
    if not force then
      if not quiet then
        io.stderr:write("file already exists")
      end
      return nil, "file already exists" -- for programs using wget as a function
    end
  end

  local f, reason = io.open(filename, "a")
  if not f then
    if not quiet then
      io.stderr:write("failed opening file for writing: " .. reason)
    end
    return nil, "failed opening file for writing: " .. reason -- for programs using wget as a function
  end
  f:close()
  f = nil

  if not quiet then
    io.write("Downloading... ")
  end
  local result, response = pcall(internet.request, url, nil, {["user-agent"]="Wget/OpenComputers"})
  if result then
    local result, reason = pcall(function()
      for chunk in response do
        if not f then
          f, reason = io.open(filename, "wb")
          assert(f, "failed opening file for writing: " .. tostring(reason))
        end
        f:write(chunk)
      end
    end)
    if not result then
      if not quiet then
        io.stderr:write("failed.\n")
      end
      if f then
        f:close()
        if not preexisted then
          fs.remove(filename)
        end
      end
      if not quiet then
        io.stderr:write("HTTP request failed: " .. reason .. "\n")
      end
      return nil, reason -- for programs using wget as a function
    end
    if not quiet then
      io.write("success.\n")
    end

    if f then
      f:close()
    end

    if not quiet then
      io.write("Saved data to " .. filename .. "\n")
    end
  else
    if not quiet then
      io.write("failed.\n")
    end
    if not quiet then
      io.stderr:write("HTTP request failed: " .. response .. "\n")
    end
    return nil, response -- for programs using wget as a function
  end
  return true -- for programs using wget as a function
end

print("fetching helloworld.lua")
wget("https://raw.githubusercontent.com/darrinmwiley/open_computer_code/master/helloworld.lua", "helloworld.lua", true, true)
print("fetching list_components.lua")
wget("https://raw.githubusercontent.com/darrinmwiley/open_computer_code/master/list_components.lua", "list_components.lua", true, true)
print("fetching get_methods.lua")
wget("https://raw.githubusercontent.com/darrinmwiley/open_computer_code/master/get_methods.lua", "get_methods.lua", true, true)
print("fetching invoke.lua")
wget("https://raw.githubusercontent.com/darrinmwiley/open_computer_code/master/invoke.lua", "invoke.lua", true, true)
print("fetching utilities")
wget("https://raw.githubusercontent.com/darrinmwiley/open_computer_code/master/utils.lua","utils.lua",true,true)
print("fetching test script")
wget("https://raw.githubusercontent.com/darrinmwiley/open_computer_code/master/test.lua", "test.lua", true, true)


