REM License: This work is licensed under the Creative Commons Attribution-NonCommercial 4.0 International License. To view a copy of this license, visit https://creativecommons.org/licenses/by-nc/4.0/ or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.
REM Author: chay@embedism.com

if exist temp do rd /s /q temp

set ZIPFILE=%~dpfn1

7za.exe x %ZIPFILE% -otemp

@for /F "tokens=*" %%F in ('dir /b /ad "temp"') do call :EXTRACTLIB %%F

rd /s /q temp

:END
EXIT /B

:EXTRACTLIB
  if not exist "temp\%1\KiCad" do EXIT /B

  mkdir %1
  copy "temp\%1\KiCad" %1
  robocopy "temp\%1\3D" "%1\3D" /s /e

  EXIT /B




