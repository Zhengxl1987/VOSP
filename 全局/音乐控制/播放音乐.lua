--[[
    播放音乐
    方案：播放网易云私人FM
    com.netease.cloudmusic.activity.RedirectActivity
    regex: (播放音乐|来一?[点首](音乐|歌))
]]

i = Intent()
i.data = Uri.parse('orpheus://radio')
app.startActivity(i)