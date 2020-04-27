--[[
    全局指令 实时公交
    正则：(实时|附近)公交
]]
navApps = {
    "com.autonavi.minimap",
    "com.baidu.BaiduMap",
}
actions = {
    "高德实时公交",
    "百度地图实时公交",
}
suc = false
for i = 1, #navApps do
    packageName = navApps[i]
    cmd = actions[i]
    if system.hasInstall(packageName) then
        result = utils.runAppCommand(packageName, cmd, argMap)
        if not result then
            toast("指令 [" .. cmd .. "] 未找到")
        else
            suc = true
            return
        end
    end
end
if (not suc) then
    app.toastError("请先安装 百度地图或高德地图", 1)
end
