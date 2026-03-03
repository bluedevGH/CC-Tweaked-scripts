local fileName = "pos_data"

print("searching for gps satellites") -- need to make these
local x, y, z = gps.locate(5)

if x then
    local file = fs.open(fileName, "w")
    file.writeLine(x)
    file.writeLine(y)
    file.writeLine(z)
    file.close()
    print("coords saved successfully")
    print("x: ", x, "y: ", y, "z: ", z)
else
    print("error - couldnt get gps signal")

    if fs.exists(fileName) then
        local file = fs.open(fileName, "r")
        x = tonumber(file.readLine())
        print("using cached x: ", x)
        file.close()
    end
end