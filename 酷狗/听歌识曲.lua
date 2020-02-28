--[[
    听歌识曲
]]
i = Intent()
i.data = Uri.parse("kugousc://hunter")
i.component = ComponentName("com.kugou.android", "com.kugou.android.app.splash.MHShortcutEntryActivity")

app.startActivity(i)