--[[
    正则: 
    地图(搜索|查找)(附近的)?@{place}
]]
if runtime.DEBUG then
    argMap["place"] = "地铁站"
    runtime.command = "地图搜索附近的地铁站"
    -- argMap["place"] = "虹桥机场"
    -- runtime.command = "地图搜索虹桥机场"
end

place = argMap["place"]

if not place or place == "" then
    speakSync("请说搜索地点")
    place = waitForVoiceParam()
    if (place) then
        runtime.command = "地图搜索" .. place
    else
        return
    end
end

isNear = String(runtime.command).contains("附近的")
print("附近：" .. String.valueOf(isNear))

function searchWithBaidu()
    local intent = Intent()
    if (isNear) then
        intent.data = Uri.parse("baidumap://map/place/nearby?query=" .. place .. "&src=andr.baidu.openAPIdemo")
    else
        intent.data = Uri.parse("baidumap://map/place/search?query=" .. place .. "&src=andr.baidu.openAPIdemo")
    end
    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_DOCUMENT) -- 即使在APP内,也可跳转
    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
    app.startActivity(intent)
end
--使用高德地图搜索
function searchbyAmap()
    local intent = Intent(Intent.ACTION_VIEW)
    if isNear then
        intent.data = Uri.parse("androidamap://arroundpoi?sourceApplication=softname&keywords=" .. place .. "&dev=0")
    else
        intent.data = Uri.parse("androidamap://poi?sourceApplication=softname&keywords=" .. place .. "&dev=0")
    end
    intent.addCategory(Intent.CATEGORY_DEFAULT)
    intent.addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP) -- 即使在APP内,也可跳转
    app.startActivity(intent)
end

-- 使用高德地图机车版搜索
-- 来源 https://www.bbsmax.com/A/A2dmRykWze/
function navWithAmapAuto()
    if (place == nil and runtime.DEBUG) then
        place = "故宫"
    end
    print("高德机车搜索")
    local intent = Intent(Intent.ACTION_VIEW)
    if isNear then
        intent.data = Uri.parse("androidauto://arroundpoi?sourceApplication=softname&keywords=" .. place .. "&dev=0")
    else
        intent.data = Uri.parse("androidauto://poi?sourceApplication=softname&keywords=" .. place .. "&style=2")
    end
    intent.addCategory(Intent.CATEGORY_DEFAULT)
    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_DOCUMENT) -- 即使在APP内,也可跳转
    app.startActivity(intent)
end

if system.getAppInfo("com.baidu.BaiduMap") then --安装了百度地图
    print("使用百度")
    searchWithBaidu()
elseif system.getAppInfo("com.autonavi.minimap") then --安装了高德地图
    print("使用高德")
    searchbyAmap()
elseif system.getAppInfo("com.autonavi.amapauto") then --安装了高德地图机车版
    --未测试
    print("使用高德机车")
    searchWithAmapAuto()
end
