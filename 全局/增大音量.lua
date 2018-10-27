-- 正则： 大+点?声  | 加大+音量
-- 加大媒体音量
if (runtime.DEBUG) then
    runtime.command = "大大大点声"
end
len = String(runtime.command).length() - 2 --lua  一个汉字长度不等1
print(len)
-- cv = system.musicCurrentVolume
-- print("当前音量：" .. cv)
-- maxV = system.musicMaxVolume
-- print("最大音量：" .. maxV)

-- index = len + cv
-- if (index > maxV) then
--     index = maxV - 2
-- end
for i = 0, len do
    system.volumeUp()
end
