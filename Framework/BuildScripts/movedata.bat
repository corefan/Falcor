@echo off

rem %1 -> Falcor Core Directory Path
rem %2 -> Solution Directory Path
rem %3 -> Project Directory Path
rem %4 -> Platform Name.
rem %5 -> Platform Short Name.
rem %6 -> Configuration.
rem %7 -> Output Directory
rem %8 -> Output Directory Type

SETLOCAL ENABLEDELAYEDEXPANSION

SET ExternalsSourceDirectory=%1\Externals\
SET DestinationDirectory=%2\Bin\%5\%8\

echo "%ExternalsSourceDirectory%"
echo "%DestinationDirectory%"

if not exist "%DestinationDirectory%" mkdir "%DestinationDirectory%"


robocopy %ExternalsSourceDirectory%\AntTweakBar\lib %DestinationDirectory% "AntTweakBar64.dll" /r:0 >nul
robocopy %ExternalsSourceDirectory%\FreeImage %DestinationDirectory%  freeimage.dll /r:0 >nul 
robocopy %ExternalsSourceDirectory%\assimp\bin\%5 %DestinationDirectory%  *.dll /r:0 >nul
robocopy %ExternalsSourceDirectory%\FFMpeg\bin\%5 %DestinationDirectory%  *.dll /r:0 >nul
robocopy %ExternalsSourceDirectory%\D3DCompiler\%5 %DestinationDirectory%  D3Dcompiler_47.dll /r:0 >nul
robocopy %ExternalsSourceDirectory%\OptiX\bin64 %DestinationDirectory%  *.dll /r:0 >nul
robocopy %ExternalsSourceDirectory%\openvr\bin\win64 %DestinationDirectory%  openvr_api.dll /r:0 >nul
robocopy %ExternalsSourceDirectory%\Slang\bin\windows-x64\release %DestinationDirectory%  *.dll /r:0 >nul


echo %1
robocopy %1\BuildScripts\ %DestinationDirectory% moveprojectdata.bat /r:0 >nul
call %DestinationDirectory%\moveprojectdata.bat %1\Source\ %DestinationDirectory%