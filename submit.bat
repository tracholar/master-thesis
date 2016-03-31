@if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
@if not exist "%HOME%" @set HOME=%USERPROFILE%
@cd /D %~dp0%
git add . 
if "%1"=="" (
set DAY=date /T
set TM=time /T
git commit -am "%DAY% %TM% 自动提交"
) else (
git commit -am %1
)
git pull origin master 
git push origin master 
