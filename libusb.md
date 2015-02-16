搞了个STM32的Maple用，但是在win7 64位下有问题，装不上驱动，也没法上传数据。后来看到官方说推荐winXP上用，于是装了个XP虚拟机来用，还是不行。因为Maple国内用的很少，资料不多，找不到。最后还是在浏览官方论坛的时候偶尔看到这个解决方案。自己试过可行，也不用虚拟机了，直接win7下使用也可。 


After getting pissed with this board not working correctly in Windows 7 64-bit with the default drivers, and then problems with a Windows XP 32-bit VM (VMWare) on Windows 7 64-bit (because it kept enumerating the device in the host machine), I tried Feyr's method. It works great!

Step-by-step instructions:

- Download the binary libUSB package (http://sourceforge.net/projects/libusb-win32/files/), extract somewhere (we'll call it c:\LIBUSB)
- Plug the Maple board into the computer
- Open Device Manager
- Switch Maple board into continuous Bootloader mode (hit reset until you get the fast blinks followed by slower blinks; reset again and immediately hit and hold the boot "BUT" button until it changes into slow blink mode, release).
- It should show some broken USB device in your Devices, not a com-port
- Run the libusb INF wizard (c:\LIBUSB\bin\x86\inf-wizard.exe)
- Click through the dialogs, the default values should be fine, or you can fill in some descriptive info
- Save the INF and have it install. It'll produce a big red prompt about the driver being unsigned and problematic; however, it will still work.
- "Update" the MAPLE 003 device in your device manager and select the INF file you generated.

To load any program:

Run the Maple IDE, when you hit the Upload, hit your Reset button on your Maple Board. It should detect and load the data on it. If your compile takes too long, try hitting the reset later in the upload. I used an alternating interval blink to prove it was working to me instead of the straight blink code.

The serial drivers that came with the Maple IDE package do work fine, so you can use those drivers for the COM port directly. 
