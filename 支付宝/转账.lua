--[[
    
    转账 09999988
]]
i = Intent()
i.data = Uri.parse('alipays://platformapi/startapp?appId=09999988')
app.startActivity(i)