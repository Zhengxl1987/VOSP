--[[
    扫一扫
]]
i = Intent("android.intent.action.VIEW")
i.data = Uri.parse("bilibili://qrscan")
app.startActivity(i)