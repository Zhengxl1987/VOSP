-- 使用activity方式
intent = app.getPackageManager().getLaunchIntentForPackage("com.tencent.mm");

intent.putExtra("LauncherUI.From.Scaner.Shortcut", true)
app.startActivity(intent)
