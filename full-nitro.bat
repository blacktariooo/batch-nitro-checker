@echo off
setlocal enabledelayedexpansion
set "el=black=[0m,bgblack=[40m,yellow=[33m,bgyellow=[43m,blue=[34m,bgblue=[44m,yellow=[33m,white=[37m,green=[32m,bggreen=[42m,red=[31m,bgred=[41m,off=[24m,pink=[35m,bgpink=[45m
set "%el:,=" && set "%"
echo. 
echo. 
echo. 
echo. 
echo.                            
echo.                          the codes will be checker from codes.txt
echo.                   and the working nitro will be place in valid-checked.txt
pause >nul
echo. 
echo. 
echo. 
for /F "tokens=*" %%A in (codes.txt) do (
    curl -s -o "%TEMP%\response.txt" "https://discordapp.com/api/v6/entitlements/gift-codes/%7B%%A%7D?with_application=false&with_subscription_plan=true"
    findstr 200 %temp%\response.txt

    if ERRORLEVEL 1 (
        echo %date% %time%  [ INVALID ]  %%A
    ) else (
        echo %date% %time%  !green![ VALID NITRO CODE DETECTED ]!black!  %%A
        >>valid-checked.txt" echo %%A
    )
)