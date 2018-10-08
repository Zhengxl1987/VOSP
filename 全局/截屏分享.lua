-- 正则：截屏(分享|发送)?
if runtime.DEBUG then
    runtime.command = "截屏" -- 测试时模拟命令
end

settings = {
    -- 指令设置
    save_path = {title = "图片存放路径", t = "string", default = "/sdcard/Pictures/Screenshots/"}
}
config = registerSettings("screnn_shot", settings, 1)
path = config.getString("save_path") .. "/" .. os.date("%Y%m%d-%H%M%S") .. ".png" -- 保存路径

system.screen2File(path) -- 截屏 保存至 path/..

if string.len(runtime.command) > 6 then -- 截屏分享
    system.shareImage(path)
end
