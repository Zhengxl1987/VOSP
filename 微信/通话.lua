--[[
    [用微信]  (呼叫@{name} | 打(语音|视频)?电话给@{name}) 
    (语音|视频)?  内容会解析到 g1 中 参考解析器 https://github.com/Vove7/ParamRegexEngine
    
    print(matchParam('打电话给xxx','打(语音|视频)?电话给@{name}'))
]]

requireAccessibility()

if runtime.DEBUG then
    argMap['name'] = 'feier'
    argMap['g1'] = '视频'
end

intent = app.getPackageManager().getLaunchIntentForPackage("com.tencent.mm");
if argMap['g1'] == '视频' then
    intent.putExtra("LauncherUI.Shortcut.LaunchType", "launch_type_voip")
else
    intent.putExtra("LauncherUI.Shortcut.LaunchType", "launch_type_voip_audio")
end

app.startActivity(intent)

waitForApp('com.tencent.mm','VoipAddressUI')
name = argMap['name']

-- 按拼音搜索
type('EditText').text = toPinyin(name, true)
sleep(100)

-- 文字匹配联系人
first = similaryText(name).type('textview').findFirst()

-- 文字匹配失败后 选择列表项第一项
-- 不推荐 错误率较高
-- if(not first) then
--     -- 列表项 第一项
--     cs = type('ListView').children[].......
-- end

if first then
    first.tryClick()
else 
    toast('搜索失败，请手动选择联系人')
end