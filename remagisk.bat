for /f "delims== tokens=1,2" %%G in (VERSION) do set anx%%G=%%H
echo %anxversion%
REM xcopy /s /y .\out\ANXCamera.apk .\src\ANXCameraMagisk\system\priv-app\ANXCamera
xcopy /s /y .\out\ANXCamera.apk .\src\ANXCameraUnity\system\priv-app\ANXCamera

del .\out\ANXCameraMagisk.zip
del .\out\ANXCameraMagisk_*.zip

del .\out\ANXCameraUnity.zip
del .\out\ANXCameraUnity_*.zip


REM del .\out\ANX4K60Unity.zip
REM del .\out\ANX4K60Unity_*.zip

del .\out\ANXCameraPerseusStockLibsUnity.zip
del .\out\ANXCameraPerseusStockLibsUnity_*.zip

REM "C:\Program Files\7-Zip\7z.exe" a -tzip .\out\ANXCameraMagisk.zip .\src\ANXCameraMagisk\*
REM copy .\out\ANXCameraMagisk.zip /B .\out\ANXCameraMagisk_%anxversion%.zip

REM adb push .\out\ANXCameraMagisk.zip  /sdcard/zips

"C:\Program Files\7-Zip\7z.exe" a -tzip .\out\ANXCameraUnity.zip .\src\ANXCameraUnity\*
copy .\out\ANXCameraUnity.zip /B .\out\ANXCameraUnity_%anxversion%.zip


"C:\Program Files\7-Zip\7z.exe" a -tzip .\out\ANXCameraPerseusStockLibsUnity.zip .\src\ANXCameraPerseusStockLibsUnity\*
copy .\out\ANXCameraPerseusStockLibsUnity.zip /B .\out\ANXCameraPerseusStockLibsUnity_%anxversion%.zip


adb push .\out\ANXCameraUnity.zip  /sdcard/zips


REM "C:\Program Files\7-Zip\7z.exe" a -tzip .\out\ANX4K60Unity.zip .\src\ANX4K60Unity\*
REM copy .\out\ANX4K60Unity.zip /B .\out\ANX4K60Unity_%anxversion%.zip