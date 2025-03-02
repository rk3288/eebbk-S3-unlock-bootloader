运行bat安装adb fastboot，解压drive，安装瑞芯微驱动，还有usb_driver_r13-windows
打开rkdevtool，家教机进入loader，工具选择loader1，然后点击执行，完成后，接着点击工具的重启
家教机打开usb，cmd输入adb reboot fastboot，然后运行unlock.bat，解锁会清空全部数据，注意备份
然后重复上面步骤重启fastboot，cmd输入fastboot flash loader，选择loader2刷入，接着fastboot flash recovery 选择recovery.img
然后fastboot oem recovery，进入recovery双清即可
