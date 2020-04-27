--[[
    正则：位置共享|共享%{0,2}位置
]]

i = Intent()
i.data = Uri.parse('baidumap://map/navi/locationshare')
app.startActivity(i)
