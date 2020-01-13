--[[
    进入蚂蚁森林
]]

i = Intent()
i.data = Uri.parse('alipays://platformapi/startapp?appId=60000002')
app.startActivity(i)