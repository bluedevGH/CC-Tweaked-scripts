rednet.open("back")
print("scanning for all local hosts")
local ids = {rednet.lookup("locateMe")}

if #ids == 0 then
    print("no devices found")
else
    for _, id in ipairs(ids) do
        print("found id:" .. id)
    end
end