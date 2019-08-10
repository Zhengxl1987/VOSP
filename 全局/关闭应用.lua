requireAccessibility()

if runtime.DEBUG then
    argMap["app"] = "网易云"
end
appName = argMap["app"]
system.openAppDetail(system.getPkgByWord(appName))
s = ViewFinder().equalsText({"强行停止", "force stop"}).waitFor(3000)
if (s and s.tryClick()) then
    ok = ViewFinder().containsText({"确定", "OK"}).waitFor(600)
    if (ok) then
        sleep(200)
        print(ok.tryClick())
    else
        ok = ViewFinder().containsText("强行停止").waitFor(600)
        if (ok) then
            ok.tryClick()
        end
    end
else
    toast("应用未运行")
end
