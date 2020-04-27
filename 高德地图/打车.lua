--[[
    高德打车
    正则：打[车的]|叫出租车?
]]
i = Intent()
i.data = Uri.parse("amapuri://drive/takeTaxi")
app.startActivity(i)
