-- 正则： 大+点?声  | 加大+音量
-- 加大媒体音量
if (runtime.DEBUG) then
    runtime.command = "大大大点声"
end
len = String(runtime.command).length() - 2 --lua  一个汉字长度不等1
print(len)

for i = 0, 1.5 * len do
    system.volumeUp()
end
