import "cn.vove7.jarvis.tools.debugserver.ConnectiveService"
runtime.commandType = 0

if (runtime.commandType == 1) then
    ConnectiveService.Companion.start()
    AppConfig.setConnectiveService(true)
else
    ConnectiveService.Companion.stop()
    AppConfig.setConnectiveService(false)
end
