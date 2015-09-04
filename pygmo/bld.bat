@echo off

mkdir build
cd build

if %ARCH%==32 (
    set CMAKE_GENERATOR="Visual Studio 10"
)

if %ARCH%==64 (
    set CMAKE_GENERATOR="Visual Studio 10 Win64"
)

cmake .. -G %CMAKE_GENERATOR% ^
  -Wno-dev ^
  -DBUILD_PYGMO:BOOL=ON ^
  -DPYTHON_EXECUTABLE:FILEPATH=%PREFIX%\python.exe ^
  -DPYTHON_INCLUDE_DIR:PATH=%PREFIX%\include ^
  -DPYTHON_LIBRARY:FILEPATH=%PREFIX%\libs\python27.lib ^
  -DCMAKE_INSTALL_PREFIX=%PREFIX%\Lib\site-packages

cmake --build . --config Release --target ALL_BUILD 1>output.txt 2>&1
if errorlevel 1 exit 1

cmake --build . --config Release --target INSTALL
if errorlevel 1 exit 1

rem Moving pagmo libs to LIBRARY_PREFIX
move /y %SP_DIR%\pagmo.dll %LIBRARY_BIN% > nul
move /y %SP_DIR%\pagmo.lib %LIBRARY_LIB% > nul
