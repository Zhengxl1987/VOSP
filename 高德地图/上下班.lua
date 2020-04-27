--[[
    上下班
    正则：去公司|回家
]]
i = Intent()
i.data = Uri.parse("amapuri://routecommute")
app.startActivity(i)
