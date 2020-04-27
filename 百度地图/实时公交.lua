--[[
    正则：(实时|附近)公交
]]
i = Intent()
i.data = Uri.parse("baidumap://map/busnearby?busfrom=v-assistant")
app.startActivity(i)
