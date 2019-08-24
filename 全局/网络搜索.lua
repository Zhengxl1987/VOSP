--[[
    正则：
    使?用@{se}搜索@{word}
    搜索@{word}

]]
import 'java.net.URLEncoder'
if runtime.DEBUG then
    argMap["se"] = "必应"
    argMap["word"] = "1+5"
end

settings = {
    s_engine = {title = "搜索引擎", t = "single_choice", items = {"百度", "搜狗", "必应", "谷歌"}}
}
config = registerSettings("vove_search", settings, 1)

word = URLEncoder.encode(argMap["word"], 'utf-8') --关键词 通过UrlEncode
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

if se then
    local e = engines[se]
    if (e) then
        print("搜索引擎" .. e)
        system.openUrl(engines[se] .. word)
    else-- 不支持的搜索引擎，或者其他应用，抛出NotSupport异常，继续执行其他指令
        notSupport()
    end
else
    system.openUrl(engines[config.getString("s_engine")] .. word)
end
