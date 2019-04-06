requireAccessibility()

-- activity: ChattingUI
-- 正则： (语音|视频)?通话
if (runtime.DEBUG) then
   runtime.command = "视频通话"
end

plus = ViewFinder().desc("更多功能按钮，已折叠").waitFor(500)
if (plus) then
    plus.tryClick()
end

ViewFinder().equalsText("视频通话").await(1000).tryClick()

if (String(runtime.command).contains("视频")) then
    waitForText("视频通话", 1000).tryClick()
else
    waitForText("语音通话", 1000).tryClick()
end
