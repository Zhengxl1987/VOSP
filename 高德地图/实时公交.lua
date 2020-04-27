--[[
    正则：(实时|附近)公交
]]
i = Intent()
i.data = Uri.parse("amapuri://realtimeBus/home")
app.startActivity(i)
