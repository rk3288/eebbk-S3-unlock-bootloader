@echo off
mode con cols=100 lines=30
title ��������ڱ��������ʾ[ѡ��]�������밴�»س���������Ҽ����ѡ�񣬷�����ִͣ�������

if %PROCESSOR_ARCHITECTURE%==x86 (set cpuArch=x86) else set cpuArch=amd64


echo.
echo.
echo.ע��ò�����Root����豸�������������
pause >nul 2>nul
cls
echo.����رմ��ڻ��Ҷ������̣�������ڱ��������ʾ[ѡ��]�������밴�»س���������Ҽ����ѡ�񣬷�����ִͣ�������
echo.
echo.
)
echo.���֡�1��Ϊȷ�ϣ���0��Ϊ����
:Q0
echo.
echo.
set /p CHOICE0="��1����ˢ������0�˳�ˢ��(1/0) "
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
echo.===��ʼ����Bootloader��ˢ�����...
echo.
echo.===�����ĵȴ���ˢ�������������..
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