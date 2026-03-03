local myName = "configme"

rednet.open("back") -- all modems need to be on back of device
rednet.host("locateMe", myName)

print("waiting for location reqs")

while true do
    local id, msg = rednet.receive("locateMe")
    if msg == "whereAt" then
        local x,y,z = gps.locate(5)
        if x then
            rednet.send(id, {x,y,z})
            print("sent coords to computer #" .. id)
        else
            print("gps fail")
        end
    end
end