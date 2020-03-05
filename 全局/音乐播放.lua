--[[
    播放音乐
    正则: 播放(音乐|歌曲)?@{song}
]]

musicApps = {
    "com.netease.cloudmusic",
    "com.kugou.android",
    "com.tencent.qqmusic",
    "com.apple.android.music",
}
actions = {
    "播放",
    "酷狗播放音乐",
    "播放音乐",
    "AppleMusic音乐播放",
}
suc = false
for i = 1, #musicApps do
    packageName = musicApps[i]
    cmd = actions[i]
    if system.hasInstall(packageName) then
        result = utils.runAppCommand(packageName, cmd, argMap)
        if not result then
            toast("指令 [" .. cmd .. "] 未找到")
        else
            suc = true
            return
        end
    end
end
if (not suc) then
    app.toastError("请先安装 网易云音乐/酷狗音乐/QQ音乐/AppleMusic", 1)
end
