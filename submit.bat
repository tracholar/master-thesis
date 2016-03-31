@if not exist "%HOME%" @set HOME=%SystemDrive%%HOMEPATH%
@cd /D %~dp0%
git add .
git commit -am %1
git pull origin master
git push origin master
pause
