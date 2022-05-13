@echo OFF
SETLOCAL ENABLEDELAYEDEXPANSION

IF [%1] EQU [] ECHO Usage script hddd or script tc id && exit /b 1

IF "%1" EQU "hddd" GOTO :DSCVR

IF "%1" EQU "tc" (
	IF [%2] EQU [] (
		ECHO Usage script hddd or script tc id && exit /b 1
	) ELSE (
		GOTO :GETT
	)
)
ECHO parameter error && EXIT /B 1

:DSCVR
SET JSDATA={"data":[

for /f "tokens=7 delims= " %%I in ('wmic /namespace:\\root\OpenHardwareMonitor PATH Sensor ^| find "hdd" ^| find "Temperature"') DO (
	for /f "tokens=2 delims=/" %%Z in ('echo %%I') DO (
		SET JSDATA=!JSDATA!{"{#HDD.ID}":"%%Z"},
	)
)

SET JSDATA=!JSDATA:~0,-1!
SET JSDATA=%JSDATA%]}

ECHO %JSDATA%
ENDLOCAL
EXIT /B 0

:GETT
SET TC=0
for /f "tokens=* skip=1 delims=" %%F in ('wmic /namespace:\\root\OpenHardwareMonitor PATH Sensor WHERE Identifier^="/hdd/%2/temperature/0" get Value') DO (
	SET TC=%%F && GOTO :GETTNXT
)
:GETTNXT
ECHO %TC%
ENDLOCAL 
EXIT /B 0