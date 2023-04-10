import Xmobar


xmonadLogs = Run XMonadLog
cpuMonitor = Run $ MultiCpu ["-t", "<total>%"] 50
memoryMonitor = Run $ Memory ["-t", "<usedratio>%"] 50
networkMonitor = Run $ Network "wlp1s0" ["-t", "<rx>KB <tx>KB"] 10
batteryMonitor = Run $
    BatteryP
    ["BATT", "ACAD"]
    [
        "-t", "<acstatus><watts> <left>%",
        "-L", "10", "-H", "80", "-p", "3",
        "--",
        "-O", "\xf089e",
        "-i", "",
        "-L", "-15",
        "-H", "-5",
        "-l", "red",
        "-m", "blue",
        "-h", "green"
        -- "--on-icon-pattern", "\xf089e",
        -- "--off-icon-pattern", "\xf007e"
    ]
    1000
keyboardMonitor = Run $ Kbd []
dateMonitor = Run $ Date "%A %d/%m/%Y %H:%M:%S" "date" 10

myCommands :: [Runnable]
myCommands = [
        xmonadLogs,
        cpuMonitor,
        memoryMonitor,
        networkMonitor,
        batteryMonitor,
        keyboardMonitor,
        dateMonitor
    ]

myTemplate =
       " %XMonadLog% }"
    ++ "\xf0ee0 %multicpu% | \xf035b %memory% | \xf0002 %wlp1s0% | %battery%"
    ++ "{ \xf11c %kbd% | %date% "

config :: Config
config = defaultConfig
    {
        font        = "monofur 20",
        bgColor     = "#1e1e2e",
        fgColor     = "#cdd6f4",
        allDesktops = True,
        position    = TopSize L 90 30,
        commands    = myCommands,
        template    = myTemplate
    }

main :: IO ()
main = xmobar config  -- or: configFromArgs config >>= xmobar