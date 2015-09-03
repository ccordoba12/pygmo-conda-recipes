set BOOSTDIR=%SRC_DIR%\boost

"%SRC_DIR%\boost_1_57_0-msvc-10.0-%ARCH%.exe" /SILENT /DIR="%BOOSTDIR%"
if errorlevel 1 exit 1

xcopy "%BOOSTDIR%\boost" "%LIBRARY_INC%\boost" /s /e /i
if errorlevel 1 exit 1

xcopy "%BOOSTDIR%"\lib%ARCH%-msvc-10.0\*vc100-mt-1_57.lib "%LIBRARY_LIB%"
if errorlevel 1 exit 1

xcopy "%BOOSTDIR%"\lib%ARCH%-msvc-10.0\*vc100-mt-1_57.dll "%LIBRARY_BIN%"
if errorlevel 1 exit 1
