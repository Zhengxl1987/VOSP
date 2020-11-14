--[[
    正则：冻结@{name}
]]
import "cn.vove7.common.app.AppConfig"

if runtime.DEBUG then 
    argMap['name'] = 'qq'
end

if (AppConfig.INSTANCE.versionCode <= 21400) then
    toast("请更新至最新版App")
    return
end

import 'com.catchingnow.icebox.sdk_client.IceBox'
local name = argMap['name']
local pkg = system.getPkgByWord(name)
if pkg then 
    IceBox.setAppEnabledSettings(app, false, {pkg})
    toast('已冻结' .. name)
else
    toast('未知应用：' .. name)
end