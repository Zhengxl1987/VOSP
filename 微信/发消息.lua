--[[
   正则：
   给@{name}发消息(内容为)?@{message}
   发消息给@{name_message}
]]
requireAccessibility()

-- 正则：发消息给% | 给%发消息(内容为)?%
-- 发消息给%(内容为)?% 不可行
if (runtime.DEBUG) then -- 调试    
    argMap["name"] = "vove"
    argMap["message"] = "1234"
    system.openAppByWord("微信", true)
end

name = argMap["name"]
msgContent = argMap["message"]
nm = argMap["name_message"]
if (nm) then
    tmp = matchValues(nm, "%内容为%") -- 适配 发消息给%(内容为)?%
    if (tmp) then
        name = tmp[0]
        msgContent = tmp[1]
    else
        name = nm
        msgContent = ""
    end
end
-- 点击搜索按钮
waitForDesc("更多功能按钮").parent.childs[0].tryClick()
searchInput = waitForText("搜索")
sleep(500)
print(searchInput.setText(toPinyin(name, true)))

p = ViewFinder().type('TextView').similaryText(name).waitFor(5000)

p.tryClick() -- 若搜寻失败, 可抛出异常，终止队列后操作

-- 发送内容
if (not msgContent or msgContent == "") then
    print("未指定消息")
    return
end

-- 切换到键盘
a = ViewFinder().desc("切换到键盘").waitFor(500)
if (a) then
    a.tryClick()
end
ViewFinder().type("EditText").waitFor(500).setText(msgContent)
if (alert("确认发送?", "")) then
    ViewFinder().equalsText("发送").waitFor(1000).tryClick()
end
