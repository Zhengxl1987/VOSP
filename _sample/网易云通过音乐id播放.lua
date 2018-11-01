--[[
    需要app版本 ： 1.2.7
    歌曲id获取  ： 通过网易云网页版 指定音乐播放页url尾部:  http://music.163.com/#/song?id=482999668
]]

i = Intent()
i.setClassName("com.netease.cloudmusic", "com.netease.cloudmusic.activity.LoadingActivity")
-- app v1.2.7以上 可通过 i = system.getLaunchIntent('com.netease.cloudmusic') 获取启动Intent,来代替上两句

i.setData(Uri.parse("orpheus://song/482999668")) -- 歌曲[晴天] id
i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK) -- 必须
app.startActivity(i)
