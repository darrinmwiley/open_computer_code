function download(url, file)
  local content = http.get(url).readAll()
  if not content then
        error("Could not connect to website")
  end
  f = fs.open(file, "w")
  f.write(content)
  f.close()
end

download("https://raw.githubusercontent.com/darrinmwiley/open_computer_code/master/helloworld.lua", "helloworld.lua")
