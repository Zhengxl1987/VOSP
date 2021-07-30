import "cn.vove7.common.accessibility.AccessibilityApi"

--[[
    功能：滑动搜索指定文本
    正则：[滚滑划]动搜索@{text}
    注意：某些页面文字可能无法提取，导致搜索不到
    todo 位置提示
]]
if not AccessibilityApi.Companion.gestureService then
    toast("需要开启高级无障碍服务")
    return
end

-- print(id('list').scrollDown())

if runtime.DEBUG then
    argMap["text"] = "老北京"
end

searchText = argMap["text"]

textFinder = ViewFinder().containsText(searchText)
textFinder2 = ViewFinder().containsDesc(searchText)

st = os.time()

targetView = textFinder.findFirst()
targetView2 = textFinder2.findFirst()
setScreenSize(100, 100)
-- swipe(50, 70, 50, 10, 100)
--     click(50, 50)
while not targetView and not targetView2 and not runtime.userInterrupt do
    swipe(50, 70, 50, 10, 150)
    click(50, 50)

    if os.time() - st > 300 then
        toast("未找到 " .. searchText .. " 歇会...")
        return
    end
    targetView = textFinder.findFirst()
    if not targetView then
        targetView2 = textFinder2.findFirst()
    end
end
if targetView or targetView2 then
    toast("找到啦")
    return
end
