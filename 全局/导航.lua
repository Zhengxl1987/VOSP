--[[
    正则: 导航到?(附近的)?% , 带我去(附近的)?%

    仅支持调用百度地图进行导航, 由于其他地图软件接口限制
]]
if runtime.DEBUG then
    -- args = {"北京"}
    -- args = {"浙江杭州"}
    runtime.command = "导航到附近的美食"
    args = {"附近的美食"}
-- args = {"浙江杭州"}
-- runtime.command = "导航到附近的厕所"
-- args = {"附近的厕所"}
end
site = args[1]

--百度导航
function navWithBaidu()
    local intent = Intent()
    intent.data = Uri.parse("baidumap://map/direction?destination=" .. site .. "&src=andr.baidu.openAPIdemo")
    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_DOCUMENT) -- 即使在百度地图内,也可跳转
    app.startActivity(intent)
end
--使用百度搜索附近
function searchNearPlace()
    local intent = Intent()
    intent.data = Uri.parse("baidumap://map/place/nearby?query=" .. site .. "&src=andr.baidu.openAPIdemo")
    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_DOCUMENT) -- 即使在百度地图内,也可跳转
    app.startActivity(intent)
end

if getAppInfo("com.baidu.BaiduMap") then --安装了百度地图
    if (matchValues(runtime.command, "%附近的%")) then
        searchNearPlace()
    else
        navWithBaidu()
    end
else
    speak("请安装百度地图")
end
