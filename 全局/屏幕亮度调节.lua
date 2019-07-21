--[[
    屏幕亮度调节
    正则：%(最高|最低|最大|最小|加大|增加|增大|降低|减少|减小|中等)(屏幕)?亮度
    自动调整(屏幕)?亮度
]]
import "cn.vove7.common.app.AppConfig"
import 'android.provider.Settings'
if runtime.DEBUG then
    runtime.command = "最大亮度"
    runtime.command = "最高亮度"
    runtime.command = "最低亮度"
    runtime.command = "最小亮度"
    runtime.command = "加大亮度"
    runtime.command = "减少亮度"
    runtime.command = "降低亮度"
    runtime.command = "增加亮度"
    runtime.command = "加大亮度"
    runtime.command = "中等亮度"
    -- runtime.command = "自动调整亮度"
end

if (AppConfig.INSTANCE.versionCode <= 155) then
    toast("此指令仅支持1.9.3+版本")
    return
end
if (not Settings.System.canWrite(app)) then
    print("无权限")
    system.openAppDetail(app.packageName)
    toast("请授予[修改系统设置]权限")
    return
else 
    print("有权限")
end
s = String(runtime.command)
if (s.contains("最")) then
    if (s.contains("高") or s.contains("大")) then
        print("最大")
        system.screenBrightness = 255
    else
        system.screenBrightness = 0
        print("最小")
    end
elseif s.contains("自动调整") then
    print("自动调整亮度")
    system.screenBrightnessMode = 1
elseif s.contains("中等") then
    print("中等")
    system.screenBrightness = 125
else
    nowValue = system.screenBrightness
    if (s.contains("加") or s.contains("增")) then
        print("加大")
        system.screenBrightness = nowValue + 50
    else
        print("降低")
        system.screenBrightness = nowValue - 50
    end
end
