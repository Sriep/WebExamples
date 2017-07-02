REM Batch file for auto build

REM Set project identity variables
set PROJECTNAME=minimal_map
set GITHUB_URL=https://github.com/Sriep/WebExamples.git
set BUILD_DIR=C:\Data\Build_%PROJECTNAME%

REM Set executable locations
set QT_DIR=C:\Qt\5.9\msvc2015_64
set QT_CREATORDIR=C:\Qt\Tools\QtCreator

REM Set internal variables
set SRCDIR=%BUILD_DIR%\WebExamples\%PROJECTNAME%
set PATH=%QT_DIR%\bin;%QT_CREATOR_DIR%/bin;%PATH%

REM Setup build directory
mkdir %BUILD_DIR%
cd %BUILD_DIR%

REM Download from GitHub
git clone %GITHUB_URL%

REM Initialise builds
call C:\"Program Files (x86)\Microsoft Visual Studio 14.0\VC"\vcvarsall.bat amd64

REM Build project
cd %SRCDIR%
qmake.exe %SRCDIR%\%PROJECTNAME%.pro -spec win32-msvc "CONFIG+=qtquickcompiler" && jom.exe qmake_all
jom.exe 
jom.exe clean
