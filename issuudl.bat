@echo off

echo.
echo Issuu Publication Downloader v1.0
echo by eqagunn

if [%1]==[] (echo. & set /p id=Document ID: ) else (set id=%1)

if [%2]==[] (echo. & set /p pages=Number of Pages: ) else (set pages=%2)

if [%3]==[] (set dest=\%id%) else (set dest=\%~3)

set /a page=1

echo.
echo Downloading! Please wait...

mkdir downloads%dest%

:loop

set "padded_page=000%page%"
set "padded_page=%padded_page:~-4%"

wget -nv -q -O ".\downloads%dest%\%padded_page%.jpg" http://image.issuu.com/%id%/jpg/page_%page%.jpg

set /a page=%page%+1

if %page% leq %pages% goto loop

echo.
echo Done!

echo.
echo Press any key to exit...
pause >nul
