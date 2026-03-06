rednet.open("back")
print("scanning for all local hosts")
local ids = {rednet.lookup("locateMe")} -- this only scans for devices hosting rednet as "locateMe", cange to your own device's rednet host name

if #ids == 0 then
    print("no devices found")
else
    for _, id in ipairs(ids) do
        print("found id:" .. id) -- this will be the ID of the computer you are looking to directly reference
    end

end
