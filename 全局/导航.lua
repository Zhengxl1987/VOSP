--[[
    正则: 
    导航到?(附近的)?@{place} 
     带我去(附近的)?@{place}

     目前仅支持调用百度地图和高德地图进行导航
    支持Bmap(需手动选择地点)
]]
if runtime.DEBUG then
    -- args = {"北京"}
    -- args = {"浙江杭州"}
    runtime.command = "导航到附近的美食"
    argMap["place"] = "附近的美食"
end
site = argMap["place"]

--使用百度地图导航
function navWithBaidu()
    local intent = Intent()
    intent.data = Uri.parse("baidumap://map/direction?destination=" .. site .. "&src=andr.baidu.openAPIdemo")
    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_DOCUMENT) -- 即使在APP内,也可跳转
    app.startActivity(intent)
end

--使用百度地图搜索附近
function searchNearbyBaidu()
    local intent = Intent()
    intent.data = Uri.parse("baidumap://map/place/nearby?query=" .. site .. "&src=andr.baidu.openAPIdemo")
    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_DOCUMENT) -- 即使在APP内,也可跳转
    app.startActivity(intent)
end


--使用高德地图导航
function navWithAmap()
    local intent = Intent()
    intent.data = Uri.parse("androidamap://keywordNavi?sourceApplication=softname&keyword=" .. site .. "&style=2")
    intent.setAction(Intent.ACTION_VIEW)
    intent.addCategory(Intent.CATEGORY_DEFAULT)
    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_DOCUMENT) -- 即使在APP内,也可跳转
    app.startActivity(intent)
end

--使用高德地图搜索附近
function searchNearbyAmap()
    local intent = Intent()
    intent.data = Uri.parse("androidamap://arroundpoi?sourceApplication=softname&keywords=" .. site .. "&dev=0")
    intent.setAction(Intent.ACTION_VIEW)
    intent.addCategory(Intent.CATEGORY_DEFAULT)
    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_DOCUMENT) -- 即使在APP内,也可跳转
    app.startActivity(intent)
end

--Bmap导航
function navByBmap()
    local i = Intent()
    i.data = Uri.parse("geo:0,0?q=" .. site) --Bmap需手动设置是否搜索附近
    i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
    app.startActivity(i)
end

c = runtime.command

if system.getAppInfo("com.baidu.BaiduMap") then --安装了百度地图
    if (matchValues(c, "%附近的%")) then
        searchNearbyBaidu()
    else
        navWithBaidu()
    end
elseif system.getAppInfo("com.autonavi.minimap") then --安装了高德地图
    if (matchValues(c, "%附近的%")) then
        searchNearbyAmap()
    else
        navWithAmap()
    end
elseif system.getAppInfo("me.gfuil.bmap") then --安装了Bmap
    navByBmap()
else
    speak("请安装百度地图或高德地图")
end
