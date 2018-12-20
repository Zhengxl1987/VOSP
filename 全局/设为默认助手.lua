require "accessibility"
import "android.os.Build"
import "android.provider.Settings"
import "cn.vove7.jarvis.R"
--[[
    暂时仅支持类原生系统
]]
-- 打开设置页面
if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) then
    app.startActivity(Intent(Settings.ACTION_MANAGE_DEFAULT_APPS_SETTINGS))
else
    app.startActivity(Intent("android.settings.MANAGE_DEFAULT_APPS_SETTINGS"))
end

ViewFinder().containsText({'助手','辅助'}).tryClick()
sleep(500)
ViewFinder().containsText({'助手应用','辅助'}).tryClick()
sleep(500)
-- 本app名
local appname = app.getString(R.string.app_name)
print(appname)
ViewFinder().containsText(appname).tryClick()
ViewFinder().equalsText('确定').tryClick()
sleep(500)
home()
speak('设置完成')