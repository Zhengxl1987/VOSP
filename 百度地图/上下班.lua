--[[
    百度地图上下班
    正则：带我?(去公司|回家)
]]
i = Intent()
if (runtime.command == "回家") then
    i.data = Uri.parse("baidumap://map/commonaddr?type=home&amp;from=shortcut_icon")
else
    i.data = Uri.parse("baidumap://map/commonaddr?type=company&amp;from=shortcut_icon")
end
app.startActivity(i)
