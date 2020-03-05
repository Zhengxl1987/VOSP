--[[
    AppleMusic音乐播放
    搜索播放
    正则: 播放@{song}
]]
if runtime.DEBUG then
    argMap["song"] = ""
end

song = argMap["song"]
if (song == "") then
    --广播
    i = Intent("android.intent.action.VIEW")
    i.data = Uri.parse("http://itunes.apple.com/radio")
    app.startActivity(i)
    return
end
i = Intent("android.intent.action.MEDIA_SEARCH")
i.putExtra("query", song)
i.component =
    ComponentName("com.apple.android.music", "com.apple.android.music.search.google.VoiceSearchHandlerActivity")

app.startActivity(i)
