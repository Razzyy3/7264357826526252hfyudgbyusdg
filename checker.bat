@echo off
mode con: cols=90 lines=50
:diocane
title Serials Checker
color 0c
cls
echo [92m---------------------[91m
echo Serials Checker
echo [92m---------------------[91m
echo.
echo BIOS Serial Number:
echo [92m------------[91m
wmic bios get serialnumber | findstr /v "SerialNumber"
echo.
echo BIOS UUID:
echo [92m------------[91m
wmic csproduct get uuid | findstr /v "UUID"
echo.
echo Baseboard Serial Number:
echo [92m------------[91m
wmic baseboard get serialnumber | findstr /v "SerialNumber"
echo.
echo Baseboard Manufacturer:
echo [92m------------[91m
wmic baseboard get manufacturer | findstr /v "Manufacturer"
echo.
echo CPU Serial Number:
echo [92m------------[91m
wmic cpu get serialnumber | findstr /v "SerialNumber"
echo.
echo Network Adapters MAC Addresses:
echo [92m------------[91m
wmic path Win32_NetworkAdapter where "PNPDeviceID like '%%PCI%%' AND NetConnectionStatus=2 AND AdapterTypeID='0'" get MacAddress  | findstr /v "MACAddress"
echo.
echo Disk Drives Volume IDs:
echo [92m------------[91m
for %%d in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    for /f "tokens=2 delims==" %%v in ('wmic logicaldisk where "DeviceID='%%d:'" get VolumeSerialNumber /value 2^>nul') do (
        echo Drive %%d Volume ID is %%v
    )
)

echo.
echo.
echo Disk Drive Serial Numbers: (For Call Of Duty Games Only)
echo [92m------------[91m
wmic diskdrive get serialnumber | findstr /v "SerialNumber"
echo Press ENTER to check serial again...
pause >nul
goto diocane
