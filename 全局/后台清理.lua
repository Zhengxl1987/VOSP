--[[
    清理后台，需要高级无障碍服务
    只支持氢氧系统
    正则：清理后台%
]]
requireAccessibility()
recents()
if (removeFloat) then
    removeFloat()
else
    sleep(800)
end

cl = ViewFinder().id("hotseat").waitFor(1000)
print(cl)
if (cl) then
    sleep(500)
    cl.globalClick()
end
