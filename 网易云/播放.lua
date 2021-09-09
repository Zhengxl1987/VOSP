--[[
    regex: 播放@{song}
    不自动开启App
    在歌曲搜索框用发送回车键完成搜索
]]
if runtime.DEBUG then
    argMap["song"] = "绝代风华"
--     argMap["song"] = "音乐"
-- argMap["song"] = "本地音乐"
-- argMap["song"] = "纸短情长"
-- argMap["song"] = "每日推荐"
-- argMap["song"] = "我喜欢的音乐"
-- argMap["song"] = "我喜欢的歌"
-- argMap["song"] = "周杰伦的歌"
-- argMap["song"] = "遥远的歌"
-- argMap["song"] = "多余的解释"
-- argMap["song"] = "有何不可"
-- argMap["song"] = "私人fm"
-- argMap["song"] = "新歌榜"
-- argMap["song"] = "飙升榜"
end

function playWithUri(uri)
    local i=Intent()
    i.data = Uri.parse(uri)
    app.startActivity(i)
end

-- 搜索内容
function search(text)
    requireAccessibility()
    playWithUri('orpheus://search')
    waitForApp('com.netease.cloudmusic', 'SearchActivity')
    s = ViewFinder().id("search_src_text").await()
    s.setText(text)

    -- 无法获取弹框视图，使用发送按键
    system.sendKey(66)
    
    i = 0
    ViewFinder().containsText("加载中").waitHide()
    -- back()
    print("结果出现") -- 可能网络错误
    s = ViewFinder().containsText("网络未连接").await(100)
    if (s) then
        speak("网络错误")
        return false
    end
    return true
end

-- 搜索歌手 播放
function playSinger(s, singer)
    search(s)
    --检查列表有此歌s
    songItem = ViewFinder().similaryText(s).type("TextView").findFirst()
    if (songItem and songItem.tryClick()) then
        print("播放" .. s)
    else
        --若无点击歌手页，播放
        v = ViewFinder().equalsText("歌手").type("TextView").await(2000)
        print(v)
        v.tryClick()
        sleep(1000)
        ViewFinder().type("TextView").containsText(singer).await(2000).tryClick() --查找歌手
        containsText('播放热门').await(5000).tryClick()
    end
end

-- 搜索播放歌曲s
function playSong(s)
    if (not search(s)) then -- 搜索
        return
    end
    -- 直接播放全部
    songItem = id('songName').await(2000)
    if (songItem and songItem.tryClick()) then
        print("成功")
    else
        print("搜索失败")
        speak("搜索失败")
    end
end

-- 获取参数
local song = argMap["song"]
print(song)

if (not song or song == "") then
    system.mediaResume()
elseif (song == "本地音乐") then
    playWithUri('orpheus://play_local_music')
elseif matches(song, "(每日)?(歌曲)?推荐") then
    playWithUri("orpheus-cortana://voice?action=play&type=general&params={'q':'','entities': [{'type':'keyword','value':'每日歌曲推荐'}]}")
elseif song == "私人fm" then
    playWithUri("orpheus-cortana://voice?action=play&type=general&params={'q':'','entities': [{'type':'keyword','value':'私人fm'}]}")
elseif song == "飙升榜" then
    playWithUri("orpheus-cortana://voice?action=play&type=general&params={'q':'','entities': [{'type':'keyword','value':'飙升榜'}]}")
elseif song == "新歌榜" then
    playWithUri("orpheus-cortana://voice?action=play&type=general&params={'q':'','entities': [{'type':'keyword','value':'新歌榜'}]}")
elseif song == "音乐" or matches(song, "我喜欢的(音乐|歌)") or matches(song, "收藏的?歌单?") then
    playWithUri("orpheus-cortana://voice?action=play&type=general&params={'q':'','entities':[{'type':'keyword','value':'我喜欢的音乐'}]}")
else
    -- 匹配 %的%
    local s = matchValues(song, "%的%")
    if (s) then
        if (s[1] == "歌") then
            playSinger(song, s[0])
        else
            playSong(song) -- 可能为..的..
        end
    else
        playSong(song)
    end
end
