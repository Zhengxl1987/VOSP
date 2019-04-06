--[[
    正则：
    (帮我)?(使?用|打开|启动|开启)@{__}
]]
if (runtime.DEBUG) then
    argMap["__"] = "蓝牙"
end

t = argMap["__"]
if (not t or t == "") then
    speakSync("打开什么")
    t = waitForVoiceParam()
end
if (t) then
    smartOpen(t)
end
