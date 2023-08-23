# IsRum

This is a program in Delphi that indicates whether a program is running on Windows.
If the program is running, it returns ERRORLEVEL 0, else it returns ERRORLEVEL 99.
It's very useful for incorporating into BAT or CMD files."


Se trata de un programa en Delphi el cual nos indica si esta ejecutandose un programa en windows.
Si el programa esta ejecutandose nos devuelve ERRORLEVEL 0 si no nos devuelve ERRORLEVEL 99.
Es muy util para utilizarlo en archivos BAT o CMD. 

Ejemplo de fichero CMD: 

IsRun "notepad.exe"
if errorlevel=0 goto si
if errorlevel=99 goto no

goto fin

:si
echo El Notepad esta ejecutandose
goto fin

:no
echo El Notepad NO esta ejecutandose

:fin


