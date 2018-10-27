--正则：(((wifi|无线)(热点)?)|(热点))
if (runtime.DEBUG) then
    runtime.commandType = -1
end
wifiApAction = {
    [-1] = function()
        -- 关闭
        system.closeWifiAp()
    end,
    [1] = function()
        -- 打开
        system.openWifiAp()
    end
}

wifiAction = {
    [-1] = function()
        -- 关闭
        system.closeWifi()
    end,
    [1] = function()
        -- 打开
        system.openWifi()
    end
}
print(runtime.command)
print(runtime.commandType)
if (String(runtime.command).contains("热点")) then
    s = wifiApAction[runtime.commandType]
    if (s) then
        s()
    end
else
    s = wifiAction[runtime.commandType]
    if (s) then
        s()
    end
end
