--[[
    正则：搜索@{name}

]]
if (runtime.DEBUG) then
    argMap["name"] = "朱一旦"
end

name = argMap["name"]
if (not name or name == "") then
    speakSync("搜索什么")
    name = waitForVoiceParam()
end
if (not name or name == "") then
    return
end
i = Intent("android.intent.action.VIEW")
i.data = Uri.parse("bilibili://search?keyword="..name)
app.startActivity(i)
