require "accessibility"
-- 使用activity方式
intent = app.getPackageManager().getLaunchIntentForPackage("com.tencent.mm");

intent.putExtra("LauncherUI.From.Scaner.Shortcut", true)
app.startActivity(intent)


-- if (runtime.DEBUG) then
--     waitForApp(openAppByWord("微信", true)) --启动微信首页
-- end

-- moreBtn = ViewFinder().desc("更多功能按钮").waitFor(1000)
-- moreBtn.tryClick()
-- waitForText('扫一扫').tryClick()