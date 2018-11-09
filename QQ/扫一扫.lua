require "accessibility"
if runtime.DEBUG then
    waitForApp(openAppByWord("qq", true))
end
k = waitForDesc("快捷入口")
k.tryClick()
s = waitForDesc("扫一扫 按钮")
s.tryClick()
