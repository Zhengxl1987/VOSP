--[[
    酷狗播放音乐
    本地 与 搜索
]]
if runtime.DEBUG then
    argMap['song'] = "本地音乐"
end

song = argMap["song"]

if song =='本地音乐' or song == '本地歌曲' or song == "本地" then
    i = Intent()
    i.data = Uri.parse("kugousc://play/local")
    i.component = ComponentName("com.kugou.android", "com.kugou.android.app.splash.shortcut.ShortcutEntryActivity")
    app.startActivity(i)
    return
end

requireAccessibility()
i = Intent()
i.data = Uri.parse("kugousc://search")
i.component = ComponentName("com.kugou.android", "com.kugou.android.app.splash.shortcut.ShortcutEntryActivity")

app.startActivity(i)
sleep(500)
waitForApp("com.kugou.android")
editable(true).await(10000).text = song
text("搜索").tryClick()
text("播放全部").await(5000).tryClick()
