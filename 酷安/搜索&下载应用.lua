--[[
    正则： (搜索|下载)@{appname}
]]

if runtime.DEBUG then
    runtime.command='搜索'
    argMap["appname"] = "qq"
end
--跳转搜索页面
i=system.getLaunchIntent('com.coolapk.market')
i.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK)
i.data=Uri.parse('coolmarket://com.coolapk.market/search')
app.startActivity(i)

settings = {
    --指令设置
    dl_auto_use_net = {title = "自动使用数据网络下载", summary = "如果提示", t = "checkbox", default = false}
}
config = registerSettings("coolapk_auto_dl", settings, 1)

requireAccessibility()
appname = argMap["appname"]
action = ''
if String(runtime.command).contains('搜索') then
    action = '搜索'
else
    action = '下载'
end

if (not appname or appname == "") then
    speakSync(action.."什么")
    appname = waitForVoiceParam()
end

waitForApp('com.coolapk.market','SuperSearchActivity')
sleep(500)
id('search_text').text=appname
id("search_button").tryClick()

if action == '搜索' then
  return
end

n = id("title_view").waitFor(7000) --等待网络加载完成
if (not n) then
    speak("搜索失败") -- 直..
end

s = id("title_view").containsText(appname).waitFor(6000) --查找第一个
if (s) then
    s.tryClick()
    action_button = waitForId("action_button")
    if (action_button.text == "打开") then
        speak("已经下载过啦") --
    else
        action_button.tryClick()
        hint_dialog = ViewFinder().containsText("手机移动网络流量").waitFor(1000)
        if (hint_dialog and config.getBoolean("dl_auto_use_net")) then
            ViewFinder().equalsText("是").tryClick()
        end
    end
else
    speak("搜索失败")
end
