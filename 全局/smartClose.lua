--[[
    正则：
    (关闭|关掉|停止)@{__}
]]
if (runtime.DEBUG) then
    argMap["__"] = "qq"
end

t = argMap["__"]
if (not t or t == "") then
    speakSync("关闭什么")
    t = waitForVoiceParam()
end
if (t) then
    smartClose(t)
end