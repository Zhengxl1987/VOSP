--[[
    正则：(传递|发送)指令@{cmd}
]]

if (AppConfig.INSTANCE.versionCode < 20000) then
    toast("请更新2.0.0+版本")
    return
end
if runtime.DEBUG then
    argMap["cmd"] = "复制123"
end

system.sendCommand2OtherDevices(argMap["cmd"])
