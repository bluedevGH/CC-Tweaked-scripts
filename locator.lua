rednet.open("back") -- this does infact work on pocket devices

print("locating self")
local myX, myY, myZ = gps.locate(5)

if not myX then
    error("gps failed, check if satellites are on")
end

while true do
    print("\n-------------")
    print("list of valid names: jkStation, renStation")
    print("type exit to exit the program\n")
    write("enter station name: ")
    local targetName = read()

    if targetName == "exit" then break end

    print("looking for ", targetName)

    if targetID then
        rednet.send(targetID, "whereAt", "locateMe")
        local id, coords = rednet.receive("locateMe", 5)

        if coords and type(coords) == "table" then
            local tX, tY, tZ = table.unpack(coords)

            local dx = tX - myX
            local dy = tY - myY
            local dz = tZ - myZ
            local distance = math.sqrt(dx*dx + dy*dy + dz*dz)
            
            print(string.format("successful, %s is %.2f blocks away.", targetName, distance))
        else
            print("error: target found but it didnt send coords")
        end
    else
        print("error: couldnt find device named", targetName)
    end
end