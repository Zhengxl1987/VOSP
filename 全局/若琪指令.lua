--[[
    正则：
    若琪@{command}
]]
settings = {
    rokid_device_id = {title = "若琪设备序列号", t = "string"},
    rokid_url = {title = "webhook地址", t = "string"}
}
config = registerSettings("rokid", settings, 1)

if runtime.DEBUG then
    argMap["command"] = "几点了"
end

if (AppConfig.INSTANCE.versionCode <= 190) then
    toast("此指令仅支持1.9.5+版本")
    return
end

sp = SpHelper()
firstUse = not sp.containsKey("rokid_first")

if (firstUse) then
    sp.set("rokid_first", true)
    if (dialog.alert("第一次使用，是否查看帮助？", nil)) then
        system.openUrl("https://vove.gitee.io/2019/08/08/Rokid-Config/")
        return
    end
end

rokid_url = config.getString("rokid_url")
if (not rokid_url or rokid_url == "") then
    speak("第一次使用请设置若琪配置信息；如需修改序列号，请说：“修改若琪配置”")
    rokid_url = dialog.input("输入WebHook地址", nil)
end
if (not rokid_url) then
    return
else
    config.set("rokid_url", rokid_url)
end

rokid_device_id = config.getString("rokid_device_id")
if (not rokid_device_id or rokid_device_id == "") then
    rokid_device_id = dialog.input("输入设备序列号", nil)
end
if (not rokid_device_id) then
    return
else
    config.set("rokid_device_id", rokid_device_id)
end

response = http.postJson(
    rokid_url,
    {
        type = "asr",
        devices = {
            sn = rokid_device_id
        },
        data = {
            text = argMap["command"]
        }
    }
)

print(response)
