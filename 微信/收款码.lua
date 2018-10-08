require "accessibility"

-- 正则：(收|付)款码
if (runtime.DEBUG) then
    waitForApp(openAppByWord("微信", true)) --启动微信首页
end
moreBtn = ViewFinder().desc("更多功能按钮").waitFor(1000)
moreBtn.tryClick()
waitForText("收付款").tryClick()
if (runtime.command == "付款码") then
    waitForText("二维码收款").tryClick()
end
