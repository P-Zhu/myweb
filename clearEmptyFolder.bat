@echo off  
chcp 65001
title 清除空文件夹  
echo.  
echo 正在删除当前目录及子目录中所有的空文件夹，请稍后...  
echo -----------------------------------  
cd. > listnull.txt  
for /f "delims=" %%i in ('dir /ad /b /s') do (  
dir /b "%%i" | findstr . > nul || echo %%i >> listnull.txt  
)  
set /a sum=0  
for /f %%i in (listnull.txt) do (  
echo 成功删除空目录：%%i  
rd /q %%i  
set /a sum+=1  
)  
echo ------------------------------------  
echo 共成功删除%cd%目录及其子目录下%sum%个空文件夹！  
echo.  
set sum=  
del /q listnull.txt > nul  
pause 
