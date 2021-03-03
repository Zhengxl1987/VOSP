-- 启动QQ，使用Android系统包名，设置系统级别参数（版本完善很成功，2021.3.2 21：18）
requireAccessibility()
system.openAppByPkg("com.tencent.mobileqq", true)
import 'java.text.SimpleDateFormat'
local weeks = { '⑦', '①', '②', '③', '④', '⑤', '⑥' }
local c = Calendar.getInstance()
local d = SimpleDateFormat("ss秒,HH时:mm分")
local w = c.get(Calendar.DAY_OF_WEEK)
lip = system.localIpAddress
    runtime.command = "ip"

-- Lua脚本设置普通级别参数（版本完善很成功，2021.3.2 21：18）
argMap["name"] = ""                        -- 这边写的name是QQ号或者QQ群聊哦，我测试的时候是写ID，不是名字。
argMap['message'] = ""        -- 觉得很不省心可以用这句话 argMap["name_message"] = ""，那么接下来tmp这一行就需要魔改化了
pName = argMap["name"]
msgContent = argMap["message"]
name_m = argMap["name_message"]

-- Lua脚本设置参数if类（无需修改，如果想定制可以改tmp这一行）
if (name_m) then
    --正则表达式写法判断消息内容
    tmp = matchValues(name_m, "%内容为%")
    if (tmp) then
        print(arr2String(tmp))
        pName = tmp[0]
        msgContent = tmp[1]
    else
        pName = name_m
        msgContent = ""
    end
end
print(pName, msgContent)

-- 以下为发送消息需要定位操作，可以深度化定制（实测QQ用户、QQ群聊是OK的）（还需要完善）
system.openAppByPkg("com.tencent.mobileqq", true)
sleep(810)
id("et_search_keyword").await(1000).tryClick()
s = ViewFinder().id("et_search_keyword")
sleep(810)
s.setTextWithInitial(pName)
a = ViewFinder().id("j64").type("TextView").similaryText(pName).waitFor(3000).tryClick()
if (not a) then
    toast("没找到哦")
    return
end

-- 以下为发送消息情况，如果没信息，那么欣欣会自动填充内容公开报错（版本完善很成功，2021.3.2 21：18）
i = ViewFinder().id("input").waitFor()
i.setText(msgContent)
clickById("fun_btn")
if (not msgContent or msgContent == "") then
    i = ViewFinder().id("input").waitFor()
    i.setText("哎呀，忘记要发什么消息惹QAQ，主人快来解决一下！"..("报错时间如下：").."北京时间星期"..weeks[w]..d.format(Date()).."\n网络很正常呢，欣欣在家里的网络IP如下:"..lip.."。")
    clickById("fun_btn")
    return
end

