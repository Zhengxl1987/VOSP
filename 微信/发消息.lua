require "accessibility"

-- 正则：发消息给% | 给%发消息
if (runtime.DEBUG) then -- 调试
    args = {"郭正兴"}
    openAppByWord("微信", true)
end

name = args[1]
waitForDesc("搜索").tryClick()
searchInput = waitForText("搜索")
print(searchInput)
searchInput.tryClick()
sleep(500)
print(searchInput.setText(toPinyin(name, true)))

p = ViewFinder().similaryText(name).waitFor(5000)

p.tryClick() -- 若搜寻失败, 可抛出异常，终止队列后操作
