--[[
    正则: 
     我在哪%
     我的位置

    目前仅支持调用百度地图和高德地图进行导航
    支持Bmap(需手动选择地点)
]]
if runtime.DEBUG then
    runtime.command = "我在哪呀"
end

function myPlace_Baidu()
    requireAccessibility()
    print(runtime.currentActivity)
    if (not (runtime.currentActivity == "com.baidu.baidumaps.MapsActivity")) then
        print("1")
        system.openAppByPkg("com.baidu.BaiduMap", true)
    end
    a = waitForId("vw_searchbox")
    sleep(500)
    a.tryClick()
    e = ViewFinder().id("tvSearchBoxInput").waitFor(1000)
    sleep(800)
    e.text = "我的位置"
    ViewFinder().equalsText("搜索").tryClick()
    sleep(500)
    ViewFinder().containsText("正在获取你的位置").waitHide()
    sleep(500)
    address = waitForId("tv_address", 3000).text
    print(address)
    speak(address)
end

c = runtime.command

--我的位置
if (c == "我的位置" or matchValues(c, "我在哪%")) then
    if system.getAppInfo("com.baidu.BaiduMap") then --安装了百度地图
        myPlace_Baidu()
    else
        speak("请安装百度地图")
    end
    return
end
