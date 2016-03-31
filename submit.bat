@if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
@if not exist "%HOME%" @set HOME=%USERPROFILE%
@cd /D %~dp0%
git add . 
if "%1"=="" (
for /f "tokens=*" %%i in ('date /T') do set DAY=%%i
git commit -am "%DAY%自动提交"
) else (
git commit -am %1
)
git pull origin master 
git push origin master 
