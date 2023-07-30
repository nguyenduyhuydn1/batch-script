:again
if "%1" == "elevated" goto start

powershell -command "Start-Process %~nx0 elevated -Verb runas"
goto :again

:start
powershell "start-process powershell"
del %0







:again

if "%1" == "elevated" ( 
    del %0
    powershell "start-process powershell"
    
) else (
    powershell -command "Start-Process %~nx0 elevated -Verb runas"
    timeout /t 5
    goto :again
)
