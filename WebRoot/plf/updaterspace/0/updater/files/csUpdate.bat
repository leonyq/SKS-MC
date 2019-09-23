@echo off 
set newdir=%cd%
set d=%date:~0,10%
set t=%time:~0,8%
java -cp %newdir%\config\update\updateCs.jar com.more.update.cs.UpdateCs %newdir%

if "%errorlevel%"=="11" (
               echo %d% %t% csUpdate.bat 检查更新程序成功，开始更新>>%nowdir%\pid.out
		goto :s1
)

echo 按任意键退出

pause>nul

exit
echo 按任意键退出

pause>nul

exit

:s1

echo 更新失败
