require "accessibility"

-- 正则：面对面建群%
-- 参数 4位密码
if (runtime.DEBUG) then
    waitForApp(openAppByWord("微信", true)) --启动微信首页
    runtime.command = "付款码"
    args = {"1234"}
end
moreBtn = ViewFinder().desc("更多功能按钮").waitFor(1000)
moreBtn.tryClick()
waitForText("发起群聊", 1000).tryClick()
waitForText("面对面建群", 1000).tryClick()

code = args[1]
if (not code) then
    return
end
-- 获取字符串指定位置的字符
function charAt(s, i)
    return string.sub(s, i, i)
end
waitForText("和身边") -- sleep
for i = 0, #code do
    c = charAt(code, i)
    sleep(200)
    ViewFinder().equalsText(c).tryClick()
    print(c)
end
