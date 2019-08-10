--[[
    正则: 
    导航到?(附近的)?@{place} 
    用@{app}导航到?(附近的)?@{place} 
    带我去(附近的)?@{place}
    用@{app}带我去(附近的)?@{place}

    目前仅支持调用百度地图和高德地图进行导航
    支持Bmap(需手动选择地点)
]]
if runtime.DEBUG then
    -- args = {"北京"}
    -- args = {"浙江杭州"}
    -- runtime.command = "导航到附近的美食"
    -- argMap["place"] = "附近的美食"
    runtime.command = "用高德带我去北京"
    argMap["place"] = "北京"
    argMap["app"] = "百度"
end
site = argMap["place"]
navApp = argMap["app"]
--使用百度地图导航
function navWithBaidu()
    local intent = Intent()
    intent.data = Uri.parse("baidumap://map/direction?destination=" .. site .. "&src=andr.baidu.openAPIdemo")
    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_DOCUMENT) -- 即使在APP内,也可跳转
    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
    app.startActivity(intent)
end

--使用百度地图搜索附近
function searchNearbyBaidu()
    local intent = Intent()
    intent.data = Uri.parse("baidumap://map/place/nearby?query=" .. site .. "&src=andr.baidu.openAPIdemo")
    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_DOCUMENT) -- 即使在APP内,也可跳转
    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
    app.startActivity(intent)
end

--使用高德地图导航
function navWithAmap()
    if (site == nil) then
        site = "北京"
    end
    print("高德导航")
    local intent = Intent()
    intent.data = Uri.parse("androidamap://keywordNavi?sourceApplication=softname&keyword=" .. site .. "&style=2")
    intent.setAction(Intent.ACTION_VIEW)
    intent.addCategory(Intent.CATEGORY_DEFAULT)
    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_DOCUMENT) -- 即使在APP内,也可跳转
    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
    app.startActivity(intent)
end

--使用高德地图搜索附近
function searchNearbyAmap()
    local intent = Intent()
    intent.data = Uri.parse("androidamap://arroundpoi?sourceApplication=softname&keywords=" .. site .. "&dev=0")
    intent.setAction(Intent.ACTION_VIEW)
    intent.addCategory(Intent.CATEGORY_DEFAULT)
    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_DOCUMENT) -- 即使在APP内,也可跳转
    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
    app.startActivity(intent)
end

-- 使用高德地图机车版导航
-- 来源 https://www.bbsmax.com/A/A2dmRykWze/
function navWithAmapAuto()
    if (site == nil) then
        site = "故宫"
    end
    print("高德机车导航")
    local intent = Intent()
    intent.data = Uri.parse("androidauto://poi?sourceApplication=softname&keywords=" .. site .. "&style=2")
    intent.setAction(Intent.ACTION_VIEW)
    intent.addCategory(Intent.CATEGORY_DEFAULT)
    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_DOCUMENT) -- 即使在APP内,也可跳转
    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
    app.startActivity(intent)
end
--使用高德地图机车版搜索附近
function searchNearbyGaoDeAuto()
    if (site == nil) then
        site = "美食"
    end
    local intent = Intent()
    intent.data = Uri.parse("androidauto://arroundpoi?sourceApplication=softname&keywords=" .. site .. "&dev=0")
    intent.setAction(Intent.ACTION_VIEW)
    intent.addCategory(Intent.CATEGORY_DEFAULT)
    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_DOCUMENT) -- 即使在APP内,也可跳转
    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
    app.startActivity(intent)
end

--Bmap导航
function navByBmap()
    local i = Intent()
    i.data = Uri.parse("geo:0,0?q=" .. site) --Bmap需手动设置是否搜索附近
    i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
    app.startActivity(i)
end

-------------- 开始解析 ---------------------

c = runtime.command
isNear = matchValues(c, "%附近的%")

function withBaidu()
    print("使用百度")
    if (isNear) then
        searchNearbyBaidu()
    else
        navWithBaidu()
    end
end

function withGaode()
    if system.getAppInfo("com.autonavi.minimap") then --安装了高德地图
        print("使用高德")
        if (isNear) then
            searchNearbyAmap()
        else
            navWithAmap()
        end
    elseif system.getAppInfo("com.autonavi.amapauto") then --安装了高德地图机车版
        print("使用高德机车")
        if (isNear) then
            searchNearbyAmapAuto()
        else
            navWithAmapAuto()
        end
    end
end

if (navApp) then -- 指定了导航软件
    print("导航软件：" .. navApp)
    if (String(navApp).contains("高德")) then
        if system.getAppInfo("com.autonavi.minimap") then
            withGaode()
        else
            speak("请安装高德地图")
        end
    elseif (String(navApp).contains("百度")) then
        if system.getAppInfo("com.baidu.BaiduMap") then
            withBaidu()
        else
            speak("请安装百度地图")
        end
    else
        speak("不支持的导航软件：" .. navApp)
    end
else -- 未指定导航软件
    if system.getAppInfo("com.baidu.BaiduMap") then --安装了百度地图
        withBaidu()
    elseif system.getAppInfo("com.autonavi.minimap") then --安装了高德地图
        print("使用高德")
        if (isNear) then
            searchNearbyAmap()
        else
            navWithAmap()
        end
    elseif system.getAppInfo("com.autonavi.amapauto") then --安装了高德地图机车版
        print("使用高德机车")
        if (isNear) then
            searchNearbyAmapAuto()
        else
            navWithAmapAuto()
        end
    elseif system.getAppInfo("me.gfuil.bmap") then --安装了Bmap
        print("使用BMap")
        navByBmap()
    else
        speak("请安装百度地图或高德地图")
    end
end
