require "accessibility"
-- 正则：播放%

-- args = {"本地音乐"}
-- args = {"纸短情长"}
-- args = {"每日推荐"}
-- args = {"我喜欢的音乐"}
-- args = {"周杰伦的歌"}
-- args = {"遥远的歌"}
-- args = {"许嵩的有何不可"}

-- 播放本地音乐
function playLike()
    inMyMusic("我喜欢的音乐")
end
-- 播放本地音乐
function playLocal()
    if (inMyMusic("本地音乐")) then
        speak("未发现本地音乐")
    end
end
-- 都是在我的音乐 点击 再点击播放的操作
function inMyMusic(name)
    local mm = ViewFinder().type("Tab").waitFor()
    mm.tryClick()
    ViewFinder().equalsText(name).waitFor(2000).tryClick()
    mm.tryClick()
    local a = ViewFinder().equalsText("播放全部").waitFor(2000)
    if (a) then
        a.tryClick()
        return true
    else
        return false
    end
end
-- 搜索内容
function search(text)
    search = ViewFinder().desc({"搜索", "Search"}).await()
    search.tryClick()

    s = ViewFinder().id("search_src_text").await()
    s.setText(text)

    -- 无法获取弹框视图
    bounds = s.getBounds() --(154, 87 - 1055, 185)[1920x1080]
    x = (bounds.left + bounds.right) / 2
    y = bounds.bottom + 100 --276
    sleep(1000)
    click(x, y) -- 
    i = 0
    while (waitForText("加载中", 200)) do --等待结果出现
        sleep(200)
    end
    back()
    print("结果出现") -- 可能网络错误
    s = ViewFinder().containsText("网络未连接").await(100)
    if (s) then
        speak("没网啦")
        return false
    end
    return true
end

-- 搜索歌手 播放
function playSinger(s, singer)
    search(s)
    --检查列表有此歌s
    songItem = ViewFinder().id("zt").similaryText(s).findFirst()
    if (songItem and songItem.tryClick()) then
        print("播放" .. s)
    else
        --若无点击歌手页，播放
        v = ViewFinder().equalsText("歌手").await(2000)
        print(v)
        v.tryClick()
        print(1)
        ViewFinder().id("ob").containsText(singer).await(2000).tryClick() --查找歌手
        print(2)
        ViewFinder().id("zt").await(3000).tryClick()
    end
end

-- 搜索播放歌曲s
function playSong(s)
    print(s)
    if (not search(s)) then -- 搜索
        return
    end
    songItem = ViewFinder().id("zt").similaryText(s).await(2000)
    if (songItem and songItem.tryClick()) then
        print("成功")
    else
        print("搜索失败")
        speak("搜索失败")
    end
end

-- 每日推荐
function playDialy()
    local tab = ViewFinder().type("Tab")
    tab.waitFor()
    local mm = tab.find()[1]
    mm.tryClick()
    waitForText("每日推荐", 1000).tryClick()
    waitForText("播放全部", 5000).tryClick()
end

-- 获取参数
local arg = args[1]
if (arg == "本地音乐") then
    playLocal()
elseif arg == "每日推荐" then
    playDialy()
    playLocal()
elseif arg == "我喜欢的音乐" then
    playLike()
else
    -- 匹配 %的%
    local s = matchValues(arg, "%的%")
    if (s) then
        if (s[1] == "歌") then
            playSinger(arg, s[0])
        else
            playSong(s[1]) -- 直接搜索歌名，省去歌手
        end
    else
        playSong(arg)
    end
end
