require 'accessibility'

-- 正则：发消息给% | 给%发消息

s = ViewFinder().id('et_search_keyword')
s.tryClick()  --
sleep(110)
s.setTextWithInitial(args[1]) -- 同 s.setText(toPinyin(args[1],true)) 或 s.text=toPinyin(args[1],true)
sleep(110)
a = ViewFinder().id('title').similaryText(args[1]).waitFor(2000).tryClick()
if (not a) then
    toast('没找到哦')
end
