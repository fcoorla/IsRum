@echo off

IsRun "notepad.exe"> nul

IF %ERRORLEVEL%==0 GOTO si
IF %ERRORLEVEL%==99 GOTO no

GOTO fin

:si 
echo El Bloc de Notas esta ejecutandose
goto fin:

:no 
echo El Bloc de Notas NO esta ejecutandose

:fin