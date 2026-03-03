local myName = "configme"
local x,y,z = gps.locate

rednet.open("back") -- all modems need to be on back of device
rednet.host("locateMe", myName)

print("waiting for location reqs")

while true do
    local id, msg = rednet.receive("locateMe")
    if msg == "whereAt" then
        rednet.send(id, {x,y,z})
        print("sent coords to computer #" .. id)
    end
end