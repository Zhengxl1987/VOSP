--[[
    全局指令 上下班
    正则：带我?(去公司|回家)
]]
navApps = {
    "com.autonavi.minimap",
    "com.baidu.BaiduMap",
}
actions = {
    "高德上下班",
    "百度地图上下班",
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
