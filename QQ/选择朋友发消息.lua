--[[
   正则：
   给@{name}发消息(内容为)?@{message}
   发消息给@{name_message}
]]
requireAccessibility()
if (runtime.DEBUG) then -- 调试
    argMap["name"] = "vove"
    argMap["message"] = "1234"
    -- argMap["name_message"] = "vove内容为1234"
    waitForApp(system.openAppByWord("qq", true))
end
pName = argMap["name"]
msgContent = argMap["message"]
nm = argMap["name_message"]
if (nm) then
    tmp = matchValues(nm, "%内容为%") -- 适配 发消息给%(内容为)?%
    if (tmp) then
        print(arr2String(tmp))
        pName = tmp[0]
        msgContent = tmp[1]
    else
        pName = nm
        msgContent = ""
    end
end
print(pName, msgContent)
s = ViewFinder().id("et_search_keyword")
s.await(1000).tryClick() --
sleep(810)
s.setTextWithInitial(pName) -- 同 s.setText(toPinyin(args[1],true)) 或 s.text=toPinyin(args[1],true)
-- sleep(110)
a = ViewFinder().id("title").type("TextView").similaryText(pName).waitFor(3000).tryClick()
if (not a) then
    toast("没找到哦")
    return
end

-- 发送内容
if (not msgContent or msgContent == "") then
    print("未指定消息")
    return
end
i = ViewFinder().id("input").waitFor()
i.setText(msgContent)
if (alert("确认发送?", "")) then
    sleep(300)
    clickById("fun_btn")
end
