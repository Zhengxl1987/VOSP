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
argMap["name"] = ""
argMap['message'] = ""
pName = argMap["name"]
msgContent = argMap["message"]
name_m = argMap["name_message"]
-- Lua+VAssistant，配合语音输入和确认提示。(提示name输入，message没输入可以安排到接下来的语音输入环节莫问题~)
if (not name or name == "") then
    sleep(300)
    toast("并没有设置信息呢，请现在设置下哦。")
    pName = waitForVoiceParam()
    if (pName ~= "") then
        if (alert("第一次确认账号或群号?", "确认上方账号或群号是否为:"..pName.."，否则请第二次重新语音输入！")) then
            sleep(300)
        else
        toast("第一次并没有设置信息呢，请现在设置下哦。")
        pName = waitForVoiceParam()
            if (alert("第二次确认账号或群号?", "确认上方账号或群号是否为:"..pName.."，否则请重新开始！")) then
                sleep(300)
            else
                if (pName ~= "") then
                    speak("欣欣去罢工了，哼！")
                end
            i.setText(pName)
            end
        end
    end
end
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
if (not pName or pName == "") then
    toast("并没有设置信息呢，请现在设置下哦。")
    pName = waitForVoiceParam(pName)
    if (not pName or pName == "") then
        speak("再不设置对方信息，欣欣就生气不理了，哼！")
        sleep(5310)
        pName = waitForVoiceParam()
        if (pName ~= "") then
            i.setText(pName)
        else
            speak("欣欣去罢工了，哼！")
            sleep(4810)
        end
    end
end
s.setTextWithInitial(pName)
a = ViewFinder().id("j64").type("TextView").similaryText(pName).waitFor(3000).tryClick()
if (not a) then
    toast("没找到哦")
    return
end
-- 以下为发送消息情况，如果没信息，那么欣欣会自动填充内容公开报错
i = ViewFinder().id("input").waitFor()
if (msgContent ~= "") then
    if (alert("确认填入信息?", "确认下方即将发送的信息是否为:"..msgContent.."，否则请重新开始！")) then
        sleep(300)
    end
    i.setText(msgContent)
    clickById("fun_btn")
    toast("信息填充完毕")
    speak("信息填充完毕，请查看自动发送情况")
    return
else
    toast("并没有设置发送的信息呢，请现在设置下哦。")
    msgContent = waitForVoiceParam()
    if (not msgContent or msgContent == "") then
        i = ViewFinder().id("input").waitFor()
        i.setText("哎呀，忘记要发什么消息惹QAQ，快来解决一下！"..("报错时间如下：").."北京时间星期"..weeks[w]..d.format(Date()).."\n网络很正常呢，的网络IP如下:"..lip.."。")
        clickById("fun_btn")
        speak("刚刚发送错误消息哦，请看看。".."\n时间为北京时间星期"..weeks[w]..d.format(Date()))
        return
    end
    if (alert("确认填入信息?", "确认下方即将发送的信息是否为:"..msgContent.."，否则请重新开始！")) then
        sleep(300)
    end
    i.setText(msgContent)
    clickById("fun_btn")
    speak("信息填充完毕，请查看自动发送情况")
end