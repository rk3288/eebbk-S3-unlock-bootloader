@echo off
mode con cols=100 lines=30
title ←如果窗口标题左侧显示[选择]字样，请按下回车或按下鼠标右键清除选择，否则将暂停执行输出。

if %PROCESSOR_ARCHITECTURE%==x86 (set cpuArch=x86) else set cpuArch=amd64


echo.
echo.
echo.注意该操作会Root你的设备，按任意键继续
pause >nul 2>nul
cls
echo.请勿关闭窗口或乱动鼠标键盘，如果窗口标题左侧显示[选择]字样，请按下回车或按下鼠标右键清除选择，否则将暂停执行输出。
echo.
echo.
)
echo.数字“1”为确认，“0”为否认
:Q0
echo.
echo.
set /p CHOICE0="按1继续刷机，按0退出刷机(1/0) "
if /i "%CHOICE0%" == "1" (
    goto Q1
) else if /i "%CHOICE0%" == "0" (
    exit
)

:Q1
set cecho=bin\windows\all\cecho.exe
goto MAIN
:MAIN
echo.
echo.===开始解锁Bootloader并刷入面具...
echo.
echo.===请耐心等待，刷机过程请勿操作..
echo.
bin\windows\all\adb reboot fastboot
bin\windows\all\fastboot %* devices
bin\windows\all\fastboot %* getvar unlocked
bin\windows\all\fastboot %* flash loader loader2.bin
bin\windows\all\fastboot %* flash recovery recovery.img
bin\windows\all\fastboot %* flash selftest officialrec.img
bin\windows\all\fastboot %* flash boot boot.img

goto Q0


echo.
echo.
goto Q0