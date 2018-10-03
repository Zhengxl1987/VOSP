args = {"今日新鲜事"}

settings = {
    s_engine = {title = "搜索引擎", t = "single_choice", items = {"百度", "搜狗", "必应", "谷歌"}}
}
config = registerSettings("vove_search", settings, 1)
if (#args < 1) then
    speak("搜索啥呦")
    return
end
engines = {} -- 不可 { '百度'='...' } ???
engines["百度"] = "https://www.baidu.com/s?wd="
engines["搜狗"] = "https://www.sogou.com/web?query="
engines["谷歌"] = "https://www.google.com/search?q="
engines["必应"] = "https://cn.bing.com/search?q="

system.openUrl(engines[config.getString("s_engine")] .. args[1])
