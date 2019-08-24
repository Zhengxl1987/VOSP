--[[
    正则：搜索@{kw}
]]
requireAccessibility()

if runtime.DEBUG then
    argMap["kw"] = "十万个为什么"
    waitForApp(system.openAppByWord('知乎'))
end
keyWord = argMap["kw"]


if (keyWord == nil or keyWord == "") then
    speak("搜索什么")
    keyWord = waitForVoiceParam()
end
print(keyWord)


ViewFinder().id('search_logo').waitFor(5000)
ViewFinder().id('input').waitFor(3000).tryClick()
sleep(800)

keyWord = "1234"
ViewFinder().id('input').setText(keyWord)

input.sendDefaultEditorAction()