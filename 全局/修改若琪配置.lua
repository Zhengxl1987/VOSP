--[[
    正则：(修改|设置|配置)若琪%
    修改若琪配置

]]

-- 指令存储
settings = {
    rokid_device_id = {title = "若琪设备序列号", t = "string"},
    rokid_url = {title = "webhook地址", t = "string"}
}
config = registerSettings("rokid", settings, 1)


if (AppConfig.INSTANCE.versionCode <= 190) then
    toast("此指令仅支持1.9.5+版本")
    return
end

url = dialog.input("输入WebHook地址", nil, config.getString("rokid_url"))

if (url and not (url == "")) then
    config.set("rokid_url", url)
end

did = dialog.input("输入若琪设备序列号", nil, config.getString("rokid_device_id"))

if (did and not (did == "")) then
    config.set("rokid_device_id", did)
end
