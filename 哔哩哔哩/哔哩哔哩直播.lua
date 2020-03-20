--[[
    直播
]]
i = Intent("android.intent.action.VIEW")
i.data = Uri.parse("bilibili://livearea")
app.startActivity(i)