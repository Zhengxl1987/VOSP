--[[
    正则：扫一扫|扫码
]]

intent = Intent("android.intent.action.VIEW")
intent.data = Uri.parse("hellobike://hellobike.com/scan_qr")
intent.putExtra("scanQR",true)
intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP )
app.startActivity(intent)