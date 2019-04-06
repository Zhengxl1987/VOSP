requireAccessibility()

-- 正则：(收|付)[款钱]码?
if (runtime.DEBUG) then
    waitForApp(system.openAppByWord("微信", true)) --启动微信首页
    runtime.command = "付款"
end
moreBtn = ViewFinder().desc("更多功能按钮").waitFor(10000)
moreBtn.tryClick()
waitForText("收付款").tryClick()
if (string.find(runtime.command,  "收")) then
    waitForText("二维码收款").tryClick()
end
