--[[
    正则：
    使?用@{se}搜索@{word}
    搜索@{word}

]]
if runtime.DEBUG then
    argMap["se"] = "必应"
    argMap["word"] = "今日新鲜事"
end

settings = {
    s_engine = {title = "搜索引擎", t = "single_choice", items = {"百度", "搜狗", "必应", "谷歌"}}
}
config = registerSettings("vove_search", settings, 1)

word = argMap["word"] --关键词
se = argMap["se"] --搜索引擎

if (not word or word == "") then
    speakSync("搜索什么")
    word = waitForVoiceParam()
end
engines = {} -- 不可 { '百度'='...' } ???
engines["百度"] = "https://www.baidu.com/s?wd="
engines["搜狗"] = "https://www.sogou.com/web?query="
engines["谷歌"] = "https://www.google.com/search?q="
engines["必应"] = "https://cn.bing.com/search?q="

if se and engines[se] then
    print("搜索引擎" .. engines[se])
    system.openUrl(engines[se] .. word)
else
    system.openUrl(engines[config.getString("s_engine")] .. word)
end
