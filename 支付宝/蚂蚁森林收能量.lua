--[[
    仅收集首页
]]
if runtime.DEBUG then
    waitForApp(openAppByWord("支付宝", true))
end

--进入蚂蚁森林
home_my = ViewFinder().equalsText("蚂蚁森林").waitFor(1500)
if (home_my) then --首页
    home_my.tryClick()
else --搜索
    waitForId("search_button").tryClick()
    ViewFinder().editable().waitFor(1000).setText("蚂蚁森林")
    ViewFinder().type("TextView").equalsText("蚂蚁森林").await(1500).tryClick()
end
wait = ViewFinder().containsText("稍等片刻")
function waitLoad()
    wait.waitFor(1000)
    while (wait.findFirst()) do --等待加载
        sleep(500)
    end
    print("加载完成")
end
waitLoad()
-- 查找列表
endF = ViewFinder().desc("查看更多好友")
function findAndTake() --收取 直到屏幕中没可收取结束
    vf = ViewFinder().desc("可收取")
    while (vf.findFirst()) do
        vf.tryClick()
        waitLoad()
        sleep(500)
        -- 收能量
        list = ViewFinder().containsDesc("收集能量").find()
        print(#list)
        for i = 0, #list - 1 do
            list[i].globalClick()
            print("收取")
            sleep(300)
        end
        --返回
        sleep(500)
        back()
        --返回
        sleep(500)
    end
end
sleep(500)
while (not endF.findFirst() and not runtime.userInterrupted) do
    scrollUp()
    findAndTake()
    sleep(1000)
end
print("结束")
