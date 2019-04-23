import 'android.os.Build'
if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) then
    requireAccessibility()
    system.lockScreen()
elseif(androRuntime.isRoot()) then
    system.screenOff()
else 
    toast("该指令暂不支持该设备")
end