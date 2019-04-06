--[[
    正则：卸载@{app}
]]
if runtime.DEBUG then
    argMap["app"] = "qq"
end

appName = argMap["app"]
print(appName)
appPkg = system.getPkgByWord(appName)
print(appPkg)
if (appPkg) then
    uninstallIntent = Intent(Intent.ACTION_DELETE)

    uninstallIntent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
    uninstallIntent.setData(Uri.parse("package:" .. appPkg))
    app.startActivity(uninstallIntent)
    if (alert("", "确认以卸载")) then
        --print('ok')
        waitForText({"OK", "确定"}, 2000).tryClick()
    else
        waitForText({"cancel", "取消"}, 2000).tryClick()
    end
else
    speak("未找到该应用")
end
