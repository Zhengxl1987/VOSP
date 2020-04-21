--[[
    跳转我的订单记录
    正则：(我的)?订单(记录)?
]]
i = Intent()
i.data = Uri.parse("openapp.jdmobile://virtual?params={category:jump,des:orderlist}")
app.startActivity(i)
